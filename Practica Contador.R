
abajo <- 0
arriba <- 0

for(i in 1:100){
  z <- 5
while(z>=3 && z<=10){
  
  caminata<- c(caminata,z)
  moneda <- rbinom(1,1,0.5) 
  if(moneda == 1){#caminata aleatoria 
    z <- z + 0.5
  }else{
    z <- z-0.5
  }
}  

if (z > 3) {abajo <- c(abajo + 1)}
  else if (z<10) {arriba <- c(arriba + 1)}
}
abajo
arriba
plot(caminata)