from model.model_pg import count_instances, top_couleur

REQUEST_VARS['photo'] = count_instances(SESSION['CONNEXION'], 'photo')
REQUEST_VARS['tour'] = count_instances(SESSION['CONNEXION'], 'tour')
REQUEST_VARS['joueur'] = count_instances(SESSION['CONNEXION'], 'joueur')

REQUEST_VARS['couleur'] = top_couleur(SESSION['CONNEXION'], 'brique')

