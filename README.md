# tecanr

<!-- badges: start -->
<!-- badges: end -->

tecanr is an R package to extract data from files generated by Tecan Infinite
200 Pro plate readers. Currently, only multiple reads per well are supported due
to differences in the layout of the data in the spreadsheets.

## Installation

You can install the development version of tecanr from
[GitHub](https://github.com/gl-eb/tecanr) with:

``` r
# install.packages("devtools")
devtools::install_github("gl-eb/tecanr")
```

## Example

``` r
library(tecanr)

# read supplied example file of single timepoint measurements
dat <- tecan_read_single(
        system.file(
          "extdata",
          "tecan_singleTime_multiReads.xlsx",
          package = "tecanr"
        )
       )

# read your own set of single timepoint measurements
dat2 <- tecan_read_single("path/to/file.xlsx")

# specify sheet of the excel file (default: 1)
dat3 <- tecan_read_single("path/to/file.xlsx", sheet = 3)

# read supplied example file of multiple timepoint measurements
# parameters work the same as for tecan_read_single()
dat4 <- tecan_read_series(
          system.file(
            "extdata",
            "tecan_timeSeries_multiReads.xlsx",
            package = "tecanr"
          )
        )
```
