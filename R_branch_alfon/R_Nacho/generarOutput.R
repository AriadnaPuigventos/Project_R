#' Title
#'
#' @param output 
#' @param config 
#' @param path 
#'
#' @return
#' @export
#'
#' @examples
generarOutput <- function(output, config, path){
  
  #Ponemos una marca de tiemnpo para saber cuando se ha guardado el modelo,
  # además, la fecha y hora le da un nombre único al archivo
  marcaTmp <- Sys.time()
  
  
  nombreArchivo <- paste0(path, "output/deberesAlemania.csv")
  
  tryCatch(expr = {
    
    write.csv(output$prediccion, file = nombreArchivo, sep = config$input$sep,
              row.names = FALSE)
    
  }, error = function(e){
    
    logerror("Ha fallado el guardado!!", logger = 'log')
  })
  
  nombreArchivo <- paste0(path, "output/modelo.rds")
  
  tryCatch(expr = {
    
    saveRDS(output$modelo, file = nombreArchivo)
    
  }, error = function(e){
    
    logerror("Ha fallado el guardado del modelo!!", logger = 'log')
  
})
  
}