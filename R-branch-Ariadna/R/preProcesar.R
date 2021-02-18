
#' @title split_data
#' 
#' @description This function call to datos and return split data 
#' 
#' @param data list of datasets
#' @param config List of configuration parameters 
#'
#' @return
#' 
#' @import logging
#'
preProcesar <- function (datos, config){
  # datos es un dataframe sacado del csv de interes
  datos <- datos[-1]
  countries_with_nans <- rownames(datos)[rowSums(is.na(datos)) > 0]
  years_with_nans <- colnames(datos)[colSums(is.na(datos)) > 0]
  first_country_with_nan <- countries_with_nans[1]
  first_year_with_nan <- years_with_nans[1]
  
  y <- datos[first_year_with_nan] 
  X <- datos[-as.integer(first_country_with_nan),] 
  
  X1= na.omit(X)
  
  #to train
  y_train <- as.vector(t(X1[first_year_with_nan]))
  X_train <- data.frame(X1[colnames(X1)!=first_year_with_nan])
  X_test <- datos[colnames(datos) != first_year_with_nan][first_country_with_nan,]
  X_test[is.na(X_te)] <- mean(as.vector(t(X_te)), na.rm = TRUE)
  
  return(X_train, y_train, X_test)
}
