# -*- coding: utf-8 -*-
"""
Created on Wed Jan 18 10:21:07 2017

@author: Uriel
"""


#!/usr/bin/env python
import math                       #Biblioteca para operaciones matematicas como raiz cuadrada, logaritmos, etc.
import numpy                      #Biblioteca para operaciones matematicas complejas
import matplotlib.pyplot as plt   #Biblioteca para desplegar graficas basicas
from matplotlib.widgets import Slider
#Se inicializa el arreglo de valores 'x'
#La funcion 'linspace' inicializa un arreglo con n puntos en un intervalo [a,b]
#El primer parametro es el limite inferior 'a'
#El segundo parametro es el limite superior 'b'
#El tercer parametro indica el numero de valores 'n' que tendra el arreglo
ensayos = 60
x = numpy.linspace(0, ensayos, ensayos)
#Se inicializa un arreglo 'y' como arreglo de puros ceros.
#El numero de ceros es igual al numero de elementos en 'x'
y = numpy.zeros(len(x))
k=1
c=[k]*ensayos
S0 = 10    		#Umbral debajo del cual el estimulo no es percibido



fig, ax = plt.subplots(2)
plt.subplots_adjust(left=0.15,bottom=0.25)
 
ax_k=plt.axes([0.15,0.1,0.65,0.03], axisbg="lightgoldenrodyellow")
slider_k=Slider(ax_k,"k",.5,1.5,valinit=k)

for i in range(len(x)):  #umbral diferencial es igual a la constante de proporcionalidad por la intensidad del estimulo
    if x[i] <= S0:
        y[i] = 0
    else:
            y[i] = S0 + k*x[i-S0] 
#El siguiente ciclo asigna un valor en el arreglo 'y' para cada valor de 'x'
#De acuerdo a la  ley de Weber, el umbral diferencial aumenta de manera proporcional a la intensidad del estimulo
#En este caso, "x" es la intensidad del estimulo y los valores de "y" los umbrales diferenciales
def update(var):
    k = slider_k.val       #El parametro de proporcionalidad de la ecuacion es 'c'
    c=[k]*ensayos     		#Umbral debajo del cual el estimulo no es percibido
    for i in range(len(x)):
        if x[i] <= S0:
            y[i]=0
        else:
            y[i] = S0 + k*x[i-S0]  #umbral diferencial es igual a la constante de proporcionalidad por la intensidad del estimulo
    
    ax[0].clear()
    ax[0].plot(x, y, 'ro')
    #ax[0].set_xlabel('Intensidad del Estimulo')
    ax[0].set_ylabel('Umbral Diferencial')
    ax[0].set_title('Ley de Weber')
    ax[0].axis([0,ensayos,0,60])
    
    ax[1].clear()
    ax[1].plot(x, c,'ro')
    ax[1].set_xlabel('Intensidad del Estimulo')
    ax[1].set_ylabel('Fraccion de Weber')
    ax[1].axis([0,ensayos,0.0,2])
  

#Veamos la grafica
ax[0].plot(x, y,'ro')
ax[0].axis([0,ensayos,0,60])
#ax[0].set_xlabel('Intensidad del Estimulo')
ax[0].set_ylabel('Umbral Diferencial')
ax[0].set_title('Ley de Weber')

ax[1].plot(x, c, 'ro')
ax[1].axis([0,ensayos,0.0,2])
ax[1].set_xlabel('Intensidad del Estimulo')
ax[1].set_ylabel('Fraccion de Weber')

slider_k.on_changed(update)



plt.show()

