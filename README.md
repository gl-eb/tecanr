
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

## Example

``` r
library(tecanr)
```

``` r
# read supplied example file of single timepoint measurements
dat <- tecan_parse(
  system.file(
    "extdata",
    "tecan_single_time_multi_reads.xlsx",
    package = "tecanr"
  )
)
#> ℹ Multiple reads per well detected
dat
#> # A tibble: 96 × 8
#>    well   mean st_dev  x1_2  x2_1   x1_1   x0_1   x1_0
#>    <chr> <dbl>  <dbl> <dbl> <dbl>  <dbl>  <dbl>  <dbl>
#>  1 A1    0.107 0.0364 0.106 0.171 0.0856 0.0873 0.0866
#>  2 A2    0.114 0.0278 0.114 0.161 0.0993 0.106  0.0889
#>  3 A3    0.117 0.0320 0.119 0.171 0.102  0.102  0.0899
#>  4 A4    0.110 0.0262 0.104 0.155 0.101  0.100  0.0878
#>  5 A5    0.110 0.0293 0.112 0.160 0.0913 0.0999 0.0877
#>  6 A6    0.110 0.0231 0.118 0.147 0.101  0.0979 0.0881
#>  7 A7    0.104 0.0149 0.109 0.123 0.0883 0.109  0.0883
#>  8 A8    0.110 0.0198 0.114 0.140 0.0969 0.109  0.0884
#>  9 A9    0.108 0.0205 0.103 0.135 0.0886 0.122  0.0897
#> 10 A10   0.104 0.0184 0.102 0.135 0.0891 0.102  0.0903
#> # ℹ 86 more rows
```

``` r
# read your own set measurements
dat2 <- tecan_parse("path/to/file.xlsx")

# specify sheet of the excel file (default: 1)
dat3 <- tecan_parse("path/to/file.xlsx", sheet = 3)
```

``` r
# read supplied example file of multiple timepoint measurements
# parameters work the same as for tecan_read_single()
dat4 <- tecan_parse(
  system.file(
    "extdata",
    "tecan_time_series_multi_reads.xlsx",
    package = "tecanr"
  )
)
#> ℹ Multiple reads per well detected
#> ℹ Time series detected
dat4
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
