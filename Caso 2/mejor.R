mejor <- function(estado,resultado){
setwd("~/Documents/Programacion_Actuarial_III_OT16/Calidad de Hospitales - data")
#Lectura de datos
Tasa <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
Tasa[,2] <- as.character(Tasa[, 2])
# Revisi??n de la validez de estado y resultado 
St <- factor(Tasa[, 7])
r <- factor(c("ataque","falla","neumonia"))
    if(estado %in% St == FALSE)
    { stop("Estado invalido")}
     e = F
    if (resultado == "ataque"){
          e = T
          co <- 11
            }
    else if ( resultado =="falla" ){
         e = T
          co <-17
            }
    else if (resultado =="neumonia"){
           e = T
           co <- 23
            }
    else 
    { stop("resultado invalido")}
#
St <- Tasa[Tasa$State == estado, ]
s <- St[, c(2,co)]
nu1 <- as.numeric(s[,2])
or <- order(nu1,na.last = NA,decreasing = FALSE)
s1 <- s[or, ]
a <-s1[,2]==s1[1,2]
s2 <-s1[a,]
s3 <- s2[order(s2[,1]),]
m <- s3[1,1]
m
}
mejor("TX","ataque")
mejor("TX","falla")
mejor("MD","neumonia")