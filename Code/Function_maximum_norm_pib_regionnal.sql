CREATE FUNCTION maximum_norm_pib_regionnal (
)
RETURNS float AS
BEGIN

	DECLARE @max float;

	--------------------------------------------------------------------------------------------------------
	SET	@max = 
	(

	SELECT MAX(case when TB.pib_regionnal <> '' 
            then cast(replace(TB.pib_regionnal,',','.')as float) 
			ELSE 0.0 
		    END)

	FROM
	(
		SELECT top 50
		r.reg,
		fis.score_pib,
		fis.score_va_region,
		fis.pib_regionnal,
		fis.valeur_ajoutee_regionale,
		AVG(CAST(fis.taux_evasion as float)) as Moyenne_taux_evasion

		FROM Fiscalite fis
		inner join Region r on fis.codgeo = r.codgeo 

		WHERE 2=2
		group by 	r.reg,
				fis.score_pib,
				fis.score_va_region,
				fis.pib_regionnal,
				fis.valeur_ajoutee_regionale
		order by CAST(r.reg as int) ASC) as TB
	)
 
    RETURN @max 
END;

--DROP FUNCTION maximum_norm_pib_regionnal;
