test_that("Toutes les fonctions sont couvertes a 100%", {
  # 1. On crée un mini-tableau parfait pour nos 3 fonctions
  df_test <- data.frame(
    Joueur = c("A", "B", "C", "D"),
    Pos = c("FW", "DF", "FW", "MF"),
    Squad = c("Equipe1", "Equipe1", "Equipe2", "Equipe2"),
    Gls = c(2, 0, 4, 1)
  )

  # 2. On teste le filtre (doit trouver 2 FW)
  res_filtre <- filtrer_poste(df_test, "FW")
  expect_equal(nrow(res_filtre), 2)

  # 3. On teste le calcul (doit trouver 2 équipes)
  res_calcul <- calculer_moyenne_buts(df_test)
  expect_equal(nrow(res_calcul), 2)
  expect_equal(res_calcul$Moyenne_Buts[1], 1) # Moyenne de l'Equipe 1 (2 et 0)

  # 4. On teste le graphique (doit générer un objet ggplot)
  res_plot <- tracer_buts(res_calcul)
  expect_s3_class(res_plot, "ggplot")
})
