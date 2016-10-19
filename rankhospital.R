rankhospital <- function(estado,resultado,num="mejor"){
    setwd("~/Documents/Programacion_Actuarial_III_OT16/Calidad de Hospitales - data")
    #Lectura de datos
    Tasa <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
    Tasa[,2] <- as.character(Tasa[, 2])
    # Revisi??n de la validez de estado y resultado 
    St <- factor(Tasa[, 7])
    r <- factor(c("ataque","falla","neumonia","mejor","peor"))
    if(estado %in% St == FALSE)
    { stop("Estado invalido")}
    e = FALSE
    if (resultado == "ataque"){
        e = TRUE
        co <- 11
    }
    else if ( resultado =="falla" ){
        e = TRUE
        co <-17
    }
    else if (resultado =="neumonia"){
        e = TRUE
        co <- 23
    }
    else 
    { stop("resultado invalido")}
    St <- Tasa[Tasa$State == estado, ]
    Rate <- co
    s <- St[, c(2,Rate)]
    nu1 <- as.numeric(s[,2])
    or <- order(nu1,na.last = NA,decreasing = FALSE)
    s1 <- s[or, ]
    n <- nrow(s1)
    if(num == "mejor") {
        num <- 1}
    if(num == "peor"){ 
        num <- n}
    if(num > n) {stop("NA")}
    tabla <- data.frame(s1,rank=1:n)
    Q <- s1[,2] == s1[num,2]
    s2 <- s1[Q,]
    mejor1 <- s2[order(s2[,1]),]
    mejor1[1,1] 
    
}
rankhospital("TX", "falla", 4)
rankhospital("MD", "ataque", "peor")
rankhospital("MN", "ataque", 5000)