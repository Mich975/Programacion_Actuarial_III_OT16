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
