   
   ;WITH mae_noid AS 
(
	SELECT	id_mae_no_identificados,
			ejercicio,
			clavagru,
			clavdeta
	FROM	dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados
	WHERE	aplicacion = 'MF'
	AND		detamodel = '159'
),

query AS
(
   SELECT
    doc.id_documento AS id_documento,
    e.id_expediente AS id_expediente,
	coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante,
	coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado,
    cabe.cabe_ejercicio AS ejercicio,
    coalesce(cabe.cabe_modelo,'') AS modelo,

	--admon_decl.id_administracion AS id_administracion_declarante,
    coalesce(cabe.cabe_admon,'') AS administracion_declarante,
    CASE WHEN cabe.cabe_admon<>'B' THEN 1 ELSE 0 END AS es_externo_declarante,
	
    coalesce(cabe.cabe_cifdecl,'') AS nif_declarante_159,
    coalesce(c_declarante.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarante,
    CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarante,

    coalesce(cabe.cabe_telefono,'') AS telefono,
    coalesce(cabe.cabe_persona,'') AS razon_social,
    coalesce(cabe.cabe_refpres,'') AS cod_presentador_colectivo,
    coalesce(cabe.cabe_banco,'') AS cod_banco_espania,
	
	--tipo_pres.id_tipo_presentacion AS id_tipo_presentacion,
	cabe.cabe_tiposoporte AS cod_tipo_presentacion,

	CASE WHEN cabe.cabe_fecpres IS NULL THEN '0001-01-01' ELSE cabe.cabe_fecpres END AS fecha_presentacion,
	CASE WHEN cabe.cabe_fecpres IS NOT NULL THEN month(cabe.cabe_fecpres) ELSE 0 END AS mes_presentacion,
	CASE WHEN cabe.cabe_fecpres IS NOT NULL THEN year(cabe.cabe_fecpres) ELSE 0 END AS anyo_presentacion,

    cabe.cabe_numcaja AS num_caja,

	CASE WHEN cabe.cabe_fecalta IS NULL THEN '0001-01-01' ELSE cabe.cabe_fecalta END AS fecha_alta,
	CASE WHEN cabe.cabe_fecalta IS NOT NULL THEN month(cabe.cabe_fecalta) ELSE 0 END AS mes_alta,
	CASE WHEN cabe.cabe_fecalta IS NOT NULL THEN year(cabe.cabe_fecalta) ELSE 0 END AS anyo_alta,

    cabe.cabe_justif AS num_justificante,

	--tipo_declaracion.id_tipo_declaracion AS id_tipo_declaracion,
	cabe.cabe_tipodecl AS cod_tipo_declaracion,

    cabe.cabe_crevi AS contador_revisiones,
    cabe.cabe_regfiscal AS regimen_fiscal_deducciones,

	--admon_ddo.id_administracion AS id_administracion_declarado,
    coalesce(declarado.mfpe59_admon,'') AS administracion_declarado,
    CASE WHEN declarado.mfpe59_admon<>'B' THEN 1 ELSE 0 END AS es_externo_declarado,
	
	coalesce(declarado.mfpe59_cif,'') AS nif_declarado_159,
    CAST(declarado.mfpe59_secuen AS varchar) AS secuencia,
    coalesce(c_declarado.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarado,
    CASE WHEN declarado.mfpe59_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarado,
    CASE WHEN declarado.mfpe59_error=1 THEN 1 ELSE 0 END AS es_erroneo_declarado,

	--clave_tipo_codigo.id_clave_tipo_codigo AS id_clave_tipo_codigo, 
	declarado.mfpe59_tipo_codigo AS cod_clave_tipo_codigo,


	coalesce(declarado.mfpe59_iban,'') AS codigo_iban,
    coalesce(declarado.mfpe59_ccc_banco,'') AS codigo_entidad,
    coalesce(declarado.mfpe59_ccc_sucur,'') AS codigo_sucursal,
    coalesce(declarado.mfpe59_ccc_dc,'') AS digito_control,
    coalesce(declarado.mfpe59_ccc_cuenta,'') AS numero_cuenta,
	
	--pais_declarado.id_pais AS id_pais_residencia,
	declarado.mfpe59_cie_pais AS cod_pais_residencia,

    declarado.mfpe59_cie_codigo AS identificacion_extranjero,
	
    declarado.mfpe59_contrato AS contrato_suministro,

	--pais_cups.id_pais AS id_cups_pais,
	declarado.mfpe59_cups_pais AS cod_cups_pais,
    
    declarado.mfpe59_cups_dist AS cups_distribuidora,
    declarado.mfpe59_cups_libre AS cups_num_libre_asignacion,  
    declarado.mfpe59_cups_dc AS cups_digito_control,
    declarado.mfpe59_cups_medida AS cups_medida,  
    declarado.mfpe59_cups_suministro AS cups_suministro, 
     
	--t_bien.id_mae_tipo_bien AS id_mae_tipo_bien,  
	declarado.mfpe59_tipo_bien AS cod_tipo_bien, 

	--sit_inmueble.id_mae_situacion_inmueble AS cod_situacion_inmueble,  
    declarado.mfpe59_situacion AS situacion_inmueble, 
	
    declarado.mfpe59_refcat AS referencia_catastral,

	CASE WHEN declarado.mfpe59_fecalta IS NULL THEN '0001-01-01' ELSE declarado.mfpe59_fecalta END AS fecha_alta_contrato,
	CASE WHEN declarado.mfpe59_fecalta IS NOT NULL THEN month(declarado.mfpe59_fecalta) ELSE 0 END AS mes_alta_contrato,
	CASE WHEN declarado.mfpe59_fecalta IS NOT NULL THEN year(declarado.mfpe59_fecalta) ELSE 0 END AS anyo_alta_contrato,

	CASE WHEN declarado.mfpe59_fecbaja IS NULL THEN '0001-01-01' ELSE declarado.mfpe59_fecbaja END AS fecha_baja_contrato,
	CASE WHEN declarado.mfpe59_fecbaja IS NOT NULL THEN month(declarado.mfpe59_fecbaja) ELSE 0 END AS mes_baja_contrato,
	CASE WHEN declarado.mfpe59_fecbaja IS NOT NULL THEN year(declarado.mfpe59_fecbaja) ELSE 0 END AS anyo_baja_contrato,

	--u_consumo.id_mae_unidad_consumo AS id_mae_unidad_consumo,  
    declarado.mfpe59_unidad_medida AS cod_unidad_consumo,
	
	--u_potencia.id_mae_unidad_potencia AS id_mae_unidad_potencia,  
    declarado.mfpe59_pot_unidad AS cod_unidad_potencia,
 
    declarado.mfpe59_pot_maxima AS potencia_maxima_contratada,

	--t_importe.id_mae_tipo_importe AS id_mae_tipo_importe,  
	importes.mfim59_tipo AS cod_tipo_importe,

    CASE
        WHEN row_number() OVER (PARTITION BY doc.id_documento,CAST(declarado.mfpe59_secuen AS varchar)
	  	     ORDER BY doc.id_documento,CAST(declarado.mfpe59_secuen AS varchar),importes.mfim59_tipo,consumos.mfco59_periodo)=1 
		THEN sum(round(importes.mfim59_importe/100,2))
        ELSE 0
    END AS importe,
	
	
    --coalesce(tipos_periodo.id_tipo_periodo,indefinidos.id_tipo_periodo) AS id_tipo_periodo,
	consumos.mfco59_periodo AS cod_periodo_facturado,
	
    consumos.mfco59_con_fact AS consumo_facturado,
	
	--t_lectura.id_mae_tipo_lectura AS id_mae_tipo_lectura,
	consumos.mfco59_con_tipo AS cod_tipo_lectura,
	     
	domicilio.sddomi_municipio AS domi_municipio,
	domicilio.sddomi_cdgo_mun AS domi_codigo_municipio,
	domicilio.sddomi_cdgo_prov AS domi_codigo_provincia,
	domicilio.sddomi_cdgo_postal AS domi_codigo_postal


 
	/*
    domicilio.sddomi_tipo AS tipo_direccion,
    domicilio.sddomi_orden AS orden,
    domicilio.sddomi_nropte AS num_puente_domicilio,
    domicilio.sddomi_tipo_via AS tipo_via,
    domicilio.sddomi_nombre_via AS nombre_via,
    domicilio.sddomi_tipo_numero AS tipo_numero,
    domicilio.sddomi_numero_casa AS numero_casa,
    domicilio.sddomi_calificador AS calificador_numero,
    domicilio.sddomi_bloque AS bloque,
    domicilio.sddomi_portal AS portal,
    domicilio.sddomi_escalera AS escalera,
    domicilio.sddomi_piso AS piso,
    domicilio.sddomi_puerta AS puerta,
    domicilio.sddomi_complemento AS complemento,
    domicilio.sddomi_localidad AS localidad,
    domicilio.sddomi_municipio AS municipio,
    coalesce(municipio.id_municipio,indefinidos.id_municipio) AS id_municipio,
    coalesce(provincia.id_provincia,indefinidos.id_provincia) AS id_provincia,
    domicilio.sddomi_cdgo_postal AS codigo_postal,
    repre.sdrepr_nifrp AS nif_representante,
    repre.sdrepr_fjuri AS forma_juridica_representante,
    repre.sdrepr_letra AS letra_nif_representante,
    repre.sdrepr_falta AS fecha_alta_representante,
    repre.sdrepr_fmodi AS fecha_modificacion_representante,
    repre.sdrepr_baja AS sw_baja_representante,
    repre.sdrepr_nropte AS num_puente_representante
	*/
	
    FROM dbn1_stg_dhyf.dbo.tbn1pe59_mf declarado
    INNER JOIN dbn1_stg_dhyf.dbo.tbn1im59_mf importes ON (declarado.mfpe59_ejercicio=importes.mfim59_ejercicio AND declarado.mfpe59_admon=importes.mfim59_admon AND declarado.mfpe59_referdoc=importes.mfim59_referdoc AND declarado.mfpe59_secuen=importes.mfim59_secuen)
    INNER JOIN (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1cabe_mf WHERE cabe_modelo='159') cabe ON cabe.cabe_ejercicio=declarado.mfpe59_ejercicio AND cabe.cabe_referdoc=declarado.mfpe59_referdoc
    INNER JOIN dbn1_stg_dhyf.dbo.tbn1co59_mf consumos ON (declarado.mfpe59_ejercicio=consumos.mfco59_ejercicio AND declarado.mfpe59_admon=consumos.mfco59_admon AND declarado.mfpe59_referdoc=consumos.mfco59_referdoc AND declarado.mfpe59_secuen=consumos.mfco59_secuen)
    LEFT JOIN (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1domi_sd WHERE sddomi_modelo='159' AND sddomi_cdgo_prov='48') domicilio ON declarado.mfpe59_ejercicio=domicilio.sddomi_ejercicio AND declarado.mfpe59_admon=domicilio.sddomi_admon AND declarado.mfpe59_referdoc=domicilio.sddomi_referdoc AND declarado.mfpe59_secuen=domicilio.sddomi_secuen
    --LEFT JOIN (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1repr_sd WHERE sdrepr_model='159') repre ON declarado.mfpe59_ejercicio=repre.sdrepr_ejerc AND declarado.mfpe59_admon=repre.sdrepr_admon AND declarado.mfpe59_referdoc=CAST(repre.sdrepr_refer AS varchar) AND declarado.mfpe59_secuen=repre.sdrepr_secue
    INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_dim_documentos doc ON (doc.referencia_larga=CAST(declarado.mfpe59_ejercicio AS varchar)+'I<'+CAST(declarado.mfpe59_referdoc AS varchar)+'00K0000')
	--INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(declarado.mfpe59_ejercicio AS varchar)+'I<'+CAST(declarado.mfpe59_referdoc AS varchar)+'00K0000')

    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente) AND e.fec_baja IS NULL
	--INNER JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (c.id_contribuyente=e.id_contribuyente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarante ON (cabe.cabe_cifdecl=c_declarante.nif_maestro AND c_declarante.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarado ON (declarado.mfpe59_cif=c_declarado.nif_maestro AND c_declarado.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.cod_tipo_presentacion=cabe.cabe_tiposoporte)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion tipo_declaracion ON (tipo_declaracion.cod_tipo_declaracion=cabe.cabe_tipodecl)
	
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda admon_decl
				ON	cabe.cabe_admon = admon_decl.cod_administracion

	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda admon_ddo
				ON	declarado.mfpe59_admon = admon_ddo.cod_administracion

    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo clave_tipo_codigo ON (clave_tipo_codigo.cod_clave_tipo_codigo=declarado.mfpe59_tipo_codigo)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais_declarado ON (pais_declarado.cod_pais=declarado.mfpe59_cie_pais)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais_cups ON (pais_cups.cod_pais=declarado.mfpe59_cups_pais)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=domicilio.sddomi_cdgo_prov)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_municipios municipio ON (municipio.cod_municipio=domicilio.sddomi_cdgo_mun)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_tipos_periodo tipos_periodo ON (tipos_periodo.cod_tipo_periodo=consumos.mfco59_periodo)

	--no_identificados_declarante
	LEFT JOIN mae_noid mae_noid_cabe 
			ON	cabe.cabe_ejercicio = mae_noid_cabe.ejercicio
			AND CAST(cabe.cabe_referdoc as varchar) = mae_noid_cabe.clavagru
			AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 

	--no_identificados_declarado
	LEFT JOIN	mae_noid  mae_noid_det
			ON	cabe.cabe_ejercicio = mae_noid_det.ejercicio
			AND CAST(cabe.cabe_referdoc as varchar) = mae_noid_det.clavagru
			AND right('0000000000000' +  cast(declarado.mfpe59_secuen as varchar) , 13) = mae_noid_det.clavdeta 


    LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_bien t_bien
			ON declarado.mfpe59_tipo_bien = t_bien.cod_tipo_bien 
			
    LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_situacion_inmueble  sit_inmueble
			ON declarado.mfpe59_situacion = sit_inmueble.cod_situacion_inmueble
					
	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_consumo u_consumo
			ON declarado.mfpe59_unidad_medida = u_consumo.cod_unidad_consumo

	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_unidad_potencia u_potencia
			ON declarado.mfpe59_pot_unidad = u_potencia.cod_unidad_potencia	

	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_importe t_importe
			ON importes.mfim59_tipo = t_importe.cod_tipo_importe


	LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_tipo_lectura t_lectura
			ON consumos.mfco59_con_tipo = t_lectura.cod_tipo_lectura
			
	CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    --where declarado.mfpe59_contrato in ('002002559439','002002559441','002002559431','002002559426','002002559446')

GROUP BY
    doc.id_documento,
    e.id_expediente,
	mae_noid_cabe.id_mae_no_identificados,
	mae_noid_det.id_mae_no_identificados,
    cabe.cabe_ejercicio,
    coalesce(cabe.cabe_modelo,''),

	--admon_decl.id_administracion,
    coalesce(cabe.cabe_admon,''),

    CASE WHEN cabe.cabe_admon<>'B' THEN 1 ELSE 0 END,
    coalesce(cabe.cabe_cifdecl,''),
    coalesce(c_declarante.id_contribuyente,indefinidos.id_contribuyente),
    CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END,
    
	coalesce(cabe.cabe_telefono,''),
    coalesce(cabe.cabe_persona,''),
    coalesce(cabe.cabe_refpres,''),
    coalesce(cabe.cabe_banco,''),
	
	--tipo_pres.id_tipo_presentacion,
	cabe.cabe_tiposoporte,
    
	cabe.cabe_fecpres,
    cabe.cabe_numcaja,
	cabe.cabe_fecalta,
    cabe.cabe_justif,
	
    --tipo_declaracion.id_tipo_declaracion,
	cabe.cabe_tipodecl,
	
    cabe.cabe_crevi,
    cabe.cabe_regfiscal,
	
	--admon_ddo.id_administracion,
    coalesce(declarado.mfpe59_admon,''),

    CASE WHEN declarado.mfpe59_admon<>'B' THEN 1 ELSE 0 END,
	coalesce(declarado.mfpe59_cif,''),
    CAST(declarado.mfpe59_secuen AS varchar),
    
    coalesce(c_declarado.id_contribuyente,indefinidos.id_contribuyente),
    CASE WHEN declarado.mfpe59_identif=1 THEN 1 ELSE 0 END,
    CASE WHEN declarado.mfpe59_error=1 THEN 1 ELSE 0 END,
	  
	--clave_tipo_codigo.id_clave_tipo_codigo,
	declarado.mfpe59_tipo_codigo,

    coalesce(declarado.mfpe59_iban,''),
    coalesce(declarado.mfpe59_ccc_banco,''),
    coalesce(declarado.mfpe59_ccc_sucur,''),
    coalesce(declarado.mfpe59_ccc_dc,''),
    coalesce(declarado.mfpe59_ccc_cuenta,''),
	
	--pais_declarado.id_pais,
	declarado.mfpe59_cie_pais,
   
    declarado.mfpe59_cie_codigo,
    declarado.mfpe59_contrato,
	
	--pais_cups.id_pais,
	declarado.mfpe59_cups_pais,
   
    declarado.mfpe59_cups_dist,
    declarado.mfpe59_cups_libre,
    declarado.mfpe59_cups_dc,
    declarado.mfpe59_cups_medida,
    declarado.mfpe59_cups_suministro,
	
	--t_bien.id_mae_tipo_bien,
	declarado.mfpe59_tipo_bien,
	
	--sit_inmueble.id_mae_situacion_inmueble,	
	declarado.mfpe59_situacion,

    declarado.mfpe59_refcat,
    declarado.mfpe59_fecalta,
    declarado.mfpe59_fecbaja,
	
	--u_consumo.id_mae_unidad_consumo ,  
	declarado.mfpe59_unidad_medida,
	
	--u_potencia.id_mae_unidad_potencia,  
    declarado.mfpe59_pot_unidad,
 
	declarado.mfpe59_pot_maxima,

	--t_importe.id_mae_tipo_importe,
	importes.mfim59_tipo,

	importes.mfim59_importe,
    
	--coalesce(tipos_periodo.id_tipo_periodo,indefinidos.id_tipo_periodo) AS id_tipo_periodo,
	consumos.mfco59_periodo,
	
	consumos.mfco59_con_fact,

	--t_lectura.id_mae_tipo_lectura,
	consumos.mfco59_con_tipo,
  
	domicilio.sddomi_municipio,
	domicilio.sddomi_cdgo_mun,
	domicilio.sddomi_cdgo_prov,
	domicilio.sddomi_cdgo_postal

      /*
	  domicilio.sddomi_tipo,
      domicilio.sddomi_orden,
      domicilio.sddomi_nropte,
      domicilio.sddomi_tipo_via,
      domicilio.sddomi_nombre_via,
      domicilio.sddomi_tipo_numero,
      domicilio.sddomi_numero_casa,
      domicilio.sddomi_calificador,
      domicilio.sddomi_bloque,
      domicilio.sddomi_portal,
      domicilio.sddomi_escalera,
      domicilio.sddomi_piso,
      domicilio.sddomi_puerta,
      domicilio.sddomi_complemento,
      domicilio.sddomi_localidad,
      domicilio.sddomi_municipio,
      coalesce(municipio.id_municipio,indefinidos.id_municipio),
      coalesce(provincia.id_provincia,indefinidos.id_provincia),
      domicilio.sddomi_cdgo_postal,
      repre.sdrepr_nifrp,
      repre.sdrepr_fjuri,
      repre.sdrepr_letra,
      repre.sdrepr_falta,
      repre.sdrepr_fmodi,
      repre.sdrepr_baja,
      repre.sdrepr_nropte
	  */

	  )


	  select * from query order by id_documento
