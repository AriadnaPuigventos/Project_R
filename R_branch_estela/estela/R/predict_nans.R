@title PredictNanValues
#' @description Funcion principal del paquete de clasificarContactos
#'
#' @param path, string
#'
#' @export
#' @import logging
#'
#' @author Alfon, Ari, Estela
predict_nans<- function(path){
  tryCatch(expr = {
    library(logging)
    
    addHandler(writeToFile, logger = 'log', file = paste0(path, "/log/logfile.log"))
    
    loginfo("Empezamos la app...", logger = 'log')
    
    loginfo("Leyendo el Config...", logger = 'log')
    config <- leerConfig(path)
    loginfo("Config leido.", logger = 'log')
    
    
    loginfo("Leyendo los datos...", logger = 'log')
    datos <- leerDatos(config, path)
    loginfo("Datos leidos.", logger = 'log')
    
    
  }, error = function(e){
    
    logerror("La aplicación ha petado...", logger = 'log')
    
    stop()
    
  }, finally = {
    loginfo("Fin de la ejecucion.", logger = 'log')
    removeHandler(writeToFile, logger = 'log')
  })
  
}
