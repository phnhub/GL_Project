--------------------------------------------------------------------------------------------------
USE inse

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'INSEE'))
BEGIN
    drop table INSEE;
END

CREATE TABLE INSEE (
    codgeo INT NOT NULL ,
    nb_pharmacie_et_parfumerie NVARCHAR(max) NOT NULL,
	dynamique_entrepreneuriale NVARCHAR(max),
    dynamique_entrepreneuriale_service NVARCHAR(max),
    synergie_medicale_commune NVARCHAR(max),
    orientation_economique varchar(255),
    indice_fiscal_partiel NVARCHAR(max) not null,
    score_fiscal NVARCHAR(max) not null,
    indice_evasion_client NVARCHAR(max) not null,
    score_evasion_client NVARCHAR(max),
    indice_synergie_medicale NVARCHAR(max),
    score_synergie_medicale NVARCHAR(max),
    seg_croissance_pop varchar(255),
    libgeo varchar(255),
    reg NVARCHAR(max),
    dep NVARCHAR(max), 
    nb_omnipraticiens NVARCHAR(max),
    nb_infirmiers NVARCHAR(max),
    nb_dentistes NVARCHAR(max),
    nb_pharmaciens NVARCHAR(max),
    densite_medicale_bv NVARCHAR(max),
    score_equipement_sante NVARCHAR(max),
    indice_demographique NVARCHAR(max),
    score_demographique NVARCHAR(max),
    indice_menages NVARCHAR(max),
    score_menages NVARCHAR(max),
    population NVARCHAR(max),
    evolution_pop NVARCHAR(max),
    evolution_pop_pourcent NVARCHAR(max),
    nb_menages NVARCHAR(max),
    nb_residences_principal NVARCHAR(max), 
    nb_proprietaires NVARCHAR(max),
    nb_logements NVARCHAR(max),
    nb_residences_secondaires NVARCHAR(max),
    nb_logement_vacances NVARCHAR(max),
    nb_occcupants_residence_principale NVARCHAR(max),
    nb_femme NVARCHAR(max), 
    nb_homme NVARCHAR(max),
    nb_mineurs NVARCHAR(max),
    nb_majeurs NVARCHAR(max), 
    nb_etudiants NVARCHAR(max),
    nb_entreprises_secteur_service NVARCHAR(max), 
    nb_entreprises_secteur_commerce NVARCHAR(max),
    nb_entreprises_secteur_construction NVARCHAR(max),
    nb_entreprises_secteur_industrie NVARCHAR(max),
    nb_creation_entreprises NVARCHAR(max),
    nb_creation_industrielles NVARCHAR(max),
    nb_creation_constructions NVARCHAR(max),
    nb_creation_commerces NVARCHAR(max),
    nb_creation_services NVARCHAR(max),
    moyenne_revenu_fiscal_departementaux NVARCHAR(max),
    moyenne_revenu_fiscal_regionaux NVARCHAR(max),
    dep_moyenne_salaire_horaire NVARCHAR(max),
    dep_moyenne_salaire_cadre_horaire NVARCHAR(max),
    dep_moyenne_salaire_prof_intermediaire NVARCHAR(max),
    dep_moyenne_salaire_employes_horaire NVARCHAR(max),
    dep_moyenne_salaire_ouvrie_horaire NVARCHAR(max),
    reg_moyenne_salaire_horaire NVARCHAR(max),
    reg_moyenne_salaire_cadre_horaire NVARCHAR(max),
    reg_moyenne_salaire_prof_intermediaire NVARCHAR(max),
    reg_moyenne_salaire_employes_horaire NVARCHAR(max),
    reg_moyenne_salaire_ouvrie_horaire NVARCHAR(max),
    valeur_ajoutee_regionale NVARCHAR(max),
    urbanite_ruralite varchar(255),
    score_urbanite NVARCHAR(max),
    nb_actifs NVARCHAR(max),
    nb_actifs_salaries NVARCHAR(max),
    nb_actifs_non_salaries NVARCHAR(max),
    nb_logement_secondaire_et_occasionnels NVARCHAR(max),
    nb_hotel NVARCHAR(max), 
    capacite_hotel NVARCHAR(max),
    nb_camping NVARCHAR(max),
    capacite_camping NVARCHAR(max),
    dynamique_demographique_bv varchar(255),
    taux_etudiant NVARCHAR(max),
    taux_proprietees NVARCHAR(max),
    dynamique_demographique_insee NVARCHAR(max),
    capacite_fisc NVARCHAR(max),
    capacite_fiscale NVARCHAR(max),
    moyenne_revenu_fiscaux NVARCHAR(max),
    taux_evasion NVARCHAR(max),
    nb_education_sante_action_sociale NVARCHAR(max),
    nb_services_personnels_et_domestiques NVARCHAR(max),
    nb_sante_action_sociale NVARCHAR(max),
    nb_industries_bien_intermediaires NVARCHAR(max), 
    nb_de_commerces NVARCHAR(max),
    nb_services_aux_soins_particuliers NVARCHAR(max),
    nb_institution_education_sante_action NVARCHAR(max),
    pib_regionnal NVARCHAR(max),
    seg_environnement_demographique_obsolete varchar(255),
    score_croissance_population NVARCHAR(max),
    score_croissance_entrepreneuriale NVARCHAR(max),
    score_va_region NVARCHAR(max),
    score_pib NVARCHAR(max),
    environnement_demographique varchar(255),
    fidelite varchar(255),
    syn_medical varchar(255),
    seg_cap_fiscale varchar(255),
    seg_dynamique_entreprise varchar(255),
    dyn_setc varchar(255),
    cp NVARCHAR(max)
	PRIMARY KEY (codgeo)
);

--------------------------------------------------------------------------------------------------
USE inse

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'Laposte_Hexasmal'))
BEGIN
    drop table Laposte_Hexasmal;
END

CREATE TABLE Laposte_Hexasmal (
Code_commune_INSEE NVARCHAR(max),
Nom_commune NVARCHAR(max),
Code_postal NVARCHAR(max),
Ligne_5 NVARCHAR(max),
Libelle_d_acheminement NVARCHAR(max),
coordonnees_gps NVARCHAR(max)
PRIMARY KEY (Code_commune_INSEE)
);

------------------------------------------------------------------------------------------------
USE inse

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'Region'))
BEGIN
    drop table Region;
END

CREATE TABLE Region (
	codgeo INT NOT NULL, 
	reg NVARCHAR(max), 
	moyenne_revenu_fiscal_regionaux NVARCHAR(max), 
	reg_moyenne_salaire_horaire NVARCHAR(max), 
	reg_moyenne_salaire_cadre_horaire NVARCHAR(max),
	reg_moyenne_salaire_prof_intermediaire NVARCHAR(max),
	reg_moyenne_salaire_employes_horaire NVARCHAR(max), 
	reg_moyenne_salaire_ouvrie_horaire NVARCHAR(max), 
	valeur_ajoutee_regionale NVARCHAR(max),
	nb_industries_bien_intermediaires NVARCHAR(max), 
	nb_de_commerces NVARCHAR(max),
	nb_services_aux_soins_particuliers NVARCHAR(max), 
	nb_institution_education_sante_action NVARCHAR(max),
	pib_regionnal NVARCHAR(max), 
	moyenne_revenu_fiscaux NVARCHAR(max),
	score_va_region NVARCHAR(max),
	score_pib NVARCHAR(max)
	PRIMARY KEY (reg)
);

------------------------------------------------------------------------------------------------
USE inse

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'Region'))
BEGIN
    drop table Region;
END

select 
	codgeo, 
	reg, 
	moyenne_revenu_fiscal_regionaux, 
	reg_moyenne_salaire_horaire, 
	reg_moyenne_salaire_cadre_horaire,
	reg_moyenne_salaire_prof_intermediaire,
	reg_moyenne_salaire_employes_horaire, 
	reg_moyenne_salaire_ouvrie_horaire, 
	valeur_ajoutee_regionale,
	nb_industries_bien_intermediaires, 
	nb_de_commerces,
	nb_services_aux_soins_particuliers, 
	nb_institution_education_sante_action,
	pib_regionnal, moyenne_revenu_fiscaux,
	score_va_region,score_pib 

into Region
	
from INSEE;

ALTER TABLE Region ADD PRIMARY KEY (reg);

--------------------------------------------------------------------------------------------------
USE inse

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'libgeo'))
BEGIN
    drop table libgeo;
END

select 
	libgeo,
	dep, 
	reg

into libgeo
	
from INSEE;

ALTER TABLE libgeo ADD PRIMARY KEY (reg);

--------------------------------------------------------------------------------------------------
USE inse

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'departement'))
BEGIN
    drop table departement;
END

select 
	codgeo,
	libgeo,
	dep, 
	dep_moyenne_salaire_horaire, 
	dep_moyenne_salaire_cadre_horaire, 
	dep_moyenne_salaire_prof_intermediaire,
	dep_moyenne_salaire_employes_horaire, 
	dep_moyenne_salaire_ouvrie_horaire,
	moyenne_revenu_fiscal_departementaux

into departement
	
from INSEE;

ALTER TABLE departement ADD PRIMARY KEY (codgeo);

--------------------------------------------------------------------------------------------------
USE inse

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'index_fiscal'))
BEGIN
    drop table index_fiscal;
END

select 
	codgeo,
	indice_fiscal_partiel, 
	score_fiscal

into index_fiscal
	
from INSEE;

ALTER TABLE index_fiscal ADD PRIMARY KEY (codgeo);

--------------------------------------------------------------------------------------------------
USE inse

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'score_equip_sante_dynam'))
BEGIN
    drop table score_equip_sante_dynam;
END

select 
	codgeo,
	dynamique_demographique_bv,
	score_equipement_sante

into score_equip_sante_dynam
	
from INSEE

ALTER TABLE score_equip_sante_dynam ADD PRIMARY KEY (codgeo);

--------------------------------------------------------------------------------------------------
USE inse

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'Activite_Economique'))
BEGIN
    drop table Activite_Economique;
END

select 
	codgeo,
	Dynamique_Entrepreneuriale, 
	dynamique_entrepreneuriale_service, 
	nb_entreprises_secteur_service, 
	nb_entreprises_secteur_commerce, 
	nb_entreprises_secteur_construction, 
	nb_entreprises_secteur_industrie, 
	nb_creation_entreprises, 
	nb_creation_industrielles, 
	nb_creation_constructions, 
	nb_creation_commerces, 
	nb_creation_services, 
	nb_actifs, 
	nb_actifs_salaries, 
	nb_actifs_non_salaries, 
	nb_industries_bien_intermediaires, 
	nb_de_commerces, 
	score_croissance_entrepreneuriale, 
	orientation_economique

into Activite_Economique
	
from INSEE;

ALTER TABLE Activite_Economique ADD PRIMARY KEY (codgeo);

--------------------------------------------------------------------------------------------------
USE inse

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'Fiscalite'))
BEGIN
    drop table Fiscalite;
END

select 
	codgeo,
	score_pib, 
	score_va_region, 
	pib_regionnal, 
	taux_evasion, 
	moyenne_revenu_fiscaux, 
	capacite_fiscale, 
	capacite_fisc, 
	valeur_ajoutee_regionale, 
	reg_moyenne_salaire_ouvrie_horaire, 
	reg_moyenne_salaire_employes_horaire, 
	reg_moyenne_salaire_prof_intermediaire, 
	reg_moyenne_salaire_cadre_horaire, 
	reg_moyenne_salaire_horaire, 
	dep_moyenne_salaire_ouvrie_horaire, 
	dep_moyenne_salaire_employes_horaire, 
	dep_moyenne_salaire_prof_intermediaire, 
	dep_moyenne_salaire_cadre_horaire, 
	dep_moyenne_salaire_horaire, 
	moyenne_revenu_fiscal_regionaux, 
	moyenne_revenu_fiscal_departementaux,  
	score_fiscal, 
	indice_fiscal_partiel

into Fiscalite
	
from INSEE;

ALTER TABLE Fiscalite ADD PRIMARY KEY (codgeo);

--------------------------------------------------------------------------------------------------
USE inse

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'Infrastructure'))
BEGIN
    drop table Infrastructure;
END

select  
	codgeo,
	nb_education_sante_action_sociale, 
	nb_services_personnels_et_domestiques, 
	nb_sante_action_sociale, 
	nb_services_aux_soins_particuliers, 
	nb_institution_education_sante_action

into Infrastructure 
	
from INSEE;

ALTER TABLE Infrastructure ADD PRIMARY KEY (codgeo);

--------------------------------------------------------------------------------------------------
USE inse

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'Logement'))
BEGIN
    drop table Logement;
END

select  
	codgeo,
	taux_proprietees, 
	nb_logement_secondaire_et_occasionnels, 
	nb_occcupants_residence_principale, 
	nb_logement_vacances, 
	nb_residences_secondaires, 
	nb_logements, 
	nb_proprietaires, 
	nb_residences_principal, 
	nb_menages

into Logement  
	
from INSEE;

ALTER TABLE Logement ADD PRIMARY KEY (codgeo);

--------------------------------------------------------------------------------------------------
USE inse

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'Population_INSEE'))
BEGIN
    drop table Population_INSEE;
END

select  
	codgeo,
	fidelite, 
	environnement_demographique, 
	dynamique_demographique_bv, 
	urbanite_ruralite, 
	seg_croissance_pop, 
	score_croissance_population, 
	dynamique_demographique_insee, 
	taux_etudiant, 
	score_urbanite, 
	nb_etudiants, 
	nb_majeurs, 
	nb_mineurs, 
	nb_homme, 
	nb_femme, 
	evolution_pop_pourcent, 
	evolution_pop, 
	population, 
	score_menages, 
	indice_menages, 
	score_demographique, 
	indice_demographique, 
	score_evasion_client, 
	indice_evasion_client

into Population_INSEE  
	
from INSEE;

ALTER TABLE Population_INSEE ADD PRIMARY KEY (codgeo);

--------------------------------------------------------------------------------------------------
USE inse

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'Sante'))
BEGIN
    drop table Sante;
END

select  
	 codgeo,
	 nb_pharmacie_et_parfumerie, 
	 synergie_medicale_commune, 
	 indice_synergie_medicale, 
	 score_synergie_medicale, 
	 nb_omnipraticiens, 
	 nb_infirmiers, 
	 nb_dentistes, 
	 nb_pharmaciens, 
	 densite_medicale_bv, 
	 score_equipement_sante

into Sante  
	
from INSEE;

ALTER TABLE Sante ADD PRIMARY KEY (codgeo);

--------------------------------------------------------------------------------------------------
USE inse

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'Tourisme'))
BEGIN
    drop table Tourisme;
END

select  
	 codgeo,
	 nb_hotel, 
	 capacite_hotel, 
	 nb_camping, 
	 capacite_camping

into Tourisme  
	
from INSEE;

ALTER TABLE Tourisme ADD PRIMARY KEY (codgeo);

--------------------------------------------------------------------------------------------------

