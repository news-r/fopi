library(rvest)
library(dplyr)

# url
uri <- "https://en.wikipedia.org/wiki/Press_Freedom_Index"

html <- read_html(uri)

clean_names <- function(x){
  nms <- names(x)
  nms <- gsub("\\[.*\\]", "", nms)
  nms <- trimws(nms)
  nms <- tolower(nms)
  names(x) <- nms
  return(x)
}

table <- html %>% 
  html_nodes(".wikitable") %>% 
  html_table() %>% 
  .[[2]] %>% 
  clean_names()

table_long <- tidyr::pivot_longer(table, -country, names_to = "year")

fopi_rank <- table_long %>% 
  mutate(
    value = gsub("\\).*", "", value),
    value = gsub("\\(", "", value),
    value = as.integer(value),
    country = gsub("\\[.*\\]", "", country),
    country_code = countrycode::countrycode(country, "country.name", "iso2c")
  ) %>% 
  rename(rank = value) %>% 
  select(country, country_code, year, rank)

score <- table_long %>% 
  mutate(
    value = gsub("\\(.*\\)", "", value),
    value = trimws(value),
    value = gsub("−", "-", value)
  ) %>% 
  pull(value)

fopi <- fopi_rank
fopi$score <- score

fopi <- tibble::as_tibble(fopi) %>% 
  mutate(
    year = as.integer(year),
    score = case_when(
      score == "N/A" ~ NA_character_,
      TRUE ~ score
    ),
    score = as.numeric(score)
  )

usethis::use_data(fopi, overwrite = TRUE)
