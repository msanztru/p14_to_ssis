;WITH
mae_noid AS 
(
        SELECT id_mae_no_identificados,
                    ejercicio,
                    clavagru,
                    clavdeta
        FROM   dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados
        WHERE  aplicacion = 'MF'
        AND detamodel = '170'
),
query AS (
    SELECT
      doc.id_documento AS id_documento,
      e.id_expediente AS id_expediente,
      cabe.cabe_ejercicio AS ejercicio,

	  coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante,
	  coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado,

      coalesce(cabe.cabe_modelo,'') AS modelo,
      coalesce(cabe.cabe_admon,'') AS administracion_declarante,
      CASE WHEN cabe.cabe_admon<>'B' THEN 1 ELSE 0 END AS es_externo_declarante,
      coalesce(cabe.cabe_cifdecl,'') AS nif_declarante_170_11,
      coalesce(left(coalesce(cabe.cabe_cifdecl,''),9)+' '+right(coalesce(cabe.cabe_cifdecl,''),2),'') AS nif_declarante_170,
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
      coalesce(left(CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,2),'') AS nif_declarante_no_identificado,
      coalesce(cabe.cabe_telefono,'') AS telefono,
      coalesce(cabe.cabe_persona,'') AS razon_social,
      coalesce(cabe.cabe_refpres,'') AS cod_presentador_colectivo,
      coalesce(cabe.cabe_banco,'') AS cod_banco_espania,
      tipo_pres.id_tipo_presentacion AS id_tipo_presentacion,
      cabe.cabe_fecpres AS fecha_presentacion,
      month(cabe.cabe_fecpres) AS mes_presentacion,
      year(cabe.cabe_fecpres) AS anyo_presentacion,
      cabe.cabe_numcaja AS num_caja,
      cabe.cabe_fecalta AS fecha_alta,
      MONTH(cabe.cabe_fecalta) AS mes_alta,
      YEAR(cabe.cabe_fecalta) AS anyo_alta,
      cabe.cabe_justif AS num_justificante,
      tipo_declaracion.id_tipo_declaracion AS id_tipo_declaracion,
      cabe.cabe_crevi AS contador_revisiones,
      cabe.cabe_regfiscal AS regimen_fiscal_deducciones,
      coalesce(declarado.mfpe70_admon,'') AS administracion_declarado,
      CASE WHEN declarado.mfpe70_admon<>'B' THEN 1 ELSE 0 END AS es_externo_declarado,
      CAST(declarado.mfpe70_secuen AS varchar) AS secuencia,
      coalesce(declarado.mfpe70_cif,'') AS nif_declarado_170_11,
      coalesce(left(coalesce(declarado.mfpe70_cif,''),9)+' '+right(coalesce(declarado.mfpe70_cif,''),2),'') AS nif_declarado_170,
      CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarado,
      coalesce(c_declarado.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarado,
      CASE WHEN declarado.mfpe70_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarado,
      CASE
          WHEN CASE WHEN declarado.mfpe70_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
          WHEN CASE WHEN declarado.mfpe70_identif=1 THEN 1 ELSE 0 END=0 THEN 1
          WHEN CASE WHEN declarado.mfpe70_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
          ELSE ''
      END AS sw_identificado_declarado,
      CASE
          WHEN CASE WHEN declarado.mfpe70_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.mfpe70_cif,'')
          ELSE ''
      END AS nif_declarado_no_identificado_11,
      coalesce(left(CASE
          WHEN CASE WHEN declarado.mfpe70_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.mfpe70_cif,'')
          ELSE ''
      END,9)+' '+right(CASE
          WHEN CASE WHEN declarado.mfpe70_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.mfpe70_cif,'')
          ELSE ''
      END,2),'') AS nif_declarado_no_identificado,
      CASE WHEN declarado.mfpe70_error=1 THEN 1 ELSE 0 END AS es_erroneo_declarado,
      tipo_hoja.id_tipo_hoja,
      clave_tipo_codigo.id_clave_tipo_codigo AS id_clave_tipo_codigo,
      coalesce(declarado.mfpe70_iban,'') AS codigo_iban,
      coalesce(declarado.mfpe70_ccc_banco,'') AS codigo_entidad,
      coalesce(declarado.mfpe70_ccc_sucur,'') AS codigo_sucursal,
      coalesce(declarado.mfpe70_ccc_dc,'') AS digito_control,
      coalesce(declarado.mfpe70_ccc_cuenta,'') AS codigo_cuenta,
      declarado.mfpe70_nro_comercio AS num_comercio,
      tipo_importe.id_tipo_importe AS id_tipo_importe,
      round(importes.mfim70_importe/100,2) AS importe

--SELECT COUNT(*)					
	FROM	(SELECT * FROM dbn1_stg_dhyf.dbo.tbn1cabe_mf WHERE cabe_modelo='170') cabe 
			
			--no_identificados_declarante
			LEFT JOIN	mae_noid mae_noid_cabe
					ON	cabe.cabe_ejercicio = mae_noid_cabe.ejercicio
					AND cast(cabe.cabe_referdoc as varchar) = mae_noid_cabe.clavagru
					AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 
					
			INNER JOIN  dbn1_stg_dhyf.dbo.tbn1pe70_mf declarado 
				ON cabe.cabe_ejercicio=declarado.mfpe70_ejercicio 
				AND cabe.cabe_referdoc=declarado.mfpe70_referdoc
			
			--no_identificados_declarado
			LEFT JOIN	mae_noid mae_noid_det
					ON	cabe.cabe_ejercicio = mae_noid_det.ejercicio
					AND cast(cabe.cabe_referdoc as varchar) = mae_noid_det.clavagru
					AND right('0000000000000' +  cast(declarado.mfpe70_secuen as varchar) , 13)=  mae_noid_det.clavdeta 
			
			LEFT JOIN dbn1_stg_dhyf.dbo.tbn1im70_mf importes 
					ON declarado.mfpe70_ejercicio=importes.mfim70_ejercicio AND declarado.mfpe70_admon=importes.mfim70_admon AND declarado.mfpe70_referdoc=importes.mfim70_referdoc AND declarado.mfpe70_secuen=importes.mfim70_secuen
    
			INNER JOIN	dbn1_norm_dhyf.dbo.tbn1_documentos doc 
					ON	doc.referencia = CAST(declarado.mfpe70_ejercicio AS varchar)+'S"'+CAST(declarado.mfpe70_referdoc AS varchar)+'00K0000'
					AND	doc.marca_baja IS NULL
					AND	doc.fec_baja IS NULL 

			INNER JOIN	dbn1_norm_dhyf.dbo.tbn1_expedientes e 
					ON	doc.id_expediente = e.id_expediente
					AND	e.fec_baja IS NULL
    
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarante 
					ON cabe.cabe_cifdecl=c_declarante.nif_maestro AND c_declarante.fec_fin_vigencia=CAST('21000101' AS datetime)
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarado 
					ON declarado.mfpe70_cif=c_declarado.nif_maestro AND c_declarado.fec_fin_vigencia=CAST('21000101' AS datetime)
			
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.cod_tipo_presentacion=cabe.cabe_tiposoporte)
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion tipo_declaracion ON (tipo_declaracion.cod_tipo_declaracion=cabe.cabe_tipodecl)
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe tipo_importe ON (tipo_importe.cod_tipo_importe=importes.mfim70_tipo)
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo clave_tipo_codigo ON (clave_tipo_codigo.cod_clave_tipo_codigo=declarado.mfpe70_tipo_codigo)
			LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_hoja tipo_hoja ON (tipo_hoja.cod_tipo_hoja=declarado.mfpe70_hoja)
			CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    GROUP BY
      doc.id_documento,
      e.id_expediente,
      cabe.cabe_ejercicio,

	  coalesce(mae_noid_cabe.id_mae_no_identificados,-1) ,
	  coalesce(mae_noid_det.id_mae_no_identificados,-1) ,

      coalesce(cabe.cabe_modelo,''),
      coalesce(cabe.cabe_admon,''),
      CASE WHEN cabe.cabe_admon<>'B' THEN 1 ELSE 0 END,
      coalesce(cabe.cabe_cifdecl,''),
      coalesce(left(coalesce(cabe.cabe_cifdecl,''),9)+' '+right(coalesce(cabe.cabe_cifdecl,''),2),''),
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
      coalesce(left(CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END,2),''),
      coalesce(cabe.cabe_telefono,''),
      coalesce(cabe.cabe_persona,''),
      coalesce(cabe.cabe_refpres,''),
      coalesce(cabe.cabe_banco,''),
      tipo_pres.id_tipo_presentacion,
      cabe.cabe_fecpres,
      month(cabe.cabe_fecpres),
      year(cabe.cabe_fecpres),
      cabe.cabe_numcaja,
	  cabe_fecalta,
      cabe.cabe_justif,
      tipo_declaracion.id_tipo_declaracion,
      cabe.cabe_crevi,
      cabe.cabe_regfiscal,
      coalesce(declarado.mfpe70_admon,''),
      CASE WHEN declarado.mfpe70_admon<>'B' THEN 1 ELSE 0 END,
      CAST(declarado.mfpe70_secuen AS varchar),
      coalesce(declarado.mfpe70_cif,''),
      coalesce(left(coalesce(declarado.mfpe70_cif,''),9)+' '+right(coalesce(declarado.mfpe70_cif,''),2),''),
      CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END,
      coalesce(c_declarado.id_contribuyente,indefinidos.id_contribuyente),
      CASE WHEN declarado.mfpe70_identif=1 THEN 1 ELSE 0 END,
      CASE
          WHEN CASE WHEN declarado.mfpe70_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
          WHEN CASE WHEN declarado.mfpe70_identif=1 THEN 1 ELSE 0 END=0 THEN 1
          WHEN CASE WHEN declarado.mfpe70_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
          ELSE ''
      END,
      CASE
          WHEN CASE WHEN declarado.mfpe70_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.mfpe70_cif,'')
          ELSE ''
      END,
      coalesce(left(CASE
          WHEN CASE WHEN declarado.mfpe70_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.mfpe70_cif,'')
          ELSE ''
      END,9)+' '+right(CASE
          WHEN CASE WHEN declarado.mfpe70_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.mfpe70_cif,'')
          ELSE ''
      END,2),''),
      CASE WHEN declarado.mfpe70_error=1 THEN 1 ELSE 0 END,
      tipo_hoja.id_tipo_hoja,
      clave_tipo_codigo.id_clave_tipo_codigo,
      coalesce(declarado.mfpe70_iban,''),
      coalesce(declarado.mfpe70_ccc_banco,''),
      coalesce(declarado.mfpe70_ccc_sucur,''),
      coalesce(declarado.mfpe70_ccc_dc,''),
      coalesce(declarado.mfpe70_ccc_cuenta,''),
      declarado.mfpe70_nro_comercio,
      tipo_importe.id_tipo_importe,
      round(importes.mfim70_importe/100,2)

	)
--select count(*) from query