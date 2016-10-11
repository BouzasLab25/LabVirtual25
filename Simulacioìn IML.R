#Simulacion IML
# Juego de Matching Pennies Perturbado. Se realizar??n simulaciones sobre el modelo de aprendizaje por igualaci??n de impulsos el cu??l consiste en: 
# Juego transformado;El m??ximo de los m??nimos pagos de un jugador es tomado como punto de referencia. Arriba de este son ganancias, debajo del mismo son perdidas
# Impulsos; sumatoria de los pagos recibidos por jugar cada estrategia actualizada s?? y s??lo s?? se juega esa estrategia
#Pi; El pago del juego transformado recibido en ese ensayo
#Probabilidad; tras una fase inicial estas se actulizan a partir de los impulsos

rm(list=ls())

trials<-500
sim<-50

sr <- matrix(NA,nrow=trials,ncol=sim) # Estrategias jugador fila
sc <- matrix(NA,nrow=trials,ncol=sim) # Estrategias jugador columna
### Las estratrategias se tienen que guardar asi que tienen que crear un objeto que guarde todas las estrategias que 
### usaran los jugadores, por lo que se necesitan dos dimenciones, por jugador 1 que contenga las elecciones 300 y otra 
### con el numero de simulaciones que se vayan a realizar. Por ahora usaremos solo 2 simulaciones para dejar listo el 
### codigo, despues tenemos que planear bien como se van a hacer las simulaciones de manera sistematica.

R0_r <- c()# Impulsos acumulados hacia estrategia triangulo para jugador fila
R1_r <- c()# Impulsos acumulados hacia estrategia cuadrado para jugador fila
R0_c <- c()# Impulsos acumulados hacia estrategia triangulo para jugador columna
R1_c <- c()# Impulsos acumulados hacia estrategia cuadrado para jugador columna

r0_r <- c()# Impulsos hacia estrategia triangulo para jugador fila
r1_r <- c()# Impulsos hacia estrategia cuadrado para jugador fila
r0_c <- c()# Impulsos hacia estrategia triangulo para jugador columna
r1_c <- c()# Impulsos hacia estrategia cuadrado para jugador columna

gr <- matrix(c(0.8430256,-0.9451327,-1.084611,0.967692),nrow=2,ncol=2) # Matriz para jugador fila
gc <- matrix(c(-0.9540875,1.0006151,1.2160209,-0.9197396),nrow=2,ncol=2) # Matriz para jugador columna

pr <- matrix(NA,nrow=trials,ncol=sim) #Probabilidad de eleccion de estrategia cuadrado jugador fila 
pc <- matrix(NA,nrow=trials,ncol=sim) #Probabilidad de eleccion de estrategia cuadrado jugador columna

### Esta primer linea debe iniciar cada secuencia de simulaciones pero los jugadores fila y columna se simulan al mismo
### tiempo.
for (i in 1:length(sr[1,])){ 
  ### Para simular se requiere asignar valores a los parametros libres ya que estos no se van a calcular a partir de 
  ### datos.
  for (t in 1:length(sr[,1])){
    R0_r[1]<-0
    R1_r[1]<-0
    R0_c[1]<-0
    R1_c[1]<-0

    # Actualizacion de probabilidaddes
    if(R0_r[t]>0 && R1_r[t]>0){
      pr[t,i]<-R0_r[t]/(R0_r[t]+R1_r[t]) #Los cambios de los if y eso no importan lo importante fue poner los parentesis!!
    }
    else{
      pr[t,i]<-0.5
    }
    if(R0_c[t]>0 && R1_c[t]>0){
      pc[t,i]<-R0_c[t]/(R0_c[t]+R1_c[t]) #Los cambios de los if y eso no importan lo importante fue poner los parentesis!!
    }
    else{
      pc[t,i]<-0.5
    }
    
    # Eleccion de estrategias
    sr[t,i]<-rbinom(1,1,pr[t,i]) ### No duden si era mas o menos asi
    sc[t,i]<-rbinom(1,1,pc[t,i]) ### No duden si era mas o menos asi
    
    # Generacion de Impulsos
    r0_r[t]<- max(0,gr[2,(sc[t,i]+1)]-gr[1,(sc[t,i]+1)])
    r1_r[t]<- max(0,gr[1,(sc[t,i]+1)]-gr[2,(sc[t,i]+1)])
    r0_c[t]<- max(0,gc[(sr[t,i]+1),2]-gc[(sr[t,i]+1),1])
    r1_c[t]<- max(0,gc[(sr[t,i]+1),1]-gc[(sr[t,i]+1),2])
  
    # Actualizacion de Impulsos
    R0_r[t+1]<-R0_r[t]+r0_r[t]
    R1_r[t+1]<-R1_r[t]+r1_r[t]
    R0_c[t+1]<-R0_c[t]+r0_c[t]
    R1_c[t+1]<-R1_c[t]+r1_c[t]
  }
}

### Olvidaron agregar los puntos a los ciclos for, for(i in 1:2). De preferencia utilicen la longitud de una variable
### para definir el limite de un ciclo for de esa forma no tendran problemas cuando cambien el numero de ensaos o de 
### simulaciones. Si lo dejan como esta y pedimos 3 simulaciones en vez de dos el codigo no va a servir. Siempre deben 
### buscar que el codigo sea lo mas general posible

plot(seq(1,trials,1),cumsum(sr[,1])/seq(1,trials,1),type="n",col="red",lwd=2,
     ylim=c(0,1), axes=F, xlab="Ensayo",ylab="Frecuencia relativa acumulada de cuadrado")
axis(1,at=seq(0,trials,50))
axis(2,at=c(0,0.4980716,0.5221317,1),labels=c(0,NA,NA,1))
for(i in 1:sim){
  lines(seq(1,trials,1),cumsum(sr[,i])/seq(1,trials,1),col=rgb(255/255,0,0,alpha=0.3),lwd=2)
  lines(seq(1,trials,1),cumsum(sc[,i])/seq(1,trials,1),col=rgb(0,0,255/255,alpha=0.3),lwd=2)
}
segments(x0=1,x1=trials,y0=0.5221317,y1=0.5221317,col="darkred",lwd=3)
segments(x0=1,x1=trials,y0=0.4980716,y1=0.4980716,col="darkblue",lwd=3)
legend(100,0.3,legend=c(0.52,0.49),col=c("darkred","darkblue"),lty=1,lwd=3,
       bty="n")

