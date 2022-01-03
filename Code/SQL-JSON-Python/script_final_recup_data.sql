USE inse;
drop table poste;
CREATE TABLE poste (
	code_commune_INSEE varchar(255),
    Nom_commune varchar(255),
    code_region varchar(255),
    ligne_5 varchar(255),
    libelle varchar(255),
    coord_gps varchar(255)
);

LOAD DATA local INFILE 'laposte-1.csv' 
INTO TABLE poste
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from poste;


drop table SC;
CREATE TABLE SC (
	code_region varchar(255),
	val_A varchar(255)

);

LOAD DATA local INFILE 'SC.csv' 
INTO TABLE SC
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n';

select * from SC;


drop table L;
CREATE TABLE L (
	code_region varchar(255),
	val_A varchar(255)

);

LOAD DATA local INFILE 'L.csv' 
INTO TABLE L
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n';

select * from L;

drop table P;
CREATE TABLE P (
	code_region varchar(255),
	val_A varchar(255)

);

LOAD DATA local INFILE 'P.csv' 
INTO TABLE P
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n';

select * from P;


drop table F;
CREATE TABLE F (
	code_region varchar(255),
	val_1 varchar(255),
    val_2 varchar(255),
    val_3 varchar(255),
    val_4 varchar(255),
    val_5 varchar(255)

);

LOAD DATA local INFILE 'F.csv' 
INTO TABLE F
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n';

select * from F;

drop table S;
CREATE TABLE S (
	code_region varchar(255),
	val_A varchar(255)

);

LOAD DATA local INFILE 'S.csv' 
INTO TABLE S
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n';

select * from S;