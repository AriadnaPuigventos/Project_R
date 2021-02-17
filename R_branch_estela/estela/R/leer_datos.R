#' Title
#'
#' @param config 
#' @param path 
#'
#' @return
#' @export
#'
#' @examples
leerDatos <- function(config, path){
  
  pathDatos <- paste0(path, "data/", config$input$name)
  
  browser()
  
  tryCatch(expr = {
    
    datos <-data.table::fread(pathDatos, encoding = 'UTF-8',
                              data.table = FALSE)
    
  }, error = function(e){
    
    logerror("Datos no encontrados en su ruta. Verifica el archivo datos",
             logger = 'log')
    stop()
  })
  if (nrow(datos) == 0 | ncol(datos) == 0){
    
    logerror("Datos mal leidos, verifica que tengan el formato correcto.",
             logger = 'log')
    stop()
    
  }
  
  return(datos)
  
}