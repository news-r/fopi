library(rvest)

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


usethis::use_data(DATASET, overwrite = TRUE)
