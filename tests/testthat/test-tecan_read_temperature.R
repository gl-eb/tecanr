test_that("function expects valid file path", {
  expect_error(tecan_read_temperature("test.xlsx"))
})

test_that("function expects sheet number as numeric", {
  expect_error(
    tecan_read_temperature(
      system.file("extdata", "tecan_timeSeries_multiReads.xlsx", package = "tecanr"),
      "2"
    )
  )
})