CREATE FUNCTION maximum_norm_commerce (
)
RETURNS float AS
BEGIN

	DECLARE 
	@coef1 float,
	@coef2 float,
	@coef3 float;

	DECLARE @max float;

	--------------------------------------------------------------------------------------------------------

	SET @coef1 = 0.80
	SET	@coef2 = 0.14
	SET	@coef3 = 0.06

	SET	@max = 
	(
	SELECT MAX(TB.Prediction_de_rentabilite_commerce)

	FROM

	(SELECT top 100

		r.reg as Region,
		SUM(CAST(dynamique_entrepreneuriale_service as float)) / CAST(Somme_total as float) * @coef3 +
		SUM(CAST(nb_creation_commerces as float))				 / CAST(Somme_total as float) * @coef2 +
		SUM(CAST(nb_entreprises_secteur_commerce as float))	 / CAST(Somme_total as float) * @coef1  as Prediction_de_rentabilite_commerce


	FROM Activite_Economique ae

	inner join Infrastructure i on ae.codgeo = i.codgeo 
	inner join Region r on ae.codgeo = r.codgeo 
	inner join(
				SELECT top 100
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
	order by CAST(r.reg as int) ASC ) as TB)
 
    RETURN @max 
END;

--DROP FUNCTION maximum_norm_commerce;
