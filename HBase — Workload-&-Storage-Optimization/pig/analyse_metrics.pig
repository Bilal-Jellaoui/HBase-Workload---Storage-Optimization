-- ============================================================
-- analyse_metrics.pig — Analyse des métriques HBase (L3)
-- Projet BMA — Master Big Data — Université Ibn Tofail
-- Résultat : (10, 438.3, 789, 23.1)
-- ============================================================

-- Chargement des données CSV
metrics = LOAD '/home/hdoop/bma-projet/pig/metrics_data.csv'
    USING PigStorage(',')
    AS (row:chararray, rps:int, used_gb:int, hfile_count:int);

-- Filtrer l'en-tête
metrics_clean = FILTER metrics BY row != 'row_key';

-- Grouper et calculer les statistiques
grouped = GROUP metrics_clean ALL;
stats = FOREACH grouped GENERATE
    COUNT(metrics_clean)        AS total_records,
    AVG(metrics_clean.rps)      AS avg_rps,
    MAX(metrics_clean.rps)      AS max_rps,
    AVG(metrics_clean.used_gb)  AS avg_used_gb;

-- Afficher les résultats
DUMP stats;
-- Résultat attendu : (10, 438.3, 789, 23.1)
