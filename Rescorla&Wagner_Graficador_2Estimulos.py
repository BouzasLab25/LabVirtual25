"""
Last modified on Thu Oct 13 2016

@author: Alfonso
"""
#Cargamos las librerias necesarias
import numpy                      #Biblioteca para operaciones matematicas complejas
from matplotlib.widgets import Slider, Button  #Bajamos la libreria para hacer Sliders
import matplotlib.pyplot as plt #Bajamos la libreria para hacer graficas

### RESCORLA-WAGNER ###
### DOS ESTIMULOS/Competencia ###

#Parametros del modelo
a = 0.3  #alpha
b1 = 0.12 #beta para EC1
b2 = 0.5 #beta para EC2
betas = [b1,b2] #arreglo de betas
l = 100  #lambda
EstP = 2 #Numero de estimulos presentes

#Variables del modelo
Ensayos = 100 
x=numpy.linspace(0, Ensayos, Ensayos)
AV = numpy.zeros((Ensayos,EstP)) #Incremento en V
V = numpy.zeros((Ensayos,EstP))  #Valor de V
VT = [0]*(Ensayos) #Suma de los valores de todos los estimulos presentes

fig, ax = plt.subplots()                           #Ampliamos nuestro espacio para poder generar dos graficos por separado (uno para la grafica principal y otro para mostrar los sliders)
plt.subplots_adjust(left=0.1, bottom=0.25)        #Especificamos la relacion entre los espacios fig y ax


for i in range(len(x)-1):
	for j in range(0,(EstP)):
		VT[i] = sum(V[i,])
		AV[i,j] = a*betas[j]*(l - VT[i])
		V[i+1,j] = V[i,j] + AV[i,j]


		print "AV1: " + str(AV[i,0]) + " - " + " V1: "+ str(V[i,0]) + " alpha: " + str(a) + " beta1: " + str(betas[0]) + "lambda:" + str(l) + "VT: " + str(VT[i]) 
		print "AV2: " + str(AV[i,1]) + " - " + " V2: "+ str(V[i,1]) + " alpha: " + str(a) + " beta2: " + str(betas[1]) + "lambda:" + str(l) + "VT: " + str(VT[i]) 

#Despliegue de la grafica
ax.plot(x, V[:,0], linewidth=5.0)
ax.plot(x, V[:,1], linewidth=5.0)
ax.set_xlabel('Ensayos')
ax.set_ylabel('Valor acumulado de V')
ax.set_title('Modelo Rescorla & Wagner', fontsize=14, fontweight='bold')

ax_a = plt.axes([0.15,0.11,0.65,0.03], axisbg="#BCE2C2")
slider_a = Slider(ax_a,"alpha",0.01,1,facecolor='#03B335',valinit=a)
ax_b1 = plt.axes([0.15, 0.06, 0.65, 0.03], axisbg='#BCC5E2')
slider_b1 = Slider(ax_b1, 'beta1', 0.01, 1.0, facecolor='#0332B3', valinit=b1)
ax_b2 = plt.axes([0.15, 0.01, 0.65, 0.03], axisbg='#BCE1E2')
slider_b2 = Slider(ax_b2, 'beta2', 0.01, 1.0, facecolor='#0399B3', valinit=b2)

def update(var):
	a = slider_a.val  
	betas[0] = slider_b1.val
	betas[1] = slider_b2.val
	for i in range(len(x)-1):
		for j in range(0,(EstP)):
			VT[i] = sum(V[i,])
			AV[i,j] = a*betas[j]*(l - VT[i])
			V[i+1,j] = V[i,j] + AV[i,j]
	ax.clear()
	ax.plot(x, V[:,0], linewidth=5.0)
	ax.plot(x, V[:,1], linewidth=5.0)
	ax.set_xlabel('Ensayos')
	ax.set_ylabel('Valor acumulado de V')
	ax.set_title('Modelo Rescorla & Wagner', fontsize=14, fontweight='bold')
	ax.set_ylim(0, 102)
slider_a.on_changed(update)
slider_b1.on_changed(update)
slider_b2.on_changed(update)
plt.show()
