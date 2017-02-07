# -*- coding: utf-8 -*-
"""
Created on Wed Jan 18 10:21:07 2017

@author: Uriel
"""

#!/usr/bin/env python
import math                       #Biblioteca para operaciones matematicas como raiz cuadrada, logaritmos, etc.
import numpy as np                #Biblioteca para operaciones matematicas complejas
import matplotlib.pyplot as plt   #Biblioteca para desplegar graficas basicas
from matplotlib.widgets import Slider

fig, ax = plt.subplots(2)
#plt.subplots_adjust(left=0.15,bottom=0.25)

#Se inicializa el arreglo de valores 'x'
#La funcion 'linspace' inicializa un arreglo con n puntos en un intervalo [a,b]
#El primer parametro es el limite inferior 'a'
#El segundo parametro es el limite superior 'b'
#El tercer parametro indica el numero de valores 'n' que tendra el arreglo
jnd = np.linspace(1, 10, 10)
k= 0.2 #constante de proporcionalidad

#El siguiente vector corresponde a las diferentes intensidades de un estímulo donde los participantes reportaron encontrar diferencia
#con respecto a un valor anterior.
estimulos = [10.00,12.00,14.40,17.280,20.736,24.88320,29.85984,35.83181,42.99817,51.5978]
#Se inicializa un arreglo 'y' como arreglo de puros ceros.
#El numero de ceros es igual al numero de elementos en 'x'
y = np.zeros(len(estimulos))

#El numero de diferencia apenas perceptible es proporcional al logaritmo de la intensidad del estimulo
for i in range(len(estimulos)):
    y[i] = k*np.log(estimulos[i])
 

#Despliegue de la grafica

ax[0].plot(estimulos, jnd)
ax[0].axis([10,50,0,10])
ax[0].set_xlabel('Intensidad del estimulo')
ax[0].set_ylabel('Diferencia Apenas Perceptible')
ax[0].set_title('Funcion de Fechner')

ax[1].plot(y, jnd)
ax[1].axis([0.459,0.8,0,10])
ax[1].set_xlabel('Intensidad del estimulo en logaritmos')
ax[1].set_ylabel('Diferencia Apenas Perceptible')

###
plt.show()