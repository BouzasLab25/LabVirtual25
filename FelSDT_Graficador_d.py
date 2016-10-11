# -*- coding: utf-8 -*-
"""
Created on Tue Oct 11 13:12:14 2016

@author: Felisa
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
Falarms = 20
hitRate = hits/100.0
faRate = Falarms/100.0

k = scipy.stats.norm(0, 1).ppf(1-faRate)
d = (scipy.stats.norm(0,1).ppf(hitRate))-(scipy.stats.norm(0,1).ppf(faRate))
c = k-(d/2)
b = (scipy.stats.norm(d,1).pdf(k))/(scipy.stats.norm(0,1).pdf(k))

fig, ax = plt.subplots()                           #Ampliamos nuestro espacio para poder generar dos graficos por separado (uno para la grafica principal y otro para mostrar los sliders)
plt.subplots_adjust(left=0.1, bottom=0.25)        #Especificamos la relacion entre los espacios fig y ax

mu = 0
variance = 1
sigma = math.sqrt(variance)
x = np.linspace(-4, 6, 100)

d1 = ax.plot(x,mlab.normpdf(x, mu, sigma), 'black')      
d2 = ax.plot(x,mlab.normpdf(x, d, sigma), 'black')     

ax.text(0, 0.42, 'Ruido', ha='center', va='bottom')  
ax.text(d, 0.42, 'Senal', ha='center', va='bottom')  

ax.set_title('Teoria de Deteccion de Senales', fontsize=20, fontweight='bold')  #Añadimos un titulo a la grafica
ax.set_xlabel('Evidencia')    #Damos un nombre al eje de las abscisas
ax.set_ylabel('Probabilidad')           #Damos un nombre al eje de las ordenadas
ax.axis([-3.0, 5.0, 0.0, 0.5])           #Especificamos las dimensiones de la grafica principal; los primeros dos valores corresponden al rango abarcado por el eje X y los ultimos, al eje Y.
 
ax_hits = plt.axes([0.15, 0.12, 0.65, 0.03], axisbg='#BCE2C2')     #Dibujamos el primer slider, especificamos su ubicacion (Limite izquierdo en X, limite inferior en y, limite derecho en X y altura apartir de su origen en Y), y el color.
s_hits = Slider(ax_hits, 'Hit Rate', 0.01, 1.0, valinit=hitRate)             #Asignamos la funcionalidad de slider, le damos un nombre, especificamos los valores entre los que puede variar y asignamos como valor inicial el default especificado al principio del codigo

ax_fa = plt.axes([0.15, 0.07, 0.65, 0.03], axisbg='#BCC5E2')      #Dibujamos el segundo slider, con las mismas dimensiones que el primero, pero situandolo en una altura distinta
s_fa = Slider(ax_fa, 'F.A. Rate', 0.01, 1.0, valinit=faRate)          #Asignamos la funcion Slider, le damos unn nombre, definimos los valores entre los que peude variar y asignamos un valor inicial

def update(adri):   # Creamos una funcion para actualizar nuestra grafica
    hitR = s_hits.val
    faR = s_fa.val
    k_ = scipy.stats.norm(0, 1).ppf(1-faR)
    d_ = (scipy.stats.norm(0,1).ppf(hitR))-(scipy.stats.norm(0,1).ppf(faR))
    c_ = k_-(d_/2)
    b_ = (scipy.stats.norm(d_,1).pdf(k_))/(scipy.stats.norm(0,1).pdf(k_))
    ax.clear() #Limpiamos la grafica para poder dibujar sobre ella
    ax.plot(x,mlab.normpdf(x, mu, sigma), 'black')      
    ax.plot(x,mlab.normpdf(x, d, sigma), 'black')    
    ax.text(0, 0.42, 'Ruido', ha='center', va='bottom')  
    ax.text(d, 0.42, 'Senal', ha='center', va='bottom')      
    ax.axis([-3.0, 5.0, 0.0, 0.5]) #Mantenemos las dimensiones de la grafica como en un inicio
    ax.set_title('Teoria de Deteccion de Senales', fontsize=2, fontweight='bold') #Reiteramos el titulo
    ax.set_xlabel('Evidencia') #Reiteramos el nombre del eje de las abscisas
    ax.set_ylabel('Probabilidad') #Reiteramos el nombre del eje de las ordenadas
s_hits.on_changed(update) #Llamamos la funcion de actualizacion por cada movimiento en el Slider de la Prior
s_fa.on_changed(update) #Llamamos la funcion de actualizacion por cada movimiento en el Slider de la Verosimilitud
plt.show() #Imprimimos la grafica
