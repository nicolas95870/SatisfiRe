test_that("Output Evolution NPS is plotly object", {
  expect_equal(any(class(NPS_evolution_plot(c(1,10),c("01/01/2020","01/02/2020"),"mois")) == "plotly"), TRUE)
})
