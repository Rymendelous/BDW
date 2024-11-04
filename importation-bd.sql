DELETE FROM BRIQUE;
DELETE FROM CRITERE;
DELETE FROM DATEF;
DELETE FROM USINE;
DELETE FROM CONSTRUCTION;
DELETE FROM OFFICIEL;
DELETE FROM AMATEUR;
DELETE FROM ETAPES;
DELETE FROM PHOTO;
DELETE FROM TOUR;
DELETE FROM JOUEUR;
DELETE FROM PARTIE;
DELETE FROM PARAMETRE;
DELETE FROM fabrique_un_type_de;
DELETE FROM est_assemble;
DELETE FROM suit;
DELETE FROM accompagne;
DELETE FROM se_divise;
DELETE FROM joue;
DELETE FROM joue_a;
DELETE FROM est_configure_selon;

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



