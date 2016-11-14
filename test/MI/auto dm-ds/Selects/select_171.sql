;WITH
mae_noid AS 
	(
        SELECT id_mae_no_identificados,
               ejercicio,
               clavagru,
               clavdeta
        FROM   dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados
        WHERE  aplicacion = 'MF'
        AND detamodel = '171'
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
      coalesce(cabe.cabe_cifdecl,'') AS nif_declarante_171_11,
      coalesce(left(coalesce(cabe.cabe_cifdecl,''),9)+' '+right(coalesce(cabe.cabe_cifdecl,''),2),'') AS nif_declarante_171,
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
      CASE WHEN cabe.cabe_fecpres<>'0001-01-01' THEN cabe.cabe_fecpres ELSE CAST('21000101' AS date) END AS fecha_presentacion,
      month(CASE WHEN cabe.cabe_fecpres<>'0001-01-01' THEN cabe.cabe_fecpres ELSE CAST('21000101' AS date) END) AS mes_presentacion,
      year(CASE WHEN cabe.cabe_fecpres<>'0001-01-01' THEN cabe.cabe_fecpres ELSE CAST('21000101' AS date) END) AS anyo_presentacion,
      cabe.cabe_numcaja AS num_caja,
      cabe.cabe_fecalta AS fecha_alta,
      MONTH(cabe.cabe_fecalta) AS mes_alta,
      YEAR(cabe.cabe_fecalta) AS anyo_alta,
      cabe.cabe_justif AS num_justificante,
      tipo_declaracion.id_tipo_declaracion AS id_tipo_declaracion,
      cabe.cabe_crevi AS contador_revisiones,
      cabe.cabe_regfiscal AS regimen_fiscal_deducciones,
      coalesce(declarado.mfpe71_admon,'') AS administracion_declarado,
      CASE WHEN declarado.mfpe71_admon<>'B' THEN 1 ELSE 0 END AS es_externo_declarado,
      CAST(declarado.mfpe71_secuen AS varchar) AS secuencia,
      coalesce(declarado.mfpe71_cif,'') AS nif_declarado_171_11,
      coalesce(left(coalesce(declarado.mfpe71_cif,''),9)+' '+right(coalesce(declarado.mfpe71_cif,''),2),'') AS nif_declarado_171,
      CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarado,
      coalesce(c_declarado.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarado,
      CASE WHEN declarado.mfpe71_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarado,
      CASE
          WHEN CASE WHEN declarado.mfpe71_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
          WHEN CASE WHEN declarado.mfpe71_identif=1 THEN 1 ELSE 0 END=0 THEN 1
          WHEN CASE WHEN declarado.mfpe71_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
          ELSE ''
      END AS sw_identificado_declarado,
      CASE
          WHEN CASE WHEN declarado.mfpe71_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.mfpe71_cif,'')
          ELSE ''
      END AS nif_declarado_no_identificado_11,
      coalesce(left(CASE
          WHEN CASE WHEN declarado.mfpe71_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.mfpe71_cif,'')
          ELSE ''
      END,9)+' '+right(CASE
          WHEN CASE WHEN declarado.mfpe71_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.mfpe71_cif,'')
          ELSE ''
      END,2),'') AS nif_declarado_no_identificado,
      CASE WHEN declarado.mfpe71_error=1 THEN 1 ELSE 0 END AS es_erroneo,
      tipo_identificacion.id_tipo_identificacion AS id_tipo_identificacion,
      coalesce(declarado.mfpe71_cod_iden,'') AS codigo_identificacion_titular,
      pais.id_pais AS id_pais,
      clave_declarado.id_clave_declarado AS id_clave_declarado,
      clave_tipo_codigo.id_clave_tipo_codigo AS id_clave_tipo_codigo,
      coalesce(declarado.mfpe71_iban,'') AS codigo_iban,
      coalesce(declarado.mfpe71_ccc_banco,'') AS codigo_entidad,
      coalesce(declarado.mfpe71_ccc_sucur,'') AS codigo_sucursal,
      coalesce(declarado.mfpe71_ccc_dc,'') AS digito_control,
      coalesce(declarado.mfpe71_ccc_cuenta,'') AS codigo_cuenta,
      CASE
          WHEN declarado.mfpe71_fecha_oper<>'0001-01-01' THEN declarado.mfpe71_fecha_oper
          ELSE CAST('21000101' AS date)
      END AS fecha_operacion,
      month(CASE
          WHEN declarado.mfpe71_fecha_oper<>'0001-01-01' THEN declarado.mfpe71_fecha_oper
          ELSE CAST('21000101' AS date)
      END) AS mes_operacion,
      year(CASE
          WHEN declarado.mfpe71_fecha_oper<>'0001-01-01' THEN declarado.mfpe71_fecha_oper
          ELSE CAST('21000101' AS date)
      END) AS anyo_operacion,
      clave_operacion.id_clave_operacion AS id_clave_operacion,
      tipo_importe.id_tipo_importe AS id_tipo_importe,
      round(importes.mfim71_importe/100,2) AS importe

    FROM 
    (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1cabe_mf WHERE cabe_modelo='171') cabe 
	--no_identificados_declarante
	LEFT JOIN	mae_noid mae_noid_cabe
			ON	cabe.cabe_ejercicio = mae_noid_cabe.ejercicio
			AND CAST(cabe.cabe_referdoc as varchar) = mae_noid_cabe.clavagru
			AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000' 
	INNER JOIN  dbn1_stg_dhyf.dbo.tbn1pe71_mf declarado ON cabe.cabe_ejercicio=declarado.mfpe71_ejercicio AND cabe.cabe_referdoc=declarado.mfpe71_referdoc	    
	--no_identificados_declarado
	LEFT JOIN	mae_noid mae_noid_det
			ON	cabe.cabe_ejercicio = mae_noid_det.ejercicio
			AND cast(cabe.cabe_referdoc as varchar)= mae_noid_det.clavagru
			AND right('0000000000000' +  cast(declarado.mfpe71_secuen as varchar) , 13)=  mae_noid_det.clavdeta 
	INNER JOIN dbn1_stg_dhyf.dbo.tbn1im71_mf importes ON (declarado.mfpe71_ejercicio=importes.mfim71_ejercicio AND declarado.mfpe71_admon=importes.mfim71_admon AND declarado.mfpe71_referdoc=importes.mfim71_referdoc AND declarado.mfpe71_secuen=importes.mfim71_secuen)
	
	INNER JOIN	dbn1_norm_dhyf.dbo.tbn1_documentos doc 
			ON	doc.referencia = CAST(declarado.mfpe71_ejercicio AS varchar)+'Sª'+CAST(declarado.mfpe71_referdoc AS varchar)+'00K0000'
			AND doc.marca_baja IS NULL
			AND doc.fec_baja IS NULL
    
	INNER JOIN	dbn1_norm_dhyf.dbo.tbn1_expedientes e 
			ON	doc.id_expediente = e.id_expediente
			AND e.fec_baja IS NULL
    
	LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarante ON (cabe.cabe_cifdecl=c_declarante.nif_maestro AND c_declarante.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarado ON (declarado.mfpe71_cif=c_declarado.nif_maestro AND c_declarado.fec_fin_vigencia=CAST('21000101' AS datetime))
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.cod_tipo_presentacion=cabe.cabe_tiposoporte)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion tipo_declaracion ON (tipo_declaracion.cod_tipo_declaracion=cabe.cabe_tipodecl)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe tipo_importe ON (tipo_importe.cod_tipo_importe=importes.mfim71_tipo)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_identificacion tipo_identificacion ON (tipo_identificacion.cod_tipo_identificacion=declarado.mfpe71_clav_cod_iden)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_declarado clave_declarado ON (clave_declarado.cod_clave_declarado=declarado.mfpe71_clav_declarado)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo clave_tipo_codigo ON (clave_tipo_codigo.cod_clave_tipo_codigo=declarado.mfpe71_tipo_codigo)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_operacion clave_operacion ON (clave_operacion.cod_clave_operacion=declarado.mfpe71_clav_operacion)
    LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_paises pais ON (pais.cod_pais=declarado.mfpe71_pais)
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
      CASE WHEN cabe.cabe_fecpres<>'0001-01-01' THEN cabe.cabe_fecpres ELSE CAST('21000101' AS date) END,
      month(CASE WHEN cabe.cabe_fecpres<>'0001-01-01' THEN cabe.cabe_fecpres ELSE CAST('21000101' AS date) END),
      year(CASE WHEN cabe.cabe_fecpres<>'0001-01-01' THEN cabe.cabe_fecpres ELSE CAST('21000101' AS date) END),
      cabe.cabe_numcaja,
	  cabe_fecalta,
      cabe.cabe_justif,
      tipo_declaracion.id_tipo_declaracion,
      cabe.cabe_crevi,
      cabe.cabe_regfiscal,
      coalesce(declarado.mfpe71_admon,''),
      CASE WHEN declarado.mfpe71_admon<>'B' THEN 1 ELSE 0 END,
      CAST(declarado.mfpe71_secuen AS varchar),
      coalesce(declarado.mfpe71_cif,''),
      coalesce(left(coalesce(declarado.mfpe71_cif,''),9)+' '+right(coalesce(declarado.mfpe71_cif,''),2),''),
      CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END,
      coalesce(c_declarado.id_contribuyente,indefinidos.id_contribuyente),
      CASE WHEN declarado.mfpe71_identif=1 THEN 1 ELSE 0 END,
      CASE
          WHEN CASE WHEN declarado.mfpe71_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
          WHEN CASE WHEN declarado.mfpe71_identif=1 THEN 1 ELSE 0 END=0 THEN 1
          WHEN CASE WHEN declarado.mfpe71_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
          ELSE ''
      END,
      CASE
          WHEN CASE WHEN declarado.mfpe71_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.mfpe71_cif,'')
          ELSE ''
      END,
      coalesce(left(CASE
          WHEN CASE WHEN declarado.mfpe71_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.mfpe71_cif,'')
          ELSE ''
      END,9)+' '+right(CASE
          WHEN CASE WHEN declarado.mfpe71_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.mfpe71_cif,'')
          ELSE ''
      END,2),''),
      CASE WHEN declarado.mfpe71_error=1 THEN 1 ELSE 0 END,
      tipo_identificacion.id_tipo_identificacion,
      coalesce(declarado.mfpe71_cod_iden,''),
      pais.id_pais,
      clave_declarado.id_clave_declarado,
      clave_tipo_codigo.id_clave_tipo_codigo,
      coalesce(declarado.mfpe71_iban,''),
      coalesce(declarado.mfpe71_ccc_banco,''),
      coalesce(declarado.mfpe71_ccc_sucur,''),
      coalesce(declarado.mfpe71_ccc_dc,''),
      coalesce(declarado.mfpe71_ccc_cuenta,''),
      CASE
          WHEN declarado.mfpe71_fecha_oper<>'0001-01-01' THEN declarado.mfpe71_fecha_oper
          ELSE CAST('21000101' AS date)
      END,
      month(CASE
          WHEN declarado.mfpe71_fecha_oper<>'0001-01-01' THEN declarado.mfpe71_fecha_oper
          ELSE CAST('21000101' AS date)
      END),
      year(CASE
          WHEN declarado.mfpe71_fecha_oper<>'0001-01-01' THEN declarado.mfpe71_fecha_oper
          ELSE CAST('21000101' AS date)
      END),
      clave_operacion.id_clave_operacion,
      tipo_importe.id_tipo_importe,
      round(importes.mfim71_importe/100,2)
)
--select top 10 * from query