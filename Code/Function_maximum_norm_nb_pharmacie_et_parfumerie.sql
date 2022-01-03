CREATE FUNCTION maximum_norm_nb_pharmacie_et_parfumerie (
)
RETURNS float AS
BEGIN

	DECLARE @max float;

	--------------------------------------------------------------------------------------------------------
	SET	@max = 
	(

	SELECT MAX(TB.nb_pharmacie_et_parfumerie)
	FROM
	(
		SELECT top 50
			r.reg,
			SUM(CAST(sa.nb_pharmacie_et_parfumerie as int)) as nb_pharmacie_et_parfumerie
		FROM Sante sa
		inner join Region r on sa.codgeo = r.codgeo 
		WHERE 2=2
		group by r.reg
		order by CAST(r.reg as int) ASC
		) as TB
	)
 
    RETURN @max 
END;

--DROP FUNCTION maximum_norm_nb_pharmacie_et_parfumerie;
