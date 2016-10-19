rankingcompleto <- function(resultado, num = "mejor") {
setwd("~/Documents/Programacion_Actuarial_III_OT16/Calidad de Hospitales - data")
#Lectura de datos
    Tasa <- read.csv("outcome-of-care-measures.csv")
    t <- factor("infarto", "falla", "neumonia","num")
    Tasa[,2] <- as.character(Tasa[, 2])
      if (resultado == "ataque"){
        co <- 11}
      else if (resultado == "falla"){ 
        co <- 17}
      else if (resultado == "neumonia") {
        co <- 23}
      else  {
        stop("resultado inv??lido")
    }
s <- numeric()
St <- levels(Tasa$State)
n <- length(St)
    for(i in 1:n) {
        EstadoI <- Tasa[St[i] == Tasa$State,]
        co1 <- EstadoI[, co]
        or <- EstadoI[order(co1, na.last = NA), ]
        primero <- or[1,2]
        ultimo <- or[nrow(or),2]
        if(num == "mejor"){
            numm <- primero}
        else if(num == "peor"){
             numm <- ultimo}
        else {numm <- or[num, 2]}
        Hosp <- c(numm, St[i])
        s <- append(s,Hosp)
    }

m <- matrix(s,n,2,byrow = T)
colnames(m) <- c("Hospital", "State")
rownames(m)<- St
n1 <- data.frame(m)
n1
}

head(rankingcompleto("ataque", 20), 10)
tail(rankingcompleto("neumonia", "peor"), 3)