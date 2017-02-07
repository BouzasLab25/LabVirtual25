### Matching Law ### 
rm(list=ls())

### Model Parameters ###
s <-c(0.6,0.5,0.5)
b <-c(0.8,0.7,0.8)

TR <- seq(0,1,0.001)
TB <- matrix(NA,length(TR),length(s))
TBr <- c()

for (j in 1:3){
  for (i in 0:length(TR)){
  TB[i,j]=b[j]*TR[i]^s[j] 
  TBr[i]=TB[i,1]+rnorm(1,0,0.02)
  }
}

colores <- c("red","blue","green")

plot(TR,TBr, type = "p", pch = 21, cex = 0.7,axes = F,
     xlab = "Tasa relativa de refuerzo", ylab = "Tasa relativa de respuesta")
axis(1,at=seq(0,1,0.1))
axis(2,at=seq(0,1,0.1))
for (k in 1:3){
  lines(TR,TB[,k], col = colores[k], lwd = 3)
}