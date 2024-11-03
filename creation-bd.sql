DROP TABLE IF EXISTS BRIQUE;
DROP TABLE IF EXISTS CRITERE;
DROP TABLE IF EXISTS DATEF;
DROP TABLE IF EXISTS USINE;
DROP TABLE IF EXISTS CONSTRUCTION;
DROP TABLE IF EXISTS OFFICIEL;
DROP TABLE IF EXISTS AMATEUR;
DROP TABLE IF EXISTS ETAPES;
DROP TABLE IF EXISTS PHOTO;
DROP TABLE IF EXISTS TOUR;
DROP TABLE IF EXISTS JOUEUR;
DROP TABLE IF EXISTS PARTIE;
DROP TABLE IF EXISTS PARAMETRE;
DROP TABLE IF EXISTS fabrique_un_type_de;
DROP TABLE IF EXISTS est_assemble
DROP TABLE IF EXISTS suit;
DROP TABLE IF EXISTS accompagne;
DROP TABLE IF EXISTS se_divise;
DROP TABLE IF EXISTS joue;
DROP TABLE IF EXISTS joue_a;
DROP TABLE IF EXISTS est_configure_selon;

CREATE TABLE BRIQUE(
    PRIMARY KEY(idB,idCritere),
    idB INTEGER NOT NULL,
    nomB VARCHAR(50),
    largeur FLOAT,
    longueur FLOAT,
    hauteur FLOAT,
    forme VARCHAR(50),
    couleur VARCHAR(50),
    mots_cles VARCHAR(100),
    idCritere INTEGER NOT NULL
);

CREATE TABLE CRITERE(
    PRIMARY KEY (idCritere),
    idCritere INTEGER NOT NULL,
    nom VARCHAR(255),
    commentaire VARCHAR(255)
);

CREATE TABLE DATEF(
    PRIMARY KEY (dateFabrication),
    dateFabrication DATE
);

CREATE TABLE USINE(
    PRIMARY KEY (idU,idB,dateFabrication),
    idU INTEGER NOT NULL,
    ville VARCHAR(50),
    pays  VARCHAR(50),
    idB INTEGER NOT NULL,
    dateFabrication DATE
);

CREATE TABLE CONSTRUCTION(
    PRIMARY KEY (idConstruction),
    idConstruction INTEGER NOT NULL,
    nomC VARCHAR(50),
    theme VARCHAR(50),
    descriptions TEXT,
    annee_sortie INTEGER,
    longueur FLOAT,
    largeur FLOAT,
    hauteur FLOAT
);

CREATE TABLE OFFICIEL(
    PRIMARY KEY(coderef,idConstruction),
    coderef INTEGER NOT NULL,
    age_recommande INTEGER,
    prix FLOAT,
    nom VARCHAR(50),
    idConstruction INTEGER NOT NULL
);

CREATE TABLE AMATEUR(
    PRIMARY KEY(idConstruction),
    nom_amateur VARCHAR(50),
    licence VARCHAR(20),
    idConstruction INTEGER NOT NULL   
);

CREATE TABLE ETAPES(
    PRIMARY KEY(numE,idConstruction),
    numE INTEGER NOT NULL,
    images TEXT,
    instruction TEXT,
    idConstruction INTEGER NOT NULL
);


CREATE TABLE PHOTO(
    PRIMARY KEY(idPhoto),
    idPhoto INTEGER NOT NULL,
    titre VARCHAR(50),
    descriptions TEXT,
    chemin_fichier TEXT
);

CREATE TABLE TOUR(
    PRIMARY KEY(numTour,idB),
    numTour INTEGER NOT NULL,
    actions TEXT,
    idB INTEGER NOT NULL   
);

CREATE TABLE JOUEUR(
    PRIMARY KEY(idJoueur),
    idJoueur INTEGER NOT NULL,
    prenom VARCHAR(50),
    date_inscription DATE,
    avatar VARCHAR(50)
);

CREATE TABLE PARTIE(
    PRIMARY KEY(idPartie),
    idPartie INTEGER NOT NULL,
    dateDeb DATE,
    dateFin DATE
);

CREATE TABLE PARAMETRE(
   PRIMARY KEY(idParam)
   idParam INTEGER NOT NULL,
   propriete VARCHAR(50),
   valeur VARCHAR(50)
);

CREATE TABLE est_configure_selon(
    PRIMARY KEY(idPartie,idParam),
    idPartie INTEGER NOT NULL,
    idParam INTEGER NOT NULL,
    duree TIME
);

CREATE TABLE fabrique_un_type_de (
    PRIMARY KEY(idB,dateFabrication),
    idB INTEGER NOT NULL,
    dateFabrication date,
    quantite INTEGER  
);

CREATE TABLE est_assemble(
    PRIMARY KEY(idConstruction,idB),
    idB INTEGER NOT NULL,
    idConstruction INTEGER NOT NULL  
);

CREATE TABLE suit(
    PRIMARY KEY(idConstruction,numE),
    idConstruction INTEGER NOT NULL,
    numE INTEGER NOT NULL
);

CREATE TABLE accompagne(
    PRIMARY KEY(idB,idConstruction,idPhoto),
    idB INTEGER NOT NULL,
    idConstruction INTEGER NOT NULL,
    idPhoto INTEGER NOT NULL
);

CREATE TABLE se_divise(
    PRIMARY KEY(numTour,idB,idPartie),
    numTour INTEGER NOT NULL,
    idB INTEGER NOT NULL,
    idPartie INTEGER NOT NULL
);

CREATE TABLE joue(
    PRIMARY KEY(numTour,idB,idJoueur),
    numTour INTEGER NOT NULL,
    idB INTEGER NOT NULL,
    idJoueur INTEGER NOT NULL
);

CREATE TABLE joue_a (
    PRIMARY KEY(idPartie,idJoueur),
    idPartie INTEGER NOT NULL,
    idJoueur INTEGER NOT NULL,
    score_partie INTEGER,
    gagnant BOOLEAN
);

ALTER TABLE BRIQUE ADD FOREIGN KEY (idCritere) REFERENCES CRITERE (idCritere);

ALTER TABLE USINE ADD FOREIGN KEY (idB) REFERENCES BRIQUE (idB);
ALTER TABLE USINE ADD FOREIGN KEY (dateFabrication) REFERENCES DATEF (dateFabrication);

ALTER TABLE OFFICIEL ADD FOREIGN KEY (idConstruction) REFERENCES CONSTRUCTION (idConstruction);

ALTER TABLE AMATEUR ADD FOREIGN KEY (idConstruction) REFERENCES CONSTRUCTION (idConstruction);

ALTER TABLE ETAPES ADD FOREIGN KEY (idConstruction) REFERENCES CONSTRUCTION (idConstruction);

ALTER TABLE TOUR ADD FOREIGN KEY (idB) REFERENCES BRIQUE (idB);

ALTER TABLE fabrique_un_type_de ADD FOREIGN KEY (idB) REFERENCES BRIQUE (idB);
ALTER TABLE fabrique_un_type_de ADD FOREIGN KEY (dateFabrication) REFERENCES DATEF (dateFabrication);
ALTER TABLE fabrique_un_type_de ADD FOREIGN KEY (idU) REFERENCES USINE (idU);

ALTER TABLE est_assemble ADD FOREIGN KEY (idConstruction) REFERENCES CONSTRUCTION (idConstruction);
ALTER TABLE est_assemble ADD FOREIGN KEY (idB) REFERENCES BRIQUE (idB);

ALTER TABLE suit ADD FOREIGN KEY (idConstruction) REFERENCES CONSTRUCTION (idConstruction);
ALTER TABLE suit ADD FOREIGN KEY (numE) REFERENCES ETAPES (numE);

ALTER TABLE accompagne ADD FOREIGN KEY (idConstruction) REFERENCES CONSTRUCTION (idConstruction);
ALTER TABLE accompagne ADD FOREIGN KEY (idB) REFERENCES BRIQUE (idB);
ALTER TABLE accompagne ADD FOREIGN KEY (idPhoto) REFERENCES PHOTO (idPhoto);

ALTER TABLE se_divise ADD FOREIGN KEY (numTour) REFERENCES TOUR (numTour);
ALTER TABLE se_divise ADD FOREIGN KEY (idPartie) REFERENCES PARTIE (idPartie);

ALTER TABLE joue ADD FOREIGN KEY (numTour) REFERENCES TOUR (numTour);
ALTER TABLE joue ADD FOREIGN KEY (idJoueur) REFERENCES JOUEUR (idJoueur);

ALTER TABLE joue_a ADD FOREIGN KEY (idJoueur) REFERENCES JOUEUR (idJoueur);
ALTER TABLE joue_a ADD FOREIGN KEY (idPartie) REFERENCES PARTIE (idPartie);

ALTER TABLE est_configure_selon ADD FOREIGN KEY (idParam) REFERENCES PARAMETRE (idParam);
ALTER TABLE est_configure_selon ADD FOREIGN KEY (idPartie) REFERENCES PARTIE (idPartie);

















