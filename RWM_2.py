import numpy

### RESCORLA-WAGNER ###
### DOS ESTIMULOS###

#Parametros del modelo
a = 0.3  #alpha
b = (0.12,0.05) #betas para estimulos diferentes
l = 100  #lambda

#Variables del modelo
Ensayos = 100
EstP = 2 #Numero de estimulos presentes
AV = numpy.zeros((Ensayos,EstP)) #Incremento en V
V = numpy.zeros((Ensayos,EstP))  #Valor de V
VT = [0]*(Ensayos) #Suma de los valores de todos los estimulos presentes

for i in range(0,(Ensayos-1)):
	for j in range(0,(EstP)):
		VT[i] = sum(V[i,])
		AV[i,j] = a*b[j]*(l - VT[i])
		V[i+1,j] = V[i,j] + AV[i,j]

		print "AV1: " + str(AV[i,0]) + " - " + " V1: "+ str(V[i,0]) + " alpha: " + str(a) + " beta1: " + str(b[0]) + "lambda:" + str(l) + "VT: " + str(VT[i]) 
		print "AV2: " + str(AV[i,1]) + " - " + " V2: "+ str(V[i,1]) + " alpha: " + str(a) + " beta2: " + str(b[1]) + "lambda:" + str(l) + "VT: " + str(VT[i]) 

#print AV
#print V
#print VT