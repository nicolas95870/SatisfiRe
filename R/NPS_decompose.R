#' NPS_decompose
#'
#' @param reco vector
#'
#' @return data.frame
#' @export
#'
#' @examples
#' NPS_decompose(my_dataset$reco)
NPS_decompose <- function(reco) {
  assertthat::assert_that(is.vector(reco))
  reco = as.numeric(reco)
  detracteurs = sum(reco <= 6, na.rm = T)
  neutres = sum(reco == 7 | reco == 8, na.rm = T)
  promoteurs = sum(reco >= 9, na.rm = T)
  reco = as.data.frame(rbind(promoteurs, neutres, detracteurs))
  reco_prop = round(as.data.frame(prop.table((reco)) * 100), 1)
  recod = as.data.frame(reco)
  df = cbind(reco_prop, recod)
  colnames(df) = c("frequence", "proportion")
  return(df)
}
