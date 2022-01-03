--------------------------------------------------------------------------------------------------
--Traitement 2 
--Cibler les meilleurs secteurs pour l'investisement dans le service et le commerce
--Commerce

USE inse

--------------------------------------------------------------------------------------------------------

DECLARE 
	@coef1 Float,
	@coef2 Float,
	@coef3 Float;

DECLARE 
	@max_norm_commerce Float

--------------------------------------------------------------------------------------------------------

SET @coef1 = 0.80
SET	@coef2 = 0.14
SET	@coef3 = 0.06

SET	@max_norm_commerce = (SELECT [dbo].[maximum_norm_commerce]())

--------------------------------------------------------------------------------------------------------

SELECT top 50

	r.reg as Region,
	TB.Somme_total,

	SUM(CAST(dynamique_entrepreneuriale_service as int)) as Dynamique_Entrepreneuriale_Service_et_Commerce,
	SUM(CAST(nb_creation_commerces as int)) as Nb_Creation_Commerces,
	SUM(CAST(nb_entreprises_secteur_commerce as int)) as Nb_de_Commerce,

	( SUM(CAST(dynamique_entrepreneuriale_service as float)) / CAST(Somme_total as float) * @coef3 +
	SUM(CAST(nb_creation_commerces as float))				 / CAST(Somme_total as float) * @coef2 +
	SUM(CAST(nb_entreprises_secteur_commerce as float))	     / CAST(Somme_total as float) * @coef1 ) / @max_norm_commerce  as Prediction_de_rentabilite_commerce

FROM Activite_Economique ae

inner join Infrastructure i on ae.codgeo = i.codgeo 
inner join Region r on ae.codgeo = r.codgeo 
inner join(

			SELECT top 50

				r.reg as Region,
				SUM(CAST(dynamique_entrepreneuriale_service as int)) + 
				SUM(CAST(nb_creation_commerces as int)) +
				SUM(CAST(nb_entreprises_secteur_commerce as int)) as Somme_total

			FROM Activite_Economique ae
			inner join Infrastructure i on ae.codgeo = i.codgeo 
			inner join Region r on ae.codgeo = r.codgeo 
			where 2=2
			group by r.reg
			order by CAST(r.reg as int) ASC
			) as TB on r.reg = TB.Region


where 2=2
group by r.reg,TB.Somme_total
order by CAST(r.reg as int) ASC