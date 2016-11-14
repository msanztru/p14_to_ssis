	;WITH mae_noid AS
	(
		SELECT	id_mae_no_identificados,
				ejercicio,
				clavagru,
				clavdeta
		FROM	dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados
		WHERE	aplicacion = 'AF'
		AND		detamodel = '270'
	)
		SELECT
			docu.id_documento AS id_documento
,			e.id_expediente AS id_expediente
			--cabe_af
,			cabe.caejercicio AS ejercicio
,			cabe.camodelo AS modelo
,			coalesce(left(coalesce(cabe.cacifdecl,''),9)+' '+right(coalesce(cabe.cacifdecl,''),2),'') AS nif_declarante_270
,			coalesce(left(CASE WHEN CASE WHEN cabe.caidentif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cacifdecl,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN cabe.caidentif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cacifdecl,'') ELSE '' END,2),'') AS nif_declarante_no_identificado
,			CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarante
,			coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarante
,			CASE WHEN cabe.caidentif=1 THEN 1 ELSE 0 END AS es_identificado_declarante,
			CASE
				WHEN CASE WHEN cabe.caidentif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
				WHEN CASE WHEN cabe.caidentif=1 THEN 1 ELSE 0 END=0 THEN 1
				WHEN CASE WHEN cabe.caidentif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
				ELSE ''
			END AS sw_identificado_declarante
,			coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante
,			coalesce(cabe.catelefono,'') AS telefono
,			coalesce(cabe.capersona,'') AS razon_social
,			cabe.caenlace AS cod_presentador_colectivo
,			coalesce(cabe.cadh,'') AS delegacion_hacienda
,			tipo_pres.id_tipo_presentacion AS id_tipo_presentacion
,			tipo_decl.id_tipo_declaracion AS id_tipo_declaracion
,			cabe.cafecpres AS fecha_presentacion
,			month(cabe.cafecpres) AS mes_presentacion
,			year(cabe.cafecpres) AS anyo_presentacion
,			adm_orig.id_administracion AS id_administracion
,			CASE WHEN cabe.caerror=1 THEN 1 ELSE 0 END AS es_erroneo_declarante
,			CASE WHEN cabe.caobserva<>'0' THEN 1 ELSE 0 END AS hay_observaciones
,			CASE WHEN cabe.cahistorico='1' THEN 1 ELSE 0 END AS es_historico
,			cabe.cavolumen AS volumen_operaciones
			--270d_af
,			CAST(declarado.af270d_secuen AS varchar) AS secuencia
,			coalesce(left(coalesce(declarado.af270d_cif,''),9)+' '+right(coalesce(declarado.af270d_cif,''),2),'') AS nif_declarado_270
,			coalesce(left(CASE WHEN CASE WHEN declarado.af270d_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.af270d_cif,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN declarado.af270d_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.af270d_cif,'') ELSE '' END,2),'') AS nif_declarado_no_identificado
,			CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarado
,			coalesce(d.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarado
,			CASE WHEN declarado.af270d_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarado
,			CASE
				WHEN CASE WHEN declarado.af270d_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
				WHEN CASE WHEN declarado.af270d_identif=1 THEN 1 ELSE 0 END=0 THEN 1
				WHEN CASE WHEN declarado.af270d_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
				ELSE ''
			END AS sw_identificado_declarado
,			coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado
,			declarado.af270d_rl_nif AS nif_representante_legal
,			declarado.af270d_rl_nombre AS nombre_representante_legal
,			perc.id_mae_tipos_perceptor AS id_mae_tipos_perceptor
,			pers.id_mae_claves_personalidad AS id_clave_personalidad
,			prov.id_provincia AS id_provincia
,			declarado.af270d_fec_sorteo AS fecha_sorteo
,			month(declarado.af270d_fec_sorteo) AS mes_sorteo
,			year(declarado.af270d_fec_sorteo) AS anyo_sorteo
,			declarado.af270d_fec_pago AS fecha_pago
,			month(declarado.af270d_fec_pago) AS mes_pago
,			year(declarado.af270d_fec_pago) AS anyo_pago
,			declarado.af270d_gestor AS gestor_cobro
,			declarado.af270d_prf_nif AS nif_pais_residencia_fiscal
,			declarado.af270d_fec_nac AS fecha_nacimiento
,			month(declarado.af270d_fec_nac) AS mes_nacimiento
,			year(declarado.af270d_fec_nac) AS anyo_nacimiento
,			declarado.af270d_lugar_nac AS lugar_nacimiento
,			pais_nac.id_pais AS id_pais_nacimiento
,			pais_rcia.id_pais AS id_pais_residencia_fiscal
,			CASE WHEN declarado.af270d_error=1 THEN 1 ELSE 0 END AS es_erroneo_declarado
			--270i_af
,			timp.id_tipo_importe AS id_tipo_importe
,			importe.af270i_importe/100 AS importe_premio
			FROM	dbn1_stg_dhyf.dbo.tbn1cabe_af cabe
					----no_identificados_declarante
					LEFT JOIN	mae_noid mae_noid_cabe
							ON	cabe.caejercicio = mae_noid_cabe.ejercicio
							--AND cabe.careferdoc=mae_noid_cabe.clavagru
							AND CAST(cabe.careferdoc AS VARCHAR(9))= mae_noid_cabe.clavagru
							AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 
					--declarados
					INNER JOIN dbn1_stg_dhyf.dbo.tbn1270d_af declarado
							ON	cabe.caejercicio = declarado.af270d_ejercicio
							AND cabe.camodelo = '270'
							AND cabe.careferdoc = declarado.af270d_referdoc
					----no_identificados_declarado
					LEFT JOIN	mae_noid mae_noid_det
							ON	cabe.caejercicio = mae_noid_det.ejercicio
							AND CAST(cabe.careferdoc AS VARCHAR(9)) = mae_noid_det.clavagru
							AND right('0000000000000' +  cast(declarado.af270d_secuen as varchar) , 13)=  mae_noid_det.clavdeta 
					--importes
					INNER JOIN dbn1_stg_dhyf.dbo.tbn1270i_af importe
							ON	declarado.af270d_ejercicio = importe.af270i_ejercicio
							AND declarado.af270d_referdoc = importe.af270i_referdoc 
							AND declarado.af270d_secuen = importe.af270i_secuen
					--documentos
					INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos docu 
							ON docu.referencia = CAST(cabe.caejercicio AS varchar)+'Y>'+CAST(cabe.careferdoc AS varchar)+'00K0000'
					--expedientes
					INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e 
							ON docu.id_expediente=e.id_expediente
					--buscar los nif en contribuyentes (para declarante y declarados)
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c 
							ON cabe.cacifdecl=c.nif_maestro 
							AND c.fec_fin_vigencia=CAST('21000101' AS datetime)
					LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes d 
							ON declarado.af270d_cif=d.nif_maestro 
							AND d.fec_fin_vigencia=CAST('21000101' AS datetime)
					--JOIN con cada maestro
					INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda adm_orig 
							ON adm_orig.cod_administracion = coalesce('B',cabe.caadmonhaci)
					INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres 
							ON tipo_pres.cod_tipo_presentacion = cabe.catippres
					INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion tipo_decl 
							ON tipo_decl.cod_tipo_declaracion = cabe.catipodecl
					INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_tipos_perceptor perc
							ON declarado.af270d_tipo = perc.cod_tipo_perceptor
					INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_personalidad pers
							ON declarado.af270d_clave = pers.cod_clave_personalidad
					INNER JOIN dbn1_norm_dhyf.dbo.tbn1_provincias prov 
							ON declarado.af270d_provin = prov.cod_provincia
					INNER JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais_nac
							ON declarado.af270d_pais_nac = pais_nac.cod_pais
					INNER JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais_rcia
							ON declarado.af270d_prf_pais = pais_rcia.cod_pais
					INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe timp
							ON importe.af270i_tipo = timp.cod_tipo_importe
					--CROSS JOIN con la tabla de valores indefinidos
					CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos