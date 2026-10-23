#!/bin/bash
# ============================================================
# optimiser.sh — Script d'optimisation HBase (L1 + L5)
# Projet BMA — Master Big Data — Université Ibn Tofail
# ============================================================

echo "=== Optimisation HBase ==="

echo "1. Compaction de la table..."
hbase shell << 'HBASE'
major_compact 'cluster_metrics'
HBASE
echo "Compaction lancee"

echo "2. Verification HDFS..."
hdfs dfs -ls /hbase
echo "HDFS OK"

echo "3. Test ZooKeeper..."
(echo ruok; sleep 2) | nc localhost 2181
echo "=== Termine ==="
