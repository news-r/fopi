
<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- badges: start -->

[![Build
status](https://ci.appveyor.com/api/projects/status/eoilou2fr917aew4?svg=true)](https://ci.appveyor.com/project/JohnCoene/fopi)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
<!-- badges: end -->

# fopi

fopi contains with dataset, and a RESTful API for the Freedom of Press
Index.

## API

From R

``` r
fopi::run_api()
```

With docker

``` bash
docker pull jcoenep/fopi
docker run --rm -p 3000:8000 jcoenep/fopi
```

Visit `http://127.0.0.1:3000/__swagger__/` for swagger docs.

## Data

You can access the data with.

``` r
data(fopi, package = "fopi")
```

Or via the [deployed API](http://app.news-r.org:2222/__swagger__/) but
using the package.

``` r
fopi::fopi_get_country("Switzerland")
#> # A tibble: 17 x 5
#>    country     country_code  year  rank score
#>    <chr>       <chr>        <int> <int> <dbl>
#>  1 Switzerland CH            2019     6 10.5 
#>  2 Switzerland CH            2018     5 11.3 
#>  3 Switzerland CH            2017     7 12.1 
#>  4 Switzerland CH            2016     7 11.8 
#>  5 Switzerland CH            2015    20 13.8 
#>  6 Switzerland CH            2014    15 10.5 
#>  7 Switzerland CH            2013    14  9.94
#>  8 Switzerland CH            2012     8 -6.2 
#>  9 Switzerland CH            2010     1  0   
#> 10 Switzerland CH            2009     7  1   
#> 11 Switzerland CH            2008     7  3   
#> 12 Switzerland CH            2007    11  3   
#> 13 Switzerland CH            2006     8  2.5 
#> 14 Switzerland CH            2005     1  0.5 
#> 15 Switzerland CH            2004     1  0.5 
#> 16 Switzerland CH            2003    12  2.5 
#> 17 Switzerland CH            2002    15  4.25
```

## Get it

You can install the development version of fopi from Github with:

``` r
# install.packages("remotes")
remotes::install_github("news-r/fopi")
```
