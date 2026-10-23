-- ============================================================
-- rapport_bma.hql — Rapports Hive BMA (BF15)
-- Projet BMA — Master Big Data — Université Ibn Tofail
-- ============================================================

-- Créer la table de rapport
CREATE TABLE IF NOT EXISTS rapport_cluster_bma (
  composant     STRING,
  statut        STRING,
  valeur        STRING,
  date_rapport  STRING
) STORED AS TEXTFILE;

-- Insérer les données de l'état du cluster
INSERT INTO rapport_cluster_bma VALUES ('NameNode',     'ACTIF',      'Port 9870',             '2026-06-18');
INSERT INTO rapport_cluster_bma VALUES ('DataNode',     'ACTIF',      '1 noeud',               '2026-06-18');
INSERT INTO rapport_cluster_bma VALUES ('HMaster',      'ACTIF',      'Port 16010',            '2026-06-18');
INSERT INTO rapport_cluster_bma VALUES ('ZooKeeper',    'ACTIF',      'imok - Port 2181',      '2026-06-18');
INSERT INTO rapport_cluster_bma VALUES ('Oozie',        'SUCCEEDED',  'Job 0000000-260618',    '2026-06-18');
INSERT INTO rapport_cluster_bma VALUES ('HDFS',         '34% utilise','17 GB / 50 GB',         '2026-06-18');
INSERT INTO rapport_cluster_bma VALUES ('Charge HBase', 'NORMALE',    '438.3 req/s',           '2026-06-18');
INSERT INTO rapport_cluster_bma VALUES ('Compaction',   'EXECUTEE',   'HFiles reduits',        '2026-06-18');

-- Générer le rapport final
SELECT composant, statut, valeur, date_rapport
FROM rapport_cluster_bma
ORDER BY composant;

-- Table simple (version minimale)
CREATE TABLE IF NOT EXISTS rapport_bma (id STRING) STORED AS TEXTFILE;
SHOW TABLES;
