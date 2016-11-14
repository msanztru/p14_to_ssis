--1162 declarantes
--1160 join con censo declarantes
--948.106 join con declarados
--679.958 join con censo declarados
--246.644 join con documentos y expedientes (porque en desa/prepro no tenemos documentos del 2014)
--246.644 join con todos los maestros (ok, no pierdo ninguno)
	;WITH mae_noid AS
	(
		SELECT	id_mae_no_identificados,
				ejercicio,
				clavagru,
				clavdeta
		FROM	dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados
		WHERE	aplicacion = 'NR'
		AND		detamodel = '296'
	),
	query AS
	(
		SELECT	--top 10000
				docu.id_documento AS id_documento,
				e.id_expediente AS id_expediente,
				--cabecera
				tipo_pres.id_tipo_presentacion AS id_tipo_presentacion,
				cabe.d296_fecha_presen AS fecha_presentacion,
				month(cabe.d296_fecha_presen) AS mes_presentacion,
				year(cabe.d296_fecha_presen) AS anyo_presentacion,
				tipo_sopo.id_tipo_soporte AS id_tipo_soporte,
				cabe.d296_refer_colec AS referencia_presentacion_colectiva,
				tipo_decl.id_tipo_declaracion AS id_tipo_declaracion,
				CASE
					WHEN row_number() OVER (PARTITION BY docu.id_documento ORDER BY docu.id_documento, coalesce(censo_declarante.cenr_nif+censo_declarante.cenr_discriminante,'') )=1 THEN coalesce(cabe.d296_bases_reten/100,0)
					ELSE 0																				
				END AS base_retenciones_declarante,
				CASE
					WHEN row_number() OVER (PARTITION BY docu.id_documento ORDER BY docu.id_documento, coalesce(censo_declarante.cenr_nif+censo_declarante.cenr_discriminante,'') )=1 THEN coalesce(cabe.d296_retenciones/100,0)
					ELSE 0																				
				END AS retenciones_declarante,
				CASE
					WHEN row_number() OVER (PARTITION BY docu.id_documento ORDER BY docu.id_documento, coalesce(censo_declarante.cenr_nif+censo_declarante.cenr_discriminante,'') )=1 THEN coalesce(cabe.d296_reten_ingdos/100,0)
					ELSE 0																				
				END AS retenciones_ingdosto_declarante,
				cabe.d296_conta_revis AS contador_revisiones,
				CASE cabe.d296_anulada WHEN 'V' THEN 1 ELSE 0 END AS es_anulada,
				cabe.d296_user_reten AS usuario_retenedor,
				cabe.d296_tfno_contacto AS telefono_contacto,
				cabe.d296_nom_contacto AS nombre_contacto,
				--declarado
				declarado.a296_secuencia AS secuencia,
				pais.id_pais AS id_pais,
				declarado.a296_fecha_deven AS fecha_devengo,
				month(declarado.a296_fecha_deven) AS mes_devengo,
				year(declarado.a296_fecha_deven) AS anyo_devengo,
				natu_rent.id_mae_naturalezas_renta AS id_mae_naturalezas_renta,--a296_naturaleza
				clav_rent.id_mae_claves_tipos_renta AS id_mae_claves_tipos_renta,--a296_clave
				subc_rent.id_mae_subclaves_tipos_renta AS id_mae_subclaves_tipos_renta,--a296_subclave
				declarado.a296_base_reten/100 AS base_retenciones_declarado,
				declarado.a296_porc_reten AS porcentaje_retencion_declarado,
				declarado.a296_retencion/100 AS retenciones_declarado,
				CASE declarado.a296_mediador WHEN 'X' THEN 1 ELSE 0 END AS es_mediador,
				clav_ident.id_clave_identificacion_fondo AS id_clave_identificacion_fondo,--a296_codigo
				declarado.a296_cod_emisor AS cod_emisor,
				clav_pago.id_mae_claves_pago AS id_mae_claves_pago,--a296_pago
				tipo_cod.id_tipo_codigo AS id_tipo_codigo,--a296_tipo_codigo
				enti_banc.id_mae_entidades_bancarias AS id_mae_entidades_bancarias,--a296_banco_valor
				declarado.a296_sucur_valor AS sucursal,
				declarado.a296_dc_valor AS digito_control,
				declarado.a296_cuenta_valor AS num_cuenta,
				CASE declarado.a296_pendiente WHEN 'X' THEN 1 ELSE 0 END AS es_pendiente,
				declarado.a296_ejer_devengo AS ejercicio_devengo,
				declarado.a296_fec_inic_pres AS fecha_inicio_prestamo,
				month(declarado.a296_fec_inic_pres) AS mes_inicio_prestamo,
				year(declarado.a296_fec_inic_pres) AS anyo_inicio_prestamo,
				declarado.a296_fec_venc_pres AS fecha_vencimiento_prestamo,
				month(declarado.a296_fec_venc_pres) AS mes_vencimiento_prestamo,
				year(declarado.a296_fec_venc_pres) AS anyo_vencimiento_prestamo,
				declarado.a296_renum_al_pres/100 AS remuneracion_prestamista,
				declarado.a296_compensacion/100 AS compensaciones,
				declarado.a296_garantia/100 AS garantias,
				declarado.a296_clave_ej2008 AS clave_presentacion_2008,
				--censo declarantes
				adm_declarante.id_administracion AS id_administracion_declarante,
				censo_declarante.cenr_nif AS nif_declarante_296,
				coalesce(left(CASE WHEN CASE WHEN censo_declarante.cenr_identificado=1 THEN 1 ELSE 0 END=0 THEN coalesce(censo_declarante.cenr_nif,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN censo_declarante.cenr_identificado=1 THEN 1 ELSE 0 END=0 THEN coalesce(censo_declarante.cenr_nif,'') ELSE '' END,2),'') AS nif_declarante_no_identificado,
				CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarante,
				coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarante,
				CASE WHEN censo_declarante.cenr_identificado=1 THEN 1 ELSE 0 END AS es_identificado_declarante,
				CASE
					WHEN CASE WHEN censo_declarante.cenr_identificado=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
					WHEN CASE WHEN censo_declarante.cenr_identificado=1 THEN 1 ELSE 0 END=0 THEN 1
					WHEN CASE WHEN censo_declarante.cenr_identificado=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
					ELSE ''
				END AS sw_identificado_declarante,
				coalesce(mae_noid_cabe.id_mae_no_identificados,-1) AS id_mae_no_id_declarante,
				censo_declarante.cenr_cod_extranjer AS cod_extranjero_declarante,
				censo_declarante.cenr_nombre AS nombre_declarante,
				clav_pers_declarante.id_mae_claves_personalidad AS id_mae_claves_personalidad_declarante,--cenr_fj
				censo_declarante.cenr_co AS c_o_declarante,
				censo_declarante.cenr_fecha_poder AS fecha_poder_declarante,
				month(censo_declarante.cenr_fecha_poder) AS mes_poder_declarante,
				year(censo_declarante.cenr_fecha_poder) AS anyo_poder_declarante,
				CASE
					WHEN row_number() OVER (PARTITION BY docu.id_documento ORDER BY docu.id_documento, coalesce(censo_declarante.cenr_nif+censo_declarante.cenr_discriminante,'') )=1 THEN coalesce(censo_declarante.cenr_importe/100,0)
					ELSE 0																				
				END AS importe_asociado_declarante,
				censo_declarante.cenr_nacionalidad AS nacionalidad_declarante,
				sexo_declarante.id_mae_sexos AS id_mae_sexos_declarante,--cenr_sexo
				censo_declarante.cenr_fecha_naci AS fecha_nacimiento_declarante,
				month(censo_declarante.cenr_fecha_naci) AS mes_nacimiento_declarante,
				year(censo_declarante.cenr_fecha_naci) AS anyo_nacimiento_declarante,
				censo_declarante.cenr_nif_paisresid_fisc AS nif_pais_residencia_fiscal_declarante,
				--censo declarados
				adm_declarado.id_administracion AS id_administracion_declarado,
				censo_declarado.cenr_nif AS nif_declarado_296,
				coalesce(left(CASE WHEN CASE WHEN censo_declarado.cenr_identificado=1 THEN 1 ELSE 0 END=0 THEN coalesce(censo_declarado.cenr_nif,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN censo_declarado.cenr_identificado=1 THEN 1 ELSE 0 END=0 THEN coalesce(censo_declarado.cenr_nif,'') ELSE '' END,2),'') AS nif_declarado_no_identificado,
				CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarado,
				coalesce(d.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarado,
				CASE WHEN censo_declarado.cenr_identificado=1 THEN 1 ELSE 0 END AS es_identificado_declarado,
				CASE
					WHEN CASE WHEN censo_declarado.cenr_identificado=1 THEN 1 ELSE 0 END=1 AND CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
					WHEN CASE WHEN censo_declarado.cenr_identificado=1 THEN 1 ELSE 0 END=0 THEN 1
					WHEN CASE WHEN censo_declarado.cenr_identificado=1 THEN 1 ELSE 0 END=1 AND CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
					ELSE ''
				END AS sw_identificado_declarado,
				coalesce(mae_noid_det.id_mae_no_identificados,-1) AS id_mae_no_id_declarado,
				censo_declarado.cenr_cod_extranjer AS cod_extranjero_declarado,
				censo_declarado.cenr_nombre AS nombre_declarado,
				clav_pers_declarado.id_mae_claves_personalidad AS id_mae_claves_personalidad_declarado,--cenr_fj
				censo_declarado.cenr_co AS c_o_declarado,
				censo_declarado.cenr_fecha_poder AS fecha_poder_declarado,
				month(censo_declarado.cenr_fecha_poder) AS mes_poder_declarado,
				year(censo_declarado.cenr_fecha_poder) AS anyo_poder_declarado,
				censo_declarado.cenr_importe/100 AS importe_asociado_declarado,
				censo_declarado.cenr_nacionalidad AS nacionalidad_declarado,
				sexo_declarado.id_mae_sexos AS id_mae_sexos_declarado,--cenr_sexo
				censo_declarado.cenr_fecha_naci AS fecha_nacimiento_declarado,
				month(censo_declarado.cenr_fecha_naci) AS mes_nacimiento_declarado,
				year(censo_declarado.cenr_fecha_naci) AS anyo_nacimiento_declarado,
				censo_declarado.cenr_nif_paisresid_fisc AS nif_pais_residencia_fiscal_declarado
		FROM	tbn1d296_nr cabe
				--censo declarantes
				INNER JOIN	tbn1cenr_nr censo_declarante
						ON	cabe.d296_referencia = censo_declarante.cenr_referencia
						AND	censo_declarante.cenr_clave_relacio = 'DC'
				--no_identificados_declarante
				LEFT JOIN	mae_noid mae_noid_cabe
						ON	CAST(SUBSTRING(cabe.d296_referencia,1,4) AS DECIMAL) = mae_noid_cabe.ejercicio
						AND SUBSTRING(cabe.d296_referencia,7,9)= mae_noid_cabe.clavagru
						AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 
				--declarado
				INNER JOIN	tbn1a296_nr declarado
						ON	cabe.d296_referencia = declarado.a296_referencia
				--censo declarados
				INNER JOIN	tbn1cenr_nr censo_declarado
						ON	declarado.a296_referencia = censo_declarado.cenr_referencia
						AND declarado.a296_secuencia = censo_declarado.cenr_secuencia
						AND	censo_declarado.cenr_clave_relacio = 'PT'
				--no_identificados_declarado
				LEFT JOIN	mae_noid mae_noid_det
						ON	CAST(SUBSTRING(cabe.d296_referencia,1,4) AS DECIMAL) = mae_noid_det.ejercicio
						AND SUBSTRING(cabe.d296_referencia,7,9) = mae_noid_det.clavagru
						AND right('0000000000000' +  CAST(declarado.a296_secuencia AS VARCHAR) , 13)=  mae_noid_det.clavdeta
				--documentos
				INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos docu 
						ON docu.referencia = cabe.d296_referencia
						AND docu.marca_baja IS NULL
				--expedientes
				INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e 
						ON docu.id_expediente=e.id_expediente
				--buscar los nif en contribuyentes (para declarante, declarados y presentador)
				LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c 
						ON censo_declarante.cenr_nif+' '+censo_declarante.cenr_discriminante=c.nif_maestro 
						AND c.fec_fin_vigencia=CAST('21000101' AS datetime)
				LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes d
						ON censo_declarado.cenr_nif+' '+censo_declarado.cenr_discriminante=d.nif_maestro
						AND d.fec_fin_vigencia=CAST('21000101' AS datetime)
				--JOIN con cada maestro
				INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres 
						ON cabe.d296_tipo_presen = tipo_pres.cod_tipo_presentacion
				INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte tipo_sopo
						ON cabe.d296_tipo_soporte = tipo_sopo.cod_tipo_soporte
				INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion tipo_decl
						ON cabe.d296_comple_susti = tipo_decl.cod_tipo_declaracion
				INNER JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais
						ON declarado.a296_pais = pais.cod_pais
				INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_naturalezas_renta natu_rent
						ON declarado.a296_naturaleza = natu_rent.cod_naturaleza_renta
				INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_renta clav_rent
						ON declarado.a296_clave_ej2008 = clav_rent.cod_clave_tipo_renta
				INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_tipos_renta subc_rent
						ON declarado.a296_subclave = subc_rent.cod_subclave_tipo_renta
				INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_identificacion_fondo clav_ident
						ON declarado.a296_codigo = clav_ident.cod_clave_identificacion_fondo
				INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_pago clav_pago
						ON declarado.a296_pago= clav_pago.cod_clave_pago
				INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_codigo tipo_cod
						ON declarado.a296_tipo_codigo = tipo_cod.cod_tipo_codigo
				INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_entidades_bancarias enti_banc
						ON declarado.a296_banco_valor = enti_banc.cod_entidad_bancaria
				INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda adm_declarante
						ON censo_declarante.cenr_administra = adm_declarante.cod_administracion
				INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_personalidad clav_pers_declarante
						ON censo_declarante.cenr_fj = clav_pers_declarante.cod_clave_personalidad
				INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_sexos sexo_declarante
						ON censo_declarante.cenr_sexo = sexo_declarante.cod_sexo
				INNER JOIN dbn1_norm_dhyf.dbo.tbn1_mi_administracion_hacienda adm_declarado
						ON censo_declarado.cenr_administra = adm_declarado.cod_administracion
				INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_personalidad clav_pers_declarado
						ON censo_declarado.cenr_fj = clav_pers_declarado.cod_clave_personalidad
				INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_sexos sexo_declarado
						ON censo_declarado.cenr_sexo = sexo_declarado.cod_sexo
				CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
	)
	SELECT * FROM query
	--order by id_documento,secuencia