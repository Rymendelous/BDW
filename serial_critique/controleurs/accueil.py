# Importation des fonctions nécessaires pour effectuer des requêtes sur la base de données
from model.model_pg import count_instances, top_couleur, min_defausse, score_min_joueur, score_max_joueur, joueur, \
    min_defausse_idparties, max_defausse, max_defausse_idparties, min_pioche, min_pioche_idparties, max_pioche, \
    max_pioche_idparties, brique_plus_grandes

# Calcul du nombre d'instances pour chaque entité et stockage dans REQUEST_VARS
REQUEST_VARS['photo'] = count_instances(SESSION['CONNEXION'], 'photo')  # Nombre total de photos
REQUEST_VARS['tour'] = count_instances(SESSION['CONNEXION'], 'tour')    # Nombre total de tours
REQUEST_VARS['joueur'] = count_instances(SESSION['CONNEXION'], 'joueur')  # Nombre total de joueurs

# Récupération des 5 couleurs de briques les plus fréquentes
REQUEST_VARS['couleur'] = top_couleur(SESSION['CONNEXION'], 'brique')

# Récupération des parties avec le plus petit nombre de briques défaussées
REQUEST_VARS['min_defausse'] = min_defausse(SESSION['CONNEXION'], 'tour')
REQUEST_VARS['min_defausse_idparties'] = min_defausse_idparties(SESSION['CONNEXION'], 'tour')

# Récupération des parties avec le plus grand nombre de briques défaussées
REQUEST_VARS['max_defausse'] = max_defausse(SESSION['CONNEXION'], 'tour')
REQUEST_VARS['max_defausse_idparties'] = max_defausse_idparties(SESSION['CONNEXION'], 'tour')

# Récupération du score minimal et maximal par joueur
REQUEST_VARS['score_min_joueur'] = score_min_joueur(SESSION['CONNEXION'], 'joue_a')
REQUEST_VARS['score_max_joueur'] = score_max_joueur(SESSION['CONNEXION'], 'joue_a')

# Liste des prénoms des joueurs
REQUEST_VARS['joueurs'] = joueur(SESSION['CONNEXION'], 'joueur')

# Récupération des parties avec le plus petit nombre de briques piochées
REQUEST_VARS['min_pioche'] = min_pioche(SESSION['CONNEXION'], 'tour')
REQUEST_VARS['min_pioche_idparties'] = min_pioche_idparties(SESSION['CONNEXION'], 'tour')

# Récupération des parties avec le plus grand nombre de briques piochées
REQUEST_VARS['max_pioche'] = max_pioche(SESSION['CONNEXION'], 'tour')
REQUEST_VARS['max_pioche_idparties'] = max_pioche_idparties(SESSION['CONNEXION'], 'tour')

# Liste des briques les plus grandes (triées par taille décroissante)
REQUEST_VARS['brique_plus_grandes'] = brique_plus_grandes(SESSION['CONNEXION'], 'brique')
