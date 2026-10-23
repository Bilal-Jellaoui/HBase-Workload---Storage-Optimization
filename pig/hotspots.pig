-- ============================================================
-- hotspots.pig — Détection des Hot Spots HBase (L4)
-- Projet BMA — Master Big Data — Université Ibn Tofail
-- Résultat : 4 serveurs avec RPS > 500
-- ============================================================

-- Chargement des données CSV
metrics = LOAD '/home/hdoop/bma-projet/pig/metrics_data.csv'
    USING PigStorage(',')
    AS (row:chararray, rps:int, used_gb:int, hfile_count:int);

-- Filtrer l'en-tête
metrics_clean = FILTER metrics BY row != 'row_key';

-- Détecter les hot spots (RPS > 500 = seuil critique)
hotspots = FILTER metrics_clean BY rps > 500;

-- Trier par RPS décroissant
hotspots_sorted = ORDER hotspots BY rps DESC;

-- Afficher les résultats
DUMP hotspots_sorted;
-- Résultat attendu :
-- (0_metrics_1781632970000_localhost, 789, 31, 45)
-- (1_metrics_1781632730000_localhost, 678, 30, 55)
-- (3_metrics_1781632610000_localhost, 556, 22, 65)
-- (0_metrics_1781632730000_localhost, 530, 23, 75)
