test_that("d20 no error", {
  expect_no_error(d4(  1))
  expect_no_error(d6(  1))
  expect_no_error(d8(  1))
  expect_no_error(d10( 1))
  expect_no_error(d12( 1))
  expect_no_error(d20( 1))
  expect_no_error(d100(1))
})

test_that("d20 no warning", {
  expect_no_warning(d4(  1))
  expect_no_warning(d6(  1))
  expect_no_warning(d8(  1))
  expect_no_warning(d10( 1))
  expect_no_warning(d12( 1))
  expect_no_warning(d20( 1))
  expect_no_warning(d100(1))
})

test_that("d20 no message", {
  expect_no_message(d4(  1))
  expect_no_message(d6(  1))
  expect_no_message(d8(  1))
  expect_no_message(d10( 1))
  expect_no_message(d12( 1))
  expect_no_message(d20( 1))
  expect_no_message(d100(1))
})

test_that("d20 no warning", {
  expect_no_warning(d4(  1))
  expect_no_warning(d6(  1))
  expect_no_warning(d8(  1))
  expect_no_warning(d10( 1))
  expect_no_warning(d12( 1))
  expect_no_warning(d20( 1))
  expect_no_warning(d100(1))
})


test_that("d20 is vector", {
  expect_vector(d4(  2))
  expect_vector(d6(  2))
  expect_vector(d8(  2))
  expect_vector(d10( 2))
  expect_vector(d12( 2))
  expect_vector(d20( 2))
  expect_vector(d100(2))
})

test_that("d20 is integer", {
  expect_type(d4(  1), "integer")
  expect_type(d6(  1), "integer")
  expect_type(d8(  1), "integer")
  expect_type(d10( 1), "integer")
  expect_type(d12( 1), "integer")
  expect_type(d20( 1), "integer")
  expect_type(d100(1), "integer")
})

test_that("d20 has correct values", {
  expect_in(d4(  100), 1:4)
  expect_in(d6(  100), 1:6)
  expect_in(d8(  100), 1:8)
  expect_in(d10( 100), 1:10)
  expect_in(d12( 100), 1:12)
  expect_in(d20( 100), 1:20)
  expect_in(d100(100), 1:100)
})
