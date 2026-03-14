# Configurer le Glue Crawler

## ÉTAPE 1 — Créer le Data Catalog (Glue)

Une fois les fichiers uploadés, configurer le Glue Crawler sur le bucket Raw :

1. Aller dans **AWS Glue** → **go to the Data Catalog** → **Tables** → **Add table**
2. appuyer sur **Create database**  → **Nom** : `datalake_raw_db` → **Create**
3. choisie `datalake_raw_db`
4. cliquer sur **Add tables using crawler** 
5. **Nom** : `crawler-raw-datalake`
6. **Data source** : **add data source** Source → S3
7. **Path S3** → `s3://datalake-raw-dev-groupe1/`
8. **IAM Role** : sélectionner `LabRole`
9. **Target Database** : `datalake_raw_db`
10. **Schedule** → On demand
11. **Create**
12. Lancer le crawler **Run crawler** → attendre le statut **`Ready`**
13. Vérifier les tables créées dans **Glue Data Catalog**

---

### Étape 2 — Vérifier le schéma (Data Dictionary)

Après l'exécution du crawler, aller dans **Glue → Data Catalog → Tables** et vérifier :

| Table | Colonnes attendues | Type détecté |
|---|---|---|
| `survey` | age, gender, country, treatment... | string, int |
| `mental_health_lifestyle_dataset` | year, stress_level, sleep_hours... | string, int, double |
| `mental_health_diagnosis_treatment_` | diagnosis, treatment, age... | string, int |

> ⚠️ Si Glue détecte un mauvais type (ex: une date comme string), le noter
> dans le Data Dictionary — P3 devra corriger ça dans le Glue ETL Job.

---
### Étape 3 — test

1. Aller dans **Athena** 
2. Choisie **Query your data in Athena console**  → **Lunch query editor** → **Edit settings** → **Manage query settings**
3. **Path** → `s3://datalake-athena-results-dev-groupe1/`
4. Dans **Editor** tester la requête suivante:
    ```sql




// 

## ETL et transformation

### 1. Création des tables Athena à partir des données RAW

Les datasets CSV stockés dans le bucket S3 `datalake-raw-dev-groupe1` ont été catalogués dans Athena afin de permettre leur interrogation via SQL.

Chaque dataset a été associé à une **table externe Athena** pointant vers le chemin correspondant dans le bucket S3.

Les tables créées sont :

- `survey`
- `mental_health_lifestyle_dataset`
- `mental_health_diagnosis_treatment_`

Ces tables permettent de lire directement les fichiers CSV stockés dans la couche **RAW** du Data Lake.

Configuration utilisée pour la lecture des CSV :

- `skip.header.line.count='1'`  
  Permet d’ignorer la première ligne du fichier CSV (en-tête des colonnes)

- `use.null.for.invalid.data='true'`  
  Permet de remplacer les valeurs incompatibles avec le type attendu par `NULL` afin d’éviter les erreurs lors des requêtes.

Chaque table pointe vers un chemin spécifique dans S3 :

- `s3://datalake-raw-dev-groupe1/survey/csv/`
- `s3://datalake-raw-dev-groupe1/mental-health-lifestyle/csv/`
- `s3://datalake-raw-dev-groupe1/mental-health-diagnosis/csv/`

---

### 2. Nettoyage des données

Lors de la lecture des datasets CSV, certaines valeurs pouvaient provoquer des erreurs de type (par exemple texte dans une colonne numérique).

Pour gérer ces problèmes :

- la première ligne du CSV (header) est ignorée
- les valeurs invalides sont automatiquement remplacées par `NULL`

Cela permet d'assurer la stabilité des requêtes Athena et de charger correctement les données dans les tables.

Ce nettoyage constitue la première étape de préparation des données avant transformation.

---

### 3. Transformation des données (CSV → Parquet)

Les données stockées dans la couche RAW ont été transformées afin d'être stockées dans un format optimisé pour l’analyse.

Le format **Parquet** a été choisi car il offre plusieurs avantages :

- compression efficace
- meilleure performance pour les requêtes analytiques
- format colonne optimisé pour Athena et les moteurs de requête

La transformation a été réalisée via Athena avec des requêtes **CREATE TABLE AS SELECT (CTAS)**.

Exemple pour le dataset `survey` :

```sql
CREATE TABLE survey_processed
WITH (
    format = 'PARQUET',
    external_location = 's3://datalake-processed-dev-groupe1/survey/',
    write_compression = 'SNAPPY'
)
AS
SELECT * FROM survey;

Cette requête :

lit les données CSV depuis la table survey
les convertit en format Parquet
stocke les fichiers générés dans la couche Processed du Data Lake
La même opération a été appliquée aux deux autres datasets :

mental_health_lifestyle_dataset
mental_health_diagnosis_treatment_

Les tables générées sont :

survey_processed
mental_health_lifestyle_processed
mental_health_diagnosis_processed

Les fichiers Parquet résultants sont stockés dans :

s3://datalake-processed-dev-groupe1/survey/
s3://datalake-processed-dev-groupe1/mental-health-lifestyle/
s3://datalake-processed-dev-groupe1/mental-health-diagnosis/

4. Vérification des données transformées

Après la transformation, plusieurs requêtes ont été exécutées dans Athena afin de vérifier que les tables transformées étaient correctement accessibles et que les données étaient correctement chargées.

Exemples de requêtes de test :

SELECT * FROM survey_processed LIMIT 10;
SELECT * FROM mental_health_lifestyle_processed LIMIT 10;
SELECT * FROM mental_health_diagnosis_processed LIMIT 10;

Ces requêtes permettent de vérifier :

que les tables existent bien dans Athena
que les données sont correctement accessibles
que la transformation vers Parquet s'est déroulée correctement.

5. Validation du pipeline ETL

À l’issue des différentes étapes, le pipeline de transformation est structuré comme suit :

RAW (CSV)
Stockage des données brutes dans S3
datalake-raw-dev-groupe1

↓

Transformation ETL avec Athena (simulation de Glue ETL)

↓

PROCESSED (Parquet)
Stockage des données optimisées
datalake-processed-dev-groupe1
        SELECT *
        FROM survey
        LIMIT 10;

---
