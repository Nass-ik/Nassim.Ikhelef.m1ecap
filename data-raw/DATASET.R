## code to prepare `DATASET` dataset goes here

# 1. Source demandée par la grille d'évaluation
url_jeu_de_donnees <- 'https://fbref.com/en/comps/9/stats/Premier-League-Stats'

# 2. Importation propre
data_foot <- read.csv("premier_league_stats.csv", sep=";", dec=",", fileEncoding="latin1")

# 3. Nettoyage de l'âge
data_foot$Age_vrai <- 2026 - data_foot$Born

# 4. Nettoyage des virgules pour les stats sur 90 min
data_foot$Gls.90 <- as.numeric(gsub(",", ".", data_foot$Gls.90))
data_foot$Ast.90 <- as.numeric(gsub(",", ".", data_foot$Ast.90))
data_foot$G.A.90 <- as.numeric(gsub(",", ".", data_foot$G.A.90))

# 5. Enregistrement officiel de la base dans ton package
usethis::use_data(data_foot, overwrite = TRUE)
