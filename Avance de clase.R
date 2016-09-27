#clase 25/08/16
#crear vectores con la funci??n vector
x <- vector(mode="numeric", length = 5L)
x

#crear vectores con la funci??n c
x <- c(0.5,0.6)
x

class(x)

x<- c(TRUE,FALSE, T, F)
x
class
y <- 5:10
x
class(x)
x<- 10:0
x
class(x)
class


x<- c(1+2i, 5, 3+9i, -4-5i)
x
class(x)


x<- c("a", "b", "c", "d")
x
class(x)

#Mezcla de objetos en un vector

y<- c(1.7, "a")   #caracter 
y
class(y)

y<- c(true,2)   #numerico
y 
class(y)


y<- c("a", True) #caracter
y
class(y)





y<- c(TRUE)
y
class(y)



#orden de coacci??n/cohersion explicita
#1 caracter
#2complejo
#3numerico
#4entero
#5logico


#coercion explicita
z<- 0:6
class(z)
as.numeric(z)
as.logical(z)
as.character(z)




z<- c(1+2i, 3+4i,8,0)
as.logical(z)


z<- c("programaci??n", "actuarial","III")
as.numeric(z)
as.logical(z)
as.complex(z)


#lista (es como un vector... pero con vectores y c/u tiene su propia clase)

x <- list(1,"a",TRUE, 1+4i)
x
class(x)

#Matr??ces
m<- matrix(nrow=2, ncol=3)
m
dim(m)
attributes(m)
#cambio de dimensiones de 2*3 a 3*2
dim(m) <- c(3,2)
m

#crear una matriz con datos
m<-matrix(1:6, 3,2)
m
m<-matrix(1:6, 3,3,TRUE)
m
m<-matrix(1:10, 3,3,TRUE)
m
class(m)
str(m)



dim(m) z-c(2,5)  # esto va a producir un error 

x<- c(1,2,3)
y<- c("a","b","c")
z<- c(x,y)
z
class(z)

m1 <- rbind(m,y)
m1

m2 <- cbind(m,x)
m2

rbind(m1,y)

cbind(m2,y)


install.packages("rmarkdown")











#Clase 31-08-16
#Factores
x<- factor(c("si","no","si","no","si","no","si","no","hola"))
x

table(x)
unclass(x)


x<- factor(c("si","no","si","no","si","no","si","no","hola")),leves= c("si","no","hola")






#Valores faltantes
x<- c(1,2,NA, 10,3)
is.na(x)
is.nan(x)


x<- c(1,2,NaN, 10,3)
is.na(x)
is.nan(x)



#Data frames
x<- data.frame(Erick = 1:4, Lori= c(T,T,F,F))
x
row.names(x) <-c("Primero","Segundo","Tercero", "Cuarto") #poner nombre a filas
x
nrow(x)
ncol(x)
attributes(x)

names(x)<- c("Yareli","Karen")
x



#Los nombres no son exclusivos de los Data frames
x<- 1:3
names(x) #NULL
names(x) <- c("hugo", "Paco","Luis")
x

x<- list(a=1:10, b=100:91, c=51:60)
x
names(x)<- c("Seq1","Seq2","Seq3")
x


m<- matrix(1:4,2,2)
m
attributes(m)
dimnames(m) <- list(c("Fil1","Fil2"),c("Col1","Col2")) #Poner nombre a las filas de la matr??z
m


r<- matrix(nrow=5,ncol=6)    #creamos una tabla tipo excel 
dimnames(r)<- list(c("1","2","3","4","5"),c("A","B","C","D","E","F"))
r



?factor


#Lectura de datos

getwd()
setwd("~/GitHub/Programacion_Actuarial_III_OT16")
data<- read.csv("Datos_S&P.csv")
data<- read.table("Datos_S&P.csv",T,",")
data 
lapply(read.table("Datos_S&P.csv",T,","),class)  
#Lapply sirve para aplicar alguna funci??n a una lista de datos, 
#como en este ejemplo para conocer la clase de cada lista en la base de datos 


getwd()
setwd("~/GitHub/Programacion_Actuarial_III_OT16")
data<- read.csv("Datos_S&P.csv")
data<- read.table("Datos_S&P.csv",T,",",nrows=100)
clases<- sapply(data,class)
data<- read.table("Datos_S&P.csv",T,",",colclasess=clases)

view(data)


# uso de dput y dget
# dump= pueden crear formatos editables en texto que son bastate recuperables = dput; preservan la "metadata", para que otros usuarios no tengan que especificarla otra vez.

y<- data.frame(a=1, b="a")

dput(y)

dput(y, file="y.R")

nueva.y<-dget("y.R")
y
nueva.y

x<- "Programaci??n Actuarial III"
y<- data.frame(a=1, b="a")
dump(c("x","y"),file = "data.R")
rm(x,y) #remover-borrar
source("data.R")

dput(airquality, file="airquality")   #guardar un archivo= dput(nombre del archivo. file=como se llama actualmente)

#file, abre ua conexion a un archivo
#con<-url("") "conecta con una pagina de internet
str(file)  # description= nombre del archivo,open=que es lo que quiero hacer(r=lectura, )


con<- url("http://www.fcfm.buap.mx/","r")
x<-readLines(con,7)
x
#--->writeLines("toma un vector de caracteristicas y escribe cada elemento en una linea a la vez en un archico de texto")lo gusrda en archivo dif.

###########################################################################################################
#Subconjuntos: extraer subconjuntos([ regresa un objeto de la misma clase del original, [[ extrae un elemento de una lista o data frame. solamente extrae un elemento, $ extrae elementos de una lista o data frame por nombre)


#creamos vector#
x<- c("a","b","c","c","d","e")
#veamos el vector
x

#extraemos elementos con []
x[1]   #toma el primer elemento
x[2]   # toma el segundo elemento
#tambien podemos extraer una secuencia de elementos
x[1:4]   #toma elementos del 1 al 4
#es posible extraer los elementos que cumplen una restriccion
x[x>"b"]   #toma los elementos que sean mayoresque b en orden alfabetico
#De manera equivalente se puede obtener un vector l??gico 
u<- x=="c"   #toma los elemntos que sean iguales a c
u

x[u]   # muestra los elementos de u

#creamos una lista
x<- list(foo=1:4,bar=0.6)
#extraemos el primer elemento de la lista,
#este elemento es ua lista que contiene una secuencia
x[1]

"extraemos nuevamente el primer elemento de la lista,
#ahora el elemento es la secuencia en s??"
x[[1]]
#extraemos un elemento por nombre
x$bar
x[["bar"]]
x["bar"]

######################################################################3
#creamos una lista de 3 elementos
x<- list(foo=1:4, bar=0.6, baz="hola")
#extraemos el primer y tercer elemento de la lista
x[c(1,3)]


x[[c(1,3)]]

name<-"foo"
x[[name]]
x$name

#se pueden extraer elementos de los elementos extra??dos
x<- list(a=list(10,12,14), b=list(3.14,2.81))
x[[c(1,3)]]
x[[1]][[3]]
x[[c(2,1)]]

#extraccion de un dato en una matriz
x<- matrix(1:6,2,3) 
x

x[1,2]
x[2,1]
x[1,]
x[,2]


#el resultado es una vector
x[1,2]
#con drop=FALSE, se mantiene la dimension y el resultado ser?? una matriz
x[1,2,drop = FALSE]

x<- matrix(1:6,2,3)
x

#sidejamos solamente el espacio, el resultado ser?? un vector
x[1,]

#si usamos drop=FALSE, el resultado ser?? una matriz 
x[1, ,drop=FALSE]

#<3
x<- list(erfrkh = 1:5)
x$e   #extrae los elementos de e ya que su nombre empieza con e
x[["e"]] # extrae un elemento de la lista que sea e
x[["e",exact=FALSE]] #extrae los elementos de a por que especificamos que no tome a


#######valores faltantes##### 
airquality[1:6,] # extrae las filas del 1:6, y de todas las comulmnas
completos<- complete.cases(airquality)  #te da como resultado un vector 

completos #true si estan completos y false si estan incompletos

airquality[completos,]  #toma los datos completos de todo el doc.
airquality[completos,][1:6,] #toma las primeras 6 filas completas

airquality[1:6,][completos,]


#colocar diferentes lineas en una sola separadas por ;

x<- 1:4; y<- 6:9
x+y
x>2 #hay algun numero en x mayores a dos
x>=2 #hay algun numero x mayores o iguales a 2
y==8
x*y
x/y

#si y tiene solo 8 elementos vuelve a tomar el mas peque??o de y 
x<- matrix(1:4,2,2);y<- matrix(rep(10,4),2,2)
x;y 

x*y
x/y
x%*%y

#estructuras de contol
#if else: probar una condicion
#for: ejecuta un ciclo de un determinado numero de veces
#while: ejecuta un ciclo mientras se cumpla una condicion
#repeat: ejecuta un ciclo infinito
#break; termina la ejecucion de un ciclo
# next: "salta" una iteraci??n de un ciclo ---->en repit
#return: sale de una funcion 


x<-c("a","b","c","d")
for(i in 1:4){
  print(x[i])
}

for(i in seq_along(x)){
  print(x[i])
}

for(letra in x){
  print(letra)
}

for(i in 1:4) print(x[i]) #no se utiliza llaves por que  solo utiliz?? una condici??n.



s<- matrix(1:6,2,3)
s
for(i in seq_len(nrow(s))){
  for(j in seq_len(ncol(s))){
    print(s[i,j])
  }
}


#ciclo while: repetir instrucciones mientras no se cumple una condici??n

z<-5
while(z>=3 && z<=10){
  
  print(z)
  moneda<-rbinom(1,1,0.5)  #rbinom crea numeros aleatorios
  if(moneda==1){#caminata aleatoria
    z<- z+1
  } else {
    z<- z-1
  }
}

#  rbinom(no. de datos, parametros, probabilidad de exito) genera numeros aleatorios
# == dice igual l??gico
#&& operaciones con verdadero falso(condicion)
#& trabajamos con un vector y el resultado sera un vector



z<-5
while(z>=3 && z<=10){
  print(z)
  moneda<-rbinom(1,1,0.5)
  if(moneda==1){#caminata aleatoria
    z<- z+1
  } else {
    z<- z-1
  }
}

z<-5
while(z>=3 && z<=10){
  print(z)
  y<-c(y,z)
  moneda<-rbinom(1,1,0.5)
  if(moneda==1){#caminata aleatoria
    z<- z+0.5
  } else {
    z<- z-0.5
  }
}
y

plot(y,type="l")  #crea la grafica de el vector y

arriba=0
abajo=0
for (i in 1:100){
  z<-5
  while(z>=3 && z<=10){
    print(z)
    y<-c(y,z)
    moneda<-rbinom(1,1,0.5)
    if(moneda==1){#caminata aleatoria
      z<- z+0.5
    } else {
      z<- z-0.5
    }
  }
  y
  
  if (z=10) {arriba<-c(arriba+1)}
  else {abajo<-c(abajo+1)}
  
}
arriba
abajo

#estructura de control: repeat
x0<- 1
tol <- 1e-8
repeat{
  x1<- CalculaEstimado(x0)
  if(abs(x1-x0)< tol)
  {break}
  else
  {x0<-x1}
}

#se utiliza next para no hacer iteraci??n en un ciclo
for(i in 1:100)
{if (1<=20)
{next}
  #otras instrucciones
}


#creacion de Funciones (checar pag 42 y copiar)
suma2<- function(x,y)
{x+y}

mayor10<-function(x)
{validos<-x>10
x[validos]}
mayor10(56)

mayor <- function (x,n-10) {
  x[x>10]
}

promedioCol<-function(x,quitarNA =TRUE){
  nc<-ncol(x)
  medias<-vector("numeric",nc)
  for (i in 1:nc){
    medias[i]<-mean(x[,i],na.rm=quitarNA)
    
  }
  medias
}


#evaluacion perezosa
f<- function(a,b){
  a^2
}
f(2)
f<-function(a,b){
  print(a)
  print(b)
}
f(3)


# el argumento "..."
myplot<-function(x,y,type="l",...){
  plot(x,y,type = type,...)}

args(paste) #pega un texto con otro separado con un espacio sep=""
function(...,sep="",collapse=NULL)
  NULL


args(paste)
function(...,sep="",collapse=NULL)
  NULL

paste("a","b",sep=":")
paste("a","b",se=":")

args(cat)
funtion(...,file="",sep="",fill=FALSE,labels=NULL,append=FALSE)
NULL

?formatC

# source("funcion")= sirve para llamar una funci??n en otra funci??n


#Scoping Rules
lm #Esta guardada en stats 
lm <- function(x) {x*x}
lm
rm(lm) #borra la funci??n 
lm  #te ense??a la original

search() #lista de entornos, Orden de lista
library(stats)  #pasa a segundo lugar el paquete que estes cargando

#El ambito lexicol??gico en R significa que Los valores de las variables
#libres son buscados en el entorno de trabajo en el que la funcion esta definida


hacer.potencia <- function(n){
  potencia <- function(x){
    x^n
  }
  potencia
}

cubica <- hacer.potencia(3)
cuadrada <- hacer.potencia(2)

cubica(3)
cuadrada(3)

#??Qu?? es el entorno de una funci??n?
ls(environment(cubica))
get("n", environment(cubica))

ls(environment(cuadrada))
get("n", environment(cuadrada))

y <- 10

f <- function(x){
  y <-2
  y^2+g(x)
}

g <- function(x){
  x*y
}

f(3)

#Estandares de escritura
#Sangria
#Tama??o de las funciones:
#limitar a una sola actividad
#Leer datos, separarlos, procesarlos, generar un reporte.
    #Fechas y tiempo en R
      #Fecha se representan con la clase Date
      #Los tiempos con las clases POSIXct o POSIXlt
          #POSIXct es un entero muy granse; util al guardae los datos en un data frame
          #POSIXlt es como una lista y guarda un conjunto de informaci??n
#Dates and Times
x <- as.Date("1970-01-01")
x
unclass(x)
unclass(as.Date("1970-01-02"))
        
date()
as.POSIXct()

















