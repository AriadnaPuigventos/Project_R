
#' @title create_output
#' @description This function is called by the skeleton function and create the 
#' output doc in to Outpute File 
#' 
#' @param output DataFrame 
#' @param config List of configuration parameters 
#' @param path The environment of project
#' 
#' @import logging
#'
#' @return
#' 

generarOutput <-  function(resultado, path){
  
  nameOutput <- paste0(path, "output/PredictedNumber.csv")
  
  tryCatch(expr = {
    
    write.csv(resultado, file = nameOutput, 
              row.names = FALSE)
    
  }, error = function(e){
    
    logerror("Saving failed!", logger = 'log')
    stop()
  })
  
}