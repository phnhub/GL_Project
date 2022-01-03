--------------------------------------------------------------------------------------------------
--Traitement 1 + Traitement 2
--Cibler les meilleurs secteurs pour l'investisement dans le service et le commerce
--Le service + le commerce

USE inse

--------------------------------------------------------------------------------------------------------

DECLARE 
	@coef1 Float,
	@coef2 Float,
	@coef3 Float;

DECLARE 
	@max_norm_service Float,
	@max_norm_commerce Float

--------------------------------------------------------------------------------------------------------

SET @coef1 = 0.80
SET	@coef2 = 0.14
SET	@coef3 = 0.06

SET	@max_norm_service = (SELECT [dbo].[maximum_norm_service]())

SET	@max_norm_commerce = (SELECT [dbo].[maximum_norm_commerce]())

--------------------------------------------------------------------------------------------------------

SELECT 
	TB1.Region,
--	TB1.Prediction_de_rentabilite_service,
--	TB2.Prediction_de_rentabilite_commerce,
	(CAST(TB1.Prediction_de_rentabilite_service as float) + 
	CAST(TB2.Prediction_de_rentabilite_commerce as float)) / 2 as Moyenne_Prediction_de_rentabilite_service_commerce

FROM 
(
SELECT top 50

	r.reg as Region,
	TB.Somme_total,

	SUM(CAST(dynamique_entrepreneuriale_service as int)) as Dynamique_Entrepreneuriale_Service_et_Commerce,
	SUM(CAST(nb_creation_services as int)) as Nb_Creation_Services,
	SUM(CAST(nb_entreprises_secteur_service as int)) as Nb_Entreprises_Secteur_Services,

	( SUM(CAST(dynamique_entrepreneuriale_service as float)) / CAST(Somme_total as float) * @coef3 +
	SUM(CAST(nb_creation_services as float))				 / CAST(Somme_total as float) * @coef2 +
	SUM(CAST(nb_entreprises_secteur_service as float))	     / CAST(Somme_total as float) * @coef1 ) / @max_norm_service  as Prediction_de_rentabilite_service

FROM Activite_Economique ae

inner join Infrastructure i on ae.codgeo = i.codgeo 
inner join Region r on ae.codgeo = r.codgeo 
inner join(

			SELECT top 50

				r.reg as Region,
				SUM(CAST(dynamique_entrepreneuriale_service as int)) + 
				SUM(CAST(nb_creation_services as int)) +
				SUM(CAST(nb_entreprises_secteur_service as int)) as Somme_total

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
) as TB1,
(
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
) as TB2

WHERE 2=2
and TB1.Region = TB2.Region
order by CAST(TB1.Region as int) ASC