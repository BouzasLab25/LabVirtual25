#Staddon's Model 2
rm(list=ls())
### Model parameters ###
kN<- 0.9
kR<- 0.9
trials <- 1000
sim <- 1
X<- matrix(NA,nrow=trials,ncol=sim) #Strength of response "X" 
Y<- matrix(NA,nrow=trials,ncol=sim) #Strength of response "Y"
C<- array (NA,dim=c(trials,2,sim)) #Choises in each option"


#Random ratio schedule values 
RRx<-0.01
RRy<-0.02
Rx<-matrix(NA,nrow=trials,ncol=sim) #Reinforcement in X
Ry<-matrix(NA,nrow=trials,ncol=sim) #Reinforcement in y

for (t in 1:trials){
  for (i in 1:sim){
    X[1,i]<-0.5
    Y[1,i]<-0.5
    
    if (X[t,i]>Y[t,i]){
      C[t,1,i]=1
      C[t,2,i]=0
    } else if (X[t,i]<Y[t,i]){
      C[t,1,i]=0
      C[t,2,i]=1
    } else {
      C[t,1,i]=rbinom(1,1,0.5)
      C[t,2,i]=abs(C[t,1,i]-1)
    }
    
    Rx[t,i]<-rbinom(1,1,RRx)
    Ry[t,i]<-rbinom(1,1,RRy)
    
    X[t+1,i]<-(abs(C[t,1,i]-1)*(1-kN)+kN)*X[t,i]+(Rx[t,i]*(C[t,1,i]*kR))*(1-X[t,i])
    Y[t+1,i]<-(abs(C[t,2,i]-1)*(1-kN)+kN)*Y[t,i]+(Ry[t,i]*(C[t,2,i]*kR))*(1-Y[t,i])
  }
}

plot(cumsum(C[,1,1]),cumsum(C[,2,1]),type="n", ylim=c(0,400), axes=F,
     xlab="Cumulative responses in X",ylab="Cumulative responses in Y")
axis(1,at=seq(0,trials,10))
axis(2,at=seq(0,400,20))

for (k in 1:sim){
  lines(cumsum(C[,1,k]),cumsum(C[,2,k]),col="blue",lwd=2)
}

plot(cumsum(C[,1,1]),cumsum(C[,2,1]),type="n", ylim=c(0,400), axes=F,
     xlab="Cumulative responses in X",ylab="Cumulative responses in Y")
axis(1,at=seq(0,trials,10))
axis(2,at=seq(0,400,20))

for (k in 1:sim){
  lines(cumsum(C[,1,k]), col='red',lwd=2)
  lines(cumsum(C[,2,k]),col='green',lwd=2)
}

