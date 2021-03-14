#' Evolution de la repartition du NPS
#'
#' @param reco vector
#' @param date vector (dmy)
#' @param unite (mois,annee,jours)
#'
#' @return plotly object
#' @export
#'
#' @examples
#' NPS_evolution_repartition(my_dataset$reco,my_dataset$date,"mois")
NPS_evolution_repartition <- function(reco, date, unite) {
  assertthat::assert_that(is.vector(reco))
  assertthat::assert_that(is.vector(date))
  assertthat::assert_that(is.character(unite))
  if (!unite %in% c("mois", "annee", "jours")) {
    stop("L'unite doit etre soit mois , jours ou annee")
  }
  if (!all(is.na(lubridate::dmy(date)) == is.na(date))) {
    stop("le format de la date doit etre au format dmy")
  }
  temp = cbind(date, (reco))
  temp = as.data.frame(temp)
  colnames(temp) = c("date", "reco")

  temp$date = lubridate::dmy(temp$date)
  temp$reco = as.numeric(as.character((temp$reco)))

  if (unite == "mois") {
    temp$date = format(as.Date(temp$date), "%m-%Y")
  }

  if (unite == "annee") {
    temp$date = format(as.Date(temp$date), "%Y")
  }

  if (unite == "jours") {
    temp$date = as.Date(temp$date)
  }

  dataset = as.data.frame(
    dplyr::summarise(
      dplyr::group_by(temp, date),
      NB_rep = sum(!is.na(reco), na.rm = T),
      Promoteurs = sum(reco >= 9, na.rm = T),
      Neutres = sum(reco == 8, na.rm = T) + sum(reco == 7, na.rm =
                                                  T),
      Detracteurs = sum(reco <= 6, na.rm =
                          T)
    )
  )
  dataset = as.data.frame(dataset)


  dataset[c("Promoteurs", "Neutres", "Detracteurs")] = dataset[c("Promoteurs", "Neutres", "Detracteurs")] / dataset$NB_rep *
    100

  dataset$NPS = (dataset$Promoteurs - dataset$Detracteurs) / dataset$NB_rep

  dataset[c("Promoteurs", "Neutres", "Detracteurs", "NPS")] = round(dataset[c("Promoteurs", "Neutres", "Detracteurs", "NPS")], 2)
  fig = plotly::plot_ly(
    data = dataset,
    x =  ~ date ,
    y =  ~ Promoteurs,
    type = "bar",
    name = "Promoteurs",
    text = ~ Promoteurs,
    textposition = 'auto'
    ,
    marker = list(
      color = "#4e9c34" ,
      line = list(color = "#4e9c34", width = 1.5)
    )
  )
  fig = plotly::add_trace(
    fig,
    y =  ~ Neutres,
    name = "Neutres",
    text = ~ Neutres,
    textposition = 'auto',
    marker = list(
      color = "#fbb829" ,
      line = list(color = "#fbb829", width = 1.5)
    )
  )
  fig = plotly::add_trace(
    fig,
    y =  ~ Detracteurs,
    name = "Detracteurs",
    text = ~ Detracteurs,
    textposition = 'auto'
    ,
    marker = list(
      color = "#bd3131" ,
      line = list(color = "#bd3131", width = 1.5)
    )
  )
  fig = plotly::layout(
    fig,
    yaxis = list(title = '% de repondants'),
    barmode = 'stack' ,
    title = "Repartions du NPS dans le temps"
  )


  return(fig)

}
