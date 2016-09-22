
completos <- function(directorio,id=1:332){
  getwd()
  setwd("~/GitHub/Programacion_Actuarial_III_OT16/specdata")
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

completos("specdata",1:6)
