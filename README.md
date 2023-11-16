
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tecanr

<!-- badges: start -->

[![R-CMD-check](https://github.com/gl-eb/tecanr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/gl-eb/tecanr/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

tecanr is an R package to extract data from Excel files generated by
Tecan Infinite 200 Pro plate readers. Currently, only measurements with
multiple reads per well are supported due to differences in the layout
of the data in the spreadsheets.

tecanr is currently in an unfinished state, so use with caution.

Tecan® is a trademark of Tecan Group Ltd., Männedorf, Switzerland. I
have no affiliation with them other than being a user of their products.

## Installation

You can install tecanr from [GitHub](https://github.com/gl-eb/tecanr)
with:

``` r
# install.packages("devtools")
devtools::install_github("gl-eb/tecanr")
```

### Development Version

You can also install the development version. While it may contain
unreleased features, changes or bugfixes, it is also likely to rapidly
evolve, potentially breaking your code. Do not use the development
version if you are not willing to deal with this.

``` r
devtools::install_github("gl-eb/tecanr", ref = "develop")
```

## Hot To Use

``` r
library(tecanr)
```

``` r
# parse your own set of measurements
dat <- tecan_parse("path/to/file.xlsx")

# specify sheet of the excel file (default: 1)
dat <- tecan_parse("path/to/file.xlsx", sheet = 3)

# unite multiple segments of a time series of measurements
dat <- tecan_unite("path/to/file.xlsx")

# specify with which sheets to start and how many to include
dat <- tecan_unite("path/to/file.xlsx", segments = 2, start = 1)
```

### Examples

``` r
# parse supplied example file of time series with multiple measurements per well
# at each timepoint
tecan_parse(
  system.file(
    "extdata",
    "tecan_time_series_multiple_reads.xlsx",
    package = "tecanr"
  )
)
#> ℹ Multiple reads per well detected
#> ℹ Time series detected
#> # A tibble: 120 × 10
#>    well  time_s temp_c   mean st_dev   x1_2  x2_1   x1_1   x0_1   x1_0
#>    <chr>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl> <dbl>  <dbl>  <dbl>  <dbl>
#>  1 A1         0   30.6 0.0959 0.0106 0.0897 0.113 0.0873 0.0902 0.0991
#>  2 A1       600   30.3 0.108  0.0207 0.0925 0.144 0.104  0.104  0.0963
#>  3 A1      1200   30.6 0.106  0.0171 0.0926 0.135 0.102  0.102  0.0961
#>  4 A1      1800   30.7 0.108  0.0193 0.0924 0.140 0.102  0.109  0.0953
#>  5 A1      2400   30.5 0.104  0.0181 0.0920 0.134 0.0908 0.105  0.0952
#>  6 A1      3000   30.5 0.103  0.0184 0.0917 0.134 0.0895 0.103  0.0947
#>  7 A1      3600   30.3 0.102  0.0187 0.0921 0.135 0.0892 0.101  0.0951
#>  8 A1      4200   30.4 0.101  0.0165 0.0919 0.130 0.0898 0.101  0.0941
#>  9 A1      4800   30.5 0.101  0.0174 0.0919 0.131 0.0893 0.0996 0.0933
#> 10 A1      5400   30.6 0.101  0.0170 0.0916 0.131 0.0887 0.0989 0.0943
#> # ℹ 110 more rows
```

``` r
# read supplied example file of a time series of measurements where the plate
# reader program was stopped and restarted, resulting in the data being split
# into multiple segments / sheets
tecan_unite(
  system.file(
    "extdata",
    "tecan_time_series_segments.xlsx",
    package = "tecanr"
  )
)
#> ℹ Multiple reads per well detected
#> ℹ Time series detected
#> ℹ Multiple reads per well detected
#> ℹ Time series detected
#> # A tibble: 120 × 10
#>    well   time temperature   mean st_dev   x1_2  x2_1   x1_1   x0_1   x1_0
#>    <chr> <dbl>       <dbl>  <dbl>  <dbl>  <dbl> <dbl>  <dbl>  <dbl>  <dbl>
#>  1 A1        0        30.6 0.0959 0.0106 0.0897 0.113 0.0873 0.0902 0.0991
#>  2 A1      600        30.3 0.108  0.0207 0.0925 0.144 0.104  0.104  0.0963
#>  3 A1     1200        30.6 0.106  0.0171 0.0926 0.135 0.102  0.102  0.0961
#>  4 A1     1800        30.7 0.108  0.0193 0.0924 0.140 0.102  0.109  0.0953
#>  5 A1     2400        30.5 0.104  0.0181 0.0920 0.134 0.0908 0.105  0.0952
#>  6 A1     3000        30.5 0.103  0.0184 0.0917 0.134 0.0895 0.103  0.0947
#>  7 A1     3600        30.3 0.102  0.0187 0.0921 0.135 0.0892 0.101  0.0951
#>  8 A1     4200        30.4 0.101  0.0165 0.0919 0.130 0.0898 0.101  0.0941
#>  9 A1     4800        30.5 0.101  0.0174 0.0919 0.131 0.0893 0.0996 0.0933
#> 10 A1     5400        30.6 0.101  0.0170 0.0916 0.131 0.0887 0.0989 0.0943
#> # ℹ 110 more rows
```
