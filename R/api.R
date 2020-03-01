#' API
#' 
#' Run the Freedom of Press Index API.
#' 
#' @name api
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

