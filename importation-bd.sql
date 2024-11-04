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

INSERT INTO PHOTO (idPhoto, titre, descriptions, chemin_fichier) 
VALUES (1, 'Construction Château', 'Un magnifique château médiéval en briques.', '/images/chateau_medieval.png');
INSERT INTO PHOTO (idPhoto, titre, descriptions, chemin_fichier) 
VALUES (2, 'Repaire de Pirates', 'Un repaire de pirates rempli de trésors.', '/images/repaire_pirates.png');
INSERT INTO PHOTO (idPhoto, titre, descriptions, chemin_fichier) 
VALUES (3, 'Faucon Millenium', 'Le célèbre Faucon Millenium prêt pour le décollage.', '/images/faucon_millenium.png');
INSERT INTO PHOTO (idPhoto, titre, descriptions, chemin_fichier) 
VALUES (4, 'Château de Glace', 'Un château magique fait entièrement de glace.', '/images/chateau_glace.png');
INSERT INTO PHOTO (idPhoto, titre, descriptions, chemin_fichier) 
VALUES (5, 'Brique Mystérieuse', 'Une brique spéciale avec un design unique.', '/images/brique_mysterieuse.png');

INSERT INTO TOUR (numTour, idB, actions) 
VALUES (1, 101, 'Brique placée sur la grille.');
INSERT INTO TOUR (numTour, idB, actions) 
VALUES (2, 102, 'Brique défaussée.');
INSERT INTO TOUR (numTour, idB, actions) 
VALUES (3, 103, 'Brique placée sur la grille.');
INSERT INTO TOUR (numTour, idB, actions) 
VALUES (4, 104, 'Brique placée sur la grille.');
INSERT INTO TOUR (numTour, idB, actions) 
VALUES (5, 105, 'Brique défaussée.');



INSERT INTO JOUEUR (idJoueur, prenom, date_inscription, avatar) 
VALUES (1, 'Alice', '2023-05-01', 'alice_avatar.png');
INSERT INTO JOUEUR (idJoueur, prenom, date_inscription, avatar) 
VALUES (2, 'Bob', '2023-06-15', 'bob_avatar.png');
INSERT INTO JOUEUR (idJoueur, prenom, date_inscription, avatar) 
VALUES (3, 'Charlie', '2023-07-20', 'charlie_avatar.png');
INSERT INTO JOUEUR (idJoueur, prenom, date_inscription, avatar) 
VALUES (4, 'Diana', '2023-08-10', 'diana_avatar.png');
INSERT INTO JOUEUR (idJoueur, prenom, date_inscription, avatar) 
VALUES (5, 'Ethan', '2023-09-05', 'ethan_avatar.png');

INSERT INTO PARTIE (idPartie, dateDeb, dateFin) 
VALUES (1, '2023-10-01', '2023-10-01');
INSERT INTO PARTIE (idPartie, dateDeb, dateFin) 
VALUES (2, '2023-10-02', '2023-10-02');
INSERT INTO PARTIE (idPartie, dateDeb, dateFin) 
VALUES (3, '2023-10-03', '2023-10-03');
INSERT INTO PARTIE (idPartie, dateDeb, dateFin) 
VALUES (4, '2023-10-04', '2023-10-04');
INSERT INTO PARTIE (idPartie, dateDeb, dateFin) 
VALUES (5, '2023-10-05', '2023-10-05');

INSERT INTO PARAMETRE (idParam, propriete, valeur) 
VALUES (1, 'Durée limite', '60 minutes');
INSERT INTO PARAMETRE (idParam, propriete, valeur) 
VALUES (2, 'Nombre de briques', '4');
INSERT INTO PARAMETRE (idParam, propriete, valeur) 
VALUES (3, 'Difficulté', 'Moyenne');
INSERT INTO PARAMETRE (idParam, propriete, valeur) 
VALUES (4, 'Temps de réflexion', '30 secondes par tour');
INSERT INTO PARAMETRE (idParam, propriete, valeur) 
VALUES (5, 'Nombre maximum de joueurs', '4');


