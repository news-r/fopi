
<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

# fopi

fopi contains with dataset, RESTful API and app presenting the Freedom
of Speech Index.

## Installation

You can install the development version of fopi from
[CRAN](https://CRAN.R-project.org) with:

``` r
# install.packages("remotes")
remotes::install_github("news-r/fopi")
```

## Example

Dataset is lazyly loaded.

``` r
library(fopi)

head(fopi)
```
