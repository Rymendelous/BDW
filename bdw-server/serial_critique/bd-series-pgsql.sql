DROP SCHEMA IF EXISTS projet CASCADE;
CREATE SCHEMA IF NOT EXISTS projet;
SET search_path TO projet;

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
DROP TABLE IF EXISTS est_assemble;
DROP TABLE IF EXISTS suit;
DROP TABLE IF EXISTS accompagne;
DROP TABLE IF EXISTS se_divise;
DROP TABLE IF EXISTS joue;
DROP TABLE IF EXISTS joue_a;
DROP TABLE IF EXISTS est_configure_selon;

CREATE TABLE BRIQUE(
PRIMARY KEY(idB),
idB serial,
nomB VARCHAR(50),
longueur integer,
largeur integer,
hauteur float,
forme VARCHAR(50),
couleur varchar(20),
mots_cles VARCHAR(100),
idCritere INTEGER 
);

CREATE TABLE CRITERE(
    PRIMARY KEY (idCritere),
    idCritere INTEGER,
    nom VARCHAR(255),
    commentaire VARCHAR(255)
);

CREATE TABLE DATEF(
    PRIMARY KEY (dateFabrication),
    dateFabrication VARCHAR(50)
);

CREATE TABLE USINE(
    PRIMARY KEY (idU,dateFabrication),
    idU INTEGER,
    dateFabrication VARCHAR(50),
    ville VARCHAR(50),
    pays  VARCHAR(50),
    idB serial
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
    PRIMARY KEY(numE),
    numE INTEGER NOT NULL,
    images TEXT,
    instruction TEXT
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
    idB serial,
    actions TEXT
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
   PRIMARY KEY(idParam),
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
    idB serial,
    dateFabrication VARCHAR(50),
    quantite INTEGER 
);

CREATE TABLE est_assemble(
    PRIMARY KEY(idConstruction,idB),
    idB serial,
    idConstruction INTEGER NOT NULL  
);

CREATE TABLE suit(
    PRIMARY KEY(idConstruction,numE),
    idConstruction INTEGER NOT NULL,
    numE INTEGER NOT NULL
);

CREATE TABLE accompagne(
    PRIMARY KEY(idB,idConstruction,idPhoto),
    idB serial,
    idConstruction INTEGER NOT NULL,
    idPhoto INTEGER NOT NULL
);

CREATE TABLE se_divise(
    PRIMARY KEY(numTour,idB,idPartie),
    numTour INTEGER NOT NULL,
    idB serial,
    idPartie INTEGER NOT NULL
);

CREATE TABLE joue(
    PRIMARY KEY(numTour,idB,idJoueur),
    numTour INTEGER NOT NULL,
    idB serial,
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

ALTER TABLE TOUR ADD FOREIGN KEY (idB) REFERENCES BRIQUE (idB);

ALTER TABLE fabrique_un_type_de ADD FOREIGN KEY (idB) REFERENCES BRIQUE (idB);
ALTER TABLE fabrique_un_type_de ADD FOREIGN KEY (dateFabrication) REFERENCES DATEF (dateFabrication);


ALTER TABLE est_assemble ADD FOREIGN KEY (idConstruction) REFERENCES CONSTRUCTION (idConstruction);
ALTER TABLE est_assemble ADD FOREIGN KEY (idB) REFERENCES BRIQUE (idB);

ALTER TABLE suit ADD FOREIGN KEY (idConstruction) REFERENCES CONSTRUCTION (idConstruction);
ALTER TABLE suit ADD FOREIGN KEY (numE) REFERENCES ETAPES (numE);

ALTER TABLE accompagne ADD FOREIGN KEY (idConstruction) REFERENCES CONSTRUCTION (idConstruction);
ALTER TABLE accompagne ADD FOREIGN KEY (idB) REFERENCES BRIQUE (idB);
ALTER TABLE accompagne ADD FOREIGN KEY (idPhoto) REFERENCES PHOTO (idPhoto);

ALTER TABLE se_divise ADD FOREIGN KEY (numTour,idB) REFERENCES TOUR (numTour,idB);
ALTER TABLE se_divise ADD FOREIGN KEY (idPartie) REFERENCES PARTIE (idPartie);

ALTER TABLE joue ADD FOREIGN KEY (numTour,idB) REFERENCES TOUR (numTour,idB);
ALTER TABLE joue ADD FOREIGN KEY (idJoueur) REFERENCES JOUEUR (idJoueur);

ALTER TABLE joue_a ADD FOREIGN KEY (idJoueur) REFERENCES JOUEUR (idJoueur);
ALTER TABLE joue_a ADD FOREIGN KEY (idPartie) REFERENCES PARTIE (idPartie);

ALTER TABLE est_configure_selon ADD FOREIGN KEY (idParam) REFERENCES PARAMETRE (idParam);
ALTER TABLE est_configure_selon ADD FOREIGN KEY (idPartie) REFERENCES PARTIE (idPartie);

DELETE FROM projet.BRIQUE;
DELETE FROM projet.CRITERE;
DELETE FROM projet.DATEF;
DELETE FROM projet.USINE;
DELETE FROM projet.CONSTRUCTION;
DELETE FROM projet.OFFICIEL;
DELETE FROM projet.AMATEUR;
DELETE FROM projet.ETAPES;
DELETE FROM projet.PHOTO;
DELETE FROM projet.TOUR;
DELETE FROM projet.JOUEUR;
DELETE FROM projet.PARTIE;
DELETE FROM projet.PARAMETRE;
DELETE FROM projet.fabrique_un_type_de;
DELETE FROM projet.est_assemble;
DELETE FROM projet.suit;
DELETE FROM projet.accompagne;
DELETE FROM projet.se_divise;
DELETE FROM projet.joue;
DELETE FROM projet.joue_a;
DELETE FROM projet.est_configure_selon;

INSERT into projet.BRIQUE (idB,nomB,longueur,largeur,hauteur,forme,couleur,mots_cles,idCritere)
    (SELECT id AS idB, NULL AS nomB, longueur, largeur, hauteur, NULL AS forme, couleur, NULL AS mots_cles, NULL AS idCritere 
    FROM legos.piece);

INSERT INTO projet.CRITERE (idCritere, nom, commentaire) VALUES (1, 'Couleur différente', 'La pièce peut être remplacée par une autre de la même forme mais dune couleur différente.');
INSERT INTO projet.CRITERE (idCritere, nom, commentaire) VALUES (2, 'Trou supplémentaire', 'La pièce peut avoir un trou supplémentaire pour des connexions alternatives.');
INSERT INTO projet.CRITERE (idCritere, nom, commentaire) VALUES (3, 'Dimensions similaires', 'Les dimensions de la pièce peuvent varier légèrement, mais elles doivent rester fonctionnelles.');
INSERT INTO projet.CRITERE (idCritere, nom, commentaire) VALUES (4, 'Forme alternative', 'Une pièce de forme différente peut être utilisée tant quelle sajuste au modèle.');
INSERT INTO projet.CRITERE (idCritere, nom, commentaire) VALUES (5, 'Flexibilité', 'La pièce peut être flexible ou rigide, selon les besoins du modèle.');

INSERT INTO projet.DATEF (dateFabrication) VALUES ('2023-01-15');
INSERT INTO projet.DATEF (dateFabrication) VALUES ('2023-02-20');
INSERT INTO projet.DATEF (dateFabrication) VALUES ('2023-03-10');
INSERT INTO projet.DATEF (dateFabrication) VALUES ('2023-04-05');
INSERT INTO projet.DATEF (dateFabrication) VALUES ('2023-05-30');

INSERT INTO projet.USINE (idU, ville, pays, idB) VALUES (1, 'Paris', 'France', 1);
INSERT INTO projet.USINE (idU, ville, pays, idB) VALUES (2, 'Berlin', 'Allemagne', 2);
INSERT INTO projet.USINE (idU, ville, pays, idB) VALUES (3, 'Milan', 'Italie', 3);
INSERT INTO projet.USINE (idU, ville, pays, idB) VALUES (4, 'Madrid', 'Espagne', 4);
INSERT INTO projet.USINE (idU, ville, pays, idB) VALUES (5, 'Londres', 'Royaume-Uni', 5);

INSERT INTO projet.CONSTRUCTION(idConstruction, nomC, theme, descriptions, annee_sortie, longueur, largeur, hauteur) 
VALUES (1, 'Repaire de Pirates', 'Aventure', 'Un repaire secret de pirates sur une île déserte.', 2020, 150, 120, 80);
INSERT INTO projet.CONSTRUCTION(idConstruction, nomC, theme, descriptions, annee_sortie, longueur, largeur, hauteur) 
VALUES (2, 'Château Médiéval', 'Histoire', 'Un majestueux château médiéval avec des tours et un pont-levis.', 2019, 200, 150, 100);
INSERT INTO projet.CONSTRUCTION(idConstruction, nomC, theme, descriptions, annee_sortie, longueur, largeur, hauteur) 
VALUES (3, 'Faucon Millenium', 'Science-fiction', 'Le célèbre vaisseau spatial de Star Wars, le Faucon Millenium.', 2021, 250, 200, 150);
INSERT INTO projet.CONSTRUCTION(idConstruction, nomC, theme, descriptions, annee_sortie, longueur, largeur, hauteur) 
VALUES (4, 'Ville Futuriste', 'Futur', 'Une ville imaginaire avec des bâtiments modernes et des technologies avancées.', 2022, 300, 250, 200);
INSERT INTO projet.CONSTRUCTION(idConstruction, nomC, theme, descriptions, annee_sortie, longueur, largeur, hauteur) 
VALUES (5, 'Base Lunaire', 'Espace', 'Une base de recherche sur la Lune pour explorer de nouveaux horizons.', 2023, 180, 140, 90);


INSERT INTO projet.ETAPES(numE, images, instruction) 
VALUES (1, 'etape1.png', 'Commencez par assembler les murs de la base.');
INSERT INTO projet.ETAPES(numE, images, instruction) 
VALUES (2, 'etape2.png', 'Ajoutez le toit de la construction.');
INSERT INTO projet.ETAPES(numE, images, instruction) 
VALUES (3, 'etape3.png', 'Installez les fenêtres et les portes.');
INSERT INTO projet.ETAPES(numE, images, instruction) 
VALUES (4, 'etape4.png', 'Décorez la construction avec des éléments supplémentaires.');
INSERT INTO projet.ETAPES(numE, images, instruction) 
VALUES (5, 'etape5.png', 'Finalisez en vérifiant chaque détail.');

INSERT INTO projet.PHOTO (idPhoto, titre, descriptions, chemin_fichier) 
VALUES (1, 'Construction Château', 'Un magnifique château médiéval en briques.', '/images/chateau_medieval.png');
INSERT INTO projet.PHOTO (idPhoto, titre, descriptions, chemin_fichier) 
VALUES (2, 'Repaire de Pirates', 'Un repaire de pirates rempli de trésors.', '/images/repaire_pirates.png');
INSERT INTO projet.PHOTO (idPhoto, titre, descriptions, chemin_fichier) 
VALUES (3, 'Faucon Millenium', 'Le célèbre Faucon Millenium prêt pour le décollage.', '/images/faucon_millenium.png');
INSERT INTO projet.PHOTO (idPhoto, titre, descriptions, chemin_fichier) 
VALUES (4, 'Château de Glace', 'Un château magique fait entièrement de glace.', '/images/chateau_glace.png');
INSERT INTO projet.PHOTO (idPhoto, titre, descriptions, chemin_fichier) 
VALUES (5, 'Brique Mystérieuse', 'Une brique spéciale avec un design unique.', '/images/brique_mysterieuse.png');

INSERT INTO projet.TOUR (numTour, idB, actions) 
VALUES (1, 101, 'Brique placée sur la grille.');
INSERT INTO projet.TOUR (numTour, idB, actions) 
VALUES (2, 102, 'Brique défaussée.');
INSERT INTO projet.TOUR (numTour, idB, actions) 
VALUES (3, 103, 'Brique placée sur la grille.');
INSERT INTO projet.TOUR (numTour, idB, actions) 
VALUES (4, 104, 'Brique placée sur la grille.');
INSERT INTO projet.TOUR (numTour, idB, actions) 
VALUES (5, 105, 'Brique défaussée.');



INSERT INTO projet.JOUEUR (idJoueur, prenom, date_inscription, avatar) 
VALUES (1, 'Alice', '2023-05-01', 'alice_avatar.png');
INSERT INTO projet.JOUEUR (idJoueur, prenom, date_inscription, avatar) 
VALUES (2, 'Bob', '2023-06-15', 'bob_avatar.png');
INSERT INTO projet.JOUEUR (idJoueur, prenom, date_inscription, avatar) 
VALUES (3, 'Charlie', '2023-07-20', 'charlie_avatar.png');
INSERT INTO projet.JOUEUR (idJoueur, prenom, date_inscription, avatar) 
VALUES (4, 'Diana', '2023-08-10', 'diana_avatar.png');
INSERT INTO projet.JOUEUR (idJoueur, prenom, date_inscription, avatar) 
VALUES (5, 'Ethan', '2023-09-05', 'ethan_avatar.png');

INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (1, '2023-10-01', '2023-10-01');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (2, '2023-10-02', '2023-10-02');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (3, '2023-10-03', '2023-10-03');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (4, '2023-10-04', '2023-10-04');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (5, '2023-10-05', '2023-10-05');

INSERT INTO projet.PARAMETRE (idParam, propriete, valeur) 
VALUES (1, 'Durée limite', '60 minutes');
INSERT INTO projet.PARAMETRE (idParam, propriete, valeur) 
VALUES (2, 'Nombre de briques', '4');
INSERT INTO projet.PARAMETRE (idParam, propriete, valeur) 
VALUES (3, 'Difficulté', 'Moyenne');
INSERT INTO projet.PARAMETRE (idParam, propriete, valeur) 
VALUES (4, 'Temps de réflexion', '30 secondes par tour');
INSERT INTO projet.PARAMETRE (idParam, propriete, valeur) 
VALUES (5, 'Nombre maximum de joueurs', '4');




