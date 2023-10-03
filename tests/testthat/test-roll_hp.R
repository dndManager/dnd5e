
test_that("roll_hp runs", {
  expect_no_error(    roll_hp("1d4+1"))
  expect_no_warning(  roll_hp("1d4+1"))
  expect_no_message(  roll_hp("1d4+1"))
  expect_no_condition(roll_hp("1d4+1"))
})

test_that("roll_hp is numeric", {
  hp <- roll_hp("1d4+1")
  expect_type(hp, "integer")
  expect_vector(hp)
  
  hps <- roll_hp("1d4+1", 2)
  expect_type(hps, "integer")
  expect_vector(hps)
}) 

test_that("roll_hp gives correct range of results", {
  expect_in(roll_hp("1d4+0", 100), 1:4)
  expect_in(roll_hp("2d6+3", 100), 3+2:12)
})
