--------------------------------------------------------------------------------------------------
--Traitement 5 
--Cibler les meilleurs secteurs pour l'investisement dans le service et le commerce
--Population 

USE inse

--------------------------------------------------------------------------------------------------------
SELECT top 50
	r.reg,
	AVG(CAST(po.evolution_pop_pourcent as float)) / 100 as evolution_pop_pourcent

FROM Population_INSEE po
inner join Region r on po.codgeo = r.codgeo 

WHERE 2=2
group by 	r.reg
order by CAST(r.reg as int) ASC