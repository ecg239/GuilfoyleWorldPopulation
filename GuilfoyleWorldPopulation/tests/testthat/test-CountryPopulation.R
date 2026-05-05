test_that("Country exists in dataset", {
  expect_true("Brazil" %in% WorldPopulation$`Country Name`)
})

test_that("Function errors for invalid country", {
  expect_error(CountryPopulation("NotACountry"))
})

test_that("Function returns a ggplot object", {
  p <- CountryPopulation("Brazil")
  expect_s3_class(p, "ggplot")
}) #Used AI. Had no idea how to do this. All of these are testing if the country that the user has entered is in the data set.
