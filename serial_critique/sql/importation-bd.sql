DELETE FROM projet.TOUR;
DELETE FROM projet.BRIQUE;
DELETE FROM projet.CRITERE;
DELETE FROM projet.DATEF;
DELETE FROM projet.USINE;
DELETE FROM projet.CONSTRUCTION;
DELETE FROM projet.OFFICIEL;
DELETE FROM projet.AMATEUR;
DELETE FROM projet.ETAPES;
DELETE FROM projet.PHOTO;
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
INSERT INTO projet.PHOTO  (idPhoto, titre, descriptions, chemin_fichier) 
VALUES (2, 'Repaire de Pirates', 'Un repaire de pirates rempli de trésors.', '/images/repaire_pirates.png');
INSERT INTO projet.PHOTO  (idPhoto, titre, descriptions, chemin_fichier) 
VALUES (3, 'Faucon Millenium', 'Le célèbre Faucon Millenium prêt pour le décollage.', '/images/faucon_millenium.png');
INSERT INTO projet.PHOTO  (idPhoto, titre, descriptions, chemin_fichier) 
VALUES (4, 'Château de Glace', 'Un château magique fait entièrement de glace.', '/images/chateau_glace.png');
INSERT INTO projet.PHOTO  (idPhoto, titre, descriptions, chemin_fichier) 
VALUES (5, 'Brique Mystérieuse', 'Une brique spéciale avec un design unique.', '/images/brique_mysterieuse.png');


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
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (6, '2023-10-06', '2023-10-06');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (7, '2023-10-07', '2023-10-07');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (8, '2023-10-08', '2023-10-08');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (9, '2023-10-09', '2023-10-09');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (10, '2023-10-10', '2023-10-10');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (11, '2023-10-11', '2023-10-11');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (12, '2023-10-12', '2023-10-12');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (13, '2023-10-13', '2023-10-13');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (14, '2023-10-14', '2023-10-14');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (15, '2023-10-15', '2023-10-15');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (16, '2023-10-16', '2023-10-16');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (17, '2023-10-17', '2023-10-17');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (18, '2023-10-18', '2023-10-18');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (19, '2023-10-19', '2023-10-19');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (20, '2023-10-20', '2023-10-20');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (21, '2023-10-21', '2023-10-21');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (22, '2023-10-22', '2023-10-22');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (23, '2023-10-23', '2023-10-23');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (24, '2023-10-24', '2023-10-24');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (25, '2023-10-25', '2023-10-25');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (26, '2023-10-26', '2023-10-26');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (27, '2023-10-27', '2023-10-27');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (28, '2023-10-28', '2023-10-28');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (29, '2023-10-29', '2023-10-29');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (30, '2023-10-30', '2023-10-30');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (31, '2023-10-31', '2023-10-31');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (32, '2023-11-01', '2023-11-01');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (33, '2023-11-02', '2023-11-02');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (34, '2023-11-03', '2023-11-03');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (35, '2023-11-04', '2023-11-04');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (36, '2023-11-05', '2023-11-05');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (37, '2023-11-06', '2023-11-06');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (38, '2023-11-07', '2023-11-07');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (39, '2023-11-08', '2023-11-08');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (40, '2023-11-09', '2023-11-09');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (41, '2023-11-10', '2023-11-10');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (42, '2023-11-11', '2023-11-11');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (43, '2023-11-12', '2023-11-12');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (44, '2023-11-13', '2023-11-13');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (45, '2023-11-14', '2023-11-14');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (46, '2023-11-15', '2023-11-15');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (47, '2023-11-16', '2023-11-16');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (48, '2023-11-17', '2023-11-17');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (49, '2023-11-18', '2023-11-18');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (50, '2023-11-19', '2023-11-19');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (51, '2023-11-20', '2023-11-20');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (52, '2023-11-21', '2023-11-21');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (53, '2023-11-22', '2023-11-22');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (54, '2023-11-23', '2023-11-23');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (55, '2023-11-24', '2023-11-24');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (56, '2023-11-25', '2023-11-25');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (57, '2023-11-26', '2023-11-26');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (58, '2023-11-27', '2023-11-27');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (59, '2023-11-28', '2023-11-28');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (60, '2023-11-29', '2023-11-29');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (61, '2023-11-30', '2023-11-30');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (62, '2023-12-01', '2023-12-01');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (63, '2023-12-02', '2023-12-02');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (64, '2023-12-03', '2023-12-03');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (65, '2023-12-04', '2023-12-04');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (66, '2023-12-05', '2023-12-05');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (67, '2023-12-06', '2023-12-06');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (68, '2023-12-07', '2023-12-07');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (69, '2023-12-08', '2023-12-08');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (70, '2023-12-09', '2023-12-09');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (71, '2023-12-10', '2023-12-10');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (72, '2023-12-11', '2023-12-11');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (73, '2023-12-12', '2023-12-12');
INSERT INTO projet.PARTIE (idPartie, dateDeb, dateFin) 
VALUES (74, '2023-12-13', '2023-12-13');


INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (1, 1, 'Brique placée sur la grille', 1);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (2, 2, 'Brique défaussée', 1);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (3, 3, 'Brique placée sur la grille', 3);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (4, 4, 'Brique défaussée', 3);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (5, 5, 'Brique placée sur la grille', 3);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (6, 6, 'Brique défaussée', 3);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (7, 7, 'Brique placée sur la grille', 3);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (8, 8, 'Brique défaussée', 3);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (9, 9, 'Brique placée sur la grille', 3);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (10, 10, 'Brique défaussée', 3);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (11, 11, 'Brique placée sur la grille', 3);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (12, 12, 'Brique placée sur la grille', 2);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (13, 13, 'Brique défaussée', 2);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (14, 14, 'Brique placée sur la grille', 2);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (15, 15, 'Brique défaussée', 2);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (16, 16, 'Brique placée sur la grille', 2);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (17, 17, 'Brique placée sur la grille', 4);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (18, 18, 'Brique défaussée', 4);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (19, 19, 'Brique placée sur la grille', 4);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (20, 20, 'Brique défaussée', 4);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (21, 21, 'Brique placée sur la grille', 4);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (22, 22, 'Brique défaussée', 4);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (23, 23, 'Brique placée sur la grille', 4);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (24, 24, 'Brique défaussée', 5);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (25, 25, 'Brique placée sur la grille', 5);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (26, 26, 'Brique défaussée', 5);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (27, 27, 'Brique placée sur la grille', 6);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (28, 28, 'Brique défaussée', 6);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (29, 29, 'Brique placée sur la grille', 6);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (30, 30, 'Brique défaussée', 6);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (31, 31, 'Brique placée sur la grille', 6);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (32, 32, 'Brique défaussée', 6);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (33, 33, 'Brique défaussée', 7);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (34, 34, 'Brique placée sur la grille', 7);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (35, 35, 'Brique défaussée', 7);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie)
VALUES (36, 36, 'Brique placée sur la grille', 7);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie) 
VALUES (1, 576, 'Brique placée sur la grille', 58), 
       (2, 6, 'Brique placée sur la grille', 58), 
       (3, 8, 'Brique défaussée', 58),
       (4, 7, 'Brique placée sur la grille', 58),
       (5, 13, 'Brique défaussée', 58),
       (6, 14, 'Brique placée sur la grille', 58),
       (7, 15, 'Brique placée sur la grille', 58),
       (8, 16, 'Brique défaussée', 58);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie) 
VALUES (1, 512, 'Brique placée sur la grille', 59), 
       (2, 7, 'Brique défaussée', 59), 
       (3, 9, 'Brique placée sur la grille', 59),
       (4, 17, 'Brique placée sur la grille', 59),
       (5, 18, 'Brique défaussée', 59),
       (6, 19, 'Brique placée sur la grille', 59),
       (7, 20, 'Brique défaussée', 59),
       (8, 21, 'Brique placée sur la grille', 59),
       (9, 22, 'Brique défaussée', 59);
INSERT INTO projet.TOUR (numTour, idB, actions, idPartie) 
VALUES (1, 768, 'Brique placée sur la grille', 60), 
       (2, 10, 'Brique défaussée', 60), 
       (3, 12, 'Brique placée sur la grille', 60),
       (4, 23, 'Brique défaussée', 60),
       (5, 24, 'Brique placée sur la grille', 60),
       (6, 25, 'Brique défaussée', 60),
       (7, 26, 'Brique placée sur la grille', 60),
       (8, 27, 'Brique défaussée', 60),
       (9, 28, 'Brique placée sur la grille', 60),
       (10, 29, 'Brique défaussée', 60);



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

INSERT INTO projet.joue_a (idPartie, idJoueur, score_partie, gagnant)
VALUES
(1, 1, 18, TRUE),  
(1, 2, 15, FALSE), 
(2, 3, 20, TRUE),   
(2, 4, 12, FALSE), 
(3, 2, 22, TRUE),   
(3, 5, 19, FALSE), 
(4, 1, 25, TRUE),  
(4, 3, 21, FALSE),  
(5, 4, 30, TRUE),   
(5, 2, 27, FALSE);  



