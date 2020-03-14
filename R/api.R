#' Run API
#' 
#' Run the Freedom of Press Index API.
#' 
#' @param host,port Parameters passed to \link[plumber]{plumb}.
#' 
#' @name run_api
#' @export
run_api <- function(host = "0.0.0.0", port = 3000){
  port <- as.integer(port)

  fl <- system.file("api/api.R", package = "fopi")

  pr <- plumber::plumb(fl)
  pr$run(
    host = host, port = port,
    swagger = TRUE
  )
}

#' Base URL
#' 
#' Define base url, if API was self-deployed.
#' 
#' @param url URL to use as base.
#' 
#' @export 
fopi_base_url <- function(url){
  if(missing(url))
    stop("Missing `url`")

  options(FOPI_BASE_URL = url)
}

base_url <- "http://app.news-r.org:2222/"

.get_base_url <- function(){
  getOption("FOPI_BASE_URL", base_url)
}

#' Call API
#' 
#' Get data via the API.
#' 
#' @param year Year of data to fetch.
#' @param country Country of data to fetch.
#' @param rank Rank of data to fetch.
#' 
#' @name call_api
#' @export 
fopi_get_year <- function(year){
  if(missing(year))
    stop("Missing `year`", call. = FALSE)

  url <- httr::parse_url(.get_base_url())
  url$path <- "year"
  url$query <- list(
    year = year 
  )
  url <- httr::build_url(url)

  response <- httr::GET(url)
  httr::stop_for_status(response)
  content <- httr::content(response)

  purrr::map_dfr(content, tibble::as_tibble)
}

#' @rdname call_api
#' @export 
fopi_get_country <- function(country){
  if(missing(country))
    stop("Missing `country`", call. = FALSE)

  url <- httr::parse_url(.get_base_url())
  url$path <- "country"
  url$query <- list(
    country = country 
  )
  url <- httr::build_url(url)

  response <- httr::GET(url)
  httr::stop_for_status(response)
  content <- httr::content(response)

  purrr::map_dfr(content, tibble::as_tibble)
}

#' @rdname call_api
#' @export 
fopi_get_rank <- function(rank){
  if(missing(rank))
    stop("Missing `rank`", call. = FALSE)

  url <- httr::parse_url(.get_base_url())
  url$path <- "rank"
  url$query <- list(
    rank = rank 
  )
  url <- httr::build_url(url)

  response <- httr::GET(url)
  httr::stop_for_status(response)
  content <- httr::content(response)

  purrr::map_dfr(content, tibble::as_tibble)
}
