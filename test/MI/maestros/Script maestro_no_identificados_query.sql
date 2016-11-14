PRINT 'Script maestro_no_identificados_query.sql'
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='fnn1_query_carga_maestro_no_identificados' AND ROUTINE_TYPE='FUNCTION')
DROP FUNCTION dbo.fnn1_query_carga_maestro_no_identificados;
GO

CREATE FUNCTION fnn1_query_carga_maestro_no_identificados() RETURNS TABLE AS RETURN

------------Query------------

SELECT	detaapli			AS aplicacion,
		detaejer			AS ejercicio,
		detaclavagru		AS clavagru,
		case
		   when detamodel in ('100','UFM') then   ltrim(rtrim(detaclavdeta))
		   else RIGHT('0000000000000' +  LTRIM(RTRIM(detaclavdeta)), 13)
		end  AS clavdeta,    

		detamodel			AS detamodel,
		detaperio			AS detaperio,
		detadpto			AS detadpto,
		detaadmi			AS detaadmi,
		detaprov			AS detaprov,
		idampl_telefono		AS telefono,
		idampl_email		AS email,
		idampl_refcat		AS refcat,
		idampl_claveop		AS claveoperacion,
		idampl_subclaveop	AS subclaveoperacion,
		SUBSTRING(idampl_nif_represe,1,9)+' '+SUBSTRING(idampl_nif_represe,10,2)	AS nif_representante,
		idampl_importe		AS importe,
		SUBSTRING(detanif,1,9)+' '+SUBSTRING(detanif,10,2)				AS nif,
		detachec			AS chec,
		detaforjur			AS forjur,
		detatipnif			AS tipo_nif,
		detaanagr			AS anagrama,
		detarazsoc			AS razon_social,
		detasigcal			AS sigcal,
		detanomcal			AS nomcal,
		detaporcal			AS porcal,
		detaporbis			AS porbis,
		detaelemen			AS elemen,
		detaclamun			AS clamun,
		detanommun			AS nommun,
		detacodpos			AS codigo_postal,
		detanomprov			AS nombre_provincia,
		detafeident			AS feident,
		detafecnac			AS fecha_nacimiento,
		detanumcuenta		AS num_cuenta,
		detaapellido1		AS apellido1,
		detaapellido2		AS apellido2,
		detanombrepila		AS nombrepila
FROM	dbn1_stg_dhyf.dbo.tbn1deta_id det
		LEFT JOIN	dbn1_stg_dhyf.dbo.tbn1ampl_id amp
				ON	det.detaejer		= amp.idampl_ejer
				AND	det.detaapli		= amp.idampl_apli
				AND	det.detaclavagru	= amp.idampl_clavagru
				AND	det.detaclavdeta	= amp.idampl_clavdeta
WHERE	detamodel IN(
					'170','171','189','198','199', --iteracion 1
					'181','781','346','720','192', --iteracion 2
					'184','270','296' --iteracion 3
				   ,'100','UFM') --IRPF

UNION ALL

SELECT	detdapli			AS aplicacion,
		detdejer			AS ejercicio,
		detdclavagru		AS clavagru,
		RIGHT('0000000000000' +  LTRIM(RTRIM(detdclavdeta)), 13) AS clavdeta,
		detdmodel			AS detamodel,
		detdperio			AS detaperio,
		detddpto			AS detadpto,
		detdadmi			AS detaadmi,
		detdprov			AS detaprov,
		idampl_telefono		AS telefono,
		idampl_email		AS email,
		idampl_refcat		AS refcat,
		idampl_claveop		AS claveoperacion,
		idampl_subclaveop	AS subclaveoperacion,
		SUBSTRING(idampl_nif_represe,1,9)+' '+SUBSTRING(idampl_nif_represe,10,2)	AS nif_representante,
		idampl_importe		AS importe,
		SUBSTRING(detdnif,1,9)+' '+SUBSTRING(detdnif,10,2)				AS nif,
		detdchec			AS chec,
		detdforjur			AS forjur,
		detdtipnif			AS tipo_nif,
		detdanagr			AS anagrama,
		detdrazsoc			AS razon_social,
		detdsigcal			AS sigcal,
		detdnomcal			AS nomcal,
		detdporcal			AS porcal,
		detdporbis			AS porbis,
		detdelemen			AS elemen,
		detdclamun			AS clamun,
		detdnommun			AS nommun,
		detdcodpos			AS codigo_postal,
		detdnomprov			AS nombre_provincia,
		detdfeident			AS feident,
		detdfecnac			AS fecha_nacimiento,
		detdnumcuenta		AS num_cuenta,
		detdapellido1		AS apellido1,
		detdapellido2		AS apellido2,
		detdnombrepila		AS nombrepila
FROM	dbn1_stg_dhyf.dbo.tbn1detd_id detd
		LEFT JOIN	dbn1_stg_dhyf.dbo.tbn1ampl_id amp
				ON	detd.detdejer		= amp.idampl_ejer
				AND	detd.detdapli		= amp.idampl_apli
				AND	detd.detdclavagru	= amp.idampl_clavagru
				AND	detd.detdclavdeta	= amp.idampl_clavdeta
WHERE	detdmodel = '159'

GO