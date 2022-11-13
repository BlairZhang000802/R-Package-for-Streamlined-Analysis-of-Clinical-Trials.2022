test_that(
  "The spectral_signature() returns a data.frame.",
  {
    data(ukb_accel)
    p <-  ukb_accel[1:100, ] |>
      spectral_signature()
    expect_s3_class(p, "data.frame")
  }
)

test_that(
  "The spectral_signature() takes log when take-log = TRUE.",
  {
    data(ukb_accel)
    p <-  ukb_accel[1:100, ] |>
      bis620.2022:: spectral_signature(take_log = TRUE) |>
      select(X, Y, Z)
    n <- ukb_accel[1:100, ] |>
      bis620.2022:: spectral_signature() |>
      select(X, Y, Z) |>
      log()
    expect_equal(p, n)
  }
)
