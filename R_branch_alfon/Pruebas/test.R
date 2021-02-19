df <- read.csv('child_mortality_0_5_year_olds_dying_per_1000_born.csv')
df <- read.csv('/Users/alfonsogarcia/Documents/Bootcamp_Data_Science/Git-Student/Project_R/R_branch_alfon/data/child_mortality_0_5_year_olds_dying_per_1000_born.csv')
head(df)
df[is.na(df)]
colSums(is.na(df) > 0)
# Setting index to countries column
rownames(df) <- df$country
# Dropping countries column now that it is on the index
df <- df[-1]
# Obtaining countries that have NaNs
countries_with_nans <- rownames(df)[rowSums(is.na(df)) > 0]
# Obtaining years that have NaNs
years_with_nans <- colnames(df)[colSums(is.na(df)) > 0]
# Assigning y_predict to the df with the NaNs
df[countries_with_nans, years_with_nans] -> y_predict
#df[countries_with_nans, years_with_nans
d_train <- na.omit(df)

# the first country with nan values will define our X_test
first_country_with_nan <- countries_with_nans[1]
# the first year with nan values will define our y variable
first_year_with_nan <- years_with_nans[1]
# defining X and y variables
y <- df[first_year_with_nan] # The first year (column) with nans
X <- df[colnames(df) != first_year_with_nan] # All the remaining years
# Splitting data
X_test <- X[first_country_with_nan,] # In this case Andorra, all columns except the one used for y
X_train <- X[rownames(X) != first_country_with_nan,] # All the remaining countries
y_train <- y[rownames(y) != first_country_with_nan,] # Of the y column, all of the countries except the one we want to predict



# install.packages('caret') 
# # SPLIT
# library(caret) #this package has the createDataPartition function
# 
# set.seed(123) #randomization`
# 
# #creating indices
# trainIndex <- createDataPartition(df, p=0.75,list=FALSE)
# 
# #splitting data into training/testing data using the trainIndex object
# IRIS_TRAIN <- iris[trainIndex,] #training data (75% of data)
# 
# IRIS_TEST <- iris[-trainIndex,] #testing data (25% of data)
# library(caret)

# Generar modelo
generarModelo <- function(datosSplit, config){
  
  # Simple linear regression model (lm means linear model)
  model_1 <- train(X_train ~ y_train, data = df, method = 'lm')
  
  loginfo("Resumen de modelo de ML", logger = 'log')
  summary(model_1)
  
  #predict to the model
  predict_test <- predict(model_1, X_test)
  
  loginfo("Resumen de modelo de ML terminado", logger = 'log')
  summary(mod1)
  
  #simple.fit <- lm(d_train ~ y_predict, data=df)
  
  browser()
  
  RMSE <- sqrt(mean((predict_test - u_predict[, ncol(d_train)])^2))
  
  resultado <- predict(model_1, y_predict)  #aqu?? estamos duplicando...
  
  browser()
  
  y_predict[, ncol(y_predict)] <- resultado
  
  output <- predict_y
  
  return(output)
  
}
############ 
# Test 2

df <- df[-1]

countries_with_nans <- rownames(df)[rowSums(is.na(df)) > 0]

years_with_nans <- colnames(df)[colSums(is.na(df)) > 0]

first_country_with_nan <- countries_with_nans[1]

first_year_with_nan <- years_with_nans[1]

y <- df[first_year_with_nan] 
X <- df[-as.integer(first_country_with_nan),] 

X1= na.omit(X)

Y_tr <- as.vector(t(X1[first_year_with_nan]))
X_tr <- data.frame(X1[colnames(X1)!=first_year_with_nan])
X_te <- X_test
X_te[is.na(X_te)] <- sum(as.vector(t(X_te)), na.rm = TRUE)
class(Y_tr)
class(as.vector(X1[first_year_with_nan]))
 
library(caret)
model_1 <- train(x=X_tr, y=Y_tr, method = 'lm')
resultado <- predict(model_1, newdata=X_te)

sum(as.vector(t(X_te)), na.rm = TRUE)


preProcesar <- function (datos){
  # datos es un dataframe sacado del csv de interes
  datos <- datos[-1]
  countries_with_nans <- rownames(datos)[rowSums(is.na(datos)) > 0]
  years_with_nans <- colnames(datos)[colSums(is.na(datos)) > 0]
  first_country_with_nan <- countries_with_nans[1]
  first_year_with_nan <- years_with_nans[1]
  
  y <- datos[first_year_with_nan] 
  X <- datos[-as.integer(first_country_with_nan),] 
  
  X1= na.omit(X)
  
  y_train <- as.vector(t(X1[first_year_with_nan]))
  X_train <- data.frame(X1[colnames(X1)!=first_year_with_nan])
  X_test <- datos[colnames(datos) != first_year_with_nan][first_country_with_nan,]
  X_test[is.na(X_te)] <- mean(as.vector(t(X_te)), na.rm = TRUE)
  return(X_train, y_train, X_test)
}