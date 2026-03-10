# Datasets — Ingestion & Arborescence S3

Ce dossier contient les données sources brutes du projet.

---

## Sources de données

Ce data lake ingère **trois types de données différents**, illustrant
la capacité d'un data lake à stocker des données hétérogènes —
contrairement à un data warehouse qui n'accepte que du structuré.

| Type | Format | Source | Description |
|---|---|---|---|
| Structuré | CSV | Kaggle | Données santé mentale |
| Non structuré — vidéo | MP4 | YouTube | Conférence santé mentale |
| Non structuré — audio | MP3 | YouTube | Podcast santé mentale |

### Datasets CSV

| Fichier | Source | Description | Lignes |
|---|---|---|---|
| `survey.csv` | [Kaggle / OSMI](https://www.kaggle.com/datasets/osmi/mental-health-in-tech-survey) | Enquête santé mentale en entreprise tech | ~1 200 |
| `Mental_Health_Lifestyle_Dataset.csv` | [Kaggle](https://www.kaggle.com/datasets/atharvasoundankar/mental-health-and-lifestyle-habits-2019-2024) | Habitudes de vie et santé mentale 2019-2024 | ~10 000+ |
| `mental_health_diagnosis_treatment_.csv` | [Kaggle](https://www.kaggle.com/datasets/uom190346a/mental-health-diagnosis-and-treatment-monitoring) | Suivi de diagnostics et traitements | ~10 000+ |

### Fichiers médias

| Fichier | Format | Description |
|---|---|---|
| `Bruno_Fallisard_SanteMentale.mp4` | MP4 | Conférence vidéo sur la santé mentale |
| `Pourquoi la santé mentale explose aujourd'hui.mp3` | MP3 | Podcast audio sur la santé mentale |

---

## Arborescence S3 Raw à créer

Avant d'uploader les fichiers, créer la structure de dossiers suivante dans le bucket **`datalake-raw-dev-groupe1`** :

```
datalake-raw-dev-groupe1/
├── survey/
│   └── csv/
│       └── survey.csv
├── mental-health-lifestyle/
│   └── csv/
│       └── Mental_Health_Lifestyle_Dataset.csv
└── mental-health-diagnosis/
|   └── csv/
|       └── mental_health_diagnosis_treatment_.csv
└── videos/
    ├── Bruno_Fallisard_SanteMentale.mp4
    └── Pourquoi la santé mentale explose aujourd'hui.mp3
```

---

## Étapes d'ingestion

### Pré-requis
- Avoir une sandbox AWS Academy active
- Avoir les 3 fichiers CSV téléchargés en local (voir liens ci-dessus)
- Le bucket `datalake-raw-dev-groupe1` doit être déjà créé 

---

### Étape 1 — Ouvrir le bucket Raw

1. Se connecter à la console AWS
2. Rechercher **S3** dans la barre de recherche
3. Cliquer sur le bucket **`datalake-raw-dev-groupe1`**

---

### Étape 2 — Créer l'arborescence et uploader les fichiers

> ⚠️ Dans S3, les dossiers n'existent que s'ils contiennent un fichier.
> Il faut donc créer les dossiers et uploader les fichiers en même temps.

#### Dataset 1 — survey

1. Dans le bucket, cliquer **"Create folder"**
2. Nom : `survey` → **"Create folder"**
3. Entrer dans `survey/`
4. Cliquer **"Create folder"** → Nom : `csv` → **"Create folder"**
5. Entrer dans `csv/`
6. Cliquer **"Upload"** → **"Add files"**
7. Sélectionner `survey.csv`
8. Cliquer **"Upload"**

#### Dataset 2 — mental-health-lifestyle

1. Retourner à la racine du bucket
2. Cliquer **"Create folder"** → Nom : `mental-health-lifestyle` → **"Create folder"**
3. Entrer dans `mental-health-lifestyle/`
4. Cliquer **"Create folder"** → Nom : `csv` → **"Create folder"**
5. Entrer dans `csv/`
6. Cliquer **"Upload"** → **"Add files"**
7. Sélectionner `Mental_Health_Lifestyle_Dataset.csv`
8. Cliquer **"Upload"**

#### Dataset 3 — mental-health-diagnosis

1. Retourner à la racine du bucket
2. Cliquer **"Create folder"** → Nom : `mental-health-diagnosis` → **"Create folder"**
3. Entrer dans `mental-health-diagnosis/`
4. Cliquer **"Create folder"** → Nom : `csv` → **"Create folder"**
5. Entrer dans `csv/`
6. Cliquer **"Upload"** → **"Add files"**
7. Sélectionner `mental_health_diagnosis_treatment_.csv`
8. Cliquer **"Upload"**

---

### Étape 3 — Uploader les fichiers médias

1. Retourner à la racine du bucket
2. Cliquer **"Create folder"** → Nom : `videos` → **"Create folder"**
3. Entrer dans `videos/`
4. Cliquer **"Upload"** → **"Add files"**
5. Sélectionner les deux fichiers :
   - `Bruno_Fallisard_SanteMentale.mp4`
   - `Pourquoi la santé mentale explose aujourd'hui.mp3`
6. Cliquer **"Upload"**

> ℹ️ Ces fichiers médias ne seront pas traités par Glue — ils restent
> dans Raw comme données non structurées. Ils illustrent la capacité
> du data lake à stocker tout type de données, contrairement à un
> data warehouse.

---

### Étape 4 — Vérifier l'upload

Une fois les 3 datasets uploadés, vérifier que la structure est correcte :

1. Retourner à la racine du bucket `datalake-raw-dev-groupe1`
2. Tu dois voir **3 dossiers** : `survey/`, `mental-health-lifestyle/`, `mental-health-diagnosis/`
3. Dans chaque dossier `csv/` tu dois voir le fichier CSV correspondant
4. Prendre un **screenshot** de la structure → le déposer dans `screenshots/` sur GitHub

---

### Étape 5 — Configurer le Glue Crawler

Une fois les fichiers uploadés, configurer le Glue Crawler sur le bucket Raw :

1. Aller dans **AWS Glue** → **Crawlers** → **"Create crawler"**
2. **Nom** : `crawler-raw-datalake`
3. **Data source** : S3 → `s3://datalake-raw-dev-groupe1/`
4. **IAM Role** : sélectionner `LabRole`
5. **Database** : créer une nouvelle base → `datalake_raw_db`
6. Lancer le crawler → attendre le statut **`Ready`**
7. Vérifier les tables créées dans **Glue Data Catalog**

---

### Étape 6 — Vérifier le schéma (Data Dictionary)

Après l'exécution du crawler, aller dans **Glue → Data Catalog → Tables** et vérifier :

| Table | Colonnes attendues | Type détecté |
|---|---|---|
| `survey` | age, gender, country, treatment... | string, int |
| `mental_health_lifestyle_dataset` | year, stress_level, sleep_hours... | string, int, double |
| `mental_health_diagnosis_treatment_` | diagnosis, treatment, age... | string, int |

> ⚠️ Si Glue détecte un mauvais type (ex: une date comme string), le noter
> dans le Data Dictionary — P3 devra corriger ça dans le Glue ETL Job.

---

### Étape 7 — Documenter le Data Dictionary

Créer un fichier `data-dictionary.md` dans ce dossier (`datasets/`) avec
pour chaque dataset : le nom de chaque colonne, son type, et sa description.

---

*Projet académique — ESGI — Introduction au Cloud AWS — Mars 2026*
