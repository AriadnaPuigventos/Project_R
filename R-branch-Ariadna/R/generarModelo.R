#' Title
#' Description: this function is called split data to return output
#' @param datos
#' @param config 
#'
#' @import caret
#' @import logging
#' @param X_train
#' @param y_train
#' @param X_test
#'
#' @param config 
#'
#' @examples

install.packages("caret") #this package has the createDataPartition function

library(caret)
library (logging)


generarModelo <- function(X_train, y_train, X_test, config){
  
  # Simple linear regression model lm
  model_1 <- train(x=X_tr, y=Y_tr, method = 'lm')

  browser()
  
  loginfo("Resumen de modelo de ML", logger = 'log')
  summary(model_1)

  #predict to the model
  resultado <- predict(model_1, newdata=X_te)
  
  browser()
  
  loginfo("Resumen de modelo de ML terminado", logger = 'log')
  summary(resultado)
  
  output <- rusultado
  
  return(output)
  
}

