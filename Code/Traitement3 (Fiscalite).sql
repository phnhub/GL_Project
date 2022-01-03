--------------------------------------------------------------------------------------------------
--Traitement 3 
--Cibler les meilleurs secteurs pour l'investisement dans le service et le commerce
--Fiscalite

USE inse

--------------------------------------------------------------------------------------------------------
DECLARE 
	@max_score_pib float,
	@max_score_va_region float,
	@max_pib_regionnal float,
	@max_valeur_ajoutee_regionale float,
	@max_Moyenne_taux_evasion float;

--------------------------------------------------------------------------------------------------------
SET	@max_score_pib = (SELECT [dbo].[maximum_norm_score_pib]());
SET	@max_score_va_region = (SELECT [dbo].[maximum_norm_score_va_region]());
SET	@max_pib_regionnal = (SELECT [dbo].[maximum_norm_pib_regionnal]());
SET	@max_valeur_ajoutee_regionale = (SELECT [dbo].[maximum_norm_valeur_ajoutee_regionale]());
SET	@max_Moyenne_taux_evasion = (SELECT [dbo].[maximum_norm_Moyenne_taux_evasion]());

--------------------------------------------------------------------------------------------------------
SELECT top 50
	r.reg,

	case when fis.score_pib <> '' 
            then cast(replace(fis.score_pib,',','.')as float) / @max_score_pib
			ELSE 0.0 
		    END as score_pib,

	case when fis.score_va_region <> '' 
            then cast(replace(fis.score_va_region,',','.')as float) / @max_score_va_region
			ELSE 0.0 
		    END as score_va_region,

	case when fis.pib_regionnal <> '' 
            then cast(replace(fis.pib_regionnal,',','.')as float) / @max_pib_regionnal
			ELSE 0.0 
		    END as pib_regionnal,

	case when fis.valeur_ajoutee_regionale <> '' 
            then cast(replace(fis.valeur_ajoutee_regionale,',','.')as float) / @max_valeur_ajoutee_regionale
			ELSE 0.0 
		    END as valeur_ajoutee_regionale,

	-AVG(CAST(fis.taux_evasion as float)) / @max_Moyenne_taux_evasion as Moyenne_taux_evasion

FROM Fiscalite fis
inner join Region r on fis.codgeo = r.codgeo 

WHERE 2=2
group by 	r.reg,
			fis.score_pib,
			fis.score_va_region,
			fis.pib_regionnal,
			fis.valeur_ajoutee_regionale
order by CAST(r.reg as int) ASC



