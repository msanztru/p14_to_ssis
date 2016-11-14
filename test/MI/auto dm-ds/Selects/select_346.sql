	;WITH
	mae_noid AS 
	(
			SELECT id_mae_no_identificados,
						ejercicio,
						clavagru,
						clavdeta
			FROM   dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados
			WHERE  aplicacion = 'MF'
			AND detamodel = '346'
	),
	query AS (
				SELECT	docu.id_documento AS id_documento,
						e.id_expediente AS id_expediente,
						cabe.cabe_ejercicio AS ejercicio,
						cabe.cabe_modelo AS modelo,
						cabe.cabe_admon AS administracion_declarante,
						CASE WHEN cabe.cabe_admon='B' THEN 0 ELSE 1 END AS es_externo_declarante,
						cabe.cabe_cifdecl AS nif_declarante_346_11,
						coalesce(left(coalesce(cabe.cabe_cifdecl,''),9)+' '+right(coalesce(cabe.cabe_cifdecl,''),2),'') AS nif_declarante_346,
						CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarante,
						coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarante,
					
						coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante,
						coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado,

						CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarante,
						CASE
						WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
						WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN 1
						WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
						ELSE ''
						END AS sw_identificado_declarante,
						CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END AS nif_declarante_no_identificado_11,
						coalesce(left(CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,2),'') AS nif_declarante_no_identificado,
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
						month(cabe.cabe_fecalta) AS mes_alta,
						year(cabe.cabe_fecalta) AS anyo_alta,
						cabe.cabe_justif AS num_justificante,
						decl.id_tipo_declaracion AS id_tipo_declaracion,
						cabe.cabe_crevi AS contador_revisiones,
						cabe.cabe_regfiscal AS regimen_fiscal_deducciones,
						--declarado
						declarado.pe46_admon AS administracion_declarado,
						CASE WHEN declarado.pe46_admon = 'B' THEN 0 ELSE 1 END AS es_externo_declarado,
						CAST(declarado.pe46_secuen AS varchar) AS secuencia,
						declarado.pe46_cif AS nif_declarado_346_11,
						CASE WHEN CASE WHEN declarado.pe46_identif = 1 THEN 1 ELSE 0 END = 0 THEN declarado.pe46_cif ELSE '' END AS nif_declarado_no_identificado_11,
						coalesce(left(declarado.pe46_cif,9)+' '+right(declarado.pe46_cif,2),'') AS nif_declarado_346,
						coalesce(left(CASE WHEN CASE WHEN declarado.pe46_identif=1 THEN 1 ELSE 0 END=0 THEN declarado.pe46_cif ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN declarado.pe46_identif=1 THEN 1 ELSE 0 END=0 THEN declarado.pe46_cif ELSE '' END,2),'') AS nif_declarado_no_identificado,
						CASE WHEN d.id_contribuyente IS NULL THEN 0 ELSE 1 END AS es_contribuyente_declarado,
						coalesce(d.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarado,
						prov.id_provincia AS id_provincia,
						clv_per.id_clave_percepcion AS id_clave_percepcion,
						tip_per.id_tipo_percepcion AS id_tipo_percepcion,
						pe46_ejer_dvgo AS ejercicio_devengo,
						pe46_concepto AS concepto,
						CASE WHEN declarado.pe46_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarado,
						CASE
							WHEN CASE WHEN declarado.pe46_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NULL THEN 0 ELSE 1 END=1 THEN 0
							WHEN CASE WHEN declarado.pe46_identif=1 THEN 1 ELSE 0 END=0 THEN 1
							WHEN CASE WHEN declarado.pe46_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NULL THEN 0 ELSE 1 END=0 THEN 2
							ELSE ''
						END AS sw_identificado_declarado,
						CASE declarado.pe46_error WHEN '1' THEN 1 ELSE 0 END AS es_erroneo,
						id_mae_claves_caracteres_intervencion AS id_mae_claves_caracteres_intervencion,
						--importes
						impo.id_tipo_importe AS id_tipo_importe,
						round(im46_importe/100,2) AS importe					

				FROM (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1cabe_mf WHERE cabe_modelo='346') cabe
						--no_identificados_declarante
						LEFT JOIN	mae_noid mae_noid_cabe
								ON	cabe.cabe_ejercicio = mae_noid_cabe.ejercicio
								AND cast(cabe.cabe_referdoc as varchar) = mae_noid_cabe.clavagru
								AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 
						--declarados
						INNER JOIN	dbn1_stg_dhyf.dbo.tbn1pe46_mf declarado
								ON	cabe.cabe_ejercicio = declarado.pe46_ejercicio
								AND cabe.cabe_modelo = '346'
								AND cabe.cabe_referdoc = declarado.pe46_referdoc
						--no_identificados_declarado
						LEFT JOIN	mae_noid mae_noid_det
								ON	cabe.cabe_ejercicio = mae_noid_det.ejercicio
								AND cast(cabe.cabe_referdoc as varchar) = mae_noid_det.clavagru
								AND right('0000000000000' +  cast(declarado.pe46_secuen as varchar) , 13)=  mae_noid_det.clavdeta 
						--importes
						INNER JOIN	dbn1_stg_dhyf.dbo.tbn1im46_mf importes 
								ON	declarado.pe46_ejercicio = importes.im46_ejercicio 
								AND declarado.pe46_admon = importes.im46_admon 
								AND declarado.pe46_referdoc = importes.im46_referdoc 
								AND declarado.pe46_secuen=importes.im46_secuen
						--documentos
						INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos docu 
								ON docu.referencia = CAST(cabe.cabe_ejercicio AS varchar)+'FF'+CAST(cabe.cabe_referdoc AS varchar)+'00K0000'
						--expedientes
						INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e 
								ON docu.id_expediente=e.id_expediente
						--buscar los nif en contribuyentes (para declarante y declarados)
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c 
								ON cabe.cabe_cifdecl=c.nif_maestro 
								AND c.fec_fin_vigencia=CAST('21000101' AS datetime)
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes d 
								ON declarado.pe46_cif=d.nif_maestro 
								AND d.fec_fin_vigencia=CAST('21000101' AS datetime)
						--JOIN con cada maestro
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias prov 
								ON declarado.pe46_provincia = prov.cod_provincia
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipos_soporte sopo 
								ON sopo.cod_tipo_soporte = cabe.cabe_tiposoporte
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion decl 
								ON decl.cod_tipo_declaracion = cabe.cabe_tipodecl
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_claves_percepcion clv_per
								ON declarado.pe46_clave = clv_per.cod_clave_percepcion
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipos_percepcion tip_per
								ON declarado.pe46_tipoper = tip_per.cod_tipo_percepcion
						INNER JOIN dbn1_dmr_dhyf.dbo.tbn1_mae_claves_caracteres_intervencion car_int
								ON declarado.pe46_caracter_interv = car_int.cod_clave_caracter_intervencion
						LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe impo 
								ON importes.im46_tipo=impo.cod_tipo_importe
						--CROSS JOIN con la tabla de valores indefinidos
						CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
	)
select * from query