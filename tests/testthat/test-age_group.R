test_that("Error if age isn't correct format", {
  expect_error(age_group("eighty"))
  expect_error(age_group(-50))
  expect_error(age_group(50.5))
  expect_error(age_group(c(25, 49.4)))
})

test_that("Warning if age 18 or less", {
  expect_warning(age_group(15))
  expect_warning(age_group(c(15, 30)))
})

test_that("Returns correct answer", {
  expect_equal(age_group(40), "40-49")
  expect_equal(age_group(62), "60-69")
  expect_equal(age_group(89), "70+")
  expect_equal(suppressWarnings(age_group(15)), NA_character_)
  expect_equal(age_group(c(45, 71)), c("40-49", "70+"))
})
