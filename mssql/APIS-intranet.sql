-- DOCUMENTOS PROCESADOS - INVENTARIO
-- HOST: 192.168.0.33  /  BDX : SBO_KAYSER

SELECT TOP 500 /*DISTINCT */  U_GSP_CABOTI as cod_tienda, convert(varchar(10), U_GSP_CADATA,101) as fecha, U_GSP_ERROR as error
FROM [SBO_KAYSER].[dbo].[@GSP_TPVCAP]
WHERE U_GSP_CADOCU<>'VRG' AND U_GSP_CAESTA<>'x' AND convert(varchar(10), U_GSP_CADATA,101)<>convert(varchar(10), GETDATE(),101) 
		AND U_GSP_ERROR ${nulleable} AND U_GSP_CABOTI='${codStore}'
ORDER by U_GSP_CABOTI

-- LEYENDA:
	-- nullable : puede tomar valores 'IS NULL' o 'IS NOT NULL'
	-- codStore : codigo de tienda







-- GENERAL
-- -- HOST: 192.168.0.33  /  BDX : SBO_KAYSER
SELECT WhsCode, WhsName FROM OWHS WHERE U_GSP_SENDTPV='Y' ---  consulta para tiendas disponibles



