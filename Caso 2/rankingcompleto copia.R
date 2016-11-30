rankingcompleto <- function(resultado, num = "mejor") {
    setwd("~/Documents/Programacion_Actuarial_III_OT16/Calidad de Hospitales - data")
    #Lectura de datos
    Tasa <- read.csv("outcome-of-care-measures.csv")
    r <- c("ataque", "falla", "neumonia")
    if (resultado == "ataque"){
        col <- 11}
    else if (resultado == "falla"){
        col <- 17}
    else if (resultado == "neumonia"){
        col <- 23}
    else if (resultado %in% r == F){
        stop("resultado inv??lido")
    }
    Tasa[, col] <- suppressWarnings(as.numeric(levels(Tasa[, col])[Tasa[, col]]))
    Tasa[, 2] <- as.character(Tasa[, 2])
    
    vec1 <- vector() 
    St <- levels(Tasa[, 7])
    for(i in 1:length(St)) {
        estado <- Tasa[grep(St[i], Tasa[,7]), ]
        or <- estado[order(estado[, col], estado[, 2], na.last = NA), ]
        
        if(num == "mejor") {
            nombre <- or[1, 2]}
        else if(num == "peor") {
            nombre <- or[nrow(or), 2]}
        else { nombre <- or[num, 2]}
        
        vec1 <- append(vec1, c(nombre, St[i]))
    }
    vec1 <- as.data.frame(matrix(vec1, length(St), 2, byrow = TRUE))
    colnames(vec1) <- c("Hospital", "State")
    rownames(vec1) <- St
    vec1
}
head(rankingcompleto("ataque", 20), 10)
