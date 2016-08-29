#Clase del 25/08/2016

#Crear Vectores con la función vector
x <- vector(mode="numeric",length = 5)
x

#Crear Vectores con la función C
x <- c(0.5,0.6)
x
class(x)

x <- c(TRUE,FALSE,T,F)
x
class(x)

x <- 10:0
x
class(x)

x <- c(1+2i,5,3+9i,-4-5i)
x
class(x)

x <- c("a","b","c","d")
x
class(x)

#Mezcla de objetos en un vector
y <- c(1.7,"a") #caracter
y
class(y)
y <- c(TRUE,2)  #numerico
y
class(y)
y <- c("a",TRUE) #Caracter
y
class(y)

y <- c(TRUE,10L)
y
class(y)

#Orden de coacción/cohersión explicita
#1 Caracter
#2 complex
#3 numeric
#4 integer
#5 logical

#Coerción explícita
z <- 0:6
class(z)
as.numeric(z)
as.logical(z)
as.character(z)

z <- c(1+2i, 3+4i,8,0+3i,0)
as.logical(z)

z <- c("Programación","Actuarial","III")
as.numeric(z)
as.logical(z)
as.complex(z)

#Lista (es como un vector... pero de vectores y c/u tiene su propia clase)
x <- list(1,"a",TRUE,1+4i)
x
class(x)

#Matrices
m <- matrix(nrow = 2, ncol = 3)
m
dim(m)
attributes(m)



