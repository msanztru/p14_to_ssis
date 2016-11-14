PRINT 'Script normalizado_mi_ds_198_activos_financieros_query_ds.sql'
GO


SET QUOTED_IDENTIFIER ON;
GO



USE dbn1_stg_dhyf
GO
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='fnn1_query_carga_ds_mi_ds_198_activos_financieros_f_id_documento' AND ROUTINE_TYPE='FUNCTION')
DROP FUNCTION dbo.fnn1_query_carga_ds_mi_ds_198_activos_financieros_f_id_documento;
GO

CREATE FUNCTION fnn1_query_carga_ds_mi_ds_198_activos_financieros_f_id_documento(@logpadre int) RETURNS TABLE AS RETURN

------------Query------------

select id_documento, referencia, id_expediente from dbn1_norm_dhyf.dbo.tbn1_documentos doc
where  doc.fec_documento > dateadd(day,-30,getdate())
union
select id_documento, referencia, id_expediente from dbn1_norm_dhyf.dbo.tbn1_documentos doc
where @logpadre = 2

------------Query------------

GO


USE dbn1_stg_dhyf
GO
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='fnn1_query_carga_ds_mi_ds_198_activos_financieros' AND ROUTINE_TYPE='FUNCTION')
DROP FUNCTION dbo.fnn1_query_carga_ds_mi_ds_198_activos_financieros;
GO

CREATE FUNCTION fnn1_query_carga_ds_mi_ds_198_activos_financieros(@logpadre int) RETURNS TABLE AS RETURN

------------Query------------

--select top 10000 * from
select * from

(
SELECT
  id_documento ,
  id_expediente ,
  cabe.ejercicio as ejercicio ,
  cabe.referencia as referencia,
  secuencia ,
  modelo ,
  nif_declarante_198_11 ,
  nif_declarado_198_11 ,
  nif_declarante_no_identificado_11 ,
  nif_declarado_no_identificado_11 ,
  nif_declarante_198 ,
  nif_declarado_198 ,
  nif_declarante_no_identificado ,
  nif_declarado_no_identificado,
  es_contribuyente_declarante ,
  es_externo,
  id_contribuyente_declarante ,
  es_contribuyente_declarado,
  id_contribuyente_declarado ,
  delegacion_hacienda,
  cod_administracion,
  telefono ,
  razon_social,
  cod_presentador_colectivo,
  es_identificado_declarante ,
  sw_identificado_declarante ,
  cod_entidad_gestora ,
  cod_tipo_presentacion ,
  fecha_presentacion,
  mes_presentacion,
  anyo_presentacion,
  num_caja,
  es_erroneo_declarante,
  num_declarados_erroneos,
  hay_observaciones,
  es_historico,
  fecha_alta,
  volumen_operaciones,
  num_justificante,
  cod_tipo_declaracion,
  num_justificante_sustitutiva,
  contador_revisiones,
  es_representante,
  cod_provincia,
  cod_pais,
  num_perceptores,
  nro_orden,
  cod_tipo_codigo,
  banco,
  sucursal,
  num_cuenta,
  fecha_operacion,
  mes_operacion,
  anyo_operacion,
  cod_clave_identificacion_fondo,
  emisor,
  cod_clave_origen,
  cod_clave_operacion_198,
  cod_clave_mercado,
  id_clave_representacion,
  cod_clave_valor,
  num_activos,
  porc_participacion,
  cod_clave_declarado,
  cod_relacion,
  es_identificado_declarado,
  sw_identificado_declarado,
  es_erroneo_declarado,
  fecha_vcto_prestamo,
  mes_vencimiento_prestamo,
  anyo_vencimiento_prestamo,
  coalesce(im80tipo,'') AS cod_tipo_importe,
  round(importes.im80importe/100,2) AS importe,
  id_mae_no_id_declarante ,
  id_mae_no_id_declarado,
  fecha_carga

    FROM
    (
    select
        0 as es_externo,
        da80ejercicio AS ejercicio,
        da80referdoc AS referencia,
        coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado,
        CAST(da80secuen AS varchar) AS secuencia,
        coalesce(d.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarado,
        declarado.da80provin AS cod_provincia,
        declarado.da80pais AS cod_pais,
        declarado.da80cltipo AS cod_tipo_codigo,
        declarado.da80clcodigo AS cod_clave_identificacion_fondo,
        declarado.da80clorigen AS cod_clave_origen,
        declarado.da80cloperacion AS cod_clave_operacion_198,
        declarado.da80clmercado AS cod_clave_mercado,
        coalesce(repre.id_clave_representacion,indefinidos.id_clave_representacion) AS id_clave_representacion,
        declarado.da80clvalor AS cod_clave_valor,
        declarado.da80cldeclarado AS cod_clave_declarado,
        declarado.da80fechaoper AS fecha_operacion,
        month(declarado.da80fechaoper) AS mes_operacion,
        year(declarado.da80fechaoper) AS anyo_operacion,
        CASE
          WHEN declarado.da80fechavcto<>'0001-01-01' THEN declarado.da80fechavcto
          ELSE CAST('21000101' AS date)
        END AS fecha_vcto_prestamo,
        month(CASE
          WHEN declarado.da80fechavcto<>'0001-01-01' THEN declarado.da80fechavcto
          ELSE CAST('21000101' AS date)
        END) AS mes_vencimiento_prestamo,
        year(CASE
          WHEN declarado.da80fechavcto<>'0001-01-01' THEN declarado.da80fechavcto
          ELSE CAST('21000101' AS date)
        END) AS anyo_vencimiento_prestamo,
        coalesce(declarado.da80cif,'') AS nif_declarado_198_11,
        CASE WHEN da80identif=1 THEN 1 ELSE 0 END AS es_identificado_declarado,
        CASE
          WHEN CASE WHEN da80identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
          WHEN CASE WHEN da80identif=1 THEN 1 ELSE 0 END=0 THEN 1
          WHEN CASE WHEN da80identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
          ELSE ''
        END AS sw_identificado_declarado,
        CASE WHEN CASE WHEN da80identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.da80cif,'') ELSE '' END AS nif_declarado_no_identificado_11,
         coalesce(left(coalesce(declarado.da80cif,''),9)+' '+right(coalesce(declarado.da80cif,''),2),'') AS nif_declarado_198,
        coalesce(left(CASE WHEN CASE WHEN da80identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.da80cif,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN da80identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.da80cif,'') ELSE '' END,2),'') AS nif_declarado_no_identificado,
        CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarado,
        coalesce(da80emisor,'') AS emisor,
        coalesce(da80represen,'') AS es_representante,
        da80nrodecl AS num_perceptores,
        da80nroorden AS nro_orden,
        coalesce(da80banco,'') AS banco,
        coalesce(da80sucursal,'') AS sucursal,
        coalesce(da80nrocuenta,'') AS num_cuenta,
        da80nroactivos/100 AS num_activos,
        da80porcen/100 AS porc_participacion,
        coalesce(da80codrelacion,'') AS cod_relacion,
        CASE WHEN da80error=1 THEN 1 ELSE 0 END AS es_erroneo_declarado,
        da80ejercicio ,
        da80referdoc
     from dbn1_stg_dhyf.dbo.tbn180da_af declarado
        --no_identificados_declarado
        LEFT JOIN (SELECT id_mae_no_identificados, ejercicio, clavagru, clavdeta  FROM   dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados WHERE  aplicacion = 'AF' AND detamodel = '198' ) mae_noid_det
                ON    da80ejercicio = mae_noid_det.ejercicio
                AND cast(da80referdoc as varchar) = mae_noid_det.clavagru
                AND right('0000000000000' +  cast(da80secuen  as varchar) , 13)=  mae_noid_det.clavdeta
     LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes d ON (declarado.da80cif=d.nif_maestro AND d.fec_fin_vigencia=CAST('21000101' AS date))
     LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion repre ON (repre.cod_clave_representacion=declarado.da80clrepres)
     CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
         ) declarado

    INNER JOIN
    (
    SELECT
      caejercicio AS ejercicio,
      coalesce(camodelo,'') AS modelo,
      coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante,
      careferdoc AS referencia,
      doc.id_documento AS id_documento,
      e.id_expediente AS id_expediente,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarante,
      coalesce('B',cabe.caadmonhaci) AS cod_administracion,
      cabe.catippres AS cod_tipo_presentacion,
      cabe.catipodecl AS cod_tipo_declaracion,
      cabe.cafecpres AS fecha_presentacion,
      month(cabe.cafecpres) AS mes_presentacion,
      year(cabe.cafecpres) AS anyo_presentacion,
      coalesce(cabe.cacifdecl,'') AS nif_declarante_198_11,
      CASE WHEN caidentif=1 THEN 1 ELSE 0 END AS es_identificado_declarante,
      CASE
          WHEN CASE WHEN caidentif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
          WHEN CASE WHEN caidentif=1 THEN 1 ELSE 0 END=0 THEN 1
          WHEN CASE WHEN caidentif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
          ELSE ''
      END AS sw_identificado_declarante,
      CASE WHEN CASE WHEN caidentif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cacifdecl,'') ELSE '' END AS nif_declarante_no_identificado_11,
      coalesce(left(coalesce(cabe.cacifdecl,''),9)+' '+right(coalesce(cabe.cacifdecl,''),2),'') AS nif_declarante_198,
      coalesce(left(CASE WHEN CASE WHEN caidentif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cacifdecl,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN caidentif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cacifdecl,'') ELSE '' END,2),'') AS nif_declarante_no_identificado,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarante,
      coalesce(cadh,'') AS delegacion_hacienda,
      coalesce(catelefono,'') AS telefono,
      coalesce(capersona,'') AS razon_social,
      caenlace AS cod_presentador_colectivo,
      coalesce(cacodentg,'') AS cod_entidad_gestora,
      coalesce(canumcaja,'') AS num_caja,
      CASE WHEN caerror=1 THEN 1 ELSE 0 END AS es_erroneo_declarante,
      caconterror AS num_declarados_erroneos,
      CASE WHEN cabe.caobserva<>'0' THEN 1 ELSE 0 END AS hay_observaciones,
      CASE WHEN cabe.cahistorico='1' THEN 1 ELSE 0 END AS es_historico,
      cafecalta AS fecha_alta,
      cavolumen AS volumen_operaciones,
      cajustif AS num_justificante,
      cajustifsus AS num_justificante_sustitutiva,
      cacrevi AS contador_revisiones,
     coalesce(cafecalta,CAST('21000101' AS datetime)) fecha_carga

    FROM (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1cabe_af WHERE camodelo='198') cabe
        --no_identificados_declarante
        LEFT JOIN (SELECT id_mae_no_identificados, ejercicio, clavagru, clavdeta  FROM   dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados WHERE  aplicacion = 'AF' AND detamodel = '198' ) mae_noid_cabe
                ON    cabe.caejercicio = mae_noid_cabe.ejercicio
                AND cast(cabe.careferdoc as varchar) = mae_noid_cabe.clavagru
                AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000'
        INNER JOIN fnn1_query_carga_ds_mi_ds_198_activos_financieros_f_id_documento(@logpadre) doc ON (doc.referencia=CAST(cabe.caejercicio AS varchar)+'D7'+CAST(cabe.careferdoc AS varchar)+'00K0000')
        INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
        LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (cabe.cacifdecl=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS date))
        CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
        ) cabe ON cabe.ejercicio=declarado.da80ejercicio AND cabe.referencia=declarado.da80referdoc

    INNER JOIN

            dbn1_stg_dhyf.dbo.tbn180im_af importes

            ON (declarado.ejercicio=importes.im80ejercicio AND declarado.referencia=importes.im80referdoc AND declarado.secuencia=importes.im80secuen)

--==============================================--

                    UNION ALL

--==============================================--

SELECT
  id_documento ,
  id_expediente ,
  cabe.ejercicio as ejercicio ,
  cabe.referencia as referencia,
  secuencia ,
  modelo ,
  nif_declarante_198_11 ,
  nif_declarado_198_11 ,
  nif_declarante_no_identificado_11 ,
  nif_declarado_no_identificado_11 ,
  nif_declarante_198 ,
  nif_declarado_198 ,
  nif_declarante_no_identificado ,
  nif_declarado_no_identificado,
  es_contribuyente_declarante ,
  es_externo,
  id_contribuyente_declarante ,
  es_contribuyente_declarado,
  id_contribuyente_declarado ,
  delegacion_hacienda,
  cabe.cod_administracion,
  telefono ,
  razon_social,
  cod_presentador_colectivo,
  es_identificado_declarante ,
  sw_identificado_declarante ,
  cod_entidad_gestora ,
  cod_tipo_presentacion ,
  fecha_presentacion,
  mes_presentacion,
  anyo_presentacion,
  num_caja,
  es_erroneo_declarante,
  num_declarados_erroneos,
  hay_observaciones,
  es_historico,
  fecha_alta,
  volumen_operaciones,
  num_justificante,
  cod_tipo_declaracion,
  num_justificante_sustitutiva,
  contador_revisiones,
  es_representante,
  cod_provincia,
  cod_pais,
  num_perceptores,
  nro_orden,
  cod_tipo_codigo,
  banco,
  sucursal,
  num_cuenta,
  fecha_operacion,
  mes_operacion,
  anyo_operacion,
  cod_clave_identificacion_fondo,
  emisor,
  cod_clave_origen,
  cod_clave_operacion_198,
  cod_clave_mercado,
  id_clave_representacion,
  cod_clave_valor,
  num_activos,
  porc_participacion,
  cod_clave_declarado,
  cod_relacion,
  es_identificado_declarado,
  sw_identificado_declarado,
  es_erroneo_declarado,
  fecha_vcto_prestamo,
  mes_vencimiento_prestamo,
  anyo_vencimiento_prestamo,
  coalesce(ix80tipo,'') AS cod_tipo_importe,
  round(importes.ix80importe/100,2) AS importe,
  id_mae_no_id_declarante ,
  id_mae_no_id_declarado,
  fecha_carga

    FROM
    (
    select
      1 as es_externo,
      px80ejercicio AS ejercicio,
      px80referdoc AS referencia,
      coalesce(mae_noid_det.id_mae_no_identificados,-1) id_mae_no_id_declarado,
      CAST(px80nropte AS varchar) AS secuencia,
      coalesce(d.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarado,
      declarado.px80provin AS cod_provincia,
      declarado.px80pais AS cod_pais,
      declarado.px80admon AS cod_administracion,
      declarado.px80cltipo AS cod_tipo_codigo,
      declarado.px80clcodigo AS cod_clave_identificacion_fondo,
      declarado.px80clorigen AS cod_clave_origen,
      declarado.px80cloperacion AS cod_clave_operacion_198,
      declarado.px80clmercado AS cod_clave_mercado,
      coalesce(repre.id_clave_representacion,indefinidos.id_clave_representacion) AS id_clave_representacion,
      declarado.px80clvalor AS cod_clave_valor,
      declarado.px80cldeclarado AS cod_clave_declarado,
      declarado.px80fechaoper AS fecha_operacion,
      month(declarado.px80fechaoper) AS mes_operacion,
      year(declarado.px80fechaoper) AS anyo_operacion,
      CASE
          WHEN declarado.px80fechavcto<>'0001-01-01' THEN declarado.px80fechavcto
          ELSE CAST('21000101' AS date)
      END AS fecha_vcto_prestamo,
      month(CASE
          WHEN declarado.px80fechavcto<>'0001-01-01' THEN declarado.px80fechavcto
          ELSE CAST('21000101' AS date)
      END) AS mes_vencimiento_prestamo,
      year(CASE
          WHEN declarado.px80fechavcto<>'0001-01-01' THEN declarado.px80fechavcto
          ELSE CAST('21000101' AS date)
      END) AS anyo_vencimiento_prestamo,
      coalesce(declarado.px80cif,'') AS nif_declarado_198_11,
      CASE WHEN px80identif=1 THEN 1 ELSE 0 END AS es_identificado_declarado,
      CASE
          WHEN CASE WHEN px80identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
          WHEN CASE WHEN px80identif=1 THEN 1 ELSE 0 END=0 THEN 1
          WHEN CASE WHEN px80identif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
          ELSE ''
      END AS sw_identificado_declarado,
      CASE WHEN CASE WHEN px80identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.px80cif,'') ELSE '' END AS nif_declarado_no_identificado_11,
      coalesce(left(coalesce(declarado.px80cif,''),9)+' '+right(coalesce(declarado.px80cif,''),2),'') AS nif_declarado_198,
      coalesce(left(CASE WHEN CASE WHEN px80identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.px80cif,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN px80identif=1 THEN 1 ELSE 0 END=0 THEN coalesce(declarado.px80cif,'') ELSE '' END,2),'') AS nif_declarado_no_identificado,
      CASE WHEN d.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarado,
      coalesce(px80emisor,'') AS emisor,
      coalesce(px80represen,'') AS es_representante,
      px80nrodecl AS num_perceptores,
      px80nroorden AS nro_orden,
      coalesce(px80banco,'') AS banco,
      coalesce(px80sucursal,'') AS sucursal,
      coalesce(px80nrocuenta,'') AS num_cuenta,
      px80nroactivos/100 AS num_activos,
      px80porcen/100 AS porc_participacion,
      coalesce(px80codrelacion,'') AS cod_relacion,
      CASE WHEN px80error=1 THEN 1 ELSE 0 END AS es_erroneo_declarado,
      px80ejercicio ,px80referdoc

     from dbn1_stg_dhyf.dbo.tbn18xpe_af declarado
        --no_identificados_declarado
        LEFT JOIN (SELECT id_mae_no_identificados, ejercicio, clavagru, clavdeta  FROM   dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados WHERE  aplicacion = 'AF' AND detamodel = '198' ) mae_noid_det
                ON    px80ejercicio = mae_noid_det.ejercicio
                AND cast(px80referdoc as varchar) = mae_noid_det.clavagru
                AND right('0000000000000' +  cast(px80nropte  as varchar) , 13)=  mae_noid_det.clavdeta
     LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes d ON (declarado.px80cif=d.nif_maestro AND d.fec_fin_vigencia=CAST('21000101' AS date))
     LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_mi_clave_representacion repre ON (repre.cod_clave_representacion=declarado.px80clrepres)
     CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos

     ) declarado

    INNER JOIN
    (
    SELECT
      cxejercicio AS ejercicio,
      coalesce(cxmodelo,'') AS modelo,
      coalesce(mae_noid_cabe.id_mae_no_identificados,-1) id_mae_no_id_declarante,
      cxreferdoc AS referencia,
      doc.id_documento AS id_documento,
      e.id_expediente AS id_expediente,
      coalesce(c.id_contribuyente,indefinidos.id_contribuyente) AS id_contribuyente_declarante,
      cabe.cxadmon AS cod_administracion,
      '' AS cod_tipo_presentacion,
      '' AS cod_tipo_declaracion,
      CAST('21000101' AS date) AS fecha_presentacion,
      month(CAST('21000101' AS date)) AS mes_presentacion,
      year(CAST('21000101' AS date)) AS anyo_presentacion,
      coalesce(cabe.cxcifdecl,'') AS nif_declarante_198_11,
      CASE WHEN cxidentif=1 THEN 1 ELSE 0 END AS es_identificado_declarante,
      CASE
          WHEN CASE WHEN cxidentif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=1 THEN 0
          WHEN CASE WHEN cxidentif=1 THEN 1 ELSE 0 END=0 THEN 1
          WHEN CASE WHEN cxidentif=1 THEN 1 ELSE 0 END=1 AND CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END=0 THEN 2
          ELSE ''
      END AS sw_identificado_declarante,
      CASE WHEN CASE WHEN cxidentif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cxcifdecl,'') ELSE '' END AS nif_declarante_no_identificado_11,
      coalesce(left(coalesce(cabe.cxcifdecl,''),9)+' '+right(coalesce(cabe.cxcifdecl,''),2),'') AS nif_declarante_198,
      coalesce(left(CASE WHEN CASE WHEN cxidentif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cxcifdecl,'') ELSE '' END,9)+' '+right(CASE WHEN CASE WHEN cxidentif=1 THEN 1 ELSE 0 END=0 THEN coalesce(cxcifdecl,'') ELSE '' END,2),'') AS nif_declarante_no_identificado,
      CASE WHEN c.id_contribuyente IS NOT NULL THEN 1 ELSE 0 END AS es_contribuyente_declarante,
      '' AS delegacion_hacienda,
      '' AS telefono,
      '' AS razon_social,
      0 AS cod_presentador_colectivo,
      '' AS cod_entidad_gestora,
      '' AS num_caja,
      CASE WHEN cxerror=1 THEN 1 ELSE 0 END AS es_erroneo_declarante,
      0 AS num_declarados_erroneos,
      0 AS hay_observaciones,
      0 AS es_historico,
      CAST('21000101' AS date) AS fecha_alta,
      0 AS volumen_operaciones,
      0 AS num_justificante,
      0 AS num_justificante_sustitutiva,
      0 AS contador_revisiones,
      coalesce(cxfecalta,CAST('21000101' AS datetime)) fecha_carga

    FROM (SELECT * FROM dbn1_stg_dhyf.dbo.tbn1i3ca_af  WHERE cxmodelo='198') cabe
        --no_identificados_declarante
        LEFT JOIN (SELECT id_mae_no_identificados, ejercicio, clavagru, clavdeta  FROM   dbn1_dmr_dhyf.dbo.tbn1_mae_no_identificados WHERE  aplicacion = 'AF' AND detamodel = '198' ) mae_noid_cabe
                ON    cabe.cxejercicio = mae_noid_cabe.ejercicio
                AND cast(cabe.cxreferdoc as varchar) = mae_noid_cabe.clavagru
                AND right('0000000000000' +  mae_noid_cabe.clavdeta, 13) = '0000000000000'
        INNER JOIN fnn1_query_carga_ds_mi_ds_198_activos_financieros_f_id_documento(@logpadre) doc ON (doc.referencia=CAST(cabe.cxejercicio AS varchar)+'D6'+CAST(cabe.cxreferdoc AS varchar)+'00K0000')
        INNER JOIN dbn1_norm_dhyf.dbo.tbn1_expedientes e ON (doc.id_expediente=e.id_expediente)
        LEFT JOIN dbn1_norm_dhyf.dbo.tbn1_contribuyentes c ON (cabe.cxcifdecl=c.nif_maestro AND c.fec_fin_vigencia=CAST('21000101' AS date))
        CROSS JOIN dbn1_norm_dhyf.dbo.tbn1_indefinidos indefinidos
    ) cabe ON cabe.ejercicio=declarado.px80ejercicio AND cabe.cod_administracion=declarado.cod_administracion AND cabe.referencia=declarado.referencia

    INNER JOIN

    dbn1_stg_dhyf.dbo.tbn18xim_af importes

    ON (declarado.ejercicio=importes.ix80ejercicio AND declarado.referencia=importes.ix80referdoc AND declarado.secuencia=importes.ix80nropte)

    ) result
------------Query------------

GO
