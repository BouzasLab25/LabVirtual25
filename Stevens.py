#!/usr/bin/env python
import math                       #Biblioteca para operaciones matematicas como raiz cuadrada, logaritmos, etc.
import numpy                      #Biblioteca para operaciones matematicas complejas
import matplotlib.pyplot as plt   #Biblioteca para desplegar graficas basicas
from matplotlib.widgets import Slider

fig, ax=plt.subplots()
plt.subplots_adjust(left=0.15,bottom=0.25)
#Se inicializa el arreglo de valores 'x'
#La funcion 'linspace' inicializa un arreglo con n puntos en un intervalo [a,b]
#El primer parametro es el limite inferior 'a'
#El segundo parametro es el limite superior 'b'
#El tercer parametro indica el numero de valores 'n' que tendra el arreglo
x = numpy.linspace(0, 1.0, 100)

#Se inicializa un arreglo 'y' como arreglo de puros ceros.
#El numero de ceros es igual al numero de elementos en 'x'
y = numpy.zeros(len(x))

#El siguiente ciclo asigna un valor en el arreglo 'y' para cada valor de 'x'
#de acuerdo con la ley de Stevens. En este caso, los valores de 'x' representan la magnitud fisica
#del estimulo, y los valores de 'y', la magnitud percibida
k = 1.0      #Constante de proporcionalidad
a = 1.2      #Exponente
for i in range(len(x)):
    y[i] = k * math.pow(x[i], a)


#Despliegue de la grafica
ax.plot(x, y)
ax.set_xlabel('Magnitud fisica del estimulo')
ax.set_ylabel('Magnitud percibida')
ax.set_title('Ley de Stevens')

ax_a=plt.axes([0.15,0.1,0.65,0.03], axisbg="lightgoldenrodyellow")
slider_a=Slider(ax_a,"a",.1,3.5,valinit=1)

def update(var):
    k = 1.0      
    a = slider_a.val
    for i in range(len(x)):
        y[i] = k * math.pow(x[i], a)
    ax.clear()
    ax.plot(x, y)
    ax.xlabel('Magnitud fisica del estimulo')
    ax.ylabel('Magnitud percibida')
    ax.title('Ley de Stevens')
slider_a.on_changed(update)
plt.show()
########## E J E R C I C I O  ############
#1. Modificar la constante de proporcionalidad y observar los cambios en la grafica
#2. Modificar el intervalo de valores de 'x'. Probar con [0.0, 2.0], [0.0, 10.0] y [0.0, 0.5]
#3. En la pagina 'https://en.wikipedia.org/wiki/Stevens%27_power_law' se presenta una tabla con
#   valores del exponente para distintos fenomenos de percepcion.
#   Graficar los diferentes valores y observar los cambios en la grafica
