PRINT 'tmp_cargar_mi_ds_modelo_159_vistas_union.sql'
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='vwn1_mi_159') DROP VIEW dbo.vwn1_mi_159
GO

CREATE VIEW dbo.vwn1_mi_159 AS
SELECT
  doc.id_documento AS id_documento,
  e.id_expediente AS id_expediente,
  cabe.cabe_ejercicio AS ejercicio,
  coalesce(cabe.cabe_modelo,'') AS modelo,
  coalesce(cabe.cabe_admon,'') AS administracion_declarante,
  CASE WHEN cabe.cabe_admon<>'B' THEN 1 ELSE 0 END AS es_externo_declarante,
  coalesce(cabe.cabe_cifdecl,'') AS nif_declarante_159,
  CASE WHEN c_declarante.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarante,
  coalesce(c_declarante.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarante,
  CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarante,
  CASE
      WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarante.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
      WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN 1
      WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarante.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
      ELSE ''
  END AS sw_identificado_declarante,
  CASE WHEN CASE WHEN cabe.cabe_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cabe.cabe_cifdecl,'') ELSE '' END AS nif_declarante_no_identificado,
  coalesce(cabe.cabe_telefono,'') AS telefono,
  coalesce(cabe.cabe_persona,'') AS razon_social,
  coalesce(cabe.cabe_refpres,'') AS cod_presentador_colectivo,
  coalesce(cabe.cabe_banco,'') AS cod_banco_espania,
  coalesce(tipo_pres.id_tipo_presentacion,indefinidos.id_tipo_presentacion) AS id_tipo_presentacion,
  CASE WHEN cabe.cabe_fecpres<>'0001-01-01' THEN cabe.cabe_fecpres END AS fecha_presentacion,
  month(cabe.cabe_fecpres) AS mes_presentacion,
  year(cabe.cabe_fecpres) AS anyo_presentacion,
  cabe.cabe_numcaja AS num_caja,
  cabe.cabe_justif AS num_justificante,
  coalesce(tipo_declaracion.id_tipo_declaracion,indefinidos.id_tipo_declaracion) AS id_tipo_declaracion,
  cabe.cabe_crevi AS contador_revisiones,
  cabe.cabe_regfiscal AS regimen_fiscal_deducciones,
  declarado.mfpe59_ejercicio AS ejercicio_declarado,
  coalesce(declarado.mfpe59_admon,'') AS administracion_declarado,
  CASE WHEN declarado.mfpe59_admon<>'B' THEN 1 ELSE 0 END AS es_externo_declarado,
  coalesce(declarado.mfpe59_referdoc,'') AS referencia,
  CAST(declarado.mfpe59_secuen AS varchar) AS secuencia,
  coalesce(declarado.mfpe59_cif,'') AS nif_declarado_159,
  CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarado,
  coalesce(c_declarado.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarado,
  CASE WHEN declarado.mfpe59_identif=1 THEN 1 ELSE 0 END AS es_identificado_declarado,
  CASE
      WHEN CASE WHEN declarado.mfpe59_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
      WHEN CASE WHEN declarado.mfpe59_identif=1 THEN 1 ELSE 0 END=0 THEN 1
      WHEN CASE WHEN declarado.mfpe59_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
      ELSE ''
  END AS sw_identificado_declarado,
  CASE WHEN CASE WHEN declarado.mfpe59_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.mfpe59_cif,'') END AS nif_declarado_no_identificado,
  CASE WHEN declarado.mfpe59_error=1 THEN 1 ELSE 0 END AS es_erroneo_declarado,
  coalesce(clave_tipo_codigo.id_clave_tipo_codigo,indefinidos.id_clave_tipo_codigo) AS id_clave_tipo_codigo,
  coalesce(declarado.mfpe59_iban,'') AS codigo_iban,
  coalesce(declarado.mfpe59_ccc_banco,'') AS codigo_entidad,
  coalesce(declarado.mfpe59_ccc_sucur,'') AS codigo_sucursal,
  coalesce(declarado.mfpe59_ccc_dc,'') AS digito_control,
  coalesce(declarado.mfpe59_ccc_cuenta,'') AS codigo_cuenta,
  declarado.mfpe59_cie_pais AS pais_residencia,
  declarado.mfpe59_cie_codigo AS identificacion_extranjero,
  declarado.mfpe59_contrato AS contrato_suministro,
  declarado.mfpe59_cups_pais AS codigo_pais,
  declarado.mfpe59_cups_dist AS distribuidora,
  declarado.mfpe59_cups_libre AS numero_libre_asignacion,
  declarado.mfpe59_cups_dc AS cups_digito_control,
  declarado.mfpe59_cups_medida AS punto_medida,
  declarado.mfpe59_cups_suministro AS punto_suministro,
  declarado.mfpe59_tipo_bien AS tipo_bien,
  declarado.mfpe59_situacion AS situacion_inmueble,
  declarado.mfpe59_refcat AS referencia_catastral,
  declarado.mfpe59_fecalta AS fecha_alta_contrato,
  declarado.mfpe59_fecbaja AS fecha_baja_contrato,
  declarado.mfpe59_unidad_medida AS unidad_medida_consumo,
  declarado.mfpe59_pot_unidad AS unidad_medida_potencia,
  declarado.mfpe59_pot_maxima AS potencia_maxima_contratada,
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
  repre.sdrepr_fjuri AS forma_juridica,
  repre.sdrepr_letra AS letra_nif_representante,
  repre.sdrepr_falta AS fecha_alta,
  repre.sdrepr_fmodi AS fecha_modificacion,
  repre.sdrepr_baja AS sw_baja,
  repre.sdrepr_nropte AS num_puente_representante
FROM dbo.tbn1pe59_mf declarado
INNER JOIN (SELECT * FROM dbo.tbn1cabe_mf WHERE cabe_modelo='159') cabe ON cabe.cabe_ejercicio=declarado.mfpe59_ejercicio AND cabe.cabe_referdoc=declarado.mfpe59_referdoc
LEFT JOIN (SELECT * FROM dbo.tbn1domi_sd WHERE sddomi_modelo='159') domicilio ON declarado.mfpe59_ejercicio=domicilio.sddomi_ejercicio AND declarado.mfpe59_admon=domicilio.sddomi_admon AND declarado.mfpe59_referdoc=domicilio.sddomi_referdoc AND declarado.mfpe59_secuen=domicilio.sddomi_secuen
LEFT JOIN (SELECT * FROM dbo.tbn1repr_sd WHERE sdrepr_model='159') repre ON declarado.mfpe59_ejercicio=repre.sdrepr_ejerc AND declarado.mfpe59_admon=repre.sdrepr_admon AND declarado.mfpe59_referdoc=CAST(repre.sdrepr_refer AS varchar) AND declarado.mfpe59_secuen=repre.sdrepr_secue
INNER JOIN dbn1_norm_dhyf.dbo.tbn1_documentos doc ON (doc.referencia=CAST(declarado.mfpe59_ejercicio AS varchar)+'I<'+CAST(declarado.mfpe59_referdoc AS varchar)+'00K0000')
INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarante ON (cabe.cabe_cifdecl=c_declarante.nif_maestro AND c_declarante.fec_fin_vigencia=CAST('21000101' AS datetime))
LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c_declarado ON (declarado.mfpe59_cif=c_declarado.nif_maestro AND c_declarado.fec_fin_vigencia=CAST('21000101' AS datetime))
LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_presentacion tipo_pres ON (tipo_pres.cod_tipo_presentacion=cabe.cabe_tiposoporte)
LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_declaracion tipo_declaracion ON (tipo_declaracion.cod_tipo_declaracion=cabe.cabe_tipodecl)
LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_tipo_codigo clave_tipo_codigo ON (clave_tipo_codigo.cod_clave_tipo_codigo=declarado.mfpe59_tipo_codigo)
LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_provincias provincia ON (provincia.cod_provincia=domicilio.sddomi_cdgo_prov)
LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_municipios municipio ON (municipio.cod_municipio=domicilio.sddomi_cdgo_mun)
CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
GROUP BY
  doc.id_documento,
  e.id_expediente,
  cabe.cabe_ejercicio,
  coalesce(cabe.cabe_modelo,''),
  coalesce(cabe.cabe_admon,''),
  CASE WHEN cabe.cabe_admon<>'B' THEN 1 ELSE 0 END,
  coalesce(cabe.cabe_cifdecl,''),
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
  coalesce(cabe.cabe_telefono,''),
  coalesce(cabe.cabe_persona,''),
  coalesce(cabe.cabe_refpres,''),
  coalesce(cabe.cabe_banco,''),
  coalesce(tipo_pres.id_tipo_presentacion,indefinidos.id_tipo_presentacion),
  CASE WHEN cabe.cabe_fecpres<>'0001-01-01' THEN cabe.cabe_fecpres END,
  month(cabe.cabe_fecpres),
  year(cabe.cabe_fecpres),
  cabe.cabe_numcaja,
  cabe.cabe_justif,
  coalesce(tipo_declaracion.id_tipo_declaracion,indefinidos.id_tipo_declaracion),
  cabe.cabe_crevi,
  cabe.cabe_regfiscal,
  declarado.mfpe59_ejercicio,
  coalesce(declarado.mfpe59_admon,''),
  CASE WHEN declarado.mfpe59_admon<>'B' THEN 1 ELSE 0 END,
  coalesce(declarado.mfpe59_referdoc,''),
  CAST(declarado.mfpe59_secuen AS varchar),
  coalesce(declarado.mfpe59_cif,''),
  CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END,
  coalesce(c_declarado.id_contribuyente,indefinidos.id_contribuyente),
  CASE WHEN declarado.mfpe59_identif=1 THEN 1 ELSE 0 END,
  CASE
      WHEN CASE WHEN declarado.mfpe59_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
      WHEN CASE WHEN declarado.mfpe59_identif=1 THEN 1 ELSE 0 END=0 THEN 1
      WHEN CASE WHEN declarado.mfpe59_identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c_declarado.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
      ELSE ''
  END,
  CASE WHEN CASE WHEN declarado.mfpe59_identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.mfpe59_cif,'') END,
  CASE WHEN declarado.mfpe59_error=1 THEN 1 ELSE 0 END,
  coalesce(clave_tipo_codigo.id_clave_tipo_codigo,indefinidos.id_clave_tipo_codigo),
  coalesce(declarado.mfpe59_iban,''),
  coalesce(declarado.mfpe59_ccc_banco,''),
  coalesce(declarado.mfpe59_ccc_sucur,''),
  coalesce(declarado.mfpe59_ccc_dc,''),
  coalesce(declarado.mfpe59_ccc_cuenta,''),
  declarado.mfpe59_cie_pais,
  declarado.mfpe59_cie_codigo,
  declarado.mfpe59_contrato,
  declarado.mfpe59_cups_pais,
  declarado.mfpe59_cups_dist,
  declarado.mfpe59_cups_libre,
  declarado.mfpe59_cups_dc,
  declarado.mfpe59_cups_medida,
  declarado.mfpe59_cups_suministro,
  declarado.mfpe59_tipo_bien,
  declarado.mfpe59_situacion,
  declarado.mfpe59_refcat,
  declarado.mfpe59_fecalta,
  declarado.mfpe59_fecbaja,
  declarado.mfpe59_unidad_medida,
  declarado.mfpe59_pot_unidad,
  declarado.mfpe59_pot_maxima,
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


GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='vwn1_mi_ds_159') DROP VIEW dbo.vwn1_mi_ds_159
GO

CREATE VIEW dbo.vwn1_mi_ds_159 AS
SELECT
  documento,
  id_expediente,
  ejercicio,
  modelo,
  administracion_declarante,
  es_externo_declarante,
  nif_declarante_159,
  nif_declarante_no_identificado,
  es_contribuyente_declarante,
  id_contribuyente_declarante,
  es_identificado_declarante,
  sw_identificado_declarante,
  telefono,
  razon_social,
  cod_presentador_colectivo,
  cod_banco_espania,
  id_tipo_presentacion,
  fecha_presentacion,
  mes_presentacion,
  anyo_presentacion,
  num_caja,
  num_justificante,
  id_tipo_declaracion,
  contador_revisiones,
  regimen_fiscal_deducciones,
  administracion_declarado,
  es_externo_declarado,
  secuencia,
  nif_declarado_159,
  nif_declarado_no_identificado,
  es_contribuyente_declarado,
  id_contribuyente_declarado,
  es_identificado_declarado,
  sw_identificado_declarado,
  es_erroneo_declarado,
  id_clave_tipo_codigo,
  codigo_iban,
  codigo_entidad,
  codigo_sucursal,
  digito_control,
  codigo_cuenta,
  pais_residencia,
  identificacion_extranjero,
  contrato_suministro,
  codigo_pais,
  distribuidora,
  numero_libre_asignacion,
  cups_digito_control,
  punto_medida,
  punto_suministro,
  tipo_bien,
  situacion_inmueble,
  referencia_catastral,
  fecha_alta_contrato,
  fecha_baja_contrato,
  unidad_medida_consumo,
  unidad_medida_potencia,
  potencia_maxima_contratada,
  tipo_direccion,
  orden,
  num_puente_domicilio,
  tipo_via,
  nombre_via,
  tipo_numero,
  numero_casa,
  calificador_numero,
  bloque,
  portal,
  escalera,
  piso,
  puerta,
  complemento,
  localidad,
  municipio,
  id_municipio,
  id_provincia,
  codigo_postal,
  nif_representante,
  forma_juridica,
  letra_nif_representante,
  fecha_alta,
  fecha_modificacion,
  sw_baja,
  num_puente_representante,
  id_tipo_importe,
  importe,
  id_tipo_periodo,
  consumo_facturado,
  tipo_lectura
FROM 
    (
      SELECT documento,id_expediente,ejercicio,modelo,administracion_declarante,es_externo_declarante,nif_declarante_159,nif_declarante_no_identificado,es_contribuyente_declarante,id_contribuyente_declarante,es_identificado_declarante,sw_identificado_declarante,telefono,razon_social,cod_presentador_colectivo,cod_banco_espania,id_tipo_presentacion,fecha_presentacion,mes_presentacion,anyo_presentacion,num_caja,num_justificante,id_tipo_declaracion,contador_revisiones,regimen_fiscal_deducciones,administracion_declarado,es_externo_declarado,secuencia,nif_declarado_159,nif_declarado_no_identificado,es_contribuyente_declarado,id_contribuyente_declarado,es_identificado_declarado,sw_identificado_declarado,es_erroneo_declarado,id_clave_tipo_codigo,codigo_iban,codigo_entidad,codigo_sucursal,digito_control,codigo_cuenta,pais_residencia,identificacion_extranjero,contrato_suministro,codigo_pais,distribuidora,numero_libre_asignacion,cups_digito_control,punto_medida,punto_suministro,tipo_bien,situacion_inmueble,referencia_catastral,fecha_alta_contrato,fecha_baja_contrato,unidad_medida_consumo,unidad_medida_potencia,potencia_maxima_contratada,tipo_direccion,orden,num_puente_domicilio,tipo_via,nombre_via,tipo_numero,numero_casa,calificador_numero,bloque,portal,escalera,piso,puerta,complemento,localidad,municipio,id_municipio,id_provincia,codigo_postal,nif_representante,forma_juridica,letra_nif_representante,fecha_alta,fecha_modificacion,sw_baja,num_puente_representante,id_tipo_importe,importe,NULL id_tipo_periodo,NULL consumo_facturado,NULL tipo_lectura
      FROM (
        SELECT
          mi_159.id_documento AS documento,
          mi_159.id_expediente AS id_expediente,
          mi_159.ejercicio AS ejercicio,
          mi_159.modelo AS modelo,
          mi_159.administracion_declarante AS administracion_declarante,
          mi_159.es_externo_declarante AS es_externo_declarante,
          mi_159.nif_declarante_159 AS nif_declarante_159,
          mi_159.nif_declarante_no_identificado AS nif_declarante_no_identificado,
          mi_159.es_contribuyente_declarante AS es_contribuyente_declarante,
          mi_159.id_contribuyente_declarante AS id_contribuyente_declarante,
          mi_159.es_identificado_declarante AS es_identificado_declarante,
          mi_159.sw_identificado_declarante AS sw_identificado_declarante,
          mi_159.telefono AS telefono,
          mi_159.razon_social AS razon_social,
          mi_159.cod_presentador_colectivo AS cod_presentador_colectivo,
          mi_159.cod_banco_espania AS cod_banco_espania,
          mi_159.id_tipo_presentacion AS id_tipo_presentacion,
          mi_159.fecha_presentacion AS fecha_presentacion,
          mi_159.mes_presentacion AS mes_presentacion,
          mi_159.anyo_presentacion AS anyo_presentacion,
          mi_159.num_caja AS num_caja,
          mi_159.num_justificante AS num_justificante,
          mi_159.id_tipo_declaracion AS id_tipo_declaracion,
          mi_159.contador_revisiones AS contador_revisiones,
          mi_159.regimen_fiscal_deducciones AS regimen_fiscal_deducciones,
          mi_159.administracion_declarado AS administracion_declarado,
          mi_159.es_externo_declarado AS es_externo_declarado,
          mi_159.secuencia AS secuencia,
          mi_159.nif_declarado_159 AS nif_declarado_159,
          mi_159.nif_declarado_no_identificado AS nif_declarado_no_identificado,
          mi_159.es_contribuyente_declarado AS es_contribuyente_declarado,
          mi_159.id_contribuyente_declarado AS id_contribuyente_declarado,
          mi_159.es_identificado_declarado AS es_identificado_declarado,
          mi_159.sw_identificado_declarado AS sw_identificado_declarado,
          mi_159.es_erroneo_declarado AS es_erroneo_declarado,
          mi_159.id_clave_tipo_codigo AS id_clave_tipo_codigo,
          mi_159.codigo_iban AS codigo_iban,
          mi_159.codigo_entidad AS codigo_entidad,
          mi_159.codigo_sucursal AS codigo_sucursal,
          mi_159.digito_control AS digito_control,
          mi_159.codigo_cuenta AS codigo_cuenta,
          mi_159.pais_residencia AS pais_residencia,
          mi_159.identificacion_extranjero AS identificacion_extranjero,
          mi_159.contrato_suministro AS contrato_suministro,
          mi_159.codigo_pais AS codigo_pais,
          mi_159.distribuidora AS distribuidora,
          mi_159.numero_libre_asignacion AS numero_libre_asignacion,
          mi_159.cups_digito_control AS cups_digito_control,
          mi_159.punto_medida AS punto_medida,
          mi_159.punto_suministro AS punto_suministro,
          mi_159.tipo_bien AS tipo_bien,
          mi_159.situacion_inmueble AS situacion_inmueble,
          mi_159.referencia_catastral AS referencia_catastral,
          mi_159.fecha_alta_contrato AS fecha_alta_contrato,
          mi_159.fecha_baja_contrato AS fecha_baja_contrato,
          mi_159.unidad_medida_consumo AS unidad_medida_consumo,
          mi_159.unidad_medida_potencia AS unidad_medida_potencia,
          mi_159.potencia_maxima_contratada AS potencia_maxima_contratada,
          mi_159.tipo_direccion AS tipo_direccion,
          mi_159.orden AS orden,
          mi_159.num_puente_domicilio AS num_puente_domicilio,
          mi_159.tipo_via AS tipo_via,
          mi_159.nombre_via AS nombre_via,
          mi_159.tipo_numero AS tipo_numero,
          mi_159.numero_casa AS numero_casa,
          mi_159.calificador_numero AS calificador_numero,
          mi_159.bloque AS bloque,
          mi_159.portal AS portal,
          mi_159.escalera AS escalera,
          mi_159.piso AS piso,
          mi_159.puerta AS puerta,
          mi_159.complemento AS complemento,
          mi_159.localidad AS localidad,
          mi_159.municipio AS municipio,
          mi_159.id_municipio AS id_municipio,
          mi_159.id_provincia AS id_provincia,
          mi_159.codigo_postal AS codigo_postal,
          mi_159.nif_representante AS nif_representante,
          mi_159.forma_juridica AS forma_juridica,
          mi_159.letra_nif_representante AS letra_nif_representante,
          mi_159.fecha_alta AS fecha_alta,
          mi_159.fecha_modificacion AS fecha_modificacion,
          mi_159.sw_baja AS sw_baja,
          mi_159.num_puente_representante AS num_puente_representante,
          coalesce(tipo_importe.id_tipo_importe,indefinidos.id_tipo_importe) AS id_tipo_importe,
          round(importes.mfim59_importe/100,2) AS importe
        FROM dbo.vwn1_mi_159 mi_159
        INNER JOIN dbo.tbn1im59_mf importes ON (mi_159.ejercicio_declarado=importes.mfim59_ejercicio AND mi_159.administracion_declarado=importes.mfim59_admon AND mi_159.referencia=importes.mfim59_referdoc AND mi_159.secuencia=importes.mfim59_secuen)
        LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe tipo_importe ON (tipo_importe.cod_tipo_importe=importes.mfim59_tipo)
        CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
      ) IMPORTES
      UNION ALL SELECT documento,NULL id_expediente,NULL ejercicio,NULL modelo,NULL administracion_declarante,NULL es_externo_declarante,NULL nif_declarante_159,NULL nif_declarante_no_identificado,NULL es_contribuyente_declarante,NULL id_contribuyente_declarante,NULL es_identificado_declarante,NULL sw_identificado_declarante,NULL telefono,NULL razon_social,NULL cod_presentador_colectivo,NULL cod_banco_espania,NULL id_tipo_presentacion,NULL fecha_presentacion,NULL mes_presentacion,NULL anyo_presentacion,NULL num_caja,NULL num_justificante,NULL id_tipo_declaracion,NULL contador_revisiones,NULL regimen_fiscal_deducciones,NULL administracion_declarado,NULL es_externo_declarado,secuencia,NULL nif_declarado_159,NULL nif_declarado_no_identificado,NULL es_contribuyente_declarado,NULL id_contribuyente_declarado,NULL es_identificado_declarado,NULL sw_identificado_declarado,NULL es_erroneo_declarado,NULL id_clave_tipo_codigo,NULL codigo_iban,NULL codigo_entidad,NULL codigo_sucursal,NULL digito_control,NULL codigo_cuenta,NULL pais_residencia,NULL identificacion_extranjero,NULL contrato_suministro,NULL codigo_pais,NULL distribuidora,NULL numero_libre_asignacion,NULL cups_digito_control,NULL punto_medida,NULL punto_suministro,NULL tipo_bien,NULL situacion_inmueble,NULL referencia_catastral,NULL fecha_alta_contrato,NULL fecha_baja_contrato,NULL unidad_medida_consumo,NULL unidad_medida_potencia,NULL potencia_maxima_contratada,NULL tipo_direccion,NULL orden,NULL num_puente_domicilio,NULL tipo_via,NULL nombre_via,NULL tipo_numero,NULL numero_casa,NULL calificador_numero,NULL bloque,NULL portal,NULL escalera,NULL piso,NULL puerta,NULL complemento,NULL localidad,NULL municipio,NULL id_municipio,NULL id_provincia,NULL codigo_postal,NULL nif_representante,NULL forma_juridica,NULL letra_nif_representante,NULL fecha_alta,NULL fecha_modificacion,NULL sw_baja,NULL num_puente_representante,id_tipo_importe,NULL importe,id_tipo_periodo,consumo_facturado,tipo_lectura
      FROM (
        SELECT
          mi_159.id_documento AS documento,
          mi_159.secuencia AS secuencia,
          coalesce(tipo_importe.id_tipo_importe,indefinidos.id_tipo_importe) AS id_tipo_importe,
          coalesce(tipos_periodo.id_tipo_periodo,indefinidos.id_tipo_periodo) AS id_tipo_periodo,
          consumos.mfco59_con_fact AS consumo_facturado,
          consumos.mfco59_con_tipo AS tipo_lectura
        FROM dbo.vwn1_mi_159 mi_159
        INNER JOIN dbo.tbn1co59_mf consumos ON (mi_159.ejercicio_declarado=consumos.mfco59_ejercicio AND mi_159.administracion_declarado=consumos.mfco59_admon AND mi_159.referencia=consumos.mfco59_referdoc AND mi_159.secuencia=consumos.mfco59_secuen)
        INNER JOIN dbo.tbn1im59_mf importes ON (mi_159.ejercicio_declarado=importes.mfim59_ejercicio AND mi_159.administracion_declarado=importes.mfim59_admon AND mi_159.referencia=importes.mfim59_referdoc AND mi_159.secuencia=importes.mfim59_secuen)
        LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_tipo_importe tipo_importe ON (tipo_importe.cod_tipo_importe=importes.mfim59_tipo)
        CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
        LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_tipos_periodo tipos_periodo ON (tipos_periodo.cod_tipo_periodo=consumos.mfco59_periodo)
      ) CONSUMOS
    ) u


GO

