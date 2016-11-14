;WITH
mae_noid AS 
(
        SELECT id_mae_no_identificados,
                    ejercicio,
                    clavagru,
                    clavdeta
        FROM   dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados
        WHERE  aplicacion = 'BW'
        AND detamodel = '781'
),
query AS (

	--CUENTA VIVIENDA (INTERNOS)
	SELECT
		doc.id_documento	AS id_documento,
		e.id_expediente		AS id_expediente,
		decl.deejerc 		AS ejercicio,
		coalesce(decl.demodel ,'')	AS modelo ,
		admini_decl.id_administracion AS id_administracion_declarante,

		coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante,
		coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado,

		0	AS es_externo_declarante,
		coalesce(ddos.donifde ,'') 	AS nif_declarante_781_11,
		coalesce(left(coalesce(ddos.donifde ,''),9)+' '+right(coalesce(ddos.donifde ,''),2),'') AS nif_declarante_781,
		--nif_declarante_no_identificado_11,
		--nif_declarante_no_identificado,
		CASE WHEN c_declarante.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END	AS es_contribuyente_declarante,
		coalesce(c_declarante.id_contribuyente,indefinidos.id_contribuyente)	AS id_contribuyente_declarante,
		--AS es_identificado_declarante,
		--AS sw_identificado_declarante,

		coalesce(decl.decompl,'') 	AS es_complementaria,
		coalesce(decl.desusti,'') 	AS es_sustitutiva,
		tipo_pres.id_tipo_presentacion	AS id_tipo_presentacion,  --carga por integridad
		coalesce(decl.detelco,'')	AS telefono_contacto,
		coalesce(decl.denomco,'') 	AS nombre_contacto,
		decl.dencaja 	AS numero_caja,
		decl.decrevi 	AS contador_revisiones,
		CASE WHEN decl.defecpr<>'0001-01-01' THEN decl.defecpr ELSE CAST('21000101' AS date) END AS fecha_presentacion,
		month(CASE WHEN decl.defecpr<>'0001-01-01' THEN decl.defecpr ELSE CAST('21000101' AS date) END)	AS mes_presentacion,
		year(CASE WHEN decl.defecpr<>'0001-01-01' THEN decl.defecpr ELSE CAST('21000101' AS date) END)	AS anyo_presentacion ,
		CASE WHEN decl.derhviv ='S' THEN 'S' ELSE 'N' END	AS es_rehabilitacion,
		
		CAST(ddos.dosecue  AS varchar)	AS secuencia,
	
  ----- datos CUENTA VIVIENDA -----
		admini_ddos.id_administracion AS id_administracion_declarado,
		0	AS es_externo_declarado,
		coalesce(ddos.donifdo ,'') 	AS nif_declarado_781_11,
		coalesce(left(coalesce(ddos.donifdo ,''),9)+' '+right(coalesce(ddos.donifdo ,''),2),'') 	AS nif_declarado_781,
		CASE WHEN CASE WHEN ddos.doident=1 THEN 1 ELSE 0 END=0 THEN coalesce(ddos.donifdo,'') ELSE '' END	AS nif_declarado_no_identificado_11,
		coalesce(left(CASE WHEN CASE WHEN ddos.doident=1 THEN 1 ELSE 0 END=0 THEN coalesce(ddos.donifdo,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN ddos.doident=1 THEN 1 ELSE 0 END=0 THEN coalesce(ddos.donifdo,'') ELSE '' END,2),'')	AS nif_declarado_no_identificado  ,
		CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END	AS es_contribuyente_declarado,
		coalesce(c_declarado.id_contribuyente,indefinidos.id_contribuyente)	AS id_contribuyente_declarado,
		ddos.doident  AS nivel_identificacion_nif_declarado,
		CASE WHEN ddos.doident =1 THEN 1 ELSE 0 END	AS es_identificado_declarado,
		CASE
			WHEN CASE WHEN ddos.doident=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
			WHEN CASE WHEN ddos.doident=1 THEN 1 ELSE 0 END=0 THEN 1
			WHEN CASE WHEN ddos.doident=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
			ELSE ''
		END AS sw_identificado_declarado,
		coalesce(dorepre,'') 	AS sw_representante ,
		provincia.id_provincia	AS id_provincia,
		coalesce(ddos.donumer,'') AS numero_identificacion_cuenta_vivienda,
		CASE WHEN ddos.dofecha <>'0001-01-01' THEN ddos.dofecha ELSE CAST('21000101' AS date) END AS fecha_apertura_cuenta_vivienda,
		month(CASE WHEN ddos.dofecha <>'0001-01-01' THEN ddos.dofecha ELSE CAST('21000101' AS date) END) AS mes_apertura_cuenta_vivienda,
		year(CASE WHEN ddos.dofecha <>'0001-01-01' THEN ddos.dofecha ELSE CAST('21000101' AS date) END)	AS anyo_apertura_cuenta_vivienda,
		round(ddos.dosdini/100,2)	AS saldo_inicial_ejercicio,
		round(ddos.dosdfin/100,2)	AS saldo_final_ejercicio,
		round(ddos.doparti/100,2)	AS porcentaje_participacion,
		
		--part.panumer		AS numero_partida,
		--round(part.padecla/100,2)	AS importe_valor_declarado,
		--round(part.pacalcu/100,2)	AS importe_valor_calculado,
		
 ----- datos REHABILITACIÓN VIVIENDA -----
		''	AS nif_titular_inmueble_rehabilitacion,
		''	AS nivel_identificacion_nif_titular, 
		0	AS es_identificado_titular,

		''	AS sw_identificado_titular,

		'' 	AS expediente_rehabilitacion,
		0	AS importe_parcial_obra,
		0	AS importe_final_obra,
		0	AS importe_prestamo,
		CAST('21000101' AS date) AS fecha_formalizacion_prestamo,
		month(CAST('21000101' AS date)) AS mes_formalizacion_prestamo,
		year(CAST('21000101' AS date))	AS anyo_formalizacion_prestamo,
		''	AS codigo_entidad,
		''	AS codigo_sucursal,
		''	AS codigo_control,
		''	AS numero_cuenta 

	FROM (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1decl_bw WHERE demodel='781') decl
	INNER JOIN dbn1_stg_dhyf.dbo.tbn1ddos_bw ddos ON decl.deejerc=ddos.doejerc  AND decl.derefer =ddos.dorefer 

	--no_identificados_declarante
	LEFT JOIN mae_noid mae_noid_cabe
			ON	decl.deejerc = mae_noid_cabe.ejercicio
			AND cast(decl.derefer as varchar)= mae_noid_cabe.clavagru
			AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 

	--no_identificados_declarado
	LEFT JOIN mae_noid mae_noid_det
			ON	decl.deejerc = mae_noid_det.ejercicio
			AND cast(decl.derefer as varchar) = mae_noid_det.clavagru
			AND right('0000000000000' +  cast(ddos.dosecue  as varchar) , 13)=  mae_noid_det.clavdeta 

    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(ddos.doejerc AS varchar)+'VG'+CAST(ddos.dorefer AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarante ON (ddos.donifde=c_declarante.nif_maestro AND c_declarante.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarado ON (ddos.donifdo=c_declarado.nif_maestro AND c_declarado.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.cod_tipo_presentacion=decl.detipop)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=ddos.docodpr)
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda admini_ddos ON (admini_ddos.cod_administracion='B')
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda admini_decl ON (admini_decl.cod_administracion='B')
	CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos  

UNION ALL	
	
	--CUENTA VIVIENDA (EXTERNOS)
	SELECT
		doc.id_documento	AS id_documento,
		e.id_expediente		AS id_expediente,
		decl.dxejerc 		AS ejercicio,
		coalesce(decl.dxmodel,'')	AS modelo ,
		admini_decl.id_administracion AS id_administracion_declarante,

		coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante,
		coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado,

		1	AS es_externo_declarante,
		coalesce(ddos.doxnifde ,'') 	AS nif_declarante_781_11,
		coalesce(left(coalesce(ddos.doxnifde ,''),9)+' '+right(coalesce(ddos.doxnifde ,''),2),'') AS nif_declarante_781,
		--nif_declarante_no_identificado_11,
		--nif_declarante_no_identificado,
		CASE WHEN c_declarante.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END	AS es_contribuyente_declarante,
		coalesce(c_declarante.id_contribuyente,indefinidos.id_contribuyente)	AS id_contribuyente_declarante,
		--AS es_identificado_declarante,
		--AS sw_identificado_declarante,

		'' 	AS es_complementaria,
		''	AS es_sustitutiva,
		-1	AS id_tipo_presentacion,  --carga por integridad
		''	AS telefono_contacto,
		''	AS nombre_contacto,
		'' 	AS numero_caja,
		0 	AS contador_revisiones,
		'21000101' fecha_presentacion,
		01		AS mes_presentacion,
		2100	AS anyo_presentacion ,
		CASE WHEN decl.dxrhviv ='S' THEN 'S' ELSE 'N' END	AS es_rehabilitacion,

		CAST(ddos.doxsecue  AS varchar)	AS secuencia,

  ----- datos CUENTA VIVIENDA -----
		admini_ddos.id_administracion AS id_administracion_declarado,
		1	AS es_externo_declarado,
		coalesce(ddos.doxnifdo ,'') 	AS nif_declarado_781_11,
		coalesce(left(coalesce(ddos.doxnifdo ,''),9)+' '+right(coalesce(ddos.doxnifdo ,''),2),'') 	AS nif_declarado_781,
		CASE WHEN CASE WHEN ddos.doxident=1 THEN 1 ELSE 0 END=0 THEN coalesce(ddos.doxnifdo,'') ELSE '' END	AS nif_declarado_no_identificado_11,
		coalesce(left(CASE WHEN CASE WHEN ddos.doxident=1 THEN 1 ELSE 0 END=0 THEN coalesce(ddos.doxnifdo,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN ddos.doxident=1 THEN 1 ELSE 0 END=0 THEN coalesce(ddos.doxnifdo,'') ELSE '' END,2),'')	AS nif_declarado_no_identificado  ,
		CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END	AS es_contribuyente_declarado,
		coalesce(c_declarado.id_contribuyente,indefinidos.id_contribuyente)	AS id_contribuyente_declarado,
		ddos.doxident  AS nivel_identificacion_nif_declarado,
		CASE WHEN ddos.doxident =1 THEN 1 ELSE 0 END	AS es_identificado_declarado,
		CASE
			WHEN CASE WHEN ddos.doxident=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
			WHEN CASE WHEN ddos.doxident=1 THEN 1 ELSE 0 END=0 THEN 1
			WHEN CASE WHEN ddos.doxident=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
			ELSE ''
		END AS sw_identificado_declarado,
		doxrepre 	AS sw_representante ,
		provincia.id_provincia	AS id_provincia,
		coalesce(ddos.doxnumer,'') AS numero_identificacion_cuenta_vivienda,
		CASE WHEN ddos.doxfecha <>'0001-01-01' THEN ddos.doxfecha ELSE CAST('21000101' AS date) END AS fecha_apertura_cuenta_vivienda,
		month(CASE WHEN ddos.doxfecha <>'0001-01-01' THEN ddos.doxfecha ELSE CAST('21000101' AS date) END) AS mes_apertura_cuenta_vivienda,
		year(CASE WHEN ddos.doxfecha <>'0001-01-01' THEN ddos.doxfecha ELSE CAST('21000101' AS date) END)	AS anyo_apertura_cuenta_vivienda,
		round(ddos.doxsdini/100,2)	AS saldo_inicial_ejercicio,
		round(ddos.doxsdfin/100,2)	AS saldo_final_ejercicio,
		round(ddos.doxparti/100,2)	AS porcentaje_participacion,

		--part.paxnumer		AS numero_partida,
		--round(part.paxdecla/100,2)	AS importe_valor_declarado,
		--round(part.paxcalcu/100,2)	AS importe_valor_calculado,
        
  ----- datos REHABILITACIÓN VIVIENDA -----
		''	AS nif_titular_inmueble_rehabilitacion,
		''	AS nivel_identificacion_nif_titular, 
		0	AS es_identificado_titular,

		''	AS sw_identificado_titular,

		'' 	AS expediente_rehabilitacion,
		0	AS importe_parcial_obra,
		0	AS importe_final_obra,
		0	AS importe_prestamo,
		CAST('21000101' AS date) AS fecha_formalizacion_prestamo,
		month(CAST('21000101' AS date)) AS mes_formalizacion_prestamo,
		year(CAST('21000101' AS date))	AS anyo_formalizacion_prestamo,
		''	AS codigo_entidad,
		''	AS codigo_sucursal,
		''	AS codigo_control,
		''	AS numero_cuenta 

	FROM (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1i3de_bw WHERE dxmodel='781') decl 
	INNER JOIN dbn1_stg_dhyf.dbo.tbn1i3do_bw ddos ON decl.dxejerc=ddos.doxejerc  AND decl.dxrefer=ddos.doxrefer 

	--no_identificados_declarante
	LEFT JOIN	mae_noid mae_noid_cabe
			ON	decl.dxejerc = mae_noid_cabe.ejercicio
			AND cast(decl.dxrefer as varchar) = mae_noid_cabe.clavagru
			AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 
	
	--no_identificados_declarado
	LEFT JOIN mae_noid mae_noid_det
			ON	decl.dxejerc = mae_noid_det.ejercicio
			AND cast(decl.dxrefer as varchar) = mae_noid_det.clavagru
			AND right('0000000000000' +  cast(ddos.doxsecue  as varchar) , 13)=  mae_noid_det.clavdeta

    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(ddos.doxejerc AS varchar)+'VG'+CAST(ddos.doxrefer AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarante ON (ddos.doxnifde=c_declarante.nif_maestro AND c_declarante.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarado ON (ddos.doxnifdo=c_declarado.nif_maestro AND c_declarado.fec_fin_vigencia=CAST('21000101' AS datetime))
    
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=ddos.doxcodpr)
	
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda admini_ddos ON (admini_ddos.cod_provincia=ddos.doxadmon )
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda admini_decl ON (admini_decl.cod_provincia=decl.dxadmon)
    
	CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos  

UNION ALL
	
	--REHABILITACIÓN VIVIENDA (INTERNOS)   
	SELECT
		doc.id_documento	AS id_documento,
		e.id_expediente		AS id_expediente,
		decl.deejerc 		AS ejercicio,
		coalesce(decl.demodel ,'')	AS modelo ,
		admini_decl.id_administracion AS id_administracion_declarante,

		coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante,
		coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado,

		0	AS es_externo_declarante,

		coalesce(rhvi.rhnifde ,'') 	AS nif_declarante_781_11,
		coalesce(left(coalesce(rhvi.rhnifde ,''),9)+' '+right(coalesce(rhvi.rhnifde ,''),2),'') AS nif_declarante_781,

		--nif_declarante_no_identificado_11,
		--nif_declarante_no_identificado,

		CASE WHEN c_declarante.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END	AS es_contribuyente_declarante,
		coalesce(c_declarante.id_contribuyente,indefinidos.id_contribuyente)	AS id_contribuyente_declarante,
		--AS es_identificado_declarante,
		--AS sw_identificado_declarante,

		coalesce(decl.decompl,'') 	AS es_complementaria,
		coalesce(decl.desusti,'') 	AS es_sustitutiva,
		tipo_pres.id_tipo_presentacion	AS id_tipo_presentacion,  --carga por integridad
		coalesce(decl.detelco,'')	AS telefono_contacto,
		coalesce(decl.denomco,'') 	AS nombre_contacto,
		decl.dencaja 	AS numero_caja,
		decl.decrevi 	AS contador_revisiones,
		CASE WHEN decl.defecpr<>'0001-01-01' THEN decl.defecpr ELSE CAST('21000101' AS date) END AS fecha_presentacion,
		month(CASE WHEN decl.defecpr<>'0001-01-01' THEN decl.defecpr ELSE CAST('21000101' AS date) END)	AS mes_presentacion,
		year(CASE WHEN decl.defecpr<>'0001-01-01' THEN decl.defecpr ELSE CAST('21000101' AS date) END)	AS anyo_presentacion ,
		CASE WHEN decl.derhviv ='S' THEN 'S' ELSE 'N' END	AS es_rehabilitacion,

		CAST(rhvi.rhsecue  AS varchar)	AS secuencia,

  ----- datos CUENTA VIVIENDA -----
		1	AS id_administracion_declarado,  
		0	AS es_externo_declarado,

		''	AS nif_declarado_781_11,
		'' 	AS nif_declarado_781,

		''	AS nif_declarado_no_identificado_11,
		''	AS nif_declarado_no_identificado  ,
		0   AS es_contribuyente_declarado,
		
		indefinidos.id_contribuyente	AS id_contribuyente_declarado, 
		''  AS nivel_identificacion_nif_declarado,
	    0   AS es_identificado_declarado,
		
		''  AS sw_identificado_declarado,
		''  AS sw_representante ,
		
		-1   AS id_provincia, 
		''  AS numero_identificacion_cuenta_vivienda,
		
		CAST('21000101' AS date) AS fecha_apertura_cuenta_vivienda,
		month(CAST('21000101' AS date)) AS mes_apertura_cuenta_vivienda,
		year(CAST('21000101' AS date))	AS anyo_apertura_cuenta_vivienda,

		0	AS saldo_inicial_ejercicio,
		0	AS saldo_final_ejercicio,
		0	AS porcentaje_participacion,

		--part.panumer		AS numero_partida,
		--round(part.padecla/100,2)	AS importe_valor_declarado,
		--round(part.pacalcu/100,2)	AS importe_valor_calculado,

  ----- datos REHABILITACIÓN VIVIENDA -----
		coalesce(left(coalesce(rhvi.rhnifti ,''),9)+' '+right(coalesce(rhvi.rhnifti ,''),2),'') 	AS nif_titular_inmueble_rehabilitacion,
	
		coalesce(rhvi.rhident,'')   AS nivel_identificacion_nif_titular, 
		CASE WHEN rhvi.rhident =1 THEN 1 ELSE 0 END	AS es_identificado_titular,

		CASE
			WHEN CASE WHEN rhvi.rhident=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_titular.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
			WHEN CASE WHEN rhvi.rhident=1 THEN 1 ELSE 0 END=0 THEN 1
			WHEN CASE WHEN rhvi.rhident=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_titular.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
			ELSE ''
		END AS sw_identificado_titular,

		coalesce(rhvi.rhnexpe,'') 	AS expediente_rehabilitacion,
		round(rhvi.rhicpar/100,2)	AS importe_parcial_obra,
		round(rhvi.rhicfin/100,2)	AS importe_final_obra,
		round(rhvi.rhimpre/100,2)	AS importe_prestamo,
		CASE WHEN rhvi.rhfechp <>'0001-01-01' THEN rhvi.rhfechp ELSE CAST('21000101' AS date) END AS fecha_formalizacion_prestamo,
		month(CASE WHEN rhvi.rhfechp <>'0001-01-01' THEN rhvi.rhfechp ELSE CAST('21000101' AS date) END) AS mes_formalizacion_prestamo,
		year(CASE WHEN rhvi.rhfechp <>'0001-01-01' THEN rhvi.rhfechp ELSE CAST('21000101' AS date) END)	AS anyo_formalizacion_prestamo,
		coalesce(rhvi.rhentip,'')	AS codigo_entidad,
		coalesce(rhvi.rhsucup,'')	AS codigo_sucursal,
		coalesce(rhvi.rhcodcp,'') 	AS codigo_control,
		coalesce(rhvi.rhnctap,'')	AS numero_cuenta 

	FROM (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1decl_bw WHERE demodel='781') decl
	INNER JOIN dbn1_stg_dhyf.dbo.tbn1rhvi_bw rhvi ON  decl.deejerc=rhvi.rhejerc AND decl.derefer=rhvi.rhrefer
	
	--no_identificados_declarante
	LEFT JOIN mae_noid mae_noid_cabe
			ON	decl.deejerc = mae_noid_cabe.ejercicio
			AND cast(decl.derefer as varchar)= mae_noid_cabe.clavagru
			AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 

	--no_identificados_declarado
	LEFT JOIN mae_noid mae_noid_det
			ON	decl.deejerc = mae_noid_det.ejercicio
			AND cast(decl.derefer as varchar) = mae_noid_det.clavagru  
			AND right('0000000000000' +  cast(rhvi.rhsecue   as varchar) , 13)=  mae_noid_det.clavdeta 
		  
	
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(rhvi.rhejerc AS varchar)+'VG'+CAST(rhvi.rhrefer AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarante ON (rhvi.rhnifde=c_declarante.nif_maestro AND c_declarante.fec_fin_vigencia=CAST('21000101' AS datetime))
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_titular ON (rhvi.rhnifti =c_titular.nif_maestro AND c_titular.fec_fin_vigencia=CAST('21000101' AS datetime))
    
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.cod_tipo_presentacion=decl.detipop)

	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda admini_decl ON (admini_decl.cod_administracion='B')
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda admini_tit ON (admini_tit.cod_provincia=rhvi.rhadmon)

	CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos  

UNION ALL
	
	--REHABILITACIÓN VIVIENDA (EXTERNOS)
	SELECT
		doc.id_documento	AS id_documento,
		e.id_expediente		AS id_expediente,
		decl.dxejerc 		AS ejercicio,
		coalesce(decl.dxmodel,'')	AS modelo ,
		admini_decl.id_administracion AS id_administracion_declarante,

		coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante,
		coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado,

		1	AS es_externo_declarante,

		coalesce(rhvi.rhnifde ,'') 	AS nif_declarante_781_11,
		coalesce(left(coalesce(rhvi.rhnifde ,''),9)+' '+right(coalesce(rhvi.rhnifde ,''),2),'') AS nif_declarante_781,

		--nif_declarante_no_identificado_11,
		--nif_declarante_no_identificado,

		CASE WHEN c_declarante.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END	AS es_contribuyente_declarante,
		coalesce(c_declarante.id_contribuyente,indefinidos.id_contribuyente)	AS id_contribuyente_declarante,
		--AS es_identificado_declarante,
		--AS sw_identificado_declarante,

		'' 	AS es_complementaria,
		''	AS es_sustitutiva,
		-1	AS id_tipo_presentacion,  --carga por integridad
		''	AS telefono_contacto,
		''	AS nombre_contacto,
		'' 	AS numero_caja,
		0 	AS contador_revisiones,
		'21000101' fecha_presentacion,
		01		AS mes_presentacion,
		2100	AS anyo_presentacion ,
		CASE WHEN decl.dxrhviv ='S' THEN 'S' ELSE 'N' END	AS es_rehabilitacion,

		CAST(rhvi.rhsecue  AS varchar)	AS secuencia,
		
        ----- datos CUENTA VIVIENDA -----
		admini_tit.id_administracion AS id_administracion_declarado,  --administracion de rhvi -- tener en cuenta en COGNOS !!!
	
		1	AS es_externo_declarado,

		'' 	AS nif_declarado_781_11,
		'' 	AS nif_declarado_781,

		''	AS nif_declarado_no_identificado_11,
		''	AS nif_declarado_no_identificado,
		0   AS es_contribuyente_declarado,
		
		indefinidos.id_contribuyente	AS id_contribuyente_declarado, 
		''  AS nivel_identificacion_nif_declarado,
	    0   AS es_identificado_declarado,
		
		'' AS sw_identificado_declarado,
		'' AS sw_representante ,
		
		-1  AS id_provincia,    
		'' AS numero_identificacion_cuenta_vivienda,
		
		CAST('21000101' AS date) AS fecha_apertura_cuenta_vivienda,
		month(CAST('21000101' AS date)) AS mes_apertura_cuenta_vivienda,
		year(CAST('21000101' AS date))	AS anyo_apertura_cuenta_vivienda,

		0	AS saldo_inicial_ejercicio,
		0	AS saldo_final_ejercicio,
		0	AS porcentaje_participacion,

		--part.panumer		AS numero_partida,
		--round(part.padecla/100,2)	AS importe_valor_declarado,
		--round(part.pacalcu/100,2)	AS importe_valor_calculado,

		----- datos REHABILITACIÓN VIVIENDA -----
		coalesce(left(coalesce(rhvi.rhnifti ,''),9)+' '+right(coalesce(rhvi.rhnifti ,''),2),'') 	AS nif_titular_inmueble_rehabilitacion,
		
		coalesce(rhvi.rhident,'')   AS nivel_identificacion_nif_titular, 
		CASE WHEN rhvi.rhident =1 THEN 1 ELSE 0 END	AS es_identificado_titular,

		CASE
			WHEN CASE WHEN rhvi.rhident=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_titular.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
			WHEN CASE WHEN rhvi.rhident=1 THEN 1 ELSE 0 END=0 THEN 1
			WHEN CASE WHEN rhvi.rhident=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_titular.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
			ELSE ''
		END AS sw_identificado_titular,

		coalesce(rhvi.rhnexpe,'') 	AS expediente_rehabilitacion,
		round(rhvi.rhicpar/100,2)	AS importe_parcial_obra,
		round(rhvi.rhicfin/100,2)	AS importe_final_obra,
		round(rhvi.rhimpre/100,2)	AS importe_prestamo,
		CASE WHEN rhvi.rhfechp <>'0001-01-01' THEN rhvi.rhfechp ELSE CAST('21000101' AS date) END AS fecha_formalizacion_prestamo,
		month(CASE WHEN rhvi.rhfechp <>'0001-01-01' THEN rhvi.rhfechp ELSE CAST('21000101' AS date) END) AS mes_formalizacion_prestamo,
		year(CASE WHEN rhvi.rhfechp <>'0001-01-01' THEN rhvi.rhfechp ELSE CAST('21000101' AS date) END)	AS anyo_formalizacion_prestamo,
		coalesce(rhvi.rhentip,'')	AS codigo_entidad,
		coalesce(rhvi.rhsucup,'')	AS codigo_sucursal,
		coalesce(rhvi.rhcodcp,'') 	AS codigo_control,
		coalesce(rhvi.rhnctap,'')	AS numero_cuenta 

    FROM (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1i3de_bw WHERE dxmodel='781') decl  
	INNER JOIN dbn1_stg_dhyf.dbo.tbn1rhvi_bw rhvi ON   decl.dxejerc=rhvi.rhejerc AND decl.dxrefer=rhvi.rhrefer 

	--no_identificados_declarante
	LEFT JOIN mae_noid mae_noid_cabe
			ON	decl.dxejerc = mae_noid_cabe.ejercicio
			AND cast(decl.dxrefer as varchar)= mae_noid_cabe.clavagru
			AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 

	--no_identificados_declarado
	LEFT JOIN mae_noid mae_noid_det
			ON	decl.dxejerc = mae_noid_det.ejercicio
			AND cast(decl.dxrefer as varchar) = mae_noid_det.clavagru  
			AND right('0000000000000' +  cast(rhvi.rhsecue   as varchar) , 13)=  mae_noid_det.clavdeta 
	

    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(rhvi.rhejerc AS varchar)+'VG'+CAST(rhvi.rhrefer AS varchar)+'00K0000')
    INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
    
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarante ON (rhvi.rhnifde=c_declarante.nif_maestro AND c_declarante.fec_fin_vigencia=CAST('21000101' AS datetime))
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_titular ON (rhvi.rhnifti =c_titular.nif_maestro AND c_titular.fec_fin_vigencia=CAST('21000101' AS datetime))

	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda admini_decl ON (admini_decl.cod_provincia=decl.dxadmon)
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda admini_tit ON (admini_tit.cod_provincia=rhvi.rhadmon)
	
	CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos  

	)
--select * from query

