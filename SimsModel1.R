#Staddon's Model 1
rm(list=ls())
### Model parameters ###
kN<- 0.2
kR<- 0.7
trials <- 200
sim <- 10

p<- matrix(rnorm(trials*sim,0,0),ncol=sim) #Probability of choosing "Right" 
C<- matrix(rnorm(trials*sim,0,0),ncol=sim) #Choises in option "Right"
FI_value<- 10 #Fix Interval value 

#Creating the FI schedule 
FI<-rep(0,FI_value-1)
FI[FI_value]<-1
TR<-as.integer(trials/FI_value) #Total reinforcements 
FI<-rep(FI,TR)
if(length(FI)!=trials){
  FI[length(FI):trials]<-0
}


for (t in 1:trials){
  for (i in 1:sim){
      
    p[t+1,i]<-kN*p[t,i]+(FI[t]*kR*(1-p[t,i]))
    
    C[t,i]<-rbinom(1,1,p[t,i])
  }
} 

plot(seq(1,trials,1),cumsum(C[,1]),type="n",col="red",lwd=2,
     ylim=c(0,30), axes=F, xlab="Time",ylab="Cumulative responses")
axis(1,at=seq(0,trials,10))
axis(2,at=seq(0,30,10))
for(i in 1:sim){
  lines(seq(1,trials),cumsum(C[,i]),col="red",lwd=2)
}




