import psycopg
from psycopg import sql
from logzero import logger

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

def top_couleur(connexion, nom_table):
    query = sql.SQL('SELECT couleur FROM {table} GROUP BY couleur ORDER BY COUNT(idB) DESC LIMIT 5').format(table=sql.Identifier(nom_table))
    return execute_select_query(connexion, query)

def min_defausse(connexion, nom_table):
    query = sql.SQL("""SELECT COUNT(actions) AS nombre_defausses FROM {table} WHERE actions = 'Brique défaussée' GROUP BY idpartie ORDER BY nombre_defausses ASC LIMIT 3""").format(table=sql.Identifier(nom_table))
    return execute_select_query(connexion, query)

def min_defausse_idparties(connexion, nom_table):
    query = sql.SQL("""SELECT idpartie FROM {table} WHERE actions = 'Brique défaussée' GROUP BY idpartie ORDER BY COUNT(actions) ASC LIMIT 3""").format(table=sql.Identifier(nom_table))
    return execute_select_query(connexion, query)

def score_min_joueur(connexion, nom_table):
    query = sql.SQL('SELECT MIN(score_partie) FROM {table} GROUP BY idjoueur ORDER BY idjoueur').format(table=sql.Identifier(nom_table))
    return execute_select_query(connexion, query)

def score_max_joueur(connexion, nom_table):
    query = sql.SQL('SELECT MAX(score_partie) FROM {table} GROUP BY idjoueur ORDER BY idjoueur').format(table=sql.Identifier(nom_table))
    return execute_select_query(connexion, query)


def joueur(connexion, nom_table):
    query = sql.SQL('SELECT prenom FROM {table} GROUP BY idjoueur ORDER BY idjoueur').format(table=sql.Identifier(nom_table))
    return execute_select_query(connexion, query)