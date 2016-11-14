--SELECT top 24 * FROM @@stgv.mi_ds_159_importes_consumos where id_documento = 11540543 and id_tipo_periodo is not null
--SELECT top 24 * FROM @@stgv.mi_ds_159_importes_consumos where id_documento = 11540543 and importe is not null

CREATE OR REPLACE VIEW @@stgv.mi_ds_159_importes_consumos
COMBINE WITH UNION ALL

IMPORTES(

select
	doc.id_documento   				#id_documento,

	--datos DECLARANTE--
	e.id_expediente					id_expediente,
	cabe.cabe_ejercicio				ejercicio,
	coalesce(cabe.cabe_modelo,'')	modelo,
	coalesce(cabe.cabe_admon,'')	administracion_declarante,
	IF(cabe.cabe_admon<>'B',1,0) 	es_externo_declarante,
	
	coalesce(cabe.cabe_cifdecl, '')	nif_declarante_159,

	----0, identificado y está en maestro contribuyentes;  1 
	----1, marcado como no identificado en host; 
	----2 no marcado como no identificado en host, pero no tenemos nif en contribuyentes
      --identificado en host, no tenemos nif en contribuyentes
	
	IF(c_declarante.id_contribuyente is not null,1,0) es_contribuyente_declarante, -- se tiene en cuenta el contribuyente 'Indefinido'
	coalesce(c_declarante.id_contribuyente,indefinidos.id_contribuyente) id_contribuyente_declarante,
	IF(cabe.cabe_identif =1,1,0)	es_identificado_declarante, 

	CASE 
    	WHEN es_identificado_declarante=1 AND es_contribuyente_declarante=1 THEN 0
		WHEN es_identificado_declarante=0 THEN 1
		WHEN es_identificado_declarante=1 AND es_contribuyente_declarante=0 THEN 2
    	ELSE ''
  	END  sw_identificado_declarante,
		
	CASE 
    	WHEN es_identificado_declarante = 0 THEN coalesce(cabe.cabe_cifdecl,'')
    	ELSE ''
  	END  nif_declarante_no_identificado,
  
	coalesce(cabe.cabe_telefono,'')		telefono,
	coalesce(cabe.cabe_persona,'')		razon_social,
	
	coalesce(cabe.cabe_refpres,'')		cod_presentador_colectivo,
	coalesce(cabe.cabe_banco,'')		cod_banco_espania,
	coalesce(tipo_pres.id_tipo_presentacion,indefinidos.id_tipo_presentacion) id_tipo_presentacion,
	if(cabe.cabe_fecpres<>'0001-01-01',cabe.cabe_fecpres)   #fecha_presentacion,
	month(cabe.cabe_fecpres)   mes_presentacion,
	year(cabe.cabe_fecpres)    anyo_presentacion,
	cabe.cabe_numcaja	num_caja,
	--cabe.cabe_fecalta	fec_alta_mf,
	cabe.cabe_justif	num_justificante,
	coalesce(tipo_declaracion.id_tipo_declaracion,indefinidos.id_tipo_declaracion) id_tipo_declaracion,
	cabe.cabe_crevi		contador_revisiones,
	cabe.cabe_regfiscal	regimen_fiscal_deducciones,
	--cabe.cabe_nroreg	num_declarados,  --CALCULADO !!!
	
---------------------------
	--datos DECLARADO--	
	coalesce(declarado.mfpe59_admon,'')			administracion_declarado,
	IF(declarado.mfpe59_admon<>'B',1,0)         es_externo_declarado,
	cast(declarado.mfpe59_secuen as varchar)	#secuencia,
	
	coalesce(declarado.mfpe59_cif, '') nif_declarado_159,
	
	IF(c_declarado.id_contribuyente is not null,1,0)  	es_contribuyente_declarado,
	coalesce(c_declarado.id_contribuyente,indefinidos.id_contribuyente) id_contribuyente_declarado,
	
	IF(declarado.mfpe59_identif=1,1,0)	es_identificado_declarado, 
	
			 
	CASE 
    	WHEN es_identificado_declarado=1 AND es_contribuyente_declarado=1 THEN 0
		WHEN es_identificado_declarado=0 THEN 1
		WHEN es_identificado_declarado=1 AND es_contribuyente_declarado=0 THEN 2
    	ELSE ''
  	END  sw_identificado_declarado,
	
	CASE 
    	WHEN es_identificado_declarado=0 THEN coalesce(declarado.mfpe59_cif,'')
  	END  nif_declarado_no_identificado,
	
	IF(declarado.mfpe59_error=1,1,0)			es_erroneo_declarado,
	
	--declarado.mfpe59_tipo_codigo 	tipo_codigo,    --'', A, O, -- en @@norm.mi_clave_tipo_codigo no existe el valos 'A', solamente: '', C, O
    coalesce(clave_tipo_codigo.id_clave_tipo_codigo,indefinidos.id_clave_tipo_codigo) id_clave_tipo_codigo,
	  
	coalesce(declarado.mfpe59_iban,'') 			codigo_iban,
	coalesce(declarado.mfpe59_ccc_banco,'') 	codigo_entidad,    
	coalesce(declarado.mfpe59_ccc_sucur,'') 	codigo_sucursal,   
	coalesce(declarado.mfpe59_ccc_dc,'') 		digito_control,    
	coalesce(declarado.mfpe59_ccc_cuenta,'') 	codigo_cuenta,
	         
	declarado.mfpe59_cie_pais 		pais_residencia,         
	declarado.mfpe59_cie_codigo 	identificacion_extranjero,  
	declarado.mfpe59_contrato 		contrato_suministro,        
	declarado.mfpe59_cups_pais 		codigo_pais,            
	declarado.mfpe59_cups_dist 		distribuidora,              
	declarado.mfpe59_cups_libre 	numero_libre_asignacion,    
	declarado.mfpe59_cups_dc 		cups_digito_control,             
	declarado.mfpe59_cups_medida 		punto_medida,            
	declarado.mfpe59_cups_suministro 	punto_suministro,        
	declarado.mfpe59_tipo_bien 		tipo_bien,               
	declarado.mfpe59_situacion 		situacion_inmueble,     
	declarado.mfpe59_refcat 		referencia_catastral,       
	declarado.mfpe59_fecalta 		fecha_alta_contrato,     
	declarado.mfpe59_fecbaja 		fecha_baja_contrato,     
	declarado.mfpe59_unidad_medida 	unidad_medida_consumo,      
	declarado.mfpe59_pot_unidad 	unidad_medida_potencia,     
	declarado.mfpe59_pot_maxima 	potencia_maxima_contratada,

	--Domicilios--
	domicilio.sddomi_tipo			tipo_direccion,  -- I=inmueble D=domicilio
	domicilio.sddomi_orden			orden,
	domicilio.sddomi_nropte			num_puente_domicilio, --??

	domicilio.sddomi_tipo_via		tipo_via,
	domicilio.sddomi_nombre_via		nombre_via,
	domicilio.sddomi_tipo_numero	tipo_numero,
	domicilio.sddomi_numero_casa	numero_casa,
	domicilio.sddomi_calificador	calificador_numero,
	domicilio.sddomi_bloque			bloque,
	domicilio.sddomi_portal			portal,
	domicilio.sddomi_escalera		escalera,
	domicilio.sddomi_piso			piso,
	domicilio.sddomi_puerta			puerta,
	domicilio.sddomi_complemento	complemento,
	domicilio.sddomi_localidad		localidad,
	domicilio.sddomi_municipio		municipio,
	--domicilio.sddomi_cdgo_mun		codigo_municipio,	
	coalesce(municipio.id_municipio,indefinidos.id_municipio)	id_municipio,
	--domicilio.sddomi_cdgo_prov	codigo_provincia,	
	coalesce(provincia.id_provincia,indefinidos.id_provincia)	id_provincia,
	domicilio.sddomi_cdgo_postal	codigo_postal,
	
	--Representantes--
	repre.sdrepr_nifrp 	nif_representante,
	repre.sdrepr_fjuri 	forma_juridica,
	repre.sdrepr_letra 	letra_nif_representante,
	repre.sdrepr_falta 	fecha_alta,
	repre.sdrepr_fmodi 	fecha_modificacion,
	repre.sdrepr_baja 	sw_baja,
	repre.sdrepr_nropte	num_puente_representante,   --??

	--Importes--
	coalesce(tipo_importe.id_tipo_importe,indefinidos.id_tipo_importe) #id_tipo_importe, --mfim59_tipo
	round(importes.mfim59_importe/100,2) 				importe
	--if(row_number() over (partition by id_documento,secuencia,id_tipo_importe,id_tipo_periodo order by id_tipo_periodo)=1,round(importes.mfim59_importe/100,2) ,0) importe
	--if(row_number() over (partition by id_documento,secuencia,id_tipo_importe order by id_tipo_importe)=1,round(importes.mfim59_importe/100,2) ,0) importe
	
	
from @@stg.pe59_mf declarado  
inner join @@stg.im59_mf importes on declarado.mfpe59_ejercicio=importes.mfim59_ejercicio
								 and declarado.mfpe59_admon=importes.mfim59_admon
								 and declarado.mfpe59_referdoc=importes.mfim59_referdoc
								 and declarado.mfpe59_secuen=importes.mfim59_secuen
inner join @@stg.cabe_mf filter (cabe_modelo='159') cabe on cabe.cabe_ejercicio = declarado.mfpe59_ejercicio and cabe.cabe_referdoc= declarado.mfpe59_referdoc 						 
inner join @@norm.documentos doc on doc.referencia=cast(declarado.mfpe59_ejercicio as varchar)+ 'I<' + cast(declarado.mfpe59_referdoc as varchar) + '00K0000' 
inner join @@norm.expedientes e on doc.id_expediente=e.id_expediente 
left  join @@norm.contribuyentes c_declarante on cabe.cabe_cifdecl=c_declarante.nif_maestro and c_declarante.fec_fin_vigencia="21000101"
left  join @@norm.contribuyentes c_declarado on declarado.mfpe59_cif=c_declarado.nif_maestro and c_declarado.fec_fin_vigencia="21000101"
left join  @@norm.mi_tipo_presentacion tipo_pres on tipo_pres.cod_tipo_presentacion=cabe.cabe_tiposoporte
left join  @@norm.mi_tipo_declaracion tipo_declaracion on tipo_declaracion.cod_tipo_declaracion=cabe.cabe_tipodecl
left join  @@norm.mi_tipo_importe tipo_importe on tipo_importe.cod_tipo_importe=importes.mfim59_tipo

left join @@norm.mi_clave_tipo_codigo clave_tipo_codigo on clave_tipo_codigo.cod_clave_tipo_codigo=declarado.mfpe59_tipo_codigo

left join @@stg.domi_sd filter (sddomi_modelo='159' and sddomi_cdgo_prov = '48')  
								 domicilio on declarado.mfpe59_ejercicio=domicilio.sddomi_ejercicio
								 and declarado.mfpe59_admon=domicilio.sddomi_admon
								 and declarado.mfpe59_referdoc=domicilio.sddomi_referdoc 
								 and declarado.mfpe59_secuen=domicilio.sddomi_secuen

left join @@stg.repr_sd filter (sdrepr_model='159') 
								 repre on declarado.mfpe59_ejercicio=repre.sdrepr_ejerc 
								 and declarado.mfpe59_admon=repre.sdrepr_admon
								 and declarado.mfpe59_referdoc=cast(repre.sdrepr_refer as varchar)
								 and declarado.mfpe59_secuen=repre.sdrepr_secue

left  join @@norm.provincias provincia on provincia.cod_provincia=domicilio.sddomi_cdgo_prov
left  join @@norm.municipios municipio on municipio.cod_municipio=domicilio.sddomi_cdgo_mun
cross join @@norm.indefinidos indefinidos
--CHECK SNOWFLAKE
--where cabe.cabe_modelo='159'   
group by all

)
CONSUMOS(
select 	
	doc.id_documento   							#id_documento,
	cast(declarado.mfpe59_secuen as varchar)	#secuencia,
    coalesce(tipo_importe.id_tipo_importe,indefinidos.id_tipo_importe) #id_tipo_importe, 
	
	--Consumos--
	--consumos.mfco59_periodo 	#periodo_facturado,
	coalesce(tipos_periodo.id_tipo_periodo,indefinidos.id_tipo_periodo)	id_tipo_periodo,  
	consumos.mfco59_con_fact 	consumo_facturado,  
	consumos.mfco59_con_tipo 	tipo_lectura
	
	
from @@stg.pe59_mf declarado  
inner join @@stg.co59_mf consumos on declarado.mfpe59_ejercicio=consumos.mfco59_ejercicio
								 and declarado.mfpe59_admon=consumos.mfco59_admon
								 and declarado.mfpe59_referdoc=consumos.mfco59_referdoc 
								 and declarado.mfpe59_secuen=consumos.mfco59_secuen
								 
-- join @@stg.cabe_mf filter (cabe_modelo='159') cabe on cabe.cabe_ejercicio = declarado.mfpe59_ejercicio and cabe.cabe_referdoc= declarado.mfpe59_referdoc 						 
inner join @@norm.documentos doc on doc.referencia=cast(declarado.mfpe59_ejercicio as varchar)+ 'I<' + cast(declarado.mfpe59_referdoc as varchar) + '00K0000' 

inner join @@stg.im59_mf importes on declarado.mfpe59_ejercicio=importes.mfim59_ejercicio
								 and declarado.mfpe59_admon=importes.mfim59_admon
								 and declarado.mfpe59_referdoc=importes.mfim59_referdoc
								 and declarado.mfpe59_secuen=importes.mfim59_secuen
left  join @@norm.mi_tipo_importe tipo_importe on tipo_importe.cod_tipo_importe=importes.mfim59_tipo
left  join @@norm.tipos_periodo tipos_periodo on tipos_periodo.cod_tipo_periodo=consumos.mfco59_periodo
cross join @@norm.indefinidos indefinidos
  
group by all
)





