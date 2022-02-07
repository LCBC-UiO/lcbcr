
<!-- README.md is generated from README.Rmd. Please edit that file -->

# LCBC functions <img src="man/figures/logo.png" align="right" alt="" width="120" />

<!-- badges: start -->

[![R-CMD-check](https://github.com/LCBC-UiO/lcbcr/workflows/R-CMD-check/badge.svg)](https://github.com/LCBC-UiO/lcbcr/actions)
[![r-universe](https://lcbc-uio.r-universe.dev/badges/lcbcr)](https://lcbc-uio.r-universe.dev/ui#packages)
<!-- badges: end -->

This package can be installed through the [LCBC
r-universe](https://lcbc-uio.r-universe.dev/ui#builds):

``` r
# Enable universe(s) by lcbc-uio
options(repos = c(
  lcbcuio = 'https://lcbc-uio.r-universe.dev',
  CRAN = 'https://cloud.r-project.org'
))

# Install some packages
install.packages('lcbcr')
```

or using remotes:

``` r
install.packages("remotes")
remotes::install_github("LCBC-UiO/lcbcr", build_vignettes = TRUE)
```

The functions are now installed, and you may load them when you want to
use them. All functions are documented in standard R fashion.

The vignette and other presentations or tutorials of the package can
also be found online [here](https://lcbc-uio.github.io/lcbcr/)
