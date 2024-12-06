from model.model_pg import get_serie_by_name, insert_serie,generer_grille,pioche,get_infos_brique
from controleurs.includes import add_activity


if 'pioche_options' not in REQUEST_VARS or not REQUEST_VARS['pioche_options']:
    REQUEST_VARS['pioche_options'] = [pioche(SESSION['CONNEXION'], 'brique') for _ in range(4)]  

# Si le formulaire est soumis
if POST and 'bouton_valider' in POST:
    if 'brique_selectionnee' in POST:
        brique_id = POST['brique_selectionnee'][0]  
        brique_infos = get_infos_brique(SESSION['CONNEXION'], 'brique', brique_id)
        if brique_infos:
            REQUEST_VARS['brique_infos'] = brique_infos
            # Met à jour la pioche en remplaçant la brique sélectionnée
            REQUEST_VARS['pioche_options'].remove(brique_id)  # Retire la brique sélectionnée
            nouvelle_brique = pioche(SESSION['CONNEXION'], 'brique')  # Ajoute une nouvelle brique aléatoire
            if nouvelle_brique and nouvelle_brique not in REQUEST_VARS['pioche_options']:
                REQUEST_VARS['pioche_options'].append(nouvelle_brique)
        else:
            REQUEST_VARS['message'] = f"Aucune information trouvée pour la brique ID {brique_id}."
            REQUEST_VARS['message_class'] = "alert-error"


nb_lignes = 8
nb_colonnes = 9
REQUEST_VARS['grille'] = generer_grille(nb_lignes, nb_colonnes)

