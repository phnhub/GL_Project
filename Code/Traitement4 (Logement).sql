--------------------------------------------------------------------------------------------------
--Traitement 4 
--Cibler les meilleurs secteurs pour l'investisement dans le service et le commerce
--Logement 

USE inse

--------------------------------------------------------------------------------------------------------
DECLARE 
	@max_nb_logements float;

--------------------------------------------------------------------------------------------------------
SET	@max_nb_logements = (SELECT [dbo].[maximum_norm_somme_nb_logements]());

--------------------------------------------------------------------------------------------------------
SELECT top 50
	r.reg,
	
	SUM(CAST(lo.nb_logements as int)) / @max_nb_logements as somme_nb_logements

FROM Logement lo
inner join Region r on lo.codgeo = r.codgeo 

WHERE 2=2
group by 	r.reg
order by CAST(r.reg as int) ASC





