from model.model_pg import pioche, get_infos_brique, generer_grille

REQUEST_VARS['option1'] = pioche(SESSION['CONNEXION'], 'brique')

#fais en sorte que les brique du formulaire soient toutes differentes
while True:
    option2 = pioche(SESSION['CONNEXION'], 'brique')
    if option2 != REQUEST_VARS['option1']: 
        REQUEST_VARS['option2'] = option2
        break

while True:
    option3 = pioche(SESSION['CONNEXION'], 'brique')
    if option3 != REQUEST_VARS['option1'] and option3 != REQUEST_VARS['option2']:
        REQUEST_VARS['option3'] = option3
        break

while True:
    option4 = pioche(SESSION['CONNEXION'], 'brique')
    if option4 != REQUEST_VARS['option1'] and option4 != REQUEST_VARS['option2'] and option4 != REQUEST_VARS['option3']: 
        REQUEST_VARS['option4'] = option4
        break

if POST and 'bouton_valider' in POST: 
    brique_selectionnee = POST.get('brique_selectionnee')  
    infos_brique = get_infos_brique(SESSION['CONNEXION'], 'brique', brique_selectionnee)
    REQUEST_VARS['infos_brique'] = infos_brique
  
# Génére la grille statique
nb_lignes = 8
nb_colonnes = 9
REQUEST_VARS['grille'] = generer_grille(nb_lignes, nb_colonnes)
