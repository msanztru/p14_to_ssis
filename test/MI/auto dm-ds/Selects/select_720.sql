	;WITH
	mae_noid AS 
	(
			SELECT id_mae_no_identificados,
						ejercicio,
						clavagru,
						clavdeta
			FROM   dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados
			WHERE  aplicacion = 'MF'
			AND detamodel = '720'
	),
	query AS (

				SELECT	docu.id_documento AS id_documento,
						e.id_expediente AS id_expediente,
						cabe.mfdecl_ejercicio AS ejercicio,
						cabe.mfdecl_modelo AS modelo,
						cabe.mfdecl_admon AS administracion_declarante,

						coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante,
						coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado,

						CASE WHEN cabe.mfdecl_admon='B' THEN 0 ELSE 1 END AS es_externo_declarante,
						cabe.mfdecl_cifdecl AS nif_declarante_720_11,
						coalesce(left(coalesce(cabe.mfdecl_cifdecl,''),9)+' '+right(coalesce(cabe.mfdecl_cifdecl,''),2),'') AS nif_declarante_720,
						CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarante,
						coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarante,
						CASE WHEN cabe.mfdecl_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarante,
						CASE
						WHEN CASE WHEN cabe.mfdecl_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
						WHEN CASE WHEN cabe.mfdecl_identif=1 THEN 1 ELSE 0 END=0 THEN 1
						WHEN CASE WHEN cabe.mfdecl_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
						ELSE ''
						END AS sw_identificado_declarante,
						CASE WHEN CASE WHEN cabe.mfdecl_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.mfdecl_cifdecl,'') ELSE '' END AS nif_declarante_no_identificado_11,
						coalesce(left(CASE WHEN CASE WHEN cabe.mfdecl_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.mfdecl_cifdecl,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN cabe.mfdecl_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.mfdecl_cifdecl,'') ELSE '' END,2),'') AS nif_declarante_no_identificado,
						cabe.mfdecl_telefono AS telefono,
						cabe.mfdecl_persona AS persona_relacionarse,
						banc.id_mae_entidades_bancarias AS id_mae_entidades_bancarias,
						sopo.id_tipo_soporte AS id_tipo_soporte,
						cabe.mfdecl_fecpres AS fecha_presentacion,
						month(cabe.mfdecl_fecpres) AS mes_presentacion,
						year(cabe.mfdecl_fecpres) AS anyo_presentacion,
						cabe.mfdecl_numcaja AS num_caja,
						cabe.mfdecl_fecalta AS fecha_alta,
						month(cabe.mfdecl_fecalta) AS mes_alta,
						year(cabe.mfdecl_fecalta) AS anyo_alta,
						cabe.mfdecl_justif AS num_justificante,
						decl.id_tipo_declaracion AS id_tipo_declaracion,
						cabe.mfdecl_justifsus AS num_justificante_sustitutiva,
						cabe.mfdecl_crevi AS contador_revisiones,
						cabe.mfdecl_regfiscal AS regimen_fiscal_deducciones,
						cabe.mfdecl_baja AS pendiente_baja,
						--declarado
						declarado.mf720d_admon AS administracion_declarado,
						CASE WHEN declarado.mf720d_admon = 'B' THEN 0 ELSE 1 END AS es_externo_declarado,
						declarado.mf720d_secuen AS secuencia,
						declarado.mf720d_cif AS nif_declarado_720_11,
						CASE WHEN CASE WHEN declarado.mf720d_ident = 1 THEN 1 ELSE 0 END = 0 THEN declarado.mf720d_cif ELSE '' END AS nif_declarado_no_identificado_11,
						coalesce(left(declarado.mf720d_cif,9)+' '+right(declarado.mf720d_cif,2),'') AS nif_declarado_720,
						coalesce(left(CASE WHEN CASE WHEN declarado.mf720d_ident=1 THEN 1 ELSE 0 END=0 THEN declarado.mf720d_cif ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN declarado.mf720d_ident=1 THEN 1 ELSE 0 END=0 THEN declarado.mf720d_cif ELSE '' END,2),'') AS nif_declarado_no_identificado,
						CASE WHEN d.id_contribuyente IS NULL THEN 0 ELSE 1 END AS es_contribuyente_declarado,
						coalesce(d.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarado,
						mf720d_represen AS nif_representante_legal,
						titu.id_mae_claves_titularidad AS id_mae_claves_titularidad,
						mf720d_tit_desc AS otra_titularidad,
						bien.id_mae_claves_bienes_720 AS id_mae_claves_bienes_720,
						sub_bien.id_mae_subclaves_bienes_720 AS id_mae_subclaves_bienes_720,
						pais.id_pais AS id_pais,
						mf720d_nombre_entidad AS nombre_entidad,
						mf720d_nif_entidad AS nif_entidad,
						mf720d_incorporacion AS fecha_incorporacion,
						month(mf720d_incorporacion) AS mes_incorporacion,
						year(mf720d_incorporacion) AS anyo_incorporacion,
						orig.id_mae_origenes_bienes_720 AS id_mae_origenes_bienes_720,
						mf720d_extincion AS fecha_extincion,
						month(mf720d_extincion) AS mes_extincion,
						year(mf720d_extincion) AS anyo_extincion,
						mf720d_saldo/100 AS saldo,
						mf720d_saldo_medio/100 AS saldo_medio_ultimo_trimestre,
						mf720d_participacion/100 AS porc_participacion,
						CASE WHEN declarado.mf720d_ident=1 THEN 1 ELSE 0 END AS es_identificado_declarado,
						CASE
							WHEN CASE WHEN declarado.mf720d_ident=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NULL THEN 0 ELSE 1 END=1 THEN 0
							WHEN CASE WHEN declarado.mf720d_ident=1 THEN 1 ELSE 0 END=0 THEN 1
							WHEN CASE WHEN declarado.mf720d_ident=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NULL THEN 0 ELSE 1 END=0 THEN 2
							ELSE ''
						END AS sw_identificado_declarado,
						--bienes
						coalesce(mf720b_bien_desc,'') AS desc_bien,
						coalesce(mueb.id_mae_claves_tipos_bienes_muebles_inmuebles,-1) AS id_mae_claves_tipos_bienes_muebles_inmuebles,
						coalesce(pais_reg.id_pais,-1) AS id_pais_registro_bien,
						coalesce(mf720b_reg_numero,'') AS registro_matricula,
						--cuentas
						coalesce(cuen.id_mae_claves_cuenta,-1) AS id_mae_claves_cuenta,
						coalesce(mf720c_bic,'') AS cod_intenacional_bancario,
						coalesce(mf720c_cuenta,'') AS cuenta,
						--valores/acciones
						coalesce(valo.id_mae_claves_identificacion_valor_accion,-1) AS id_mae_claves_identificacion_valor_accion,
						coalesce(mf720v_ident,'') AS identificacion_valor_accion,
						coalesce(repr.id_clave_representacion,-1) AS id_clave_representacion,
						coalesce(mf720v_nro_valores,0) AS num_valores

				FROM	dbn1_stg_dhyf.dbo.tbn1decl_mf cabe
					--no_identificados_declarante
					LEFT JOIN mae_noid mae_noid_cabe
							ON	cabe.mfdecl_ejercicio = mae_noid_cabe.ejercicio
							AND cast(cabe.mfdecl_referdoc as varchar) = mae_noid_cabe.clavagru
							AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 
						--declarados
						INNER JOIN	dbn1_stg_dhyf.dbo.tbn1720d_mf declarado
								ON	cabe.mfdecl_ejercicio = declarado.mf720d_ejercicio
								AND cabe.mfdecl_modelo = '720'
								AND cabe.mfdecl_referdoc = declarado.mf720d_referdoc	
							--no_identificados_declarado
						LEFT JOIN	mae_noid mae_noid_det
								ON	cabe.mfdecl_ejercicio = mae_noid_det.ejercicio
								AND cast(cabe.mfdecl_referdoc as varchar) = mae_noid_det.clavagru
								AND right('0000000000000' +  cast(declarado.mf720d_secuen as varchar) , 13)=  mae_noid_det.clavdeta 
						--documentos
						INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos docu 
								ON docu.referencia = CAST(cabe.mfdecl_ejercicio AS varchar)+'W='+CAST(cabe.mfdecl_referdoc AS varchar)+'00K0000'
						--expedientes
						INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e 
								ON docu.id_expediente=e.id_expediente
						--buscar los nif en contribuyentes (para declarante y declarados)
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c 
								ON cabe.mfdecl_cifdecl=c.nif_maestro 
								AND c.fec_fin_vigencia=CAST('21000101' AS datetime)
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes d 
								ON declarado.mf720d_cif=d.nif_maestro 
								AND d.fec_fin_vigencia=CAST('21000101' AS datetime)										
						--LEFT JOIN con tablas de Bienes, Cuentas y Valores/Acciones 
						LEFT JOIN dbn1_stg_dhyf.dbo.tbn1720b_mf bienes
								ON	declarado.mf720d_ejercicio = bienes.mf720b_ejercicio
								AND	declarado.mf720d_admon = bienes.mf720b_admon
								AND	declarado.mf720d_referdoc = bienes.mf720b_referdoc
								AND	declarado.mf720d_secuen = bienes.mf720b_secuen					
						LEFT JOIN dbn1_stg_dhyf.dbo.tbn1720c_mf cuentas
								ON	declarado.mf720d_ejercicio = cuentas.mf720c_ejercicio
								AND	declarado.mf720d_admon = cuentas.mf720c_admon
								AND	declarado.mf720d_referdoc = cuentas.mf720c_referdoc
								AND	declarado.mf720d_secuen = cuentas.mf720c_secuen
						LEFT JOIN dbn1_stg_dhyf.dbo.tbn1720v_mf valores
								ON	declarado.mf720d_ejercicio = valores.mf720v_ejercicio
								AND	declarado.mf720d_admon = valores.mf720v_admon
								AND	declarado.mf720d_referdoc = valores.mf720v_referdoc
								AND	declarado.mf720d_secuen = valores.mf720v_secuen
						--LEFT JOIN con cada maestro
						LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_entidades_bancarias banc
								ON cabe.mfdecl_banco = banc.cod_entidad_bancaria
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte sopo
								ON cabe.mfdecl_tiposoporte = sopo.cod_tipo_soporte
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion decl
								ON cabe.mfdecl_tipodecl = decl.cod_tipo_declaracion
						LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_titularidad titu
								ON declarado.mf720d_tit_clave = titu.cod_clave_titularidad
						LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_bienes_720 bien
								ON declarado.mf720d_bien_clave = bien.cod_clave_bien_720
						LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_subclaves_bienes_720 sub_bien
								ON declarado.mf720d_bien_clave = sub_bien.cod_clave_bien_720
								AND declarado.mf720d_bien_subclave = sub_bien.cod_subclave_bien_720
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais
								ON declarado.mf720d_bien_pais = pais.cod_pais
						LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_tipos_bienes_muebles_inmuebles mueb
								ON bienes.mf720b_tipo_bien = mueb.cod_clave_tipo_bien_mueble_inmueble
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais_reg
								ON bienes.mf720b_reg_pais = pais_reg.cod_pais
						LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_origenes_bienes_720 orig
								ON declarado.mf720d_origen_bien = orig.cod_origen_bien_720
						LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_cuenta cuen
								ON cuentas.mf720c_clave_cuenta = cuen.cod_clave_cuenta
						LEFT JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_identificacion_valor_accion valo
								ON valores.mf720v_clave_ident = valo.cod_clave_identificacion_valor_accion
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion repr
								ON valores.mf720v_repres_valores = repr.cod_clave_representacion
						--CROSS JOIN con la tabla de valores indefinidos
						CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos

	)
--select * from query