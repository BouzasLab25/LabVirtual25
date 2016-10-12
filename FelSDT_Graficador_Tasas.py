# -*- coding: utf-8 -*-
"""
Created on Wed Oct 12 16:47:32 2016

@author: Alejandro
"""
#Cargamos las librerias necesarias
from matplotlib.widgets import Slider  #Bajamos la libreria para hacer Sliders
import matplotlib.pyplot as plt #Bajamos la libreria para hacer graficas
import numpy as np
import matplotlib.mlab as mlab
import math
import scipy
import scipy.stats


hits = 90
Falarms = 15
hitRate = hits/100.0
faRate = Falarms/100.0

d = (scipy.stats.norm(0,1).ppf(hitRate))-(scipy.stats.norm(0,1).ppf(faRate))
k = (d/2)
b = (scipy.stats.norm(d,1).pdf(k))/(scipy.stats.norm(0,1).pdf(k))

fig, ax = plt.subplots()                           #Ampliamos nuestro espacio para poder generar dos graficos por separado (uno para la grafica principal y otro para mostrar los sliders)
plt.subplots_adjust(left=0.1, bottom=0.25)        #Especificamos la relacion entre los espacios fig y ax

mu = 0
variance = 1
sigma = math.sqrt(variance)
x = np.linspace(-4, 6, 100)
y = [k,6]
n = [-4,k]

d1 = ax.plot(x,mlab.normpdf(x, mu, sigma), 'black')      
d2 = ax.plot(x,mlab.normpdf(x, d, sigma), 'black')

ax.plot([k,k],[0,0.5], 'red')
ax.fill_between([k,6], 0, scipy.stats.norm(d,1).pdf([k,5]), facecolor='blue', alpha=0.5)
ax.fill_between(x, 0, scipy.stats.norm(0,1).pdf(x), facecolor='gray', alpha=0.5)
     

ax.text(0, 0.42, 'Ruido', ha='center', va='bottom')  
ax.text(d, 0.42, 'Senal', ha='center', va='bottom')  

ax.set_title('Teoria de Deteccion de Senales', fontsize=18, fontweight='bold')  #Añadimos un titulo a la grafica
ax.set_xlabel('Evidencia')    #Damos un nombre al eje de las abscisas
ax.set_ylabel('Probabilidad')           #Damos un nombre al eje de las ordenadas
ax.axis([-3.0, 5.0, 0.0, 0.7])           #Especificamos las dimensiones de la grafica principal; los primeros dos valores corresponden al rango abarcado por el eje X y los ultimos, al eje Y.
 
ax_k = plt.axes([0.10, 0.12, 0.80, 0.03], axisbg='#BCE2C2')     #Dibujamos el primer slider, especificamos su ubicacion (Limite izquierdo en X, limite inferior en y, limite derecho en X y altura apartir de su origen en Y), y el color.
s_k = Slider(ax_k, 'Criterio', -3.0, 5.0, facecolor='red', valinit=k)             #Asignamos la funcionalidad de slider, le damos un nombre, especificamos los valores entre los que puede variar y asignamos como valor inicial el default especificado al principio del codigo

def update(adri):   # Creamos una funcion para actualizar nuestra grafica
    hitR = 90.0/100.0
    faR = 15.0/100.0
    k_ = s_k.val
    d_ = (scipy.stats.norm(0,1).ppf(hitR))-(scipy.stats.norm(0,1).ppf(faR))
    c_ = k_-(d_/2)
    b_ = (scipy.stats.norm(d_,1).pdf(k_))/(scipy.stats.norm(0,1).pdf(k_))
    ax.clear() #Limpiamos la grafica para poder dibujar sobre ella
    ax.plot(x,mlab.normpdf(x, mu, sigma), 'black')      
    ax.plot(x,mlab.normpdf(x, d_, sigma), 'black') 
    ax.plot([k_,k_],[0,0.5], 'red')
    ax.text(0, 0.42, 'Ruido', ha='center', va='bottom')  
    ax.text(d_, 0.42, 'Senal', ha='center', va='bottom')      
    ax.axis([-3.0, 5.0, 0.0, 0.7]) #Mantenemos las dimensiones de la grafica como en un inicio
    ax.set_title('Teoria de Deteccion de Senales', fontsize=18, fontweight='bold') #Reiteramos el titulo
    ax.set_xlabel('Evidencia') #Reiteramos el nombre del eje de las abscisas
    ax.set_ylabel('Probabilidad') #Reiteramos el nombre del eje de las ordenadas
s_k.on_changed(update) #Llamamos la funcion de actualizacion por cada movimiento en el Slider de la Prior
plt.show() #Imprimimos la grafica
