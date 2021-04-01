#' Generate Plotly dognuts about satisfaction question
#'
#' @param attribut vector
#' @param nb_level numeric
#' @param titre character
#'
#' @return plotly
#' @export
#'
#' @examples Sat_Dognuts(my_dataset$reco,10,titre = "Propreté de l'accueil")
Sat_Dognuts <- function(attribut, nb_level, titre) {
  assertthat::assert_that(is.vector(attribut))
  assertthat::assert_that(is.numeric(nb_level))
  assertthat::assert_that(is.character(titre))

  reco = attribut
  reco = as.numeric(reco)
  if (nb_level > 9) {
    `Pas du tout satisfait` = sum(reco <= 4, na.rm = T)
    `Pas satisfait` = sum(reco == 6 | reco == 5, na.rm = T)
    `Satisfait` = sum(reco == 7 | reco == 8, na.rm = T)
    `Tres satisfait` = sum(reco >= 9, na.rm = T)
    reco = as.data.frame(rbind(
      `Pas du tout satisfait`,
      `Pas satisfait`,
      `Satisfait` ,
      `Tres satisfait`
    ))




  }

  if (nb_level <= 6) {
    `Pas du tout satisfait` = sum(reco == 1, na.rm = T)
    `Pas satisfait` = sum(reco == 2, na.rm = T)
    `Satisfait` = sum(reco == 3, na.rm = T)
    `Tres satisfait` = sum(reco >= 4 , na.rm = T)

    reco = as.data.frame(rbind(
      `Pas du tout satisfait`,
      `Pas satisfait`,
      `Satisfait` ,
      `Tres satisfait`
    ))


  }

  reco_prop = round(as.data.frame(prop.table((reco)) * 100), 1)
  reco = as.data.frame(reco)

  recod = cbind(rownames(reco), reco)
  rownames(recod) = NULL
  colnames(recod) = c("reco", "count")

  fig <-
    recod %>% plotly::plot_ly(
      labels = ~ reco,
      values = ~ count,
      marker = list(colors = c(
        "#FF0921", '#FF8040', '#92d050', '#00b050'
      ))
    )
  fig <- fig %>% plotly::add_pie(hole = 0.6)
  fig <- fig %>% plotly::layout(
    title = titre,
    showlegend = F,
    xaxis = list(
      showgrid = FALSE,
      zeroline = FALSE,
      showticklabels = FALSE
    ),
    yaxis = list(
      showgrid = FALSE,
      zeroline = FALSE,
      showticklabels = FALSE
    )
  )
  fig <-
    fig %>% plotly::add_annotations(
      reco_prop["Tres satisfait", ] - reco_prop["Pas du tout satisfait", ],
      x = 0.5,
      y = 0.5,
      xref = "paper",
      yref = "paper",
      text = ,
      showarrow = F,
      font = list(
        color = "black",
        family =
          "sans serif",
        size = 30
      )
    )

  return(fig)
}
