--------------------------------------------------------------------------------------------------
--Traitement 6 
--Cibler les meilleurs secteurs pour l'investisement dans le service et le commerce
--Sante

USE inse

--------------------------------------------------------------------------------------------------------
DECLARE 
	@max_nb_pharmacie_et_parfumerie float;

--------------------------------------------------------------------------------------------------------
SET	@max_nb_pharmacie_et_parfumerie = (SELECT [dbo].[maximum_norm_nb_pharmacie_et_parfumerie]());

--------------------------------------------------------------------------------------------------------
SELECT top 50

	r.reg,	
	SUM(CAST(sa.nb_pharmacie_et_parfumerie as int)) / @max_nb_pharmacie_et_parfumerie as nb_pharmacie_et_parfumerie

FROM Sante sa
inner join Region r on sa.codgeo = r.codgeo 

WHERE 2=2
group by r.reg
order by CAST(r.reg as int) ASC