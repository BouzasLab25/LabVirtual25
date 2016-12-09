### Matching Law ### 
rm(list=ls())

TR <- seq(1,100,1)
TB <- c()

### Model Parameters ###
s <-0.5
b <-0.8

for (i in 1:length(TR)){
  TB[i]=b*TR[i]^s 
}

plot(TR,TB, type="l")
      