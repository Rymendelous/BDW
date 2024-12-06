from model.model_pg import count_instances, top_couleur , min_defausse, score_min_joueur, score_max_joueur,joueur,min_defausse_idparties,max_defausse,max_defausse_idparties,min_pioche,min_pioche_idparties,max_pioche,max_pioche_idparties,generer_grille

REQUEST_VARS['photo'] = count_instances(SESSION['CONNEXION'], 'photo')
REQUEST_VARS['tour'] = count_instances(SESSION['CONNEXION'], 'tour')
REQUEST_VARS['joueur'] = count_instances(SESSION['CONNEXION'], 'joueur')

REQUEST_VARS['couleur'] = top_couleur(SESSION['CONNEXION'], 'brique')

REQUEST_VARS['min_defausse'] = min_defausse(SESSION['CONNEXION'], 'tour')
REQUEST_VARS['min_defausse_idparties'] = min_defausse_idparties(SESSION['CONNEXION'], 'tour')
REQUEST_VARS['max_defausse'] = max_defausse(SESSION['CONNEXION'], 'tour')
REQUEST_VARS['max_defausse_idparties'] = max_defausse_idparties(SESSION['CONNEXION'], 'tour')

REQUEST_VARS['score_min_joueur'] = score_min_joueur(SESSION['CONNEXION'], 'joue_a')
REQUEST_VARS['score_max_joueur'] = score_max_joueur(SESSION['CONNEXION'], 'joue_a')

REQUEST_VARS['joueurs'] = joueur(SESSION['CONNEXION'], 'joueur')

REQUEST_VARS['min_pioche'] = min_pioche(SESSION['CONNEXION'], 'tour')
REQUEST_VARS['min_pioche_idparties'] = min_pioche_idparties(SESSION['CONNEXION'], 'tour')
REQUEST_VARS['max_pioche'] = max_pioche(SESSION['CONNEXION'], 'tour')
REQUEST_VARS['max_pioche_idparties'] = max_pioche_idparties(SESSION['CONNEXION'], 'tour')

nb_lignes = 8
nb_colonnes = 9
REQUEST_VARS['grille'] = generer_grille(nb_lignes, nb_colonnes)