#' Filtrer les joueurs par poste
#'
#' @param data Un tableau de donnees
#' @param poste_choisi Le poste a filtrer (ex: "FW")
#' @return Un tableau filtre
#' @export
filtrer_poste <- function(data, poste_choisi) {
  dplyr::filter(data, Pos == poste_choisi)
}

#' Calculer la moyenne des buts par equipe
#'
#' @param data Un tableau de donnees
#' @return Un tableau resume
#' @export
calculer_moyenne_buts <- function(data) {
  data |>
    dplyr::group_by(Squad) |>
    dplyr::summarise(Moyenne_Buts = mean(Gls, na.rm = TRUE))
}

#' Tracer le graphique des buts par equipe
#'
#' @param data_resume Les donnees resumees
#' @return Un graphique ggplot2
#' @export
tracer_buts <- function(data_resume) {
  ggplot2::ggplot(data_resume, ggplot2::aes(x = Squad, y = Moyenne_Buts)) +
    ggplot2::geom_col(fill = "steelblue") +
    ggplot2::coord_flip() +
    ggplot2::theme_minimal()
}
