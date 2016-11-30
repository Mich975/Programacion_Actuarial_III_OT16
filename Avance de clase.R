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

#Funciones de ciclo
#lapply: Aplica una funci??n a todos los elementos de una lista
#sapply: Lo mismo que lapply pero intenta simplificar el resultado
#apply: Aplica una funcion dentro de los margenes de un arreglo
#tapply: Aplica la funcion 

lapply
#function (X, FUN, ...) 
#{
 #   FUN <- match.fun(FUN)
  #  if (!is.vector(X) || is.object(X)) 
   #     X <- as.list(X)
# .Internal(lapply(X, FUN))
# }
# <bytecode: 0x1020a13c0>
  #  <environment: namespace:base>
#coercionar(cambia un objeto a otro (as.list(x)))
#match.fun(FUN) buscara una funcion que tu nombraste en R
#   .internal = lo resuelve como c y lo devuelve en R
# rnorm : numeros aleatorios en una distribucion normal
x <- list(a=1:5,b=rnorm(10000))
lapply(x,mean)

x <- list(a=1:5,b=rnorm(10),c=rnorm(10,1),d=rnorm(10,2))
lapply(x,mean)
sapply(x,mean)
#runif : genera n??meros aleatorios con distribucion uniforme entre 0 y 1
x <- 1:4
lapply(x,runif)
lapply(x,runif,max=15,min=5) #genera # aleatorios entre 5 y 15
#Sapply: simplifica el resultado de lapply

x <- 1:4
lapply(x,runif, max=15, min=5)
sapply(x,runif, max=15, min=5)

#apply: se utiliza para evaluar una funci??n, manera mas general
str(apply)
#function (X, MARGIN, FUN, ...) 
#margen 2 saca el promedio de las columnas
#margen 1 saca el promedio de las filas
#columnas son las variables
#filas son las observaciones
x <- matrix(rnorm(200),20,10)
apply(x,2,mean)
apply(x,1,mean)
#Medias y sumas de filas/columnas
    #Para sumas y medias de dimensiones de una matriz
#       rowSums = apply(x,1,sum),
#       rowMeans = apply(x,1,mean)
#       ColSums = apply(x,2,sum)
#       ColMean = apply(x,2,mean)

# quantile num que esta debajo del porcentaje dado
x <- matrix(rnorm(200),20,10)
apply(x,1,quantile,probs=c(0.25,0.75))

a <- array(rnorm(2*2*10),c(2,2,10))
apply(a,c(2,3), mean)
rowMeans(a,dims = 2)

#mapply

#FUN es la funcion a aplicar
#MoreArg lista de otros argumentos

list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))
mapply(rep,1:4,4:1)
 #Vectorizar una funci??n
noise <- function(n,mean,sd){
    rnorm(n,mean,sd)
}
noise(5,1,2)
noise(1:5,1:5,2)

mapply(noise,1:5,1:5,2)

#tapply
# function (X, INDEX, FUN = NULL, ..., simplify = TRUE) 
#   X es un vector
#   INDEX es un factor o lista de factores
#   ... otros argumentos a pasar a la fun
#   simplify simplifica los resuldatos

x <- c(rnorm(10),runif(10),rnorm(10,1))

f <- gl(3,10)

f

tapply(x,f, mean)
tapply(x,f,mean, simplify = F)


#str(split)
#function (x, f, drop = FALSE, ...)  

# x es un vector, lista o data frame
# f: es un factor o lista de factores
# drop: indica si los factores vacios deberian de omitirse

x <- c(rnorm(10),runif(10),rexp(10))

f <- gl(3,10)

f
split(x,f)

lapply(split(x,f),mean)

library(datasets)
head(airquality)
s <- airquality
n <- s$Month
b <- split(x,n)
lapply(b,function(x) colMeans(x[,1:3]))
sapply(b,function(x) colMeans(x[,1:4],na.rm = T))

#Manejo de errores
#massage:una nootificacion generica que se produce, el c??digo sigue corriendo
#warning:algo esta nal, pero no necesariamente es fatal, el codigo sigue corriendo
#error:un aviso de que un problema
#condiction 
log(-1)
#[1] NaN
#Warning message:
   # In log(-1) : Se han producido NaNs (no existe logaritmo de un num negativo)
imprimeMSJ <- function(x){
    if(x>0)
        print("x es mayor que 0")
    else
        print("x es menor o igual a 0")
    invisible(x)
}
imprimeMSJ(1)

imprimeMSJ2 <- function(x){
    if(is.na(x))
        print("x es un valor faltante")
    else if(x>0)
        print("x es mayor que 0")
    else
        print("x es menor o igual a 0")
    invisible(x)
}
imprimeMSJ(1)

x <- log(-1)
imprimeMSJ2(x)
#Herramientas para depurar
#traceback
#debug
#browser
#trace
#recover

#traceback

mean(x)
#Error in mean(x) : objeto 'x' no encontrado
> traceback()
#1: mean(x)
options(error = recover)
?Error
?options
read.csv("perritosgay")
install.packages("swirl")
library("swirl")
swirl()

####
#str: Muestra una forma compacta de la estructura interna de un objeto
str(str)
str(lm)
str(ls) #ls crea una lista
x <- rnorm(100)
str(x) #caracteristicas de que es este objeto
summary(x)
f <- gl(40,10) #lista de factores 
f
str(f)
summary(f)
str(airquality)

m <- matrix(rnorm(100),10,10)
m
str(m)
s <- split(airquality,airquality$Month)
s
str(s)

#Generar n??meros aleatorios
#rnorm: genera numeros aleatorios
#dnorm: probabilidad de que una variable aleatoria de un valor especifico
#pnorm: probabilidad de que un numero sea mayor qu otro
#rpois:: genera variables aleatorias Poisson con una tasa dada, lo mas probable que pueda pasar
        #num de exitos en un intervalo de tiempo
# d densidad
#r generar una variable aleatoria
#p para la distribucion acumulativa probabilidad de que sea menor o igual
#q para el cuantil de una funcion

x <- rnorm(10)
x
as.numeric(as.integer(probs*10000))/10
y <- rnorm(10,50,5)
y
summary(x)
summary(y)

set.seed(1) #establecer semilla, semilla =1
rnorm(5)
set.seed(2) #para poder replicar los numeros aleatorios
rnorm(5)
set.seed(1)
rnorm(5)

normal1 <- rnorm(10000)
normal2 <- rnorm(10000,10,5)
hist(normal1) #manda a graficar un histograma de frecuencia de los factores
summary(normal1)
hist(normal2)
summary(normal2)
rpois(10,1) #distribuci??n Poisson
poisson1 <- rpois(10000,1)
poisson2 <- rpois(10000,10)
hist(poisson1)
hist(poisson2)
ppois(2,2)
ppois(4,2)
ppois(6,2)
hist(rpois(10000,2))
ppois(0,2)
?ppois
for(i in 0:11){print(dpois(i,2))}

hist(runif(10000,10,20)) #Uniforme entre un minimo de 10 y max de 20 como se
                            #acomodan los datos.
#Modelo lineal tengo una variable la multi por una constante y le sumo una constante

set.seed(20)
x <- rnorm(100,0,1)
e <- rnorm(100,0,2)
y <- 0.5 + 2*x+e
plot(x,y)

z <- 0.5 + 2*x
plot(x,z)
plot(z,y)

set.seed(20)
x <- rnorm(100,0,1)
e <- rnorm(100,0,50)
y <- 0.5 + 2*x+e
plot(x,y)

set.seed(10)
x <- rbinom(100,1,0.5) # numero de exitos en una cierta cantidad de intentos
                    #(cantidad,tama??o(intentos),probabilidad de exito) 
e <- rnorm(100,0,1)
y <- 0.5 + 6*x + e
summary(y)
plot(x,y, main="Modelo Lineal", col="dark red")


set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3*x
y <- rpois(100,exp(log.mu)) #Llamar poisson
summary(y)
plot(x,y,main="Modelo Poisson",col="forestgreen")

#Muestreo: tomar al azar dentro de un grupo de valores
set.seed(1)
sample(1:10,4)
sample(letters,5)
#permutacion: diferentes formas que se pueden ordenar un conjunto de numeros
sample(1:10) # hay 10! de formas
sample(1:10,replace = TRUE) #hay 10^10 formas

#Perfilaje
#??Por qu?? mi codigo es lento?, perfilaje(profiling)
#system.time(), devuelve la cantidad de tiempo que le toma al sistema evaluar una
    #expresion
#regresa un objeto de calse proc_time
    #user time: tiempo que ocupo la expresion en el CPU
    #elapsed time: tiempo en el reloj
system.time(readLines("http://www.fcfm.buap.mx"))

hilbert <- function(n){
    i <- 1:n
    1/outer(i-1,i,"+")
}

x <- hilbert(1000)
system.time(x <- hilbert(1000))
system.time(svd(x))

#Perfilador de R
     #Rprof cada 2 segundo te dice en que estas trabajando

#DEPURACION DE DATOS
 #Obtenci??n de datos
 #Datos bruto
    #Un archivo binario que entrega como resultado una maquina de medici??n

#Datos ordenados
    #cada variable medida se encuentra en una columna
    #cada observaci??n de esa variable, debe aparecer en una fila distinta
    #Debe haber una tabla para cada tipo de variable

#Libro de c??digo
#   Informaci??n acerca de las variables en la base de datos ordenada
#   Informaci??n acerca de las s??ntesos que se realizaron
#   Informaci??n acerca del dise??o experimental utilizado
#TIPS
#   Un formato com??n para este documento es un archivo de Word/texto
#   Tiene una secci??n llamada "Dise??o experimental"

getwd()
tail(list.files(),2)
setwd("./data.R")
getwd()

setwd("../")
getwd()
setwd("~")
getwd()

#file.exists("nombreDirectotio") revisa si el directorio existe
#dir.create("nombreDirectorio") crea un directorio si no existe


if (file.exists("data") == FALSE){
    dir.create("data")
}

if (!file.exists("data")){
    dir.create("data")
}
file.exists("data")

#download.file(), descarga un archivo desde internet, ayuda a la replicaci??n, parametros(url, )

#Carga de archivos
# read.table, es el principal para cargar y leer datos, flexible y robusta, requiere mas parametros

#Algunos parametros importantes:
# quote- le dice a r si existe un comentario (quote=""), no hay comentarios
# na.strings, establece que el caracter que corresponde a valores faltantes
# nrows, dice la cantidad de filas a leer del archivo
# skip- una cantidad de filas a evitar antes antes de iniciar la lectura

install.packages("rJava")
install.packages("xlsx")
library(rJava)



######  26-10-16  ############
#funcion Write
#formato XML: almacenar datos, 
# etiquetas: inicio, cierre, vacias


install.packages("XML")
library(XML)
url<-"http://www.w3schools.com/xml/simple.xml"
data<- xmlTreeParse(url, useInternalNodes = TRUE)
nodoRaiz<-xmlRoot(data)
xmlName(nodoRaiz)
names(nodoRaiz)

#extraccion de datos
xmlSApply(nodoRaiz,xmlValue)# te da lo que esta almacenado en ese nodo

# XPath:
# /nodo ,nodo de nivel superior
# //


#obtener precios y nombre+
xpathSApply(nodoRaiz,"//name",xmlValue)

xpathSApply(nodoRaiz,"//price",xmlValue)


# http://www.start.berkel


# Archivo Json: 
install.packages("jsonlite")
library(jsonlite)
jsonData<-fromJSON("http://api.github.com/users/Losiram13/repos")
names(jsonData)

jsonData$name

iris
#Conversion a json
myjson<- toJSON(iris, pretty = TRUE)
cat(myjson)

#conversion desde json a dataframe
iris2<- fromJSON(myjson)
head(iris2)

##########27-10-16############333
#Data.table hereda de dataframe todas las funciones que lo aceptan.
install.packages("data.table")
library(data.table)
DF=data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
DF
DT=data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DT,3)
tables()
DT[2,]
DT[DT$y=="a"] #datos que tengan valores igual a "a"

DT[DT$y=="b"]
DT[DT$y=="a"]
DT[c(2,3)]
DT[,c(2,3)]


#subconjunto de columnas
#el argumento que se pone despues de la coma es llamado una expresion
#en r una expresion es una coleccion de declaraciones delimitada por llaves
{x=1
    y=5}
DT[,list(mean(x),sum(z))]
DT[,table(y)]
DT[,w:=z^2]
DT

DT2<-DT
DT[,y:=2]
DT
head(DT)
head(DT2)=tambien cambia los datos, si modificas el original
DT[,m:={tmp<-(x+z);log2(tmp+5)}]
DT
DT[,a:=x>0]
DT
DT[,b:=mean(x+w),by=a]
DT

set.seed(123)
DT<-data.table(x=sample(letters[1:3],1E5,TRUE))
DT[,.N,by=x] #crea una funcion .N y cuenta cuantas valores dio de cada variable




library(swirl)
install_from_swirl("Getting_and_Cleaning_Data")

Leaving swirl now. Type swirl() to resume.


# lectura para trabajar con datos : http://vita.had.co.nz/papers/tidy-data.pdf

DT<- data.table(x=rep(letters[1:3],each=100),
                y=rnorm(300))
setkey(DT,x) 
DT['a']

DT1<- data.table(x=c('a','a','b','dt1'),y=1:4)
DT2<-data.table(x=c('a','b','dt2'),z=5:7)
setkey(DT1,x);set2key(DT2,x)
merge(DT1,DT2) #variables que aparecen en una y otra tabla

set.seed(1)
df_gde<-data.frame(x=rnorm(1E6),y=rnorm(1E6))
file<-tempfile()
write.table(df_gde,file=file,row.names=F, col.names=T,sep="\t",quote=F)
system.time(fread(file))
system.time(read.table(file,header = T,sep="\t"))


##otro formato para bases de datos: (mySQL)
#bases de datos, Tablas 

install.packages("RMySQL")
library(RMySQL)
ucscDb<-dbConnect(MySQL(),user="genome",
                  host="genome-mysql.cse.ucsc.edu")
result<-dbGetQuery(ucscDb,"show databases;");dbDisconnect(ucscDb);
result

#download.file()
#   descarga archivos de internet
#   incluso si se puede hacer a mano, ayuda para la replicabilidad
install.packages("data.table")
library(data.table)

DT <- data.table(x = rep(letters[1:3],each = 100),
y = rnorm(300))
setkey(DT,x)
DT['a']

DT1 <- data.table(x=c('a','a','b','dt1'),y=1:4) 
DT2 <- data.table(x=c('a','b','dt2'), z= 5:7)
setkey(DT1,x); setkey(DT2,x)
merge(DT1,DT2)

set.seed(1)
df_gde <- data.frame(x=rnorm(1E6), y=rnorm(1E6))
file <- tempfile()
write.table(df_gde, file= file, row.names = F, col.names = T, sep="\t",quote=F)
system.time(fread(file))
system.time(read.table(file,header = T,sep = "\t"))

#mySQL
#formato para bases de datos
install.packages("RMySQL")
library(RMySQL)
ucscDb <- dbConnect(MySQL(),user="genome",host="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb,"show databases;"); dbDisconnect(ucscDb);
result

hg19 <- dbConnect(MySQL(),user="genome",db="hg19",host="genome-mysql.cse.ucsc.edu")
tablas <- dbListTables(hg19)
length(tablas)
tablas[1:3]
#Obetener dimensiones de una tabla en especifico.
dbListFields(hg19,"affyU133Plus2")

#Leer desde la tabla
affyData <- db
dbDisconnect(hg19)

#HDF5 almacena grandes bases de datos, almacena diferentes clases de datos
# Guarda la informacion como si fueran carpetas
source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")
library(rhdf5)
created = h5createFile("example.h5")
created
#Escritura y lectura de fragmentos
h5write(c(12,13,14),"example.h5","foo/A", index=list(1:3,1))
h5read("example.h5","foo/A")


#Webscraping
# Extracci??n programada de informaci??n desde c??digo HTML

set.seed(13435)
x <- data.frame("var1" = sample(1:5), "var2" = sample(6:10), "var3" = sample(11:15))
x <- x[sample(1:5),]
x$var2[c(1,3)]= NA
x[,1]
x[,"var1"]
x[1:2,"var2"]
x[x<=3,"var1"]
x[x>11,"var3"]

subset(x, x$var1<=3 & x$var3>11)
x[x$var1<=3 && x$var3>11,]
x[x$var1 | x$var3>11,]


# && Operador logico
# & Vector 

which(x$var2>8)
x[which(x$var2>8),] #extraer las filas donde x es mayor que 8 en var2
sort(x$var1)
sort(x$var1, decreasing = T)
sort(x$var2)
sort(x$var2, decreasing = T)
sort(x$var2, na.last = T)
sort(x$var2, decreasing = T, na.last = T)

sort(x$var1)
order(x$var1)
x[order(x$var1),]
x[order(x$var2, decreasing = T, na.last = F),]

library(plyr)
arrange(x,var1)
arrange(x,desc(var1))
x$var4 <- rnorm(5)
x
cbind(x,rnorm(5))
x

#Descarga de Datos

if(!dir.exists("data")){dir.create("data")}
url <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accesType=DOWNLOAD"
download.file(url,"./data/restaurantes.csv")
data <- read.csv("./data/restaurantes.csv")

table(data$zipCode, useNA = "ifany")
table(data$councilDistrict,data$zipCode)

if(!dir.exists("data")){dir.create("data")}
url <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accesType=DOWNLOAD"
download.file(url,"./data/restaurantes.csv")
data <- read.csv("./data/restaurantes.csv")
head(data,n=3)
tail(data,n=3)
summary(data)
str(data)

#CLASE 30/11/2016
quantile(data$councilDistrict,na.rm=T)
quantile(data$councilDistrict, probs= c(0.5,0.75,0.9))

table(data$zipCode, useNA="ifany")
table(data$councilDistrict,data$zipCode) 

sum(is.na(data$councilDistrict))
any(is.na(data$councilDistrict))
all(!is.na(data$councilDistrict))
all(data$zipCode > 0)
colSums(is.na(data))
all(colSums(is.na(data)) == 0)

table(data$zipCode %in% c("21212"))
table(data$zipCode %in% c("21212","21213"))
data[data$zipCode %in% c("21212","21213"),]
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)
xt <- xtabs(Freq ~ Gender + Admit, data = DF)
xt

warpbreaks$replicate <- rep(1:9, len = 54)
xt = xtabs(breaks ~.,data = warpbreaks)
xt
summary(warpbreaks)
dim(warpbreaks)
ftable(xt)

fakeData = rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData), units = "Mb")
#metadatos (800040) numeros de las filas, registro de dato, cuantos datos son (+40)

#Crear variables nuevas
#   usualmente no tenemos la variable q nos interesa
#   hacer tranformaciones de los datos que tenemos
#   agregar valores a la base de datos

#Crear secuencias
s1 <- seq(1,10,by=2); s1
s2 <- seq(1,10,by=3); s2
x <- c(1,2,8,25,100); seq(along = x) #Genera un conteo para cada uno de los elementos
#quantile
sq <- seq(.1,.7, by=.1); sq
#crea variable cerca
data$cerca <- data$neighborhood %in% c("Roland Park", "Homeland")
table(data$cerca)
head(data)
#variables binarias
data$zipError <- ifelse(data$zipCode < 0, TRUE,FALSE)
data[data$zipError,]
table(data$zipError, data$zipCode < 0)

#variables Categ??ricas
data$zipGrupo <- cut(data$zipCode, breaks = quantile(data$zipCode)) #cut toma max y min de un bloque de valores
table(data$zipGrupo)
table(data$zipGrupo, data$zipCode)

#Corte simplificado
install.packages("Hmisc")
library(Hmisc)
data$zipGrupo <- cut2(data$zipCode, g=4)
table(data$zipGrupo)

s
