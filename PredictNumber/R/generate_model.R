#' Title
#'
#' @param datos 
#' @param config 
#'
#' @import lm
#' @import logging
#' @param preProcesed 
#'
#' @examples
#' 
#' 


generarModelo <- function(preProcesed){
  
  library(caret)
  library(logging)
  
  X_train<-preProcesed$X_tr
  y_train<-preProcesed$y_tr
  X_test<-preProcesed$X_te
  
  X_test[is.na(X_test)] <- mean(as.vector(t(X_test)), na.rm = TRUE)
  
  # Simple linear regression model lm
  model_1 <- train(x=X_train, y=y_train, method = 'lm')
  
  browser()
  
  loginfo("Resumen de modelo de ML", logger = 'log')
  summary(model_1)
  
  #predict to the model
  resultado <- predict(model_1, newdata=X_test)
  
  browser()
  
  loginfo("Resumen de modelo de ML terminado", logger = 'log')
  
  summary(resultado)
  
  
  return(resultado)
  
}
