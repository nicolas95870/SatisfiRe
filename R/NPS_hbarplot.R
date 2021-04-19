#' NPS_hbarplot
#'
#' @param dataset data.frame
#' @param dr character
#' @param reco numeric
#'
#' @return plotlyobject
#' @export
#'
#' @examples
#' NPS_hbarplot(my_dataset,dr, reco)
NPS_hbarplot <- function(dataset, dr, reco) {
  assertthat::assert_that(is.data.frame(dataset))
  grouped_data <- dplyr::group_by({
    {
      dataset
    }
  }, {
    {
      dr
    }
  })

  summarize_data <-
    dplyr::summarize(
      grouped_data,
      promoteurs = sum({
        {
          reco
        }
      } >= 9),
      neutres = sum({
        {
          reco
        }
      } == 8 |
        {
          {
            reco
          }
        } == 7),
      detracteurs = sum({
        {
          reco
        }
      } <= 6)
    )

  contigence = as.data.frame(summarize_data)
  row.names(contigence) = contigence[[1]]
  contigence[[1]] <- NULL
  contigence = as.data.frame(contigence)


  A = contigence
  B = A
  A = round(A / rowSums(A), 2)





  #A et B sont des dataframe ou chaque row.names est soit promoteur, neutre, detracteurs , chaque colonnes est un perimetres
  # A est une propotion, B est une contingence


  fig <-
    plotly::plot_ly(
      A,
      y = row.names(A),
      x = A$promoteurs ,
      text = A$promoteurs,
      textposition = 'auto' ,
      type = 'bar',
      orientation = 'h',
      name = 'Promoteurs',
      hovertext  = B$promoteurs,
      marker = list(color = "#4e9c34",
                    line = list(color = "#4e9c34",
                                width = 3))
    )


  fig <-
    plotly::add_trace(
      fig,
      x = A$neutres,
      name = 'Neutres',
      text = A$neutres,
      textposition = 'auto',
      hovertext  = B$neutres,
      marker = list(color = "#fbb829",
                    line = list(color = "#fbb829",
                                width = 3))
    )

  fig <-
    plotly::add_trace(
      fig,
      x = A$detracteurs,
      name = 'Detracteurs',
      text = A$detracteurs,
      textposition = 'auto',
      hovertext  = B$detracteurs,
      marker = list(color = '#bd3131',
                    line = list(color = '#bd3131',
                                width = 3))
    )

  fig <- fig %>% plotly::layout(
    barmode = 'stack',
    xaxis = list(title = ""),
    yaxis = list(title = "")
  )
  return(fig)

}
