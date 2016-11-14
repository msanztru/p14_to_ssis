--IF EXISTS (
-- SELECT * FROM SYS.OBJECTS WHERE object_id=OBJECT_ID('dbo.fnn1_query_carga_mi_detalles_194') and type in (N'FN', N'IF', N'TF', N'FS', N'FT')
-- )
--DROP FUNCTION dbo.fnn1_query_carga_mi_detalles_194
--GO

--USE dbn1_stg_dhyf
--GO

--CREATE FUNCTION dbo.fnn1_query_carga_mi_detalles_194() 
--RETURNS @tabla TABLE (id_documento int, fec_documento date, fec_baja_documento date) 
--AS
--BEGIN
--	declare @f_desde date =datefromparts(year(Getdate())-1,1,1)
--	INSERT @tabla(id_documento,fec_documento,fec_baja_documento)	
--	SELECT	id_documento,
--			fec_documento,
--			fec_baja_documento
--	FROM	dbn1_norm_dhyf.dbo.tbn1_documentos
--	WHERE	fec_documento >= @f_desde
--			OR fec_baja_documento >= @f_desde
	

--	RETURN 
--END
--GO

IF EXISTS (
 SELECT * FROM SYS.OBJECTS WHERE object_id=OBJECT_ID('dbo.fnn1_query_carga_mi_documentos_194') and type in (N'FN', N'IF', N'TF', N'FS', N'FT')
 )
DROP FUNCTION dbo.fnn1_query_carga_mi_documentos_194
GO

USE dbn1_stg_dhyf
GO

CREATE FUNCTION dbo.fnn1_query_carga_mi_documentos_194() 
RETURNS @tabla TABLE (id_documento int, fec_documento date, fec_baja_documento date) 
AS
BEGIN
	declare @f_desde date =datefromparts(year(Getdate())-1,1,1)
	INSERT @tabla(id_documento,fec_documento,fec_baja_documento)	
	SELECT	id_documento,
			fec_documento,
			fec_baja_documento
	FROM	dbn1_norm_dhyf.dbo.tbn1_documentos
	WHERE	(fec_documento >= @f_desde
			OR fec_baja_documento >= @f_desde)
			AND cod_modelo = '194'
	RETURN 
END
GO
