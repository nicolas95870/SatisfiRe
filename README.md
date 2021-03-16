
<!-- README.md is generated from README.Rmd. Please edit that file -->

# SatisfiRe

<!-- badges: start -->
<!-- badges: end -->

The goal of SatisfiRe is to analyze data from consumers survey

## Installation

You can install the released version of SatisfiRe from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("SatisfiRe")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("nicolas95870/SatisfiRe")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(SatisfiRe)
## basic example code
```

## Compute NPS

``` r
NPS(c(1,10,2,3,5,2))
#> [1] -66.67
```

## Display NPS Dognuts

``` r
NPS_Dognuts(c(1,2,10,4,3,6,7,8))
```

## Display NPS Evolution

``` r
NPS_evolution_plot(c(1,10),c("01/01/2020","01/02/2020"),"mois")
```

## Display Evolution NPS by category

``` r
NPS_evolution_repartition(my_dataset$reco,my_dataset$date,"mois")
```
