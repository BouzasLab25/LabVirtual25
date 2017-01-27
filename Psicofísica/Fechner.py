# -*- coding: utf-8 -*-
"""
Created on Wed Jan 18 10:21:07 2017

@author: Uriel
"""

# -*- coding: utf-8 -*-
"""
Created on Wed Jan 18 10:06:45 2017

@author: Uriel
Ley Psicofísica (Fechner)
"""

#!/usr/bin/env python
import math                       #Biblioteca para operaciones matematicas como raiz cuadrada, logaritmos, etc.
import numpy as np                #Biblioteca para operaciones matematicas complejas
import matplotlib.pyplot as plt   #Biblioteca para desplegar graficas basicas
from matplotlib.widgets import Slider

fig, ax=plt.subplots()

#Se inicializa el arreglo de valores 'x'
#La funcion 'linspace' inicializa un arreglo con n puntos en un intervalo [a,b]
#El primer parametro es el limite inferior 'a'
#El segundo parametro es el limite superior 'b'
#El tercer parametro indica el numero de valores 'n' que tendra el arreglo
x = np.linspace(0, 100.0,100)

#Se inicializa un arreglo 'y' como arreglo de puros ceros.
#El numero de ceros es igual al numero de elementos en 'x'
y = np.zeros(len(x))

#El siguiente ciclo asigna un valor en el arreglo 'y' para cada valor de 'x'
#de acuerdo con la ley de Stevens. En este caso, los valores de 'x' representan la magnitud fisica
#del estimulo, y los valores de 'y', la magnitud percibida
k = 2     #Constante de proporcionalidad
#a = 1.2    #Exponente
for i in range(len(x)):
    y[i] = k*np.log(x[i])


#Despliegue de la grafica
ax.plot(x, y)
ax.axis([0,100,0,10])
ax.set_xlabel('Intensidad del estimulo')
ax.set_ylabel('Diferencia Apenas Perceptible')
ax.set_title('Funcion de Fechner')
###
plt.show()