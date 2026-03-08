# Data Dictionary

Ce document décrit les datasets utilisés dans le projet, avec le nom de chaque colonne, son type et sa description.

---

## Dataset : mental_health_survey.csv

| Column Name                   | Type      | Description |
|--------------------------------|----------|-------------|
| Timestamp                      | DateTime | Date et heure à laquelle le participant a rempli le questionnaire |
| Age                             | Integer  | Âge du participant |
| Gender                          | String   | Sexe du participant (Male/Female/Other) |
| Country                         | String   | Pays de résidence |
| state                           | String   | État / région du participant (si applicable) |
| self_employed                   | String   | Indique si le participant est indépendant (Yes/No) |
| family_history                  | String   | Historique familial de problèmes de santé mentale (Yes/No) |
| treatment                       | String   | Si le participant a reçu un traitement pour santé mentale (Yes/No) |
| work_interfere                  | String   | Impact de la santé mentale sur le travail (Never/Rarely/Sometimes/Often) |
| no_employees                    | String   | Taille de l’entreprise (ex : 1-5, 6-25, 26-100, 100-500, 500-1000, 1000+) |
| remote_work                     | String   | Le participant travaille-t-il à distance ? (Yes/No/Sometimes) |
| tech_company                    | String   | L’entreprise est-elle une société technologique ? (Yes/No) |
| benefits                        | String   | L’entreprise offre-t-elle des avantages pour la santé mentale ? (Yes/No/Don't know) |
| care_options                     | String   | Options de soins offertes par l’entreprise (ex : EAP, hotline, counseling) |
| wellness_program                | String   | Programmes de bien-être disponibles (Yes/No/Don't know) |
| seek_help                        | String   | Encouragement à demander de l’aide au travail (Yes/No/Somewhat) |
| anonymity                        | String   | Les employés peuvent-ils demander de l’aide de façon anonyme ? (Yes/No/Don't know) |
| leave                            | String   | Politiques de congé pour santé mentale disponibles (Yes/No/Don't know) |
| mental_health_consequence        | String   | Conséquences possibles d’une santé mentale affectée (ex : pas d’impact, discrétion, impact carrière) |
| phys_health_consequence          | String   | Conséquences physiques possibles (ex : pas d’impact, affecte performance) |
| coworkers                        | String   | Attitude des collègues face à la santé mentale (ex : supportive, neutral, not supportive) |
| supervisor                       | String   | Attitude du superviseur (ex : supportive, neutral, not supportive) |
| mental_health_interview          | String   | Posibilité que la santé mentale soit discutée en entretien (Yes/No/Maybe) |
| phys_health_interview            | String   | Posibilité que la santé physique soit discutée en entretien (Yes/No/Maybe) |
| mental_vs_physical               | String   | Priorité accordée à la santé mentale vs physique dans l’entreprise |
| obs_consequence                  | String   | Conséquences observées pour demander de l’aide (ex : none, negative, positive) |
| comments                         | String   | Commentaires libres du participant |

---

## Dataset : Mental_Health_Lifestyle_Dataset.csv

| Column Name                 | Type      | Description |
|------------------------------|----------|-------------|
| Country                      | String   | Pays de résidence du répondant |
| Age                    | String   | Tranche d’âge du répondant  |
| Gender                       | String   | Identité de genre de l’individu |
| Exercise Level                 | String   | Fréquence et intensité de l’activité physique |
| Diet Type                | String   | Type de régime suivi (ex. : Végétarien, Végétalien, Équilibré) |
| Sleep Hours                  | Float    | Nombre moyen d’heures de sommeil par jour |
| Stress Level                 | Integer  | Niveau de stress auto-évalué  |
| Mental Health Condition                | String | Affection mentale diagnostiquée (ex. : Anxiété, Dépression) |
| Work Hours per Week           | Integer  | Nombre moyen d’heures travaillées par semaine |
| Screen Time per Day (Hours)    | Float   | Temps moyen passé devant un écran par jour (en heures) |
| Social Interaction Score               | Float  | Indice d’interaction sociale (1-10) |
| Happiness Score              | Float  | Indice de bonheur général (1-10) |

---

## Dataset : mental_health_diagnosis_treatment_.csv

| Column Name                   | Type      | Description |
|--------------------------------|----------|-------------|
| Patient ID                     | String   | Identifiant unique du patient |
| Age                            | Integer  | Âge du patient |
| Gender                         | String   | Sexe du patient (Male/Female) |
| Diagnosis                       | String   | Trouble de santé mentale diagnostiqué (ex : Anxiety, Depression) |
| Symptom Severity (1-10)         | Integer  | Gravité des symptômes (1-10) |
| Mood Score (1-10)               | Integer  | Note d’humeur pendant le traitement (1-10) |
| Sleep Quality (1-10)            | Integer  | Qualité du sommeil auto-déclarée (1-10) |
| Physical Activity                | Float    | Heures d’activité physique par semaine |
| Medication                       | String   | Médicaments prescrits (ex : SSRIs, Antidepressants) |
| Therapy Type                     | String   | Type de thérapie (ex : CBT, DBT) |
| Treatment Start Date             | Date     | Date de début du traitement |
| Treatment Duration               | Integer  | Durée du traitement en semaines |
| Stress Level (1-10)              | Integer  | Niveau de stress du patient (1-10) |
| Outcome                          | String   | Résultat du traitement (ex : Improved, Deteriorated) |
| Treatment Progress (1-10)        | Integer  | Progression observée pendant le traitement (1-10) |
| AI-Detected Emotional State      | String   | État émotionnel détecté par l’IA (ex : Happy, Anxious) |
| Adherence to Treatment (%)       | Float    | Pourcentage de respect du plan de traitement |

---
