;WITH mae_noid AS 
(
	SELECT	id_mae_no_identificados,
			ejercicio,
			clavagru,
			clavdeta
	FROM	dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados
	WHERE	aplicacion = 'MF'
	AND		detamodel = '189'
),

query AS
(
	SELECT	doc.id_documento AS id_documento,
			e.id_expediente AS id_expediente,
			cabe.cabe_ejercicio AS ejercicio,
			coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante,
			coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado,
			cabe.cabe_modelo AS modelo,
			cabe.cabe_admon AS administracion_declarante,
			adm_dnte.id_administracion AS id_administracion_declarante,
			CASE WHEN cabe.cabe_admon='B' THEN 0 ELSE 1 END AS es_externo_declarante,
			cabe.cabe_cifdecl AS nif_declarante_189_11,
			CASE WHEN c_declarante.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarante,
			coalesce(c_declarante.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarante,
			CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarante,
			CASE
				WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarante.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
				WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN 1
				WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarante.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
				ELSE ''
			END AS sw_identificado_declarante,
			CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END AS nif_declarante_no_identificado_11,
			cabe.cabe_telefono AS telefono,
			cabe.cabe_persona AS razon_social,
			cabe.cabe_refpres AS cod_presentador_colectivo,
			cabe.cabe_banco AS cod_banco_espania,
			sopo.id_tipo_soporte AS id_tipo_soporte,
			cabe.cabe_fecpres AS fecha_presentacion,
			month(cabe.cabe_fecpres) AS mes_presentacion,
			year(cabe.cabe_fecpres) AS anyo_presentacion,
			cabe.cabe_numcaja AS num_caja,
			cabe.cabe_fecalta AS fecha_alta,
			MONTH(cabe.cabe_fecalta) AS mes_alta,
			YEAR(cabe.cabe_fecalta) AS anyo_alta,
			cabe.cabe_justif AS num_justificante,
			decl.id_tipo_declaracion AS id_tipo_declaracion,
			cabe.cabe_crevi AS contador_revisiones,
			cabe.cabe_regfiscal AS regimen_fiscal_deducciones,
			pe89.mfpe89_admon AS administracion_declarado,
			CASE WHEN pe89.mfpe89_admon='B' THEN 0 ELSE 1 END AS es_externo_declarado,
			CAST(pe89.mfpe89_secuen AS varchar) AS secuencia,
			pe89.mfpe89_cif AS nif_declarado_189_11,
			CASE WHEN c_declarado.id_contribuyente IS NULL THEN 0 ELSE 1 END AS es_contribuyente_declarado,
			coalesce(c_declarado.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarado,
			CASE WHEN pe89.mfpe89_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarado,
			CASE
				WHEN CASE WHEN pe89.mfpe89_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NULL THEN 0 ELSE 1 END=1 THEN 0
				WHEN CASE WHEN pe89.mfpe89_identif=1 THEN 1 ELSE 0 END=0 THEN 1
				WHEN CASE WHEN pe89.mfpe89_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NULL THEN 0 ELSE 1 END=0 THEN 2
				ELSE ''
			END AS sw_identificado_declarado,
			CASE WHEN CASE WHEN pe89.mfpe89_identif=1 THEN 1 ELSE 0 END=0 THEN pe89.mfpe89_cif ELSE '' END AS nif_declarado_no_identificado_11,
			prov.id_provincia AS id_provincia,
			pais.id_pais AS id_pais,
			merc.id_clave_mercado AS id_clave_mercado,
			valo.id_clave_valor_189 AS id_clave_valor_189,
			iden.id_clave_identificacion_189 AS id_clave_identificacion_189,
			mfpe89_ident_valor AS valor_identificacion,
			repr.id_clave_representacion AS id_clave_representacion,
			mfpe89_nro_valores AS num_valores,
			round(mfpe89_particip/100,2) AS porcentaje_participacion,
			CASE pe89.mfpe89_error WHEN '1' THEN 1 ELSE 0 END AS es_erroneo,
			impo.id_tipo_importe AS id_tipo_importe,
			round(mfim89_importe/100,2) AS importe,
			coalesce(left(cabe.cabe_cifdecl,9)+' '+right(cabe.cabe_cifdecl,2),'') AS nif_declarante_189,
			coalesce(left(CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,2),'') AS nif_declarante_no_identificado,
			coalesce(left(pe89.mfpe89_cif,9)+' '+right(pe89.mfpe89_cif,2),'') AS nif_declarado_189,
			coalesce(left(CASE WHEN CASE WHEN pe89.mfpe89_identif=1 THEN 1 ELSE 0 END=0 THEN pe89.mfpe89_cif ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN pe89.mfpe89_identif=1 THEN 1 ELSE 0 END=0 THEN pe89.mfpe89_cif ELSE '' END,2),'') AS nif_declarado_no_identificado
	FROM	(SELECT * FROM dbn1_stg_dhyf.dbo.tbn1cabe_mf WHERE cabe_modelo='189') cabe 
			--no_identificados_declarante
			LEFT JOIN mae_noid mae_noid_cabe 
					ON	cabe.cabe_ejercicio = mae_noid_cabe.ejercicio
					AND CAST(cabe.cabe_referdoc as varchar) = mae_noid_cabe.clavagru
					AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 
			INNER JOIN dbn1_stg_dhyf.dbo.tbn1pe89_mf pe89 
					ON cabe.cabe_ejercicio=pe89.mfpe89_ejercicio 
					AND cabe.cabe_modelo='189' 
					AND cabe.cabe_referdoc=pe89.mfpe89_referdoc
			--no_identificados_declarado
			LEFT JOIN	mae_noid  mae_noid_det
					ON	cabe.cabe_ejercicio = mae_noid_det.ejercicio
					AND CAST(cabe.cabe_referdoc as varchar) = mae_noid_det.clavagru
					AND right('0000000000000' +  cast(pe89.mfpe89_secuen as varchar) , 13) = mae_noid_det.clavdeta 
			INNER JOIN	dbn1_stg_dhyf.dbo.tbn1im89_mf im89 
					ON	pe89.mfpe89_ejercicio = im89.mfim89_ejercicio 
					AND pe89.mfpe89_admon = im89.mfim89_admon 
					AND pe89.mfpe89_referdoc = im89.mfim89_referdoc 
					AND pe89.mfpe89_secuen = im89.mfim89_secuen
			INNER JOIN	dbn1_norm_dhyf.dbo.tbn1_documentos doc 
					ON	CAST(cabe.cabe_ejercicio AS varchar)+'D['+CAST(cabe.cabe_referdoc AS varchar)+'00K0000'=doc.referencia
					AND	doc.marca_baja IS NULL
					AND	doc.fec_baja IS NULL 
			INNER JOIN	dbn1_norm_dhyf.dbo.tbn1_expedientes e 
					ON	doc.id_expediente = e.id_expediente
					AND	e.fec_baja IS NULL
			LEFT JOIN	dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarante 
					ON	cabe.cabe_cifdecl = c_declarante.nif_maestro 
					AND c_declarante.fec_fin_vigencia = CAST('21000101' AS datetime)
			LEFT JOIN	dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarado 
					ON	pe89.mfpe89_cif = c_declarado.nif_maestro 
					AND c_declarado.fec_fin_vigencia = CAST('21000101' AS datetime)
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion decl 
					ON	decl.cod_tipo_declaracion=cabe.cabe_tipodecl
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte sopo 
					ON	sopo.cod_tipo_soporte=cabe.cabe_tiposoporte
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias prov 
					ON	pe89.mfpe89_provincia=prov.cod_provincia
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais 
					ON	pe89.mfpe89_pais=pais.cod_pais
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_mercado merc 
					ON	pe89.mfpe89_clv_mercado=merc.cod_clave_mercado
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_claves_valor_189 valo 
					ON	pe89.mfpe89_clv_valor=valo.cod_clave_valor_189
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_claves_identificacion_189 iden 
					ON	pe89.mfpe89_clv_ident=iden.cod_clave_identificacion_189
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion repr 
					ON	pe89.mfpe89_clv_represe=repr.cod_clave_representacion
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe impo 
					ON	im89.mfim89_tipo=impo.cod_tipo_importe
			INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda adm_dnte
					ON	cabe.cabe_admon = adm_dnte.cod_administracion
			CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
	GROUP BY
			doc.id_documento,
			e.id_expediente,
			cabe.cabe_ejercicio,
			coalesce(mae_noid_cabe.id_mae_no_identificados,-1) ,
			coalesce(mae_noid_det.id_mae_no_identificados,-1) ,
			cabe.cabe_modelo,
			cabe.cabe_admon,
			adm_dnte.id_administracion,
			CASE WHEN cabe.cabe_admon='B' THEN 0 ELSE 1 END,
			cabe.cabe_cifdecl,
			CASE WHEN c_declarante.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END,
			coalesce(c_declarante.id_contribuyente,indefinidos.id_contribuyente),
			CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END,
			CASE
				WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarante.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
				WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN 1
				WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarante.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
				ELSE ''
			END,
			CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,
			cabe.cabe_telefono,
			cabe.cabe_persona,
			cabe.cabe_refpres,
			cabe.cabe_banco,
			sopo.id_tipo_soporte,
			cabe.cabe_fecpres,
			month(cabe.cabe_fecpres),
			year(cabe.cabe_fecpres),
			cabe.cabe_numcaja,
			cabe_fecalta,
			cabe.cabe_justif,
			decl.id_tipo_declaracion,
			cabe.cabe_crevi,
			cabe.cabe_regfiscal,
			pe89.mfpe89_admon,
			CASE WHEN pe89.mfpe89_admon='B' THEN 0 ELSE 1 END,
			CAST(pe89.mfpe89_secuen AS varchar),
			pe89.mfpe89_cif,
			CASE WHEN c_declarado.id_contribuyente IS NULL THEN 0 ELSE 1 END,
			coalesce(c_declarado.id_contribuyente,indefinidos.id_contribuyente),
			CASE WHEN pe89.mfpe89_identif=1 THEN 1 ELSE 0 END,
			CASE
				WHEN CASE WHEN pe89.mfpe89_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NULL THEN 0 ELSE 1 END=1 THEN 0
				WHEN CASE WHEN pe89.mfpe89_identif=1 THEN 1 ELSE 0 END=0 THEN 1
				WHEN CASE WHEN pe89.mfpe89_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NULL THEN 0 ELSE 1 END=0 THEN 2
				ELSE ''
			END,
			CASE WHEN CASE WHEN pe89.mfpe89_identif=1 THEN 1 ELSE 0 END=0 THEN pe89.mfpe89_cif ELSE '' END,
			prov.id_provincia,
			pais.id_pais,
			merc.id_clave_mercado,
			valo.id_clave_valor_189,
			iden.id_clave_identificacion_189,
			mfpe89_ident_valor,
			repr.id_clave_representacion,
			mfpe89_nro_valores,
			mfpe89_particip,
			CASE pe89.mfpe89_error WHEN '1' THEN 1 ELSE 0 END,
			impo.id_tipo_importe,
			round(mfim89_importe/100,2),
			coalesce(left(cabe.cabe_cifdecl,9)+' '+right(cabe.cabe_cifdecl,2),''),
			coalesce(left(CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,2),''),
			coalesce(left(pe89.mfpe89_cif,9)+' '+right(pe89.mfpe89_cif,2),''),
			coalesce(left(CASE WHEN CASE WHEN pe89.mfpe89_identif=1 THEN 1 ELSE 0 END=0 THEN pe89.mfpe89_cif ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN pe89.mfpe89_identif=1 THEN 1 ELSE 0 END=0 THEN pe89.mfpe89_cif ELSE '' END,2),'')
)
select count(*) from query