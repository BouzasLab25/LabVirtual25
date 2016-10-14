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
x = np.arange(-6.0, 6.0, 0.01)
yes = np.arange(k, 6.0, 0.01)
no = np.arange(-6.0, k, 0.01)
 

d1 = ax.plot(x,mlab.normpdf(x, mu, sigma), 'black')      
d2 = ax.plot(x,mlab.normpdf(x, d, sigma), 'black')

ax.plot([k,k],[0,0.5], 'red')
ax.fill_between(yes, 0, (scipy.stats.norm(d,1).pdf(yes)), facecolor='#19D386', alpha=0.5)
ax.fill_between(yes, 0, (scipy.stats.norm(0,1).pdf(yes)), facecolor='#F7C11D', alpha=0.5)
ax.fill_between(no, 0, scipy.stats.norm(0,1).pdf(no), facecolor='#C81BE2', alpha=0.5)
ax.fill_between(no, 0, scipy.stats.norm(d,1).pdf(no), facecolor='#003797', alpha=0.5)
     
ax.plot([-2.5,4.5],[0.6,0.6], 'k', linewidth=1) #Insertamos dos lineas
ax.text(-1.6, 0.61, 'Rechazos', color='#C81BE2', ha='center', va='bottom', fontsize=10, fontweight='bold')   #Escribimos los terminos que componen la Regla
ax.text(0.2, 0.61, 'Omisiones', color='#003797', ha='center', va='bottom', fontsize=10, fontweight='bold')   
ax.text(2.3, 0.61, 'FalsasAlarmas', color='#D3A519', ha='center', va='bottom', fontsize=10, fontweight='bold')   
ax.text(4.05, 0.61, 'Hits', ha='center', color='#188A5B', va='bottom', fontsize=10)   
ax.text(-1.6, 0.56, '(%.2f)' %scipy.stats.norm(0,1).cdf(k), color='#C81BE2', ha='center', va='bottom', fontsize=10)   #Escribimos los terminos que componen la Regla
ax.text(0.2, 0.56, '(%.2f)' %scipy.stats.norm(d,1).cdf(k), color='#003797', ha='center', va='bottom', fontsize=10)   
ax.text(2.3, 0.56, '(%.2f)' %(1-scipy.stats.norm(0,1).cdf(k)), color='#D3A519', ha='center', va='bottom', fontsize=10)   
ax.text(4.05, 0.56, '(%.2f)' %(1-scipy.stats.norm(d,1).cdf(k)), ha='center', color='#188A5B', va='bottom', fontsize=10)

ax.text(0, 0.42, 'Ruido', ha='center', va='bottom')  
ax.text(d, 0.42, 'Senal', ha='center', va='bottom')  

ax.set_title('Teoria de Deteccion de Senales', fontsize=18, fontweight='bold')  #Añadimos un titulo a la grafica
ax.set_xlabel('Evidencia')    #Damos un nombre al eje de las abscisas
ax.set_ylabel('Probabilidad')           #Damos un nombre al eje de las ordenadas
ax.axis([-3.0, 5.0, 0.0, 0.7])           #Especificamos las dimensiones de la grafica principal; los primeros dos valores corresponden al rango abarcado por el eje X y los ultimos, al eje Y.
 
ax_k = plt.axes([0.10, 0.12, 0.80, 0.03], axisbg='white')     #Dibujamos el primer slider, especificamos su ubicacion (Limite izquierdo en X, limite inferior en y, limite derecho en X y altura apartir de su origen en Y), y el color.
s_k = Slider(ax_k, 'Criterio', -3.0, 5.0, facecolor='white', valinit=k)             #Asignamos la funcionalidad de slider, le damos un nombre, especificamos los valores entre los que puede variar y asignamos como valor inicial el default especificado al principio del codigo

def update(adri):   # Creamos una funcion para actualizar nuestra grafica 
    hitR = 90.0/100.0
    faR = 15.0/100.0
    k_ = s_k.val
    yes = np.arange(k_, 6.0, 0.01)
    no = np.arange(-6.0, k_, 0.01)
    d_ = (scipy.stats.norm(0,1).ppf(hitR))-(scipy.stats.norm(0,1).ppf(faR))
    c_ = k_-(d_/2)
    b_ = (scipy.stats.norm(d_,1).pdf(k_))/(scipy.stats.norm(0,1).pdf(k_))
    ax.clear() #Limpiamos la grafica para poder dibujar sobre ella
    ax.plot(x,mlab.normpdf(x, mu, sigma), 'black')      
    ax.plot(x,mlab.normpdf(x, d_, sigma), 'black') 
    ax.plot([-2.5,4.5],[0.6,0.6], 'k', linewidth=1) #Insertamos dos lineas
    ax.text(-1.6, 0.61, 'Rechazos', color='#C81BE2', ha='center', va='bottom', fontsize=10, fontweight='bold')   #Escribimos los terminos que componen la Regla
    ax.text(0.2, 0.61, 'Omisiones', color='#003797', ha='center', va='bottom', fontsize=10, fontweight='bold')   
    ax.text(2.3, 0.61, 'FalsasAlarmas', color='#D3A519', ha='center', va='bottom', fontsize=10, fontweight='bold')   
    ax.text(4.05, 0.61, 'Hits', ha='center', color='#188A5B', va='bottom', fontsize=10)   
    ax.text(-1.6, 0.56, '(%.2f)' %scipy.stats.norm(0,1).cdf(k_), color='#C81BE2', ha='center', va='bottom', fontsize=10)   #Escribimos los terminos que componen la Regla
    ax.text(0.2, 0.56, '(%.2f)' %scipy.stats.norm(d,1).cdf(k_), color='#003797', ha='center', va='bottom', fontsize=10)   
    ax.text(2.3, 0.56, '(%.2f)' %(1-scipy.stats.norm(0,1).cdf(k_)), color='#D3A519', ha='center', va='bottom', fontsize=10)   
    ax.text(4.05, 0.56, '(%.2f)' %(1-scipy.stats.norm(d,1).cdf(k_)), ha='center', color='#188A5B', va='bottom', fontsize=10)    
    ax.plot([k_,k_],[0,0.5], 'red')
    ax.fill_between(yes, 0, (scipy.stats.norm(d,1).pdf(yes)), facecolor='#19D386', alpha=0.5)
    ax.fill_between(yes, 0, (scipy.stats.norm(0,1).pdf(yes)), facecolor='#F7C11D', alpha=0.5)
    ax.fill_between(no, 0, scipy.stats.norm(0,1).pdf(no), facecolor='#C81BE2', alpha=0.5)
    ax.fill_between(no, 0, scipy.stats.norm(d,1).pdf(no), facecolor='#003797', alpha=0.5)
    ax.text(0, 0.42, 'Ruido', ha='center', va='bottom')  
    ax.text(d_, 0.42, 'Senal', ha='center', va='bottom')      
    ax.axis([-3.0, 5.0, 0.0, 0.7]) #Mantenemos las dimensiones de la grafica como en un inicio
    ax.set_title('Teoria de Deteccion de Senales', fontsize=18, fontweight='bold') #Reiteramos el titulo
    ax.set_xlabel('Evidencia') #Reiteramos el nombre del eje de las abscisas
    ax.set_ylabel('Probabilidad') #Reiteramos el nombre del eje de las ordenadas
s_k.on_changed(update) #Llamamos la funcion de actualizacion por cada movimiento en el Slider de la Prior
plt.show() #Imprimimos la grafica
