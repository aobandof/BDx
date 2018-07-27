
-- STOCK PRODUCTOS CON CONDIFICACION SENS
-- HOST: 192.168.0.17  /  BDX : WMSTEK_KAYSER

--$conexion_stock=new MssqlConexion('192.168.0.17','wms','pjc3l1','WMSTEK_KAYSER');

SELECT S.itemCode, CASE WHEN STOCK.Cant IS NULL THEN 0 ELSE STOCK.Cant END AS cantidad
FROM	(SELECT t0.IdArticulo as sku, CAST(SUM(t0.Cantidad)-30 AS int) as cant 
		FROM Existencia as t0 
		INNER JOIN Ubicacion as t1 ON t0.IdUbicacion=t1.IdUbicacion
		WHERE t0.IdAlmacen = '01' AND t0.IdUbicacion LIKE '01%' and t1.Nivel in ('1','2')
		GROUP BY IdArticulo HAVING SUM(Cantidad)>30 ) AS STOCK
RIGHT JOIN [192.168.0.13].[Stock].[dbo].[Kayser_OITM] as S ON STOCK.sku = S.itemCode COLLATE SQL_Latin1_General_CP1_CI_AS
WHERE S.U_Marca='SENS' 
ORDER BY S.itemCode

		CASE 
			WHEN C.Cantidad>30 THEN C.Cantidad-30 ELSE 0
		END AS cantidad	




SELECT * FROM [192.168.0.17].[WMSTEK_KAYSER].[dbo].[Existencia] 


SELECT ItemCode 
FROM [192.168.0.13].[Stock].[dbo].[Kayser_OITM] as S
WHERE U_Marca='SENS'

