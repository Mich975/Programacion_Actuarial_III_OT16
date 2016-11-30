

mediacontaminante <- function(directorio,contaminante, id = 1:332){
  getwd()
  setwd("~/Documents/Programacion_Actuarial_III_OT16/specdata")
  n <- numeric()
  s <- numeric()

  for (i in id){
    p <- paste(formatC(i,width = 3, flag = "0"),".Csv",sep ="")
    datos <- read.csv(p, header = TRUE)
      n <- c(n,datos$nitrate)
      s <- c(s,datos$sulfate)
    
    if (contaminante == "nitrate"){
  
        media <- mean(n,na.rm = TRUE)
      } else if (contaminante == "sulfate"){
        media <- mean(s,na.rm = TRUE)
      }
  }
  media
}
mediacontaminante("specdata","sulfate",1:10)