rm(list=ls())
#Autor: Yuznhio Sierra


# En esta seccion revisaremos la ecuacion principal del integrador con fuga
# que contiene un solo parametro.Este primer ejercicio se encuentra diseñado
# para tener un primer acercamiento al modelo y su comportamiento cuando 
# se modifican variables sencillas como el numero de ensayos o el valor
# del parametro a. 

V <- c() # En esta linea creamos un objeto V que por el momento se 
# encuentra vac??o. En este objeto iremos acumulando los valores del
# integrador que obtendremos a lo largo de los ensayos. 
  
a <- 0.6 # Le asignamos al par??metro a un valor entre 0 y 1. 
R_si <- rep(100,1) # En el objeto R_si se encuentran los ensayos en los que
# existi?? un pulso. Para simplificar se asume que todos los pulsos son del
# mismo valor (100). En este caso, el 1 indica que s??lo existi?? un ensayo con pulso.
R_no <- rep(0,49) # En el objeto R_no se encuentran los ensayos en los que
# no existi?? un pulso (por lo que se le asigna el valor 0). El 49 indica el 
#n??mero de ensayos.
R <- c(R_si,R_no) # Este objeto es la combinaci??n de los dos anteriores. 
# En realidad es el n??mero de ensayos total: 
# (ensayos en los que existi?? pulso)+ (ensayos en los que no existi?? pulso)

#Modelo del Integrador con fuga. Las siguientes cuatro lineas conforman lo que
# se conoce como un loop. El objetivo de esta estructura es que el integrador
# vaya actualizando los valores de carga y descarga a lo largo de todos los
# ensayos de acuerdo con la ecuaci??n que lo representa (Ecuaci??n 1 en el )
for (k in 1:length(R)){   # esta l??nea lo ??nico que indica es que el ciclo durar?? 
                          # lo que el n??mero de ensayos determine. (Recuerda que R es el n??mero de ensayos)
  V[1]<- 0                # El valor de V en el primer ensayo es 0.
  V[(k+1)]= a*V[k] + (1-a)*R[k]  # Esto no es m??s que la programaci??n de la Ecuaci??n 1.
}

# Hasta aqu?? ya tenemos todos los valores del integrador guardados en el objeto V.
# Las siguientes l??neas son s??lo para expresar gr??ficamente el modelo. 
plot(V,axes=F, type='b', 
     col='orange',xlab="Ensayo",ylab="Valor de V",pch=16)
axis(1,at=seq(0,100,5))
axis(2,at=seq(0,100,10))
abline(v=2,lty='dotted')
text(20,47,"a = 0.1")
