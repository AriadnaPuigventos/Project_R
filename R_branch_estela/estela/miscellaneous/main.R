#EJEMPLO DE NACHO 

lapply(c("dummies", "logging", "xgboost", "XML"), require, character.only = T)

Directorio <- "C:/Users/nacho/Desktop/The_Bridge/temario/DATA_NOV2019-master/R/clasificarContactos/"

setwd(Directorio)
carpetaScripts <- paste0(Directorio, "R/")

#List files nos devuelve los archivos dentro del directorio.

lapply(paste0("R/", list.files(path = "R/", recursive = TRUE)), source)

#debug(clasificarContactosApp)

clasificarContactosApp(Directorio)

#undebug(clasificarContactosApp)

#-------------------------------------------------------------------------------------------------------------

#TRIAL NUESTRO PARA IR VIENDO QUE FUNCIONA CADA FUNCION()




path<-paste0(getwd(),"/")
path

d<-predict_nans(path)

config<-leerConfig(path)

data=leerDatos(config, path)


data

