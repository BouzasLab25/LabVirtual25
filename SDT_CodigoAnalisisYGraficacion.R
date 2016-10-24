#Codigo Base para Analisis Parametrico y Graficacion (SDT)
rm(list=ls())  #Limpiamos el espacio de trabajo

#####Datos a graficar#####
h<-123  #Numero crudo de Hits
f<-75   #Numero de Falsas Alarmas
h_rate<-h/150      #Tasa de Hits relativo al total de Ensayos con Se??al
fa_rate<-f/150     #Tasa de Falsas Alarmas relativa al total de Ensayos con Ruido

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
beta<-round(beta,5) #Redondeamos el valor del Sesgo Beta a 5 decimales para facilitar su representacion

text(-4,0.39,paste("K = ",k))  #Imprimimos la localizacion del criterio 
text(-5,0.34,paste("C = ",c))  #Imprimimos el valor del Sesgo C
text(-4,0.29,paste("D' = ",d)) #Imprimimos el valor de la distancia entre las medias (D')
text(-5,0.24,paste("Hit Rate = ",h_rate))            #Especificamos la Tasa de Hits
text(-4,0.19,paste("False alarm Rate = ",fa_rate))   #Especificamos la Tasa de Falsas Alarmas

