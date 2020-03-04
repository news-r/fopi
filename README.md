
<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Build
status](https://ci.appveyor.com/api/projects/status/eoilou2fr917aew4?svg=true)](https://ci.appveyor.com/project/JohnCoene/fopi)
<!-- badges: end -->

# fopi

fopi contains with dataset, and a RESTful API for the Freedom of Press
Index.

## Data

``` r
data(fopi, package = "fopi")
```

## API

From R

```r
run_api()
```

With docker

``` bash
docker pull jcoenep/fopi
docker run --rm -p 3000:8000 jcoenep/fopi
```

Visit `http://127.0.0.1:3000/__swagger__/` for swagger docs.

## Get it

You can install the development version of fopi from Github with:

``` r
# install.packages("remotes")
remotes::install_github("news-r/fopi")
```
