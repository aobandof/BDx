-- CONSULTAS PARA OBTENER LOS DOCUMENTOS ERRADOS O NO PROCESADOS DE LAS TIENDAS

--PARA OBTENER EL CODIGO Y NOMBRE DE TIENDA
SELECT WhsCode as cod_tienda, WhsName AS tienda FROM OWHS where U_GSP_SENDTPV = 'Y' ORDER BY WhsName

-- CONSULTA PARA OBTENER LOS DOCUMENTOS PROCESADOS
select DISTINCT   U_GSP_CABOTI, convert(varchar(10), U_GSP_CADATA,101) as Fecha, U_GSP_ERROR
from [SBO_KAYSER].[dbo].[@GSP_TPVCAP]
where U_GSP_CADOCU<>'VRG' AND U_GSP_CAESTA<>'x' AND convert(varchar(10), U_GSP_CADATA,101)<>convert(varchar(10), GETDATE(),101)
ORDER by U_GSP_CABOTI

-- MISMA CONSULTA SOLO PARA ERRADOS:
select DISTINCT   U_GSP_CABOTI, convert(varchar(10), U_GSP_CADATA,101) as Fecha, U_GSP_ERROR
from [SBO_KAYSER].[dbo].[@GSP_TPVCAP]
where U_GSP_CADOCU<>'VRG' AND U_GSP_CAESTA<>'x' AND convert(varchar(10), U_GSP_CADATA,101)<>convert(varchar(10), GETDATE(),101) AND U_GSP_ERROR IS NOT NULL AND U_GSP_CABOTI='102'
ORDER by U_GSP_CABOTI

-- MISMA CONSULTA SOLO PARA NO PROCESADOS:
select DISTINCT   U_GSP_CABOTI, convert(varchar(10), U_GSP_CADATA,101) as Fecha, U_GSP_ERROR
from [SBO_KAYSER].[dbo].[@GSP_TPVCAP]
where U_GSP_CADOCU<>'VRG' AND U_GSP_CAESTA<>'x' AND convert(varchar(10), U_GSP_CADATA,101)<>convert(varchar(10), GETDATE(),101) AND U_GSP_ERROR IS NULL AND U_GSP_CABOTI='118'
ORDER by U_GSP_CABOTI


select DISTINCT   U_GSP_CABOTI as cod_tienda, convert(varchar(10), U_GSP_CADATA,101) as fecha, U_GSP_ERROR as error
                    from [SBO_KAYSER].[dbo].[@GSP_TPVCAP]
                    where U_GSP_CADOCU<>'VRG' AND U_GSP_CAESTA<>'x' AND convert(varchar(10), U_GSP_CADATA,101)<>convert(varchar(10), GETDATE(),101) AND U_GSP_ERROR IS NOT NULL AND U_GSP_CABOTI='102'
                    ORDER by U_GSP_CABOTI