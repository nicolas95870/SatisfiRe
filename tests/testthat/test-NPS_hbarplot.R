test_that("NPS_hbarplot", {
  expect_equal(any(class(NPS_hbarplot(my_dataset,dr,reco)) == "plotly"), TRUE)
})
