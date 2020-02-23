# Module UI
  
#' @title   mod_home_ui and mod_home_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_home
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_home_ui <- function(id){
  ns <- NS(id)
  tagList(
  
  )
}
    
# Module Server
    
#' @rdname mod_home
#' @export
#' @keywords internal
    
mod_home_server <- function(input, output, session){
  ns <- session$ns
}
    
## To be copied in the UI
# mod_home_ui("home_ui_1")
    
## To be copied in the server
# callModule(mod_home_server, "home_ui_1")
 
