#' add levels to recommendation factor
#'
#' @param x vector numeric
#'
#' @return factor
#' @export
#'
#' @examples
#' addNoAnswer(c(1,2))
addNoAnswer <- function(x) {
  assertthat::assert_that(is.numeric(x))
  x = as.factor(x)
  modalite = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
  modalite[!(modalite %in% levels(x))]
  if (is.factor(x))
    return(factor(x, levels = c(levels(x), modalite[!(modalite %in% levels(x))])))
  return(x)
}



#' Compute NPS score
#'
#' @param reco vector numeric
#'
#' @return numeric
#' @export
#'
#' @examples
#' NPS(c(1,10))
NPS <- function(reco){
  reco = addNoAnswer(reco)

  NPS = round((sum(table(reco)[c("9","10")],na.rm = T)-
                 sum(table(reco)[c("0","1","2","3","4","5","6")],na.rm = T))/
                sum(table(reco),na.rm = T)*100,2)
  return(NPS)
}


