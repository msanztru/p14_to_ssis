	;WITH mae_noid AS 
	(
		SELECT	id_mae_no_identificados,
				ejercicio,
				clavagru,
				clavdeta
		FROM	dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados
		WHERE	aplicacion = 'MF'
		AND		detamodel = '184'
	),
	query AS (
	--DECLARANTE

	SELECT 
			doc.id_documento AS id_documento,
			e.id_expediente AS id_expediente,
			cabe.cabe_ejercicio AS ejercicio,
			cabe.cabe_modelo AS modelo,
			admini_decl.id_administracion AS id_administracion_declarante,

			CASE WHEN cabe.cabe_admon='B' THEN 0 ELSE 1 END AS es_externo_declarante,
			coalesce(cabe.cabe_cifdecl,'') AS nif_declarante_184_11,  
			CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END AS nif_declarante_no_identificado_11,
			coalesce(left(coalesce(cabe.cabe_cifdecl,''),9)+' '+right(coalesce(cabe.cabe_cifdecl,''),2),'') AS nif_declarante_184,
			coalesce(left(CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,2),'') AS nif_declarante_no_identificado,
			
			CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarante,
			coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarante,
			CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarante,
			CASE
			WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
			WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN 1
			WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
			ELSE ''
			END AS sw_identificado_declarante,

			--no_identificados_declarante
			coalesce(mae_noid_cabe.id_mae_no_identificados,-1) AS id_mae_no_id_declarante,

			coalesce(cabe.cabe_telefono,'') AS telefono,
			coalesce(cabe.cabe_persona,'') AS persona_relacionarse,
			cabe.cabe_refpres AS cod_presentador_colectivo,

			banc.id_mae_entidades_bancarias AS id_mae_entidades_bancarias,
			presenta.id_tipo_presentacion AS id_tipo_presentacion,

			CASE WHEN cabe.cabe_fecpres IS NULL THEN '0001-01-01' ELSE cabe.cabe_fecpres END AS fecha_presentacion,
			CASE WHEN cabe.cabe_fecpres IS NOT NULL THEN month(cabe.cabe_fecpres) ELSE 0 END AS mes_presentacion,
			CASE WHEN cabe.cabe_fecpres IS NOT NULL THEN year(cabe.cabe_fecpres) ELSE 0 END AS anyo_presentacion,

			cabe.cabe_numcaja AS num_caja,

			CASE WHEN cabe.cabe_fecalta IS NULL THEN '0001-01-01' ELSE cabe.cabe_fecalta END AS fecha_alta,
			CASE WHEN cabe.cabe_fecalta IS NOT NULL THEN month(cabe.cabe_fecalta) ELSE 0 END AS mes_alta,
			CASE WHEN cabe.cabe_fecalta IS NOT NULL THEN year(cabe.cabe_fecalta) ELSE 0 END AS anyo_alta,

			cabe.cabe_justif AS num_justificante,
			tipo_decl.id_tipo_declaracion AS id_tipo_declaracion,
			cabe.cabe_justifsus AS num_justificante_sustitutiva,
			cabe.cabe_crevi AS contador_revisiones,
			cabe.cabe_regfiscal AS regimen_fiscal_deducciones,
			cabe.cabe_baja AS pendiente_baja,
			cabe.cabe_nroreg AS num_declarados,

			--Más datos declarante 
			coalesce(tipos_entidad.id_mae_claves_tipos_entidad_mf,-1) AS id_mae_claves_tipos_entidad,
			coalesce(actividad_ppal.id_mae_claves_actividad_ppal_mf,-1) AS id_mae_claves_actividad_ppal,
			coalesce(tipos_entidad_ext.id_mae_claves_tipos_entidad_mf,-1) AS id_mae_claves_tipos_entidad_extranjero,

			coalesce(mcabe.mcab_ext_objeto,'') AS es_objeto_extranjero,

			coalesce(pais_mcabe.id_pais,-1) AS id_pais_extranjero,
			coalesce(mcabe.mcab_ext_renta_res/100,0) AS renta_residentes_extranjero, 

			CASE WHEN mcabe.mcab_ext_regim_i_s = 'S' THEN 1 ELSE 0 END AS es_regimen_impuesto_soc_extranjero,	
			
			coalesce(mcabe.mcab_cif_represen,'') AS cif_representante,  
			coalesce(mcabe.mcab_nom_represen,'') AS nombre_representante, 

			CASE
				WHEN row_number() OVER (PARTITION BY doc.id_documento ORDER BY doc.id_documento,d_eco_cabe.de84_clave, d_eco_cabe.de84_subclave,d_eco_cabe.de84_campo,d_eco_cabe.de84_orden)=1 THEN coalesce(mcabe.mcab_vol_opers/100,0)

				ELSE 0																				
			END AS volumen_operaciones,  --cabe

			--declarado
			1 AS id_administracion_declarado,
			
			NULL es_externo_declarado, --0, 1
			NULL AS secuencia,
			'' AS nif_declarado_184_11,
			'' nif_declarado_no_identificado_11,
			'' AS nif_declarado_184,
			'' AS nif_declarado_no_identificado,
			NULL es_contribuyente_declarado,
			NULL AS id_contribuyente_declarado,
			
			NULL es_identificado_declarado,
			'' sw_identificado_declarado,

			--no_identificados_declarado
			-1 AS id_mae_no_id_declarado,

			''  AS es_representante,  
			-1 AS id_provincia, 
			-1 AS id_pais,
			-1 AS id_mae_claves_participe_184, 
			
			'' es_miembro_31_diciembre,
			0  AS num_dias_miembro,--!!!
			0 porcentaje_participacion, --ddos

			'' AS domicilio_fiscal,
			null es_ejerce_actividad,

			0 porcentaje_atribucion,  --ddos

			'' es_erroneo_declarado, 
			
			--datos_económicos_declarante
			claves_cabe.id_mae_claves_184 AS id_mae_claves_184_declarante,
			subclaves_cabe.id_mae_subclaves_184 AS id_mae_subclaves_184_declarante,
			d_eco_cabe.de84_campo AS campo_declarante,
			d_eco_cabe.de84_orden AS orden_declarante,
			d_eco_cabe.de84_valor  AS valor_declarante,
			CASE WHEN d_eco_cabe.de84_error='1' THEN 1 ELSE 0 END AS es_erroneo_dato_ec_declarante, 
			
			--datos_económicos_declarado
			-1	AS id_mae_claves_184_declarado,											
			-1	AS id_mae_subclaves_184_declarado,
			 0	AS campo_declarado,
			 0	AS orden_declarado,
			 0	AS valor_declarado,
			''	AS es_erroneo_dato_ec_declarado, 
			
			0   AS contador_declarados
	FROM	dbn1_stg_dhyf.dbo.tbn1cabe_mf cabe
					
			--Más datos declarante mcab_mf	
			LEFT JOIN dbn1_stg_dhyf.dbo.tbn1mcab_mf mcabe
					ON	cabe.cabe_ejercicio = mcabe.mcab_ejercicio
					AND cabe.cabe_modelo = '184'    --mcab_admon
					AND	cabe.cabe_admon = mcabe.mcab_admon
					AND	cabe.cabe_referdoc = mcabe.mcab_referdoc

			 LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais_mcabe
					ON mcabe.mcab_ext_pais = pais_mcabe.cod_pais 
					
			LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_entidad_mf tipos_entidad
					ON mcabe.mcab_tipo_entidad = tipos_entidad.cod_clave_tipo_entidad_mf	
					
			LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_actividad_ppal_mf actividad_ppal
					ON mcabe.mcab_act_ppal = actividad_ppal.cod_clave_actividad_ppal_mf							
						
			LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_entidad_mf tipos_entidad_ext
					ON mcabe.mcab_ext_tipo_enti = tipos_entidad_ext.cod_clave_tipo_entidad_mf		
			
			--datos_economicos declarante
			INNER JOIN dbn1_stg_dhyf.dbo.tbn1de84_mf d_eco_cabe
					ON	cabe.cabe_ejercicio = d_eco_cabe.de84_ejercicio
					AND	cabe.cabe_admon = d_eco_cabe.de84_admon
					AND	cabe.cabe_referdoc = d_eco_cabe.de84_referdoc
					AND	d_eco_cabe.de84_secuen = 0		

			--documentos
			INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc 
					ON doc.referencia = CAST(cabe.cabe_ejercicio AS varchar)+'JQ'+CAST(cabe.cabe_referdoc AS varchar)+'00K0000'
					AND doc.marca_baja IS NULL

			--expedientes
			INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e 
					ON doc.id_expediente=e.id_expediente

			--buscar los nif en contribuyentes (para declarante y declarados)
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c 
					ON cabe.cabe_cifdecl=c.nif_maestro 
					AND c.fec_fin_vigencia=CAST('21000101' AS datetime)
					
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda admini_decl ON admini_decl.cod_administracion=cabe.cabe_admon	
			
			--LEFT JOIN con cada maestro
			LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_entidades_bancarias banc
					ON cabe.cabe_banco = banc.cod_entidad_bancaria 
					
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion presenta
					ON cabe.cabe_tiposoporte = presenta.cod_tipo_presentacion
					
			--LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte soporte
			--		ON cabe.cabe_tiposoporte = soporte.cod_tipo_soporte
					
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion tipo_decl
					ON cabe.cabe_tipodecl = tipo_decl.cod_tipo_declaracion	
			
			--declarante
			LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_184 claves_cabe
					ON d_eco_cabe.de84_clave = claves_cabe.cod_clave_184

			LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_184 subclaves_cabe
					ON d_eco_cabe.de84_clave = subclaves_cabe.cod_clave_184
					AND d_eco_cabe.de84_subclave = subclaves_cabe.cod_subclave_184
					
			--no_identificados_declarante
			LEFT JOIN	mae_noid mae_noid_cabe
					ON	cabe.cabe_ejercicio = mae_noid_cabe.ejercicio
					AND CAST(cabe.cabe_referdoc AS VARCHAR(9))= mae_noid_cabe.clavagru
					AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 					
			
			CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
			
UNION ALL

--DECLARADO
SELECT 
			doc.id_documento AS id_documento,
			e.id_expediente AS id_expediente,
			cabe.cabe_ejercicio AS ejercicio,
			cabe.cabe_modelo AS modelo,
			admini_decl.id_administracion AS id_administracion_declarante,

			CASE WHEN cabe.cabe_admon='B' THEN 0 ELSE 1 END AS es_externo_declarante,
			coalesce(cabe.cabe_cifdecl,'') AS nif_declarante_184_11,  
			CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END AS nif_declarante_no_identificado_11,
			coalesce(left(coalesce(cabe.cabe_cifdecl,''),9)+' '+right(coalesce(cabe.cabe_cifdecl,''),2),'') AS nif_declarante_184,
			coalesce(left(CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,2),'') AS nif_declarante_no_identificado,
			
			CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarante,
			coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarante,
			CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarante,
			CASE
			WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
			WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN 1
			WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
			ELSE ''
			END AS sw_identificado_declarante,

			--no_identificados_declarante
			-1 AS id_mae_no_id_declarante,

			coalesce(cabe.cabe_telefono,'') AS telefono,
			coalesce(cabe.cabe_persona,'') AS persona_relacionarse,
			cabe.cabe_refpres AS cod_presentador_colectivo,

			banc.id_mae_entidades_bancarias AS id_mae_entidades_bancarias,
			presenta.id_tipo_presentacion AS id_tipo_presentacion,

			CASE WHEN cabe.cabe_fecpres IS NULL THEN '0001-01-01' ELSE cabe.cabe_fecpres END AS fecha_presentacion,
			CASE WHEN cabe.cabe_fecpres IS NOT NULL THEN month(cabe.cabe_fecpres) ELSE 0 END AS mes_presentacion,
			CASE WHEN cabe.cabe_fecpres IS NOT NULL THEN year(cabe.cabe_fecpres) ELSE 0 END AS anyo_presentacion,

			cabe.cabe_numcaja AS num_caja,

			CASE WHEN cabe.cabe_fecalta IS NULL THEN '0001-01-01' ELSE cabe.cabe_fecalta END AS fecha_alta,
			CASE WHEN cabe.cabe_fecalta IS NOT NULL THEN month(cabe.cabe_fecalta) ELSE 0 END AS mes_alta,
			CASE WHEN cabe.cabe_fecalta IS NOT NULL THEN year(cabe.cabe_fecalta) ELSE 0 END AS anyo_alta,

			cabe.cabe_justif AS num_justificante,
			tipo_decl.id_tipo_declaracion AS id_tipo_declaracion,
			cabe.cabe_justifsus AS num_justificante_sustitutiva,
			cabe.cabe_crevi AS contador_revisiones,
			cabe.cabe_regfiscal AS regimen_fiscal_deducciones,
			cabe.cabe_baja AS pendiente_baja,
			cabe.cabe_nroreg AS num_declarados,

			--Más datos declarante 
			coalesce(tipos_entidad.id_mae_claves_tipos_entidad_mf,-1) AS id_mae_claves_tipos_entidad,
			coalesce(actividad_ppal.id_mae_claves_actividad_ppal_mf,-1) AS id_mae_claves_actividad_ppal,
			coalesce(tipos_entidad_ext.id_mae_claves_tipos_entidad_mf,-1) AS id_mae_claves_tipos_entidad_extranjero,

			coalesce(mcabe.mcab_ext_objeto,'') AS es_objeto_extranjero,

			coalesce(pais_mcabe.id_pais,-1) AS id_pais_extranjero,
			coalesce(mcabe.mcab_ext_renta_res/100,0) AS renta_residentes_extranjero, 

			CASE WHEN mcabe.mcab_ext_regim_i_s = 'S' THEN 1 ELSE 0 END AS es_regimen_impuesto_soc_extranjero,	
			
			coalesce(mcabe.mcab_cif_represen,'') AS cif_representante,  
			coalesce(mcabe.mcab_nom_represen,'') AS nombre_representante, 

			0 AS volumen_operaciones,  --cabe

			--declarado
			admini_ddos.id_administracion AS id_administracion_declarado,
			
			CASE WHEN ddos.pe84_admon = 'B' THEN 0 ELSE 1 END AS es_externo_declarado,
			ddos.pe84_secuen AS secuencia,
			ddos.pe84_cif AS nif_declarado_184_11,
			CASE WHEN CASE WHEN ddos.pe84_identif = 1 THEN 1 ELSE 0 END = 0 THEN ddos.pe84_cif ELSE '' END AS nif_declarado_no_identificado_11,
			coalesce(left(ddos.pe84_cif,9)+' '+right(ddos.pe84_cif,2),'') AS nif_declarado_184,
			coalesce(left(CASE WHEN CASE WHEN ddos.pe84_identif=1 THEN 1 ELSE 0 END=0 THEN ddos.pe84_cif ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN ddos.pe84_identif=1 THEN 1 ELSE 0 END=0 THEN ddos.pe84_cif ELSE '' END,2),'') AS nif_declarado_no_identificado,
			CASE WHEN d.id_contribuyente IS NULL THEN 0 ELSE 1 END AS es_contribuyente_declarado,
			coalesce(d.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarado,
			
			CASE WHEN ddos.pe84_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarado,
			CASE
				WHEN CASE WHEN ddos.pe84_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NULL THEN 0 ELSE 1 END=1 THEN 0
				WHEN CASE WHEN ddos.pe84_identif=1 THEN 1 ELSE 0 END=0 THEN 1
				WHEN CASE WHEN ddos.pe84_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NULL THEN 0 ELSE 1 END=0 THEN 2
				ELSE ''
			END AS sw_identificado_declarado,

			--no_identificados_declarado
			coalesce(mae_noid_det.id_mae_no_identificados,-1) AS id_mae_no_id_declarado,

			coalesce(ddos.pe84_represen,'')  AS es_representante,  
			prov.id_provincia AS id_provincia, 
			pais.id_pais AS id_pais,
			claves_participe.id_mae_claves_participe_184 AS id_mae_claves_participe_184, 
			
			CASE WHEN ddos.pe84_miembro_31dic='S' THEN 1 ELSE 0 END AS es_miembro_31_diciembre,
			ddos.pe84_dias_miembro  AS num_dias_miembro,--!!!
			CASE
				WHEN row_number() OVER (PARTITION BY doc.id_documento,ddos.pe84_secuen ORDER BY doc.id_documento,ddos.pe84_secuen,d_eco_ddos.de84_clave, d_eco_ddos.de84_subclave,d_eco_ddos.de84_campo,d_eco_ddos.de84_orden)=1 THEN coalesce(ddos.pe84_porc_particip/10000,0)
				ELSE 0
			END AS porcentaje_participacion, --ddos

			coalesce(ddos.pe84_domic_fiscal,'') AS domicilio_fiscal,
			CASE WHEN ddos.pe84_ejerce_activ='SI' THEN 1 ELSE 0 END AS es_ejerce_actividad,

			CASE
				WHEN row_number() OVER (PARTITION BY doc.id_documento,ddos.pe84_secuen ORDER BY doc.id_documento,ddos.pe84_secuen,d_eco_ddos.de84_clave, d_eco_ddos.de84_subclave,d_eco_ddos.de84_campo,d_eco_ddos.de84_orden)=1 THEN coalesce(ddos.pe84_porc_atribuc/10000,0)
				ELSE 0
			END AS porcentaje_atribucion,  --ddos

			CASE WHEN ddos.pe84_error='1' THEN 1 ELSE 0 END AS es_erroneo_declarado, 
			
			--datos_económicos_declarante
			 -1	 AS id_mae_claves_184_declarante,
			 -1  AS id_mae_subclaves_184_declarante,
			  0  AS campo_declarante,
			  0  AS orden_declarante,
			  0  AS valor_declarante,
			 ''  AS es_erroneo_dato_ec_declarante, 
			
			--datos_económicos_declarado
			claves_ddos.id_mae_claves_184 AS id_mae_claves_184_declarado,											
			subclaves_ddos.id_mae_subclaves_184 AS id_mae_subclaves_184_declarado,
			d_eco_ddos.de84_campo AS campo_declarado,
			d_eco_ddos.de84_orden AS orden_declarado,
			d_eco_ddos.de84_valor  AS valor_declarado,
			CASE WHEN d_eco_ddos.de84_error='1' THEN 1 ELSE 0 END AS es_erroneo_dato_ec_declarado,
	
			CASE
				WHEN row_number() OVER (PARTITION BY doc.id_documento,ddos.pe84_secuen ORDER BY doc.id_documento,ddos.pe84_secuen,d_eco_ddos.de84_clave, d_eco_ddos.de84_subclave,d_eco_ddos.de84_campo,d_eco_ddos.de84_orden)=1 THEN 1
				ELSE 0
			END AS contador_declarados, --ddos			
			
	FROM	dbn1_stg_dhyf.dbo.tbn1cabe_mf cabe
					
			--Más datos declarante mcab_mf	
			LEFT JOIN dbn1_stg_dhyf.dbo.tbn1mcab_mf mcabe
					ON	cabe.cabe_ejercicio = mcabe.mcab_ejercicio
					AND cabe.cabe_modelo = '184'    --mcab_admon
					AND	cabe.cabe_admon = mcabe.mcab_admon
					AND	cabe.cabe_referdoc = mcabe.mcab_referdoc

			 LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais_mcabe
					ON mcabe.mcab_ext_pais = pais_mcabe.cod_pais 
					
			LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_entidad_mf tipos_entidad
					ON mcabe.mcab_tipo_entidad = tipos_entidad.cod_clave_tipo_entidad_mf	
					
			LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_actividad_ppal_mf actividad_ppal
					ON mcabe.mcab_act_ppal = actividad_ppal.cod_clave_actividad_ppal_mf							
						
			LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_entidad_mf tipos_entidad_ext
					ON mcabe.mcab_ext_tipo_enti = tipos_entidad_ext.cod_clave_tipo_entidad_mf		

			--declarados
			INNER JOIN	dbn1_stg_dhyf.dbo.tbn1pe84_mf ddos
					ON	cabe.cabe_ejercicio = ddos.pe84_ejercicio
					AND cabe.cabe_modelo = '184'
					AND cabe.cabe_referdoc = ddos.pe84_referdoc	
								
			--datos_economicos declarado	
			INNER JOIN dbn1_stg_dhyf.dbo.tbn1de84_mf d_eco_ddos
					ON	ddos.pe84_ejercicio = d_eco_ddos.de84_ejercicio
					AND	ddos.pe84_admon = d_eco_ddos.de84_admon
					AND	ddos.pe84_referdoc = d_eco_ddos.de84_referdoc
					AND	ddos.pe84_secuen = d_eco_ddos.de84_secuen
						
			--documentos
			INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc 
					ON doc.referencia = CAST(cabe.cabe_ejercicio AS varchar)+'JQ'+CAST(cabe.cabe_referdoc AS varchar)+'00K0000'
					AND doc.marca_baja IS NULL

			--expedientes
			INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e 
					ON doc.id_expediente=e.id_expediente

			--buscar los nif en contribuyentes (para declarante y declarados)
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c 
					ON cabe.cabe_cifdecl=c.nif_maestro 
					AND c.fec_fin_vigencia=CAST('21000101' AS datetime)
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes d 
					ON ddos.pe84_cif=d.nif_maestro 
					AND d.fec_fin_vigencia=CAST('21000101' AS datetime)
					
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda admini_decl ON admini_decl.cod_administracion=cabe.cabe_admon	
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda admini_ddos ON admini_ddos.cod_administracion=ddos.pe84_admon
			
			--LEFT JOIN con cada maestro
			LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_entidades_bancarias banc
					ON cabe.cabe_banco = banc.cod_entidad_bancaria 
					
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion presenta
					ON cabe.cabe_tiposoporte = presenta.cod_tipo_presentacion
					
			--LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte soporte
			--		ON cabe.cabe_tiposoporte = soporte.cod_tipo_soporte
					
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion tipo_decl
					ON cabe.cabe_tipodecl = tipo_decl.cod_tipo_declaracion	
			
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais
					ON ddos.pe84_pais = pais.cod_pais 
					
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias prov
					ON ddos.pe84_provincia = prov.cod_provincia2		
			
			LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_participe_184 claves_participe
					ON ddos.pe84_clave_partic = claves_participe.cod_clave_participe_184

			--declarados
			LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_184 claves_ddos
					ON d_eco_ddos.de84_clave = claves_ddos.cod_clave_184

			LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_184 subclaves_ddos
					ON d_eco_ddos.de84_clave = subclaves_ddos.cod_clave_184
					AND d_eco_ddos.de84_subclave = subclaves_ddos.cod_subclave_184
			
			----no_identificados_declarado
			LEFT JOIN	mae_noid mae_noid_det
					ON	cabe.cabe_ejercicio = mae_noid_det.ejercicio
					AND CAST(cabe.cabe_referdoc AS VARCHAR(9)) = mae_noid_det.clavagru
					AND right('0000000000000' +  cast(ddos.pe84_secuen as varchar) , 13)=  mae_noid_det.clavdeta 
					
			CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
)

--select * from query