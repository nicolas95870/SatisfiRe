test_that("addNoAnswer works", {
  expect_equal(length(levels(addNoAnswer(1))), 11)
})

test_that("NPS works",{
  expect_true(is.numeric(NPS(c(1,2,3,4))))
})
