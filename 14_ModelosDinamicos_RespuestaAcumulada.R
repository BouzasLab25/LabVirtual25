#Code's main author: Alfonso Medina
#Comments : Felisa

#Staddon's Model 1
rm(list=ls())  #Never forget to clear the workspace

##### Model parameters #####
kN<- 0.9  #Effect of Nonreward
kR<- 0.9  #Effect of Reward
trials <- 300    #Discrete time units taken into account
sim <- 5         #Number of Simulations

p<- matrix(rnorm(trials*sim,0,0),ncol=sim)        #Probability of choosing "Right". We build a matrix of probabilities (with as many values as trials and subjects we are simulating) extracted randomly from a normal distribution. We order our values in as many columns as subjects we simulate.
C<- matrix(rnorm(trials*sim,0,0),ncol=sim)        #Choices in option "Right"
#You should run 'p' or 'c' in the console to see the result.
FI_value<- 10      #Fixed Interval value: After which amount of 'time units' will reward be available.


#####Creating Reinforcement Schedule according to the Fixed Interval previously specified#####
FI<-rep(0,FI_value-1)        # We create an array containing all the discrete-time-units where reward will not be available; The array contains '0' values for every time-unit just before the FI is accomplished.
FI[FI_value]<-1              # Within this same array, we declare that Reward will be available only when the FI is accomplished. Thus, we'll have a '1' value at the location of the array that correspons to the discrete time-unit of reward availability given by the FI schedule.

TR<-as.integer(trials/FI_value) #Total number of reinforcements: According to the total amount of time available (trials), what's the maximun amount of times the reward will be available, given the Fixed Interval restriction (FI_value)
FI<-rep(FI,TR)                 #We replace the FI array, for a longer version of it, which repeats the same amount of Nonreinforced and Reinforced discrete time units as many times as the FI schedule can be contained within the procedure length.
#You should run 'FI' in the console to see the resulting outcome.
#We also encourage you to do it separately before and after you've run the code defining TR.


##### Applying the Model 1 #####
for (t in 1:trials){   #We create a for loop that repeats itself for every discrete time unit contained within our initial variable 'trials'
  for (i in 1:sim){    #We insert a subordinated for loop; which means that for every time unit, we'll repit the procedure as many times as subjects we're simulating.
#Remember, for now on: t refers to the time unit we're at, and i corresponds to the subject we're simulating.  
    
    p[t+1,i]<-kN*p[t,i]+(FI[t]*kR*(1-p[t,i]))      #This is the model Equation as stated in Eq. 9.3. (Staddon's Addaptative Behavior and Learning; Chapter 9
    
#Now, what we want is to convert the probability of response obtained by the previous equation into an actual response. 
# So far, p is only telling us how likely is that the response will occure based on whether it has or not being reinforced.
# For each trial, whether or not the subject will respond is defined as the outcome of a binomial distribution with parameters n=1 (the actual moment) and p = p(t+i)
# In other words, you can picture this process as if for each moment in time, the subject tossed a coin to decide whether or not to respond, with the p(t+i) previously calculated being the probability of the coin showing a particular outcome
    C[t,i]<-rbinom(1,1,p[t,i])      # Whether or not the organism will respond on every trial, given by p(t+i)   
  }
} 


##### Plotting the outcome #####
plot(seq(1,trials,1),type="n",col="red",lwd=2,              #We create a plot which length equals the number of trials. We set type='n' so we can start with an empty plot.
     ylim=c(0,150), axes=F, xlab="Time",ylab="Cumulative responses")    # Defining plot axes and title
axis(1,at=seq(0,trials,10))                                             # Labels for the X axis
axis(2,at=seq(0,150,30))                                                # Labels for the Y axis
for(i in 1:sim){                                                        # We draw a line for every subject simulated
  lines(seq(1,trials),cumsum(C[,i]),col="red",lwd=2)                    # The line plotted for every subject is going to extend to all the trials, and it's cumulative nature is given by 'cumsum(C[,1])' which sums the actual outcome 0 (response didn't occur) or 1 (respons occurs) with the previous outcomes
}

# From the Textbook:
# "The model pattern is stable (...) lacking any process for temporal discrimination, 
# always shows the postreinforcer burst pattern


