# 🚀 HBase Optimizer — Prévision de Charge et Optimisation des Ressources

<div align="center">

![HBase](https://img.shields.io/badge/Apache%20HBase-2.5.7-red?style=for-the-badge&logo=apache)
![Hadoop](https://img.shields.io/badge/Apache%20Hadoop-3.3.6-yellow?style=for-the-badge&logo=apache)
![Pig](https://img.shields.io/badge/Apache%20Pig-0.17.0-orange?style=for-the-badge&logo=apache)
![Hive](https://img.shields.io/badge/Apache%20Hive-3.1.3-gold?style=for-the-badge&logo=apache)
![Oozie](https://img.shields.io/badge/Apache%20Oozie-4.1.0-blue?style=for-the-badge&logo=apache)
![Ubuntu](https://img.shields.io/badge/Ubuntu-20.04-E95420?style=for-the-badge&logo=ubuntu)
![Java](https://img.shields.io/badge/Java-8-007396?style=for-the-badge&logo=java)

**Système intelligent de surveillance, prévision et optimisation proactive d'un cluster Apache HBase**

*Master Big Data, Intelligence Artificielle et Applications Avancées — 2025/2026*  
*Université Ibn Tofail, Kénitra — Faculté des Sciences*

---

[![GitHub Stars](https://img.shields.io/github/stars/Bilal-Jellaoui/bma-hbase-optimizer?style=social)](https://github.com/Bilal-Jellaoui/bma-hbase-optimizer)
[![GitHub Forks](https://img.shields.io/github/forks/Bilal-Jellaoui/bma-hbase-optimizer?style=social)](https://github.com/Bilal-Jellaoui/bma-hbase-optimizer)

</div>

---

## 👥 Équipe

| Nom | GitHub |
|-----|--------|
| **Bilal Jellaoui** | [@Bilal-Jellaoui](https://github.com/Bilal-Jellaoui) |
| **M.Azil** | — |
| **A.Echihami** | — |


---

## 📌 Description du Projet

Ce projet implémente un **pipeline Big Data complet** pour surveiller, analyser et optimiser un cluster Apache HBase. Il répond à deux problèmes majeurs rencontrés en production :

| Problème | Impact | Notre Solution |
|----------|--------|---------------|
| 🔴 **Hot Spots** | Certains RegionServers surchargés → pannes | Détection automatique via Apache Pig (RPS > 500) |
| 🟠 **Fragmentation HDFS** | Fichiers HFile éparpillés → ralentissement | Compaction majeure planifiée via Oozie |
| 🟡 **Surveillance réactive** | Détection trop tardive | Collecte toutes les 30s → prévision en temps réel |

---

## 🏗️ Architecture en 4 Couches

```
┌─────────────────────────────────────────────────────────────┐
│  COUCHE 4 — SERVICE & RAPPORTS                              │
│  Apache Hive │ Dashboard HTML │ HDFS:9870 │ YARN:8088       │
│                               │ HBase:16010                  │
├─────────────────────────────────────────────────────────────┤
│  COUCHE 3 — ORCHESTRATION                                   │
│  Apache Oozie 4.1.0 │ workflow.xml │ Tomcat │ Derby DB      │
├─────────────────────────────────────────────────────────────┤
│  COUCHE 2 — TRAITEMENT & ANALYSE                            │
│  Apache Pig 0.17.0 │ analyse_metrics.pig │ hotspots.pig     │
├─────────────────────────────────────────────────────────────┤
│  COUCHE 1 — COLLECTE & STOCKAGE                             │
│  HBase 2.5.7 │ HDFS 3.3.6 │ ZooKeeper:2181 │ optimiser.sh  │
└─────────────────────────────────────────────────────────────┘
```

---

## ⚡ Pipeline en 5 Étapes

```
📥 COLLECTE          🔍 ANALYSE           🔧 OPTIMISATION
cluster_metrics  →   Apache Pig       →   major_compact
201 lignes           438.3 req/s avg       balancer → true
4 familles CF        4 hot spots           ZooKeeper: imok
     ↓
🤖 ORCHESTRATION     📊 RAPPORTS
Apache Oozie    →   Apache Hive
SUCCEEDED            rapport_bma
Job: 0000000-...     SELECT * → 8 lignes
```

---

## 📊 Résultats Obtenus

```
✅ 9 processus Java actifs simultanément (jps)
✅ 201 lignes de métriques dans cluster_metrics
✅ 4 hot spots détectés (RPS > 500) : 789, 678, 556, 530 req/s
✅ Moyenne cluster : 438.3 req/s | Max : 789 req/s
✅ Oozie workflow : Status SUCCEEDED
✅ Oozie : System mode NORMAL (version 4.1.0)
✅ ZooKeeper : imok (port 2181)
✅ Hive : rapport_bma créé + SELECT * → 8 lignes
✅ 3 interfaces web opérationnelles (9870, 8088, 16010)
```

---

## 📁 Structure du Projet

```
bma-hbase-optimizer/
│
├── 📂 scripts/
│   └── optimiser.sh          # Script principal : compaction + HDFS + ZooKeeper
│
├── 📂 pig/
│   ├── analyse_metrics.pig   # Calcul des statistiques de charge (L3)
│   ├── hotspots.pig          # Détection des hot spots RPS > 500 (L4)
│   └── metrics_data.csv      # Données de métriques exportées
│
├── 📂 oozie/
│   ├── workflow.xml          # Définition du workflow Oozie (L6)
│   └── job.properties        # Configuration du job Oozie
│
├── 📂 hive/
│   └── rapport_bma.hql       # Requêtes Hive pour les rapports (BF15)
│
├── 📂 config/
│   ├── hbase-site.xml        # Configuration HBase (IP réelle + WAL filesystem)
│   └── core-site.xml         # Configuration Hadoop (proxyuser Oozie)
│
├── 📂 dashboard/
│   └── dashboard.html        # Dashboard HTML avec données réelles
│
├── 📂 docs/
│   └── rapport_final.pdf     # Rapport technique complet (25 pages)
│
└── README.md
```

---

## 🚀 Démarrage Rapide

### Prérequis
- Ubuntu 20.04 LTS
- Java 8 (OpenJDK)
- Hadoop 3.3.6
- HBase 2.5.7
- Apache Pig 0.17.0
- Apache Hive 3.1.3
- Apache Oozie 4.1.0

### 1️⃣ Démarrer le cluster

```bash
# Se connecter avec l'utilisateur hdoop
su - hdoop

# Démarrer HDFS
start-dfs.sh && sleep 10

# Démarrer YARN
start-yarn.sh && sleep 10

# Démarrer HBase + ZooKeeper
start-hbase.sh && sleep 300

# Démarrer Oozie
cd ~/oozie-server && bin/oozied.sh start
```

### 2️⃣ Vérifier les 9 processus

```bash
jps
# Attendu :
# NameNode, DataNode, SecondaryNameNode
# ResourceManager, NodeManager
# HMaster, HRegionServer, HQuorumPeer
# Bootstrap (Oozie)
```

### 3️⃣ Vérifier ZooKeeper

```bash
(echo ruok; sleep 2) | nc localhost 2181
# → imok ✅
```

### 4️⃣ Vérifier Oozie

```bash
oozie version
# → Oozie client build version: 4.1.0

oozie admin -oozie http://localhost:11000/oozie -status
# → System mode: NORMAL ✅
```

### 5️⃣ Lancer le script d'optimisation

```bash
bash ~/bma-projet/optimiser.sh
# → Compaction lancée ✅
# → HDFS OK ✅
# → imok ✅
```

### 6️⃣ Analyser avec Pig

```bash
pig -x local ~/bma-projet/pig/analyse_metrics.pig
# → (10, 438.3, 789, 23.1) ✅

pig -x local ~/bma-projet/pig/hotspots.pig
# → 4 hot spots détectés ✅
```

### 7️⃣ Soumettre le workflow Oozie

```bash
hdfs dfs -put ~/oozie-workflows/bma-workflow/workflow.xml /user/hdoop/bma-workflow/
oozie job -oozie http://localhost:11000/oozie -config ~/oozie-workflows/job.properties -run
# → job: 0000000-260618120933658-oozie-hdoo-W

oozie job -oozie http://localhost:11000/oozie -info <JOB_ID>
# → Status: SUCCEEDED ✅
```

### 8️⃣ Consulter les rapports Hive

```bash
hive
```
```sql
SELECT * FROM rapport_bma;
-- → 8 lignes, 4.468 secondes ✅
```

---

## 🌐 Interfaces Web

| Interface | URL | Description |
|-----------|-----|-------------|
| 🗄️ HDFS NameNode | http://192.168.56.101:9870 | État du système de fichiers |
| ⚙️ YARN ResourceManager | http://192.168.56.101:8088 | Gestion des ressources |
| 🏠 HBase Master | http://localhost:16010 | Administration HBase |

---

## 🔧 Problèmes Connus et Solutions

| Problème | Cause | Solution |
|----------|-------|----------|
| HMaster ne démarre pas | Conflit Protobuf/Netty | `hbase.wal.provider=filesystem` + IP réelle |
| Oozie 5.x impossible | conjars.org mort (2023) | Compiler Oozie 4.1.0 depuis les sources |
| Port 9000 refusé | NameNode sur IP réelle | Utiliser `192.168.56.101:9000` |
| ZooKeeper refuse ruok | Whitelist désactivée | `HBASE_OPTS -Dzookeeper.4lw.commands.whitelist=*` |
| Pig incompatible HBase | Conflit Guava | Export CSV + `pig -x local` |
| Mémoire insuffisante (Killed) | 4GB RAM insuffisant | Ajouter 2GB swap |

---

## 📚 Stack Technique

| Composant | Version | Rôle |
|-----------|---------|------|
| Ubuntu | 20.04 LTS | Système d'exploitation |
| Java | OpenJDK 8 | Runtime |
| Apache Hadoop | 3.3.6 | Stockage distribué (HDFS) + ressources (YARN) |
| Apache HBase | 2.5.7 | Base de données NoSQL |
| Apache Pig | 0.17.0 | Analyse des métriques |
| Apache Hive | 3.1.3 | Rapports SQL |
| Apache Oozie | 4.1.0 | Orchestration des workflows |
| Apache ZooKeeper | (intégré HBase) | Coordination du cluster |
| Maven | 3.6.3 | Compilation d'Oozie |

---

## 📖 Références

1. Apache Software Foundation. *HBase Reference Guide 2.5*. 2024.
2. Apache Software Foundation. *Hadoop 3.3.6 Documentation*. 2024.
3. L. George. *HBase: The Definitive Guide, 2nd Ed*. O'Reilly, 2022.
4. Apache Software Foundation. *Apache Pig 0.17.0 User Guide*. 2024.
5. Apache Software Foundation. *Apache Oozie 4.1.0 Documentation*. 2023.
6. Apache Software Foundation. *Apache Hive 3.1.3 Language Manual*. 2024.

---

## 📄 Licence

Ce projet est réalisé dans le cadre académique du Master Big Data de l'Université Ibn Tofail de Kénitra.

---

<div align="center">

**⭐ N'oubliez pas de mettre une étoile si ce projet vous a aidé ! ⭐**

*Université Ibn Tofail — Faculté des Sciences — Master Big Data 2025/2026*

</div>
