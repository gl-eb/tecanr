% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tecan_single_time_multiple_reads.R
\name{tecan_single_time_multiple_reads}
\alias{tecan_single_time_multiple_reads}
\title{Read multiple measurements per well}
\usage{
tecan_single_time_multiple_reads(dat_raw)
}
\arguments{
\item{dat_raw}{(tibble) a excel sheet}
}
\value{
A \code{\link[tibble:tibble]{tibble::tibble()}} containing tidy data
}
\description{
\code{\link[=tecan_single_time_multiple_reads]{tecan_single_time_multiple_reads()}} gets a Tecan plate reader measurement
from an Excel file when multiple readings of each well were taken
}
\examples{
tecan_raw$single_time_multiple_reads |> tecan_single_time_multiple_reads()

}
