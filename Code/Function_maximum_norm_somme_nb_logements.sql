CREATE FUNCTION maximum_norm_somme_nb_logements (
)
RETURNS float AS
BEGIN

	DECLARE @max float;

	--------------------------------------------------------------------------------------------------------
	SET	@max = 
	(

	SELECT MAX(TB.somme_nb_logements)
	FROM
	(
		SELECT top 50
			r.reg,
			SUM(CAST(lo.nb_logements as int)) as somme_nb_logements
		FROM Logement lo
		inner join Region r on lo.codgeo = r.codgeo 
		WHERE 2=2
		group by 	r.reg
		order by CAST(r.reg as int) ASC
		) as TB
	)
 
    RETURN @max 
END;

--DROP FUNCTION maximum_norm_somme_nb_logements;
