#Codigo Base para Analisis NO paramétrico (SDT)
#Autor: Adriana F. Chávez De la Peña
#adrifelcha@gmail.com
##########################################################

rm(list=ls())  #Limpiamos el espacio de trabajo

Hits <- 85
FA <- 10
Signals <- 100
Noise <- 100
Hit_rate <- Hits/Signals
FA_rate <- FA/Noise


#A' de acuerdo con la formula presentada por Stainslaw (1999)
if(FA_rate > Hit_rate){
  A <- 0.5- ( ((FA_rate-Hit_rate)*(1+FA_rate-Hit_rate)) / ((4*FA_rate)*(1-Hit_rate)) )
  A <- round(A,2)
  print("A-prima")
  print(A)  
} else {
  A <- 0.5+ ( ((Hit_rate-FA_rate)*(1+Hit_rate-FA_rate)) / ((4*Hit_rate)*(1-FA_rate)) )
  A <- round(A,2)
  print("A-prima")
  print(A)
}


#B" de acuerdo con el metodo de Grier (Stainslaw. 1999)
if(FA_rate > Hit_rate){
  B <- (((FA_rate*(1-FA_rate))-(Hit_rate*(1-Hit_rate)))/((FA_rate*(1-FA_rate))+(Hit_rate*(1-Hit_rate))))
  B <- round(B,2)
  print("B-biprima")
  print(B)  
} else {
  B <- (((Hit_rate*(1-Hit_rate))-(FA_rate*(1-FA_rate)))/((Hit_rate*(1-Hit_rate))+(FA_rate*(1-FA_rate))))
  B <- round(B,2)
  print("B-biprima")
  print(B)
}


