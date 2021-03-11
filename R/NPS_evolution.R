#' Plot evolution of NPS
#'
#' @param reco vector numeric
#' @param date vector date (dmy)
#' @param unite character (mois, jours, annee)
#'
#' @return plotly
#' @export
#'
#' @examples
#' NPS_evolution_plot(c(1,10),c("01/01/2020","01/02/2020"),"mois")
NPS_evolution_plot <- function(reco, date, unite) {
  assertthat::assert_that(is.numeric(reco))
  if (!unite %in% c("mois", "annee", "jours")) {
    stop("L'unite doit etre soit mois , jours ou annee")
  }
  if (!all(is.na(lubridate::dmy(date)) == is.na(date))) {
    stop("le format de la date doit etre au format dmy")
  }

  temp = data.frame(date, as.numeric(reco))
  colnames(temp) = c("date", "reco")

  temp$date = lubridate::dmy(temp$date)


  if (unite == "mois") {
    temp$date = format(as.Date(temp$date), "%m-%Y")
  }

  if (unite == "annee") {
    temp$date = format(as.Date(temp$date), "%Y")
  }

  if (unite == "jours") {
    temp$date = as.Date(temp$date)
  }

  gs = as.data.frame(dplyr::summarise(dplyr::group_by(temp, date), NPS = NPS(reco)))
  fig = plotly::plot_ly(
    data = gs,
    x = gs$date,
    y = gs$NPS ,
    type = "scatter",
    mode = "lines"
  )
  return(fig)
}
