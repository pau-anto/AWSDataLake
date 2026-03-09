# SQL — Requêtes Athena & KPIs

Ce dossier contient les requêtes SQL exécutées sur Amazon Athena.

---

## Objectif

Interroger les données du bucket S3 Curated via **Amazon Athena**
pour calculer des KPIs sur la santé mentale et alimenter les
dashboards QuickSight.

---

## Étapes à suivre

### Pré-requis
- La sandbox AWS Academy doit être active
- Le Glue Crawler Curated doit avoir été exécuté
- Les tables doivent être visibles dans le Glue Data Catalog

---

### Étape 1 — Configurer Athena



### Étape 2 — Sélectionner la base de données


### Étape 3 — Tester avec une requête simple

Avant de lancer les KPIs, vérifier que les données sont bien accessibles :

Prendre un **screenshot** du résultat → `screenshots/04-analytics/`

---

### Étape 4 — Lancer les requêtes KPIs

Les requêtes sont disponibles dans le fichier `kpis.sql`.
Les copier-coller dans l'éditeur Athena et les exécuter une par une.

---

## Idées de KPIs à calculer

### Sur `survey.csv` — Santé mentale en entreprise tech

```sql
-- Taux de personnes ayant cherché un traitement par pays
SELECT country,
       COUNT(*) AS total,
       SUM(CASE WHEN treatment = 'Yes' THEN 1 ELSE 0 END) AS traitement,
       ROUND(100.0 * SUM(CASE WHEN treatment = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS taux_traitement
FROM survey
GROUP BY country
ORDER BY taux_traitement DESC;

-- Répartition par genre
SELECT gender, COUNT(*) AS total
FROM survey
GROUP BY gender
ORDER BY total DESC;
```

### Sur `mental_health_lifestyle_dataset` — Habitudes et santé mentale

```sql
-- Evolution du stress moyen par année
SELECT year,
       ROUND(AVG(stress_level), 2) AS stress_moyen
FROM mental_health_lifestyle_dataset
GROUP BY year
ORDER BY year;

-- Corrélation sommeil et stress
SELECT sleep_hours,
       ROUND(AVG(stress_level), 2) AS stress_moyen,
       COUNT(*) AS total
FROM mental_health_lifestyle_dataset
GROUP BY sleep_hours
ORDER BY sleep_hours;
```

### Sur `mental_health_diagnosis_treatment_` — Diagnostics

```sql
-- Répartition des diagnostics
SELECT diagnosis,
       COUNT(*) AS total
FROM mental_health_diagnosis_treatment_
GROUP BY diagnosis
ORDER BY total DESC;

-- Répartition par tranche d'âge
SELECT CASE
         WHEN age < 25 THEN '< 25 ans'
         WHEN age BETWEEN 25 AND 35 THEN '25-35 ans'
         WHEN age BETWEEN 36 AND 50 THEN '36-50 ans'
         ELSE '> 50 ans'
       END AS tranche_age,
       COUNT(*) AS total
FROM mental_health_diagnosis_treatment_
GROUP BY 1
ORDER BY total DESC;
```

---

### Étape 5 — Connecter QuickSight à Athena

---

## Screenshots à prendre

| Fichier | Contenu |
|---|---|
| `001-athena-settings.png` | Configuration du bucket de résultats |
| `002-athena-tables.png` | Tables visibles dans le Data Catalog |
| `003-athena-query-result.png` | Résultat d'une requête KPI |
| `004-quicksight-dataset.png` | Dataset connecté à Athena |
| `005-quicksight-dashboard.png` | Dashboard final avec visualisations |

---

*Projet académique — ESGI — Introduction au Cloud AWS — Mars 2026*
