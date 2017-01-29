"""
Last modified on Thu Oct 13 15:25:42 2016

@author: Alfonso
"""
#Cargamos las librerias necesarias
import numpy                      #Biblioteca para operaciones matematicas complejas
from matplotlib.widgets import Slider, Button  #Bajamos la libreria para hacer Sliders
import matplotlib.pyplot as plt #Bajamos la libreria para hacer graficas

### RESCORLA-WAGNER ###

#Parametros del modelo
a = 0.3  #alpha
b = 0.15 #beta
l = 100  #lambda

#Variables del modelo
Ensayos= 100
x=numpy.linspace(0, Ensayos, Ensayos)
AV = numpy.zeros(len(x)) #Incremento en V
V = numpy.zeros(len(x)) #Valor de V

fig, ax = plt.subplots()                           #Ampliamos nuestro espacio para poder generar dos graficos por separado (uno para la grafica principal y otro para mostrar los sliders)
plt.subplots_adjust(left=0.1, bottom=0.25)        #Especificamos la relacion entre los espacios fig y ax

for k in range(len(x)-1):
    AV[k] = a*b*(l - V[k])

    V[k+1] = V[k] + AV[k]
   
    print "AV: " + str(AV[k]) + " - " + " V: "+ str(V[k]) + " alpha: " + str(a) + " beta: " + str(b) + "lambda:" + str(l)

#Despliegue de la grafica
ax.plot(x, V, linewidth=5.0)
ax.set_xlabel('Ensayos')
ax.set_ylabel('Valor acumulado de V')
ax.set_title('Modelo Rescorla & Wagner', fontsize=14, fontweight='bold')

ax_a = plt.axes([0.15,0.1,0.65,0.03], axisbg="#BCE2C2")
slider_a = Slider(ax_a,"alpha",0.01, 1, facecolor='#03B335',valinit=0.5)
ax_b = plt.axes([0.15, 0.05, 0.65, 0.03], axisbg='#BCC5E2')
slider_b = Slider(ax_b, 'beta', 0.01, 1, facecolor='#0332B3', valinit=0.5)

def update(var):
    a = slider_a.val  
    b = slider_b.val
    for k in range(len(x)-1):
	    AV[k] = a*b*(l - V[k])
	    V[k+1] = V[k] + AV[k]
    ax.clear()
    ax.plot(x, V, linewidth=5.0)
    ax.set_xlabel('Ensayos')
    ax.set_ylabel('Valor acumulado de V')
    ax.set_title('Modelo Rescorla & Wagner', fontsize=14, fontweight='bold')
    ax.set_ylim(0, 102)
slider_a.on_changed(update)
slider_b.on_changed(update)
plt.show()