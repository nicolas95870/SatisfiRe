test_that("NPS_evolution_repartition.R", {
  expect_equal(any(class(NPS_evolution_repartition(my_dataset$reco,my_dataset$date,"mois")) == "plotly"), TRUE)
  expect_equal(any(class(NPS_evolution_repartition(my_dataset$reco,my_dataset$date,"jours")) == "plotly"), TRUE)
  expect_equal(any(class(NPS_evolution_repartition(my_dataset$reco,my_dataset$date,"annee")) == "plotly"), TRUE)
})
