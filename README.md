
<!-- README.md is generated from README.Rmd. Please edit that file -->

# SatisfiRe

<!-- badges: start -->
<!-- badges: end -->

The goal of SatisfiRe is to analyse data from consumers survey

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

## Display NPS

``` r
NPS_Dognuts(c(1,2,10,4,3,6,7,8))
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/master/examples>.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
