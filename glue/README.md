# Configurer le Glue Crawler

## ÉTAPE 1 — Créer le Data Catalog (Glue)

Une fois les fichiers uploadés, configurer le Glue Crawler sur le bucket Raw :

1. Aller dans **AWS Glue** → **go to the Data Catalog** → **"Create crawler"**
2. **Nom** : `crawler-raw-datalake`
3. **Data source** : S3 → `s3://datalake-raw-dev-groupe1/`
4. **IAM Role** : sélectionner `LabRole`
5. **Database** : créer une nouvelle base → `datalake_raw_db`
6. Lancer le crawler → attendre le statut **`Ready`**
7. Vérifier les tables créées dans **Glue Data Catalog**

---

### Étape 5 — Vérifier le schéma (Data Dictionary)

Après l'exécution du crawler, aller dans **Glue → Data Catalog → Tables** et vérifier :

| Table | Colonnes attendues | Type détecté |
|---|---|---|
| `survey` | age, gender, country, treatment... | string, int |
| `mental_health_lifestyle_dataset` | year, stress_level, sleep_hours... | string, int, double |
| `mental_health_diagnosis_treatment_` | diagnosis, treatment, age... | string, int |

> ⚠️ Si Glue détecte un mauvais type (ex: une date comme string), le noter
> dans le Data Dictionary — P3 devra corriger ça dans le Glue ETL Job.

---

### Étape 6 — Documenter le Data Dictionary

Créer un fichier `data-dictionary.md` dans ce dossier (`datasets/`) avec
pour chaque dataset : le nom de chaque colonne, son type, et sa description.

---
