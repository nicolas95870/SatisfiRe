
test_that("NPS decompose works", {
  expect_equal(class(NPS_decompose(my_dataset$reco)), "data.frame")
})
