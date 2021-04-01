test_that("Test de la fonction", {
  expect_equal("plotly" %in% class(Sat_Dognuts(my_dataset$reco,10,titre = "Propreté de l'accueil")), TRUE)
})
