--if(row_number() over (partition by id_expediente_z3 order by id_deuda)=1,exp_z3.importe_liquid_principal,0) importe_liquidacion_principal,


--if(row_number() over (partition by id_documento,secuencia,id_tipo_importe,id_tipo_periodo order by id_tipo_periodo)=1,exp_z3.importe_liquid_principal,0) importe_liquidacion_principal,

--drop table @@norm.mi_ds_159_consumo_energia_electrica
CREATE OR alter TABLE @@norm.mi_ds_159_consumo_energia_electrica(
	#id_mi_ds_159		    	int IDENTITY(1,1),

--datos DECLARANTE	
	id_documento					int NOT NULL REFERENCES @@norm.documentos,
	id_expediente					int NOT NULL REFERENCES @@norm.expedientes,
	ejercicio						smallint,
	modelo 							varchar(3),   
	administracion_declarante		varchar(1),
	es_externo_declarante			bit,
	nif_declarante_159				varchar(11),
	nif_declarante_no_identificado  varchar(11),

	es_contribuyente_declarante		bit,  -- incluye el contribuyente indefinido
	id_contribuyente_declarante		int REFERENCES @@norm.contribuyentes(id_contribuyente),
	
	es_identificado_declarante		bit ,
	sw_identificado_declarante  	varchar(1),   ----***** 0,1,2,3 
	
	telefono					varchar(10),
	razon_social				varchar(40),
	
	cod_presentador_colectivo	int,		--Presentador Colectivo parece que debería ser JOIN con la tabla PRES_AF, no está importada
	cod_banco_espania			varchar(4),	--Parece un código, no está en la documentación
	id_tipo_presentacion		int NOT NULL REFERENCES @@norm.mi_tipo_presentacion,	--S=Soporte, P=Papel F=PDF, H=Telemática >50.000 regs, I=Internet, T=Editran
	fecha_presentacion			date,
	mes_presentacion			int,
	anyo_presentacion 			int ,
	num_caja					varchar(8),
	--fec_alta_mf					date,
	num_justificante			numeric(13),
	id_tipo_declaracion			int NOT NULL REFERENCES @@norm.mi_tipo_declaracion,  ----Complementaria, sustitutiva
	contador_revisiones			int,
	regimen_fiscal_deducciones	varchar(1),	--Parece un código, no está en la documentación, '', 0, 1, 2, 3, 4, 5
	--num_declarados				int,   --CALCULADO !!!
		
--datos DECLARADO	
	administracion_declarado	varchar(1),
	es_externo_declarado		bit,
	secuencia 					varchar(9),
	nif_declarado_159			varchar(11),
	nif_declarado_no_identificado  varchar(11),
	es_contribuyente_declarado		bit,
	id_contribuyente_declarado  	int REFERENCES @@norm.contribuyentes(id_contribuyente),
	--nivel_dentificacion	varchar(1) NOT NULL,
	--nivel_error     		varchar(1) NOT NULL,
    es_identificado_declarado	bit, --1=Identif 0=No identif
	sw_identificado_declarado   varchar(1),
	es_erroneo_declarado					bit, --1=Erróneo 0=Correcto	

	--tipo_codigo     		varchar(1) NOT NULL,
	id_clave_tipo_codigo	int NOT NULL REFERENCES @@norm.MI_clave_tipo_codigo, --C: C.C.C., O: Otra identificación, para el 159-->A: C.C.C., O: Otra identificación
	
	codigo_iban				varchar(4) NOT NULL,
    codigo_entidad			varchar(4) NOT NULL,
	codigo_sucursal   		varchar(4) NOT NULL,
	digito_control    		varchar(2) NOT NULL,
	codigo_cuenta	  		varchar(10) NOT NULL,
	
	pais_residencia         	varchar(2) NOT NULL,
	identificacion_extranjero  	varchar(15) NOT NULL,
	contrato_suministro        	varchar(12) NOT NULL,
	codigo_pais            		varchar(2) NOT NULL,
	distribuidora              	varchar(4) NOT NULL,
	numero_libre_asignacion    	varchar(12) NOT NULL,
	cups_digito_control         varchar(2) NOT NULL, --Código Universal del Punto de Suministro(CUPS),
	punto_medida            	varchar(1) NOT NULL,
	punto_suministro        	varchar(1) NOT NULL,
	tipo_bien               	varchar(1) NOT NULL,
	situacion_inmueble     		varchar(1) NOT NULL,
	referencia_catastral       	varchar(20) NOT NULL,
	fecha_alta_contrato     	date NOT NULL,
	fecha_baja_contrato     	date NOT NULL,
	unidad_medida_consumo      	varchar(1) NOT NULL, --K Kwh,M Megawh,G Gigawh,T Terawh (orden foral)
	unidad_medida_potencia     	varchar(1) NOT NULL,
	potencia_maxima_contratada 	varchar(6) NOT NULL,

	--Importes--
	id_tipo_importe				int NOT NULL REFERENCES @@norm.MI_tipo_importe, --01=Importe donativo, aportación o disposición
	importe				    	numeric(18,2),
	
	--Consumos--
	--periodo_facturado  	varchar(2) NOT NULL,
	id_tipo_periodo int NOT NULL REFERENCES @@norm.tipos_periodo,

	consumo_facturado  	decimal(4, 0) NULL,
	tipo_lectura       	varchar(1) NULL,		--R: real E:estimada
	    
	--Domicilios--
	tipo_direccion			varchar(1) NOT NULL,
	orden					int NOT NULL,
	num_puente_domicilio	varchar(11) NOT NULL,

	tipo_via	varchar(5) NULL,
	nombre_via	varchar(50) NULL,
	tipo_numero	varchar(3) NULL,
	numero_casa	varchar(5) NULL,
	calificador_numero	varchar(3) NULL,
	bloque	varchar(3) NULL,
	portal	varchar(3) NULL,
	escalera	varchar(3) NULL,
	piso	varchar(3) NULL,
	puerta	varchar(3) NULL,
	complemento	varchar(40) NULL,
	localidad	varchar(30) NULL,
	municipio	varchar(30) NULL,
	--codigo_municipio	varchar(5) NULL,
	id_municipio			int REFERENCES @@norm.municipios,
	--codigo_provincia	varchar(2) NULL,
	id_provincia			int REFERENCES @@norm.provincias,
	codigo_postal	varchar(5) NULL,

	--Representantes--
	nif_representante		varchar(11) NULL,
	forma_juridica			varchar(1) NULL,
	letra_nif_representante	varchar(1) NULL,
	fecha_alta				date NULL,
	fecha_modificacion		date NULL,
	sw_baja					varchar(1) NULL,
	num_puente_representante	varchar(11) NOT NULL,

	fec_alta						datetime,
	fec_modificacion				datetime,
	fec_baja						datetime,
	CONSTRAINT uk_ds_mod159 UNIQUE (id_documento,secuencia,id_tipo_importe,id_tipo_periodo)
)


CREATE OR REPLACE PROCEDURE @@proc.cargar_mi_ds_159_consumo_energia_electrica(@logpadre int)
LOAD @@norm.mi_ds_159_consumo_energia_electrica with SCD1
select 
	doc.id_documento   							#id_documento,
	
---------------------------
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

---------------------------
	--Importes--
	coalesce(tipo_importe.id_tipo_importe,indefinidos.id_tipo_importe) #id_tipo_importe, --mfim59_tipo
	round(importes.mfim59_importe/100,2) 				importe,
	
	--if(row_number() over (partition by id_documento,secuencia,id_tipo_importe,id_tipo_periodo order by id_tipo_periodo)=1,round(importes.mfim59_importe/100,2) ,0) importe,
	--Column 'dbn1_stg_dhyf_u.dbo.tbn1im59_mf.mfim59_importe' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.

---------------------------
	--Consumos--
	--consumos.mfco59_periodo 	#periodo_facturado,
	coalesce(tipos_periodo.id_tipo_periodo,indefinidos.id_tipo_periodo)	#id_tipo_periodo,    
	consumos.mfco59_con_fact 	consumo_facturado,  
	consumos.mfco59_con_tipo 	tipo_lectura, 
	
	    
---------------------------
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
	
---------------------------
	--Representantes--
	repre.sdrepr_nifrp 	nif_representante,
	repre.sdrepr_fjuri 	forma_juridica,
	repre.sdrepr_letra 	letra_nif_representante,
	repre.sdrepr_falta 	fecha_alta,
	repre.sdrepr_fmodi 	fecha_modificacion,
	repre.sdrepr_baja 	sw_baja,
	repre.sdrepr_nropte	num_puente_representante   --??


from @@stg.pe59_mf declarado  
inner join @@stg.im59_mf importes on declarado.mfpe59_ejercicio=importes.mfim59_ejercicio
								 and declarado.mfpe59_admon=importes.mfim59_admon
								 and declarado.mfpe59_referdoc=importes.mfim59_referdoc
								 and declarado.mfpe59_secuen=importes.mfim59_secuen
inner join @@stg.cabe_mf filter (cabe_modelo='159') cabe on cabe.cabe_ejercicio = declarado.mfpe59_ejercicio and cabe.cabe_referdoc= declarado.mfpe59_referdoc 						 

inner join @@stg.co59_mf consumos on declarado.mfpe59_ejercicio=consumos.mfco59_ejercicio
								 and declarado.mfpe59_admon=consumos.mfco59_admon
								 and declarado.mfpe59_referdoc=consumos.mfco59_referdoc 
								 and declarado.mfpe59_secuen=consumos.mfco59_secuen
								 
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
								 							 
inner join @@norm.documentos doc on doc.referencia=cast(declarado.mfpe59_ejercicio as varchar)+ 'I<' + cast(declarado.mfpe59_referdoc as varchar) + '00K0000' 
inner join @@norm.expedientes e on doc.id_expediente=e.id_expediente 
left  join @@norm.contribuyentes c_declarante on cabe.cabe_cifdecl=c_declarante.nif_maestro and c_declarante.fec_fin_vigencia="21000101"
left  join @@norm.contribuyentes c_declarado on declarado.mfpe59_cif=c_declarado.nif_maestro and c_declarado.fec_fin_vigencia="21000101"
left  join @@norm.mi_tipo_presentacion tipo_pres on tipo_pres.cod_tipo_presentacion=cabe.cabe_tiposoporte
left  join @@norm.mi_tipo_declaracion tipo_declaracion on tipo_declaracion.cod_tipo_declaracion=cabe.cabe_tipodecl
left  join @@norm.mi_tipo_importe tipo_importe on tipo_importe.cod_tipo_importe=importes.mfim59_tipo
left  join @@norm.mi_clave_tipo_codigo clave_tipo_codigo on clave_tipo_codigo.cod_clave_tipo_codigo=declarado.mfpe59_tipo_codigo
left  join @@norm.provincias provincia on provincia.cod_provincia=domicilio.sddomi_cdgo_prov
left  join @@norm.municipios municipio on municipio.cod_municipio=domicilio.sddomi_cdgo_mun
left  join @@norm.tipos_periodo tipos_periodo on tipos_periodo.cod_tipo_periodo=consumos.mfco59_periodo
cross join @@norm.indefinidos indefinidos
--CHECK SNOWFLAKE
--where cabe.cabe_modelo='159'   
group by all

