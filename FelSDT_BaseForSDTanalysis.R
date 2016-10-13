
rm(list=ls())  

h<-123
f<-75
h_rate<-h/150
fa_rate<-f/150
k<-qnorm(1-fa_rate,0,1)
d<-qnorm(h_rate,0,1)-qnorm(fa_rate,0,1)
c<-k-(d/2)                    
beta<-dnorm(k,d,1)/dnorm(k,0,1)

soporte <- seq(-6,6,.05)
d_ruido <- dnorm(soporte,0,1)
d_senal <- dnorm(soporte,d,1)

plot(soporte,d_ruido,type='l')
lines(soporte,d_senal,type='l',col='blue')
abline(v=k,col='red')
abline(v=d/2,col='blue',lty=2)


d<-round(d,5)
k<-round(k,5)
c<-round(c,5)
beta<-round(beta,5)

text(-4,0.39,paste("K = ",k))
text(-5,0.34,paste("C = ",c))
text(-4,0.29,paste("D' = ",d))
text(-5,0.24,paste("Hit Rate = ",h_rate))
text(-4,0.19,paste("False alarm Rate = ",fa_rate))

