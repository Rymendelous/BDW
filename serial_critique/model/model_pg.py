import psycopg
import random
from psycopg import sql
from logzero import logger

#j'ai gardé les fonctions qui étaient déjà présente dans serial_critique au cas ou j'en ai besoin pour plus tard
def execute_select_query(connexion, query, params=[]):
    """
    Méthode générique pour exécuter une requête SELECT (qui peut retourner plusieurs instances).
    Utilisée par des fonctions plus spécifiques.
    """
    with connexion.cursor() as cursor:
        try:
            cursor.execute(query, params)
            result = cursor.fetchall()
            return result 
        except psycopg.Error as e:
            logger.error(e)
    return None

def execute_other_query(connexion, query, params=[]):
    """
    Méthode générique pour exécuter une requête INSERT, UPDATE, DELETE.
    Utilisée par des fonctions plus spécifiques.
    """
    with connexion.cursor() as cursor:
        try:
            cursor.execute(query, params)
            result = cursor.rowcount
            return result 
        except psycopg.Error as e:
            logger.error(e)
    return None

def get_instances(connexion, nom_table):
    """
    Retourne les instances de la table nom_table
    String nom_table : nom de la table
    """
    query = sql.SQL('SELECT * FROM {table}').format(table=sql.Identifier(nom_table), )
    return execute_select_query(connexion, query)

#Nombre d’instances pour 3 tables de votre choix 
def count_instances(connexion, nom_table):
    """
    Retourne le nombre d'instances de la table nom_table
    String nom_table : nom de la table
    """
    query = sql.SQL('SELECT COUNT(*) AS nb FROM {table}').format(table=sql.Identifier(nom_table))
    return execute_select_query(connexion, query)

def get_episodes_for_num(connexion, numero):
    """
    Retourne le titre des épisodes numérotés numero
    Integer numero : numéro des épisodes
    """
    query = 'SELECT titre FROM episodes where numéro=%s'
    return execute_select_query(connexion, query, [numero])

def get_serie_by_name(connexion, nom_serie):
    """
    Retourne les informations sur la série nom_serie (utilisé pour vérifier qu'une série existe)
    String nom_serie : nom de la série
    """
    query = 'SELECT * FROM series where nomsérie=%s'
    return execute_select_query(connexion, query, [nom_serie])

def insert_serie(connexion, nom_serie):
    """
    Insère une nouvelle série dans la BD
    String nom_serie : nom de la série
    Retourne le nombre de tuples insérés, ou None
    """
    query = 'INSERT INTO series VALUES(%s)'
    return execute_other_query(connexion, query, [nom_serie])

def get_table_like(connexion, nom_table, like_pattern):
    """
    Retourne les instances de la table nom_table dont le nom correspond au motif like_pattern
    String nom_table : nom de la table
    String like_pattern : motif pour une requête LIKE
    """
    motif = '%' + like_pattern + '%'
    nom_att = 'nomsérie'  # nom attribut dans séries (à éviter)
    if nom_table == 'actrices':  # à éviter
        nom_att = 'nom'  # nom attribut dans actrices (à éviter)
    query = sql.SQL("SELECT * FROM {} WHERE {} ILIKE {}").format(
        sql.Identifier(nom_table),
        sql.Identifier(nom_att),
        sql.Placeholder())
    #    like_pattern=sql.Placeholder(name=like_pattern))
    return execute_select_query(connexion, query, [motif])


# Top-5 des couleurs ayant le plus de briques
def top_couleur(connexion, nom_table):
    # Retourne les cinq couleurs ayant le plus de briques, triées par ordre décroissant du nombre de briques
    query = sql.SQL('SELECT couleur FROM {table} GROUP BY couleur ORDER BY COUNT(idB) DESC LIMIT 5').format(table=sql.Identifier(nom_table))
    return execute_select_query(connexion, query)

# Pour chaque joueur, son score minimal
def score_min_joueur(connexion, nom_table):
    # Retourne le score minimal pour chaque joueur, trié par identifiant du joueur
    query = sql.SQL('SELECT MIN(score_partie) FROM {table} GROUP BY idjoueur ORDER BY idjoueur').format(table=sql.Identifier(nom_table))
    return execute_select_query(connexion, query)

# Pour chaque joueur, son score maximal
def score_max_joueur(connexion, nom_table):
    # Retourne le score maximal pour chaque joueur, trié par identifiant du joueur
    query = sql.SQL('SELECT MAX(score_partie) FROM {table} GROUP BY idjoueur ORDER BY idjoueur').format(table=sql.Identifier(nom_table))
    return execute_select_query(connexion, query)

# Liste des prénoms des joueurs
def joueur(connexion, nom_table):
    # Retourne les prénoms des joueurs, triés par identifiant du joueur
    query = sql.SQL('SELECT prenom FROM {table} GROUP BY idjoueur ORDER BY idjoueur').format(table=sql.Identifier(nom_table))
    return execute_select_query(connexion, query)

# Parties avec le plus petit et le plus grand nombre de pièces défaussées
def min_defausse(connexion, nom_table):
    # Retourne les trois parties avec le plus petit nombre de briques défaussées
    query = sql.SQL("""SELECT COUNT(actions) AS nombre_defausses FROM {table} WHERE actions = 'Brique défaussée' 
                       GROUP BY idpartie ORDER BY nombre_defausses ASC LIMIT 3""").format(table=sql.Identifier(nom_table))
    return execute_select_query(connexion, query)

def min_defausse_idparties(connexion, nom_table):
    # Retourne les identifiants des trois parties avec le plus petit nombre de briques défaussées
    query = sql.SQL("""SELECT idpartie FROM {table} WHERE actions = 'Brique défaussée' 
                       GROUP BY idpartie ORDER BY COUNT(actions) ASC LIMIT 3""").format(table=sql.Identifier(nom_table))
    return execute_select_query(connexion, query)

def max_defausse(connexion, nom_table):
    # Retourne les trois parties avec le plus grand nombre de briques défaussées
    query = sql.SQL("""SELECT COUNT(actions) AS nombre_defausses FROM {table} WHERE actions = 'Brique défaussée' 
                       GROUP BY idpartie ORDER BY nombre_defausses DESC LIMIT 3""").format(table=sql.Identifier(nom_table))
    return execute_select_query(connexion, query)

def max_defausse_idparties(connexion, nom_table):
    # Retourne les identifiants des trois parties avec le plus grand nombre de briques défaussées
    query = sql.SQL("""SELECT idpartie FROM {table} WHERE actions = 'Brique défaussée' 
                       GROUP BY idpartie ORDER BY COUNT(actions) DESC LIMIT 3""").format(table=sql.Identifier(nom_table))
    return execute_select_query(connexion, query)

# Parties avec le plus petit et le plus grand nombre de pièces piochées
def min_pioche(connexion, nom_table):
    # Retourne les trois parties avec le plus petit nombre de briques placées sur la grille
    query = sql.SQL("""SELECT COUNT(actions) AS nombre_defausses FROM {table} WHERE actions = 'Brique placée sur la grille' 
                       GROUP BY idpartie ORDER BY nombre_defausses ASC LIMIT 3""").format(table=sql.Identifier(nom_table))
    return execute_select_query(connexion, query)

def min_pioche_idparties(connexion, nom_table):
    # Retourne les identifiants des trois parties avec le plus petit nombre de briques placées sur la grille
    query = sql.SQL("""SELECT idpartie FROM {table} WHERE actions = 'Brique placée sur la grille' 
                       GROUP BY idpartie ORDER BY COUNT(actions) ASC LIMIT 3""").format(table=sql.Identifier(nom_table))
    return execute_select_query(connexion, query)

def max_pioche(connexion, nom_table):
    # Retourne les trois parties avec le plus grand nombre de briques placées sur la grille
    query = sql.SQL("""SELECT COUNT(actions) AS nombre_defausses FROM {table} WHERE actions = 'Brique placée sur la grille' 
                       GROUP BY idpartie ORDER BY nombre_defausses DESC LIMIT 3""").format(table=sql.Identifier(nom_table))
    return execute_select_query(connexion, query)

def max_pioche_idparties(connexion, nom_table):
    # Retourne les identifiants des trois parties avec le plus grand nombre de briques placées sur la grille
    query = sql.SQL("""SELECT idpartie FROM {table} WHERE actions = 'Brique placée sur la grille' 
                       GROUP BY idpartie ORDER BY COUNT(actions) DESC LIMIT 3""").format(table=sql.Identifier(nom_table))
    return execute_select_query(connexion, query)

# Plus grandes briques
def brique_plus_grandes(connexion, nom_table):
    # Retourne les identifiants des briques, triés par taille décroissante (longueur * largeur)
    query = sql.SQL("""SELECT idb FROM {table} ORDER BY longueur*largeur DESC""").format(table=sql.Identifier(nom_table))
    return execute_select_query(connexion, query)



# Génère une grille
def generer_grille(nb_lignes, nb_colonnes):
    # Génère une grille avec les dimensions spécifiées et une configuration de hachures prédéfinie
    lignes_hachures = [
        [],
        [1, 2, 5, 6],
        [1, 3, 5, 7],
        [1, 2, 3, 5, 7],
        [1, 2, 3, 5, 7],
        [1, 3, 5, 7],
        [1, 2, 5, 6],
        []
    ]
    return {"lignes": nb_lignes, "colonnes": nb_colonnes, "hachures": lignes_hachures}

# Piocher une brique aléatoire
def pioche(connexion, nom_table):
    # Sélectionne aléatoirement une brique avec des dimensions inférieures ou égales à 2
    try:
        query = sql.SQL("SELECT idB FROM {table} WHERE longueur <= 2 OR largeur <= 2").format(table=sql.Identifier(nom_table))
        briques = execute_select_query(connexion, query)
        if not briques:
            print("Aucune brique trouvée avec les critères.")
            return None
        brique_choisie = random.choice(briques)
        return brique_choisie[0]
    except Exception as e:
        print(f"Erreur lors de la récupération de la brique : {e}")
        return None

# Obtenir les informations d'une brique
def get_infos_brique(connexion, nom_table, brique_selectionnee):
    # Retourne les informations complètes de la brique sélectionnée
    try:
        query = sql.SQL("SELECT * FROM {table} WHERE idB = %s").format(table=sql.Identifier(nom_table))
        result = execute_select_query(connexion, query, [brique_selectionnee])
        if result:
            return result
        else:
            print(f"Aucune brique trouvée avec l'id {brique_selectionnee}.")
            return None
    except Exception as e:
        print(f"Erreur lors de l'exécution de la requête : {e}")
        return None
