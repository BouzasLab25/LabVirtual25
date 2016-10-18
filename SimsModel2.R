# Code's main author : Alfonso Medina
# Comments: Felisa

#Staddon's Model 2
rm(list=ls()) # Clear the workspace

##### Model parameters #####
kN<- 0.9  # Effect of Nonreward
kR<- 0.9  # Effect of Reward
trials <- 200    # Number of trials taken into account
sim <- 3         # Number of Simulations (i.e. Number of 'Subjects')

#We create two empty matrices (Filled with 'NA') which will contain the strenght of responses X and Y on each trial (rows) for every simulation ran (columns)
X<- matrix(NA,nrow=trials,ncol=sim) #Strength of response "X":
Y<- matrix(NA,nrow=trials,ncol=sim) #Strength of response "Y"
#We create an empty matrix for every simulation run. Each matrix is going to have as many rows as columns, and as many columns as response options.
C<- array (NA,dim=c(trials,2,sim)) #Choices on each moment. This matrix will indicate which of the two response options will be observed on each trial.
##### Random ratio schedule values #####
#Within Random ratio schedules of reinforcement, we can think of reinforcement as if a coin is tossed after each response is made to see whether or not it will be reinforced, where the probability of 'reward' is given by the reinforcement schedule identified as Random Ratio
#This type of reinforcement schedule receives the name of Random Ratio, because the relationship between the number of responses produced before getting the reward (the ratio 1 reinforcement/n responses), is random.
RRx<-0.2      #  Probability of reinforcement for Response X
RRy<-0.1      #  Probability of reinforcement for Response Y

#We create two empty matrices for the reinforcement availability (0 or 1 values) on each trial, for each subject simulated, for each response option.
Rx<-matrix(NA,nrow=trials,ncol=sim) #Reinforcement availability for Response X
Ry<-matrix(NA,nrow=trials,ncol=sim) #Reinforcement availability for Response Y

#We start filling the empty matrices created so far (Response strengths and Reinforcement availilabilities)

for (t in 1:trials){      #We create a for loop that repeats itself for every trial and
  for (i in 1:sim){       #that contains a repetition (another for loop) for every simulation made
    X[1,i]<-0.5   # We set an initial Response Strength of 0.5 for X (t=1) for each subject (i)
    Y[1,i]<-0.5   # We set an initial Response Strength of 0.5 for Y (t=1) for each subject (i)
    
    #We start filling our Choice matrix (the one defined as 'C', which specified which one of the two response options would be chosen)
    if (X[t,i]>Y[t,i]){          # When the Response X has a greater Strength
      C[t,1,i]=1       #The Choice matrix will contain a '1' on the X response column (column 1), on its corresponding trial and simulation
      C[t,2,i]=0       #The Choice matrix will contain a '0' on the Y response column (column 2), on the corresponding trial and simulation subject
    } else if (X[t,i]<Y[t,i]){   # When the Response Y has a greater Strength
      C[t,1,i]=0       #The Choice matrix will contain a '0' on the X response column (column 1)
      C[t,2,i]=1       #The Choice matrix will contain a '1' on the Y Response column (column 2)
    } else {                     # When both responses X and Y have the same strength 
      C[t,1,i]=rbinom(1,1,0.5)   #The X response will contain a '1' with a probability of 0.5 (because there's no predominant response strength in this scenario time)
      C[t,2,i]=abs(C[t,1,i]-1)   #And therefore, the Y response will contain either a 0 or a 1, depending on what's been obtained in Response X. (If Response X = 0, then Response Y = C[t,1,i]-1 = 0 - 1 = -1, and |-1| = 1; If Response X = 1, then Response Y = C[t,1,i]-1 = 1 - 1 = 0)
    }

#NOTE: So far, we've just defined the rule by which the Choice matrix is going to be filled. We still know nothing about the strenghts of Responses X and Y on each trial, for each subject.

#We fill our Reinforcement matrix, which will tell us whether or not Responses X and Y could be reinforced on each trial, for each subject.
    Rx[t,i]<-rbinom(1,1,RRx)     #
    Ry[t,i]<-rbinom(1,1,RRy)
    
#We now calculate the Response Strenght for both X and Y, given the Reinforcement available for each one on each trial for each subject:
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

