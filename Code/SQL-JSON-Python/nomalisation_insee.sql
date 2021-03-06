#create database inse;
use inse;
drop table Insee;
CREATE TABLE INSEE (
    codgeo  INT NOT NULL ,
    nb_pharmacie_et_parfumerie int NOT NULL,
	dynamique_entrepreneuriale int,
    dynamique_entrepreneuriale_service int,
    synergie_medicale_commune int,
    orientation_economique varchar(255),
    indice_fiscal_partiel float not null,
    score_fiscal float not null,
    indice_evasion_client float not null,
    score_evasion_client float,
    indice_synergie_medicale float,
    score_synergie_medicale float,
    seg_croissance_pop varchar(255),
    libgeo varchar(255),
    reg int,
    dep int, 
    nb_omnipraticiens int,
    nb_infirmiers int,
    nb_dentistes int,
    nb_pharmaciens int,
    densite_medicale_bv float,
    score_equipement_sante int,
    indice_demographique float,
    score_demographique float,
    indice_menages float,
    score_menages float,
    population int,
    evolution_pop int,
    evolution_pop_pourcent int,
    nb_menages int,
    nb_residences_principal int, 
    nb_proprietaires int,
    nb_logements int,
    nb_residences_secondaires int,
    nb_logement_vacances int,
    nb_occcupants_residence_principale int,
    nb_femme int, 
    nb_homme int,
    nb_mineurs int,
    nb_majeurs int, 
    nb_etudiants int,
    nb_entreprises_secteur_service int, 
    nb_entreprises_secteur_commerce int,
    nb_entreprises_secteur_construction int,
    nb_entreprises_secteur_industrie int,
    nb_creation_entreprises int,
    nb_creation_industrielles int,
    nb_creation_constructions int,
    nb_creation_commerces int,
    nb_creation_services int,
    moyenne_revenu_fiscal_departementaux float,
    moyenne_revenu_fiscal_regionaux float,
    dep_moyenne_salaire_horaire float,
    dep_moyenne_salaire_cadre_horaire float,
    dep_moyenne_salaire_prof_intermediaire float,
    dep_moyenne_salaire_employes_horaire float,
    dep_moyenne_salaire_ouvrie_horaire float,
    reg_moyenne_salaire_horaire float,
    reg_moyenne_salaire_cadre_horaire float,
    reg_moyenne_salaire_prof_intermediaire float,
    reg_moyenne_salaire_employes_horaire float,
    reg_moyenne_salaire_ouvrie_horaire float,
    valeur_ajoutee_regionale float,
    urbanite_ruralite varchar(255),
    score_urbanite float,
    nb_actifs int,
    nb_actifs_salaries int,
    nb_actifs_non_salaries int,
    nb_logement_secondaire_et_occasionnels int,
    nb_hotel int, 
    capacite_hotel int,
    nb_camping int,
    capacite_camping int,
    dynamique_demographique_bv varchar(255),
    taux_etudiant float,
    taux_proprietees float,
    dynamique_demographique_insee float,
    capacite_fisc float,
    capacite_fiscale float,
    moyenne_revenu_fiscaux float,
    taux_evasion float,
    nb_education_sante_action_sociale float,
    nb_services_personnels_et_domestiques float,
    nb_sante_action_sociale float,
    nb_industries_bien_intermediaires int, 
    nb_de_commerces int,
    nb_services_aux_soins_particuliers int,
    nb_institution_education_sante_action int,
    pib_regionnal float,
    seg_environnement_demographique_obsolete varchar(255),
    score_croissance_population float,
    score_croissance_entrepreneuriale float,
    score_va_region float,
    score_pib float,
    environnement_demographique varchar(255),
    fidelite varchar(255),
    syn_medical varchar(255),
    seg_cap_fiscale varchar(255),
    seg_dynamique_entreprise varchar(255),
    dyn_setc varchar(255),
    cp int,
    PRIMARY KEY (codgeo)
);



LOAD DATA local INFILE 'Insee.csv' 
INTO TABLE insee 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select reg,dep from INSEE;
select reg,dep from libgeo;

-- 1FN

-- redundant column
ALTER TABLE INSEE DROP COLUMN capacite_fisc;

-- make atomique columns
UPDATE INSEE SET syn_medical = 'Forte' WHERE syn_medical = 'Forte Synergie M??dicale';
UPDATE INSEE SET syn_medical = 'Faible' WHERE syn_medical = 'Faible Synergie M??dicale';
UPDATE INSEE SET syn_medical = 'Moyenne' WHERE syn_medical = 'Synergie M??dicale';
ALTER TABLE INSEE CHANGE syn_medical niveau_syn_medical varchar(255);
select niveau_syn_medical from INSEE;

ALTER TABLE INSEE ADD type_bassin VARCHAR(255);

UPDATE INSEE SET type_bassin = 'Industriel' WHERE environnement_demographique LIKE 'Bassin Industriel%';
UPDATE INSEE SET type_bassin = 'Urbain' WHERE environnement_demographique LIKE 'Bassin Urbain%';
UPDATE INSEE SET type_bassin = 'Residentiel' WHERE environnement_demographique LIKE 'Bassin R%';
UPDATE INSEE SET type_bassin = 'Diverisifie' WHERE environnement_demographique LIKE 'Bassin d%';
UPDATE INSEE SET type_bassin = 'Agroalimentaire' WHERE environnement_demographique LIKE 'Bassins A%';

ALTER TABLE INSEE CHANGE type_bassin type_bassin_en_croissance_demo varchar(255);
ALTER TABLE INSEE CHANGE type_bassin_en_croissance_demo type_bassin_de_orientation_econ_en_croissance_demo varchar(255);

ALTER TABLE INSEE DROP COLUMN orientation_economique;
ALTER TABLE INSEE DROP COLUMN environnement_demographique;
ALTER TABLE INSEE DROP COLUMN seg_croissance_pop;

UPDATE INSEE SET seg_cap_fiscale = 'Elevee' WHERE seg_cap_fiscale LIKE 'Fiscalit?? e%';

UPDATE INSEE SET fidelite = 'Sedentaire' WHERE fidelite LIKE 'Pop S%';
UPDATE INSEE SET fidelite = 'Mobile' WHERE fidelite LIKE 'Pop M%';

UPDATE INSEE SET seg_dynamique_entreprise = 'Moyenne' WHERE seg_dynamique_entreprise LIKE 'Dynamique Economique';
UPDATE INSEE SET seg_dynamique_entreprise = 'Faible' WHERE seg_dynamique_entreprise LIKE 'Faible dynamique';
UPDATE INSEE SET seg_dynamique_entreprise = 'Moyenne' WHERE seg_dynamique_entreprise LIKE 'Moyenne dynamique';

UPDATE INSEE SET dynamique_demographique_bv = 'Accroissement par exc??dent migratoire' WHERE dynamique_demographique_bv LIKE '3.Accroissement par exc??dent migratoire';
UPDATE INSEE SET dynamique_demographique_bv = 'Accroissement par exc??dent naturel' WHERE dynamique_demographique_bv LIKE '2.Accroissement par exc??dent naturel';
UPDATE INSEE SET dynamique_demographique_bv ='Accroissement par exc??dent naturel et migratoire' where dynamique_demographique_bv like '1.Accroissement par exc??dent naturel et migratoire';
UPDATE INSEE SET dynamique_demographique_bv = 'D??clin par d??ficit naturel et migratoire' where dynamique_demographique_bv like '4.D??clin par d??ficit naturel et migratoire';
UPDATE INSEE SET dynamique_demographique_bv = 'D??clin par d??ficit naturel' where dynamique_demographique_bv like '5.D??clin par d??ficit naturel';
UPDATE INSEE SET dynamique_demographique_bv = 'D??clin par d??ficit migratoire' where dynamique_demographique_bv like '6.D??clin par d??ficit migratoire';


alter table insee drop dyn_setc;

alter table insee drop urbanite_ruralite;

alter table insee drop seg_environnement_demographique_obsolete;

select * from insee;

-- 2 FN

-- drop table info_reg;
-- CREATE TABLE info_reg AS SELECT reg, dep, nb_industries_bien_intermediaires, nb_de_commerces,nb_services_aux_soins_particuliers, nb_institution_education_sante_action,pib_regionnal, moyenne_revenu_fiscaux,
-- score_va_region,score_pib from insee;

drop table region;
create table Region as select reg, moyenne_revenu_fiscal_regionaux, reg_moyenne_salaire_horaire, reg_moyenne_salaire_cadre_horaire,reg_moyenne_salaire_prof_intermediaire,
reg_moyenne_salaire_employes_horaire, reg_moyenne_salaire_ouvrie_horaire, valeur_ajoutee_regionale,nb_industries_bien_intermediaires, nb_de_commerces,nb_services_aux_soins_particuliers, nb_institution_education_sante_action,pib_regionnal, moyenne_revenu_fiscaux,
score_va_region,score_pib from insee;

ALTER TABLE region
ADD primary key (reg); 

select * from region;

alter table insee 
drop column nb_de_commerces,
drop nb_industries_bien_intermediaires,
drop column nb_services_aux_soins_particuliers, 
drop column nb_institution_education_sante_action,
drop column pib_regionnal,
drop column score_va_region,
drop column score_pib,
drop moyenne_revenu_fiscaux,
drop moyenne_revenu_fiscal_regionaux,
drop reg_moyenne_salaire_horaire, 
drop reg_moyenne_salaire_cadre_horaire,
drop reg_moyenne_salaire_prof_intermediaire,
drop reg_moyenne_salaire_employes_horaire,
drop reg_moyenne_salaire_ouvrie_horaire,
drop valeur_ajoutee_regionale;

drop table libgeo;
create table libgeo as select libgeo,dep, reg from insee;
 
drop table departement;
create table departement as select libgeo,dep, dep_moyenne_salaire_horaire, dep_moyenne_salaire_cadre_horaire, dep_moyenne_salaire_prof_intermediaire,
dep_moyenne_salaire_employes_horaire, dep_moyenne_salaire_ouvrie_horaire,moyenne_revenu_fiscal_departementaux from insee;

ALTER TABLE departement
ADD primary key (dep); 

ALTER TABLE libgeo
ADD primary key(libgeo,dep,reg); 

alter table insee 
drop column dep_moyenne_salaire_horaire,
drop dep_moyenne_salaire_cadre_horaire, 
drop dep_moyenne_salaire_prof_intermediaire,
drop dep_moyenne_salaire_employes_horaire,
drop dep_moyenne_salaire_ouvrie_horaire,
drop moyenne_revenu_fiscal_departementaux,
drop cp;


drop table index_fiscal;
create table index_fiscal as select indice_fiscal_partiel, score_fiscal from insee;


ALTER TABLE index_fiscal
ADD primary key(indice_fiscal_partiel); 

alter table insee drop score_fiscal; 

drop table score_equip_sante_dynam;

create table score_equip_sante_dynam as select dynamique_demographique_bv,score_equipement_sante from insee;

ALTER TABLE score_equip_sante_dynam
ADD primary key(dynamique_demographique_bv); 

alter table insee drop score_equipement_sante;

select * from insee;

ALTER TABLE insee
ADD FOREIGN KEY (dynamique_demographique_bv) REFERENCES score_equip_sante_dynam(dynamique_demographique_bv); 

ALTER TABLE insee
ADD FOREIGN KEY (libgeo) REFERENCES libgeo(libgeo); 

ALTER TABLE insee
ADD FOREIGN KEY (index_fiscal_partiel) REFERENCES index_fiscal(index_fiscal_partiel); 

ALTER TABLE insee
ADD FOREIGN KEY (dep) REFERENCES departement(dep); 

ALTER TABLE insee
ADD FOREIGN KEY (reg) REFERENCES region(reg); 


select * from libgeo;





