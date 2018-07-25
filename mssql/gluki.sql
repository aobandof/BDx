/*********************   detallado de compras  ******************************/
select t1.LicTradNum as numeroCedula, CONVERT(VARCHAR(10), U_GSP_CADATA, 120) fechaCompra, (CONVERT(VARCHAR(10), getdate(),120)) as fechaActualizacion, 
case  
	when U_GSP_CADOCU IN ('vtd','vab') then CAST((U_GSP_CATOTA) * -1 AS Int)
    when U_GSP_CADOCU not IN ('vtd','vab') then CAST((U_GSP_CATOTA) AS Int)  end as  total,
case 
    when U_GSP_CADOCU IN ('vti','VTIM','VTD','VAB','VFA') then 'COMPRAS'  END  as indicador
from [@GSP_TPVCAP] t0  inner join OCRD t1 on t1.CardCode=t0.U_GSP_CACLIE 
where U_GSP_CADOCU not in ('vti_ag','vtim_ag','vtd_ag') and t1.GroupCode='6' and  U_GSP_CADATA between (GETDATE()-(DAY(GETDATE())-1)) AND getdate()


/*****TOTAL DE COMPRAS******************/

select		t1.LicTradNum as numeroCedula,
case
	when U_GSP_CADOCU IN ('vti','VTIM','VTD','VAB','VFA') then 'COMPRAS'  END  as indicador, 
case	
	when U_GSP_CADOCU IN ('vtd','vab') then cast(sum(U_GSP_CATOTA) * -1 AS Int)  
	when U_GSP_CADOCU not IN ('vtd','vab') then cast(sum(U_GSP_CATOTA) AS Int) end as  total,
max(CONVERT(VARCHAR(10), getdate(),120)) as fechaActualizacion, max(cast(year(U_GSP_CADATA) as varchar(4)) + '-'+ cast(month(U_GSP_CADATA)as varchar(2))) as periodo
from [@GSP_TPVCAP] t0  inner join OCRD t1 on t1.CardCode=t0.U_GSP_CACLIE 
where U_GSP_CADOCU not in ('vti_ag','vtim_ag','vtd_ag') and t1.GroupCode='6' and U_GSP_CADATA between (GETDATE()-(DAY(GETDATE())-1)) AND getdate()
group by t1.LicTradNum, U_GSP_CADOCU