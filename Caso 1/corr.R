
corr <- function(directorio, horizonte = 0){
  getwd()
  setwd("~/Documents/Programacion_Actuarial_III_OT16/specdata")
  completos <- function(directorio,id=1:332){
    suma1 <- numeric()
    for(i in id ){
      p <- paste(formatC(i,width = 3, flag = "0"),".Csv",sep ="")
      datos <- read.csv(p, header = TRUE)
      
      
      com <- complete.cases(datos)
      suma1 <- c(suma1,sum(com))
      
    }
    ComId<- data.frame(Id = id, nobs = suma1)
    ComId
  }
  
  compl <- completos("specdata",1:332)
  
  ne <- compl["nobs"] > horizonte
  nom <- compl[ne,]$Id

  
  co <- numeric()
  for(n in nom){
    p <- paste(formatC(n,width = 3, flag = "0"),".Csv",sep ="")
    datos <- read.csv(p, header = TRUE)

    com <- datos[complete.cases(datos),]
    n <- com$nitrate
    s <- com$sulfate
    co <- c(co,cor(n, s,))
  }
  
  co
  }

??

+