# 🤝 Guide de contribution — AWS Data Lake

Ce fichier définit les conventions de travail pour le groupe.
Merci de les respecter pour éviter les conflits et garder le repo propre.

---

## 🚀 Démarrage rapide

```bash
# 1. Cloner le repo (à faire une seule fois)
git clone https://github.com/pau-anto/aws-data-lake.git
cd aws-data-lake

# 2. Avant chaque session de travail — toujours synchroniser
git pull origin main
```

---

## 📁 Qui travaille où

| Dossier | Responsable | Ne pas modifier sans accord |
|---|---|---|
| `architecture/` | Pauline | ✋ |
| `datasets/` | Lilia | ✋ |
| `glue/` | Ikraam | ✋ |
| `sql/` | Amira | ✋ |
| `report/` | Tout le groupe | ✅ |
| `screenshots/` | Tout le groupe | ✅ |
| `README.md` | Pauline | ✋ |

> Si tu as besoin de modifier le dossier de quelqu'un d'autre,
> préviens-le d'abord sur WhatsApp/Discord.

---

## ✍️ Convention de nommage des commits

Utilise toujours ce format :

```
type(dossier): description courte en français
```

### Types disponibles

| Type | Quand l'utiliser |
|---|---|
| `feat` | Ajout d'un nouveau fichier ou fonctionnalité |
| `fix` | Correction d'une erreur |
| `docs` | Ajout ou modification de documentation |
| `infra` | Modification de l'infrastructure AWS |
| `data` | Ajout ou modification de datasets |
| `refactor` | Réorganisation sans changement de fonctionnalité |

### Exemples

```bash
# ✅ Bons commits
git commit -m "feat(glue): ajout script ETL PySpark nettoyage survey"
git commit -m "docs(report): ajout chapitre pipeline de données"
git commit -m "data(datasets): upload Mental_Health_Lifestyle_Dataset"
git commit -m "fix(sql): correction requête KPI taux de traitement"
git commit -m "infra(architecture): mise à jour infrastructure.yaml"
git commit -m "feat(screenshots): ajout captures Glue Crawler Raw"

# ❌ Mauvais commits (à éviter)
git commit -m "update"
git commit -m "fix"
git commit -m "test"
git commit -m "wip"
```

---

## 🔄 Workflow quotidien

### Avant de commencer à travailler

```bash
# Toujours synchroniser avant de modifier quoi que ce soit
git pull origin main
```

### Après avoir travaillé

```bash
# 1. Voir ce que tu as modifié
git status

# 2. Ajouter tes fichiers
git add dossier/fichier.ext

# 3. Créer un commit avec un message clair
git commit -m "type(dossier): description"

# 4. Pousser sur GitHub
git push origin main
```

### Si git push est refusé

```bash
# Quelqu'un a poussé avant toi — synchronise d'abord
git pull origin main --rebase
git push origin main
```

---

## 📸 Screenshots

Les captures d'écran de la console AWS vont dans `screenshots/`
organisées par étape :

```
screenshots/
├── 01-infrastructure/     # Buckets S3, CloudFormation (Pauline)
├── 02-ingestion/          # Upload S3, Glue Crawler (Lilia)
├── 03-etl/                # Glue Job, Parquet (Ikraam)
├── 04-analytics/          # Athena, QuickSight (Amira)
└── 05-securite/           # IAM, CloudTrail
```

**Nommage des fichiers screenshots :**
```
# Format : NNN-description.png
001-s3-buckets-created.png
002-glue-crawler-ready.png
003-athena-query-result.png
```

---

## ⚠️ Règles importantes

- **Ne jamais pusher de credentials AWS** (clés d'accès, tokens) — si ça arrive par accident, prévenir immédiatement Pauline
- **Ne jamais modifier `main` directement** si tu travailles sur quelque chose d'instable — fais-le sur une copie locale d'abord
- **Toujours faire un `git pull` avant un `git push`** — ça évite 90% des conflits
- **Les fichiers CSV/datasets lourds** vont dans `datasets/` sur le repo ET dans S3 Raw

---

## 🆘 En cas de problème Git

### J'ai fait une erreur dans mon dernier commit

```bash
# Modifier le message du dernier commit
git commit --amend -m "nouveau message"
```

### J'ai pushé un fichier par erreur

```bash
# Prévenir Pauline — elle gère ça
```

### J'ai un conflit

```bash
# Ouvrir le fichier en conflit dans VSCode
# Chercher les marqueurs <<<<<<< HEAD
# Garder la bonne version, supprimer les marqueurs
# Puis :
git add fichier-corrige
git commit -m "fix: résolution conflit"
git push
```

---

*Projet académique — ESGI — Introduction au Cloud AWS — Mars 2026*
