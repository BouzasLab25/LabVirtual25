#Codigo Base para Analisis Parametrico y Graficacion (SDT)
#Autor: Adriana F. Chávez De la Peña
#adrifelcha@gmail.com
##########################################################

rm(list=ls())  #Limpiamos el espacio de trabajo

#####Datos a graficar#####
h<-90  #Numero crudo de Hits
f<-20   #Numero de Falsas Alarmas
h_rate<-h/100      #Tasa de Hits relativo al total de Ensayos con Se??al
fa_rate<-f/100     #Tasa de Falsas Alarmas relativa al total de Ensayos con Ruido

#####Estimaci??n Param??trica#####
k<-qnorm(1-fa_rate,0,1)   #Calculamos la localizacion del Criterio
d<-qnorm(h_rate,0,1)-qnorm(fa_rate,0,1)     #Calculamos d'
c<-k-(d/2)                                  #Calculamos el Sesgo c
beta<-dnorm(k,d,1)/dnorm(k,0,1)             #Calculamos el Sesgo Beta

soporte <- seq(-6,6,.05)        #Especificamos el Soporte de nuestras distribuciones
d_ruido <- dnorm(soporte,0,1)   #Definimos nuestra distribucion de Ruido de acuerdo a la teoria (Media=0 y DV=1)
d_senal <- dnorm(soporte,d,1)   #Definimos la distribucion de Se??al, con media en d'

plot(soporte,d_ruido,type='l')             #Dibujamos la distribucion de ruido
lines(soporte,d_senal,type='l',col='blue') #Dibujamos la distribucion de Se??al
abline(v=k,col='red')                      #Dibujamos el criterio
abline(v=d/2,col='blue',lty=2)             #Se??alamos la localizacion Optima (sin sesgo) del criterio


d<-round(d,5)   #Redondeamos el valor de d' a 5 decimales para facilitar su representacion
k<-round(k,5)   #Redondeamos el valor del criterio a 5 decimales para facilitar su representacion
c<-round(c,5)   #Redondeamos el valor del Sesgo c a 5 decimales para facilitar su representacion
h_rate<-round(h_rate,3)
fa_rate<-round(fa_rate,3)
beta<-round(beta,5) #Redondeamos el valor del Sesgo Beta a 5 decimales para facilitar su representacion

text(-4,0.39,paste("K = ",k))  #Imprimimos la localizacion del criterio 
text(-5,0.34,paste("C = ",c))  #Imprimimos el valor del Sesgo C
text(-4,0.29,paste("D' = ",d)) #Imprimimos el valor de la distancia entre las medias (D')
text(-5,0.24,paste("Hit Rate = ",h_rate))            #Especificamos la Tasa de Hits
text(-4,0.19,paste("False alarm Rate = ",fa_rate))   #Especificamos la Tasa de Falsas Alarmas
text(-4,0.13,paste("Beta = ",beta))   #Especificamos la Tasa de Falsas Alarmas


############ Curvas ROC

# Una vez que hemos computado el valor de la d' que separa las distribuciones de ruido y señal
# podemos trazar una curva ROC, que nos describa todas las combinaciones posibles de tasa de
# Hits y Falsas Alarmas, dada todas las posibles combinaciones del criterio. 

#Para trazar la Curva ROC, necesitamos crear un Ciclo For:


hits <- c()   #Creamos un arreglo vacío, que vamos a ir llenando con el Ciclo For, para las tasas de Hits
falarms <- c()  #Creamos un arreglo vacío para las tasas de Falsas Alarmas
bias_c <- seq(-10,10,0.1) 
d_null <- 0  #Como referencia, vamos a incluir una curva ROC para una d' de 0. El sistema a evaluar será juzgado como 'más preciso' conforme su ROC se aleje de ésta función de identidad.
hits_na <- c()     #Creamos un arreglo vacío para los hits en  d' 0
falarms_na <- c()  # Creamos un arreglo vacío para las falsas alarmas en d' 0


for (i in 1:length(bias_c)){                     #Creamos un For donde, para cada posible valor del sesgo C (que relaciona directamente d' con el criterio)
  hits[i] <- pnorm((-d/2)-bias_c[i])             #se compute la proporción de la distribución de señal que cae sobre el criterio
  falarms[i] <- pnorm((d/2)-bias_c[i])           # y la proporción de la distribución de ruido.
  hits_na[i] <- pnorm((d_null/2)-bias_c[i])      #Para referencia, realizamos el mismo cómputo para la d' de 0
  falarms_na[i] <- pnorm((-d_null/2)-bias_c[i])
}

plot(fa_rate,h_rate, pch=16, col='deepskyblue4', xlim=c(0,1), ylim=c(0,1), xlab='F.A. Rate', ylab='Hit Rate')     #Ploteamos las tasas de hits y falsas alarmas obervadas como un punto en el espacio
lines(hits,falarms,lwd=2,col='deepskyblue2')        #Dibujamos la curva ROC correspondiente a la d' de nuestro sistema evaluado
lines(hits_na,falarms_na,lwd=1,col='black', lty=2)  #Dibujamos la función de identidad, que corresponde a una d' de 0 (Donde las distribuciones de ruido y señal se empalman por completo)
lines(c(0.38, 0.48),c(0.2,0.2), lwd=2, lty=1, col="deepskyblue3")      
points(0.43,0.1, lty=3, pch=16, col='deepskyblue4')
text(0.5, 0.2, labels="All possible trade-offs between Hit & F.A. rates given the d'", offset=0, cex = 0.7, pos=4)
text(0.5, 0.1, labels="Observed Hit & F.A. rates given the used criterion", offset=0, cex = 0.7, pos=4)
text(0.85, 0.83, labels="d' = 0", offset=0, cex = 0.8, pos=4)
text(fa_rate-0.13, h_rate+0.02, paste("d' =", d), offset=0, cex = 0.8, pos=4)
title('ROC')



