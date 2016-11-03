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
Falarms = 15
hitRate = hits/100.0
faRate = Falarms/100.0

k = scipy.stats.norm(0, 1).ppf(1-faRate)
d = (scipy.stats.norm(0,1).ppf(hitRate))-(scipy.stats.norm(0,1).ppf(faRate))
c = k-(d/2)
b = (scipy.stats.norm(d,1).pdf(k))/(scipy.stats.norm(0,1).pdf(k))

fig, ax = plt.subplots(3)                           #Ampliamos nuestro espacio para poder generar dos graficos por separado (uno para la grafica principal y otro para mostrar los sliders)
plt.subplots_adjust(left=0.1, bottom=0.25)        #Especificamos la relacion entre los espacios fig y ax

mu = 0
variance = 1
sigma = math.sqrt(variance)
x = np.linspace(-4, 6, 100)
yes = np.arange(k, 6.0, 0.01)      #Delimitamos el espacio de ‘respuestas afirmativas’, a la derecha del criterio.
no = np.arange(-6.0, k, 0.01)      #Delimitamos el espacio de ‘respuestas negativas’, a la izquierda del criterio.
 
d1 = ax[0].plot(x,mlab.normpdf(x, mu, sigma), 'black')      
d2 = ax[0].plot(x,mlab.normpdf(x, d, sigma), 'black', ls='dashed')     
ax[0].fill_between(yes, 0, scipy.stats.norm(0,1).pdf(yes), facecolor='#9F169A', alpha=0.5)
ax[0].plot([k,k],[0,0.5], 'red')
ax[0].text(-0.9, 0.34, 'Ruido', ha='center', va='bottom')  
ax[0].text((d+0.9), 0.34, 'Senal', ha='center', va='bottom')
ax[0].text((k+0.5), 0.17, 'F.A.', color='purple', fontweight='bold', ha='center', va='bottom')
ax[0].plot([0,0],[0,0.4], 'black', ls='dashed')
ax[0].plot([0,k],[0.3,0.3], 'black')
ax[0].text((k+0.1), 0.38, 'k', ha='center', va='bottom', color='red')  
ax[0].text(-2, 0.21, '(%.3f)' %k, ha='center', va='bottom', color='black', fontsize=12 )  
ax[0].set_title('Discriminabilidad', fontsize=18, fontweight='bold')  #Añadimos un titulo a la grafica
ax[0].set_ylabel('Probabilidad')           #Damos un nombre al eje de las ordenadas
ax[0].axis([-3.0, 5.0, 0.0, 0.5])           #Especificamos las dimensiones de la grafica principal; los primeros dos valores corresponden al rango abarcado por el eje X y los ultimos, al eje Y.
 
d1 = ax[1].plot(x,mlab.normpdf(x, mu, sigma), 'black', ls='dashed')      
d2 = ax[1].plot(x,mlab.normpdf(x, d, sigma), 'black')     
ax[1].fill_between(yes, 0, scipy.stats.norm(d,1).pdf(yes), facecolor='#289F16', alpha=0.5)         #Coloreamos los Rechazos Correctos
ax[1].plot([k,k],[0,0.5], 'red')
ax[1].text(-0.9, 0.34, 'Ruido', ha='center', va='bottom')  
ax[1].text((d+0.9), 0.34, 'Senal', ha='center', va='bottom')
ax[1].text((d), 0.2, 'Hits', color='Green', fontweight='bold', ha='center', va='bottom')
ax[1].plot([d,d],[0,0.4], 'black', ls='dashed')
ax[1].plot([k,d],[0.3,0.3], 'black')
ax[1].text((k+0.1), 0.38, 'k', ha='center', va='bottom', color='red')  
ax[1].text(-2, 0.21, '(%.3f)' %(d-k), ha='center', va='bottom', color='black', fontsize=12 )  
ax[1].set_ylabel('Probabilidad')           #Damos un nombre al eje de las ordenadas
ax[1].axis([-3.0, 5.0, 0.0, 0.5])           #Especificamos las dimensiones de la grafica principal; los primeros dos valores corresponden al rango abarcado por el eje X y los ultimos, al eje Y.

d1 = ax[2].plot(x,mlab.normpdf(x, mu, sigma), 'black')      
d2 = ax[2].plot(x,mlab.normpdf(x, d, sigma), 'black')     
ax[2].fill_between(yes, 0, scipy.stats.norm(d,1).pdf(yes), facecolor='#289F16', alpha=0.5)         #Coloreamos los Rechazos Correctos
ax[2].fill_between(yes, 0, scipy.stats.norm(0,1).pdf(yes), facecolor='#9F169A', alpha=0.5)
ax[2].plot([k,k],[0,0.5], 'red', ls='dashed')
ax[2].text(-0.9, 0.34, 'Ruido', ha='center', va='bottom')  
ax[2].text((d+0.9), 0.34, 'Senal', ha='center', va='bottom')
ax[2].plot([0,0],[0,0.4], 'purple', ls='dashed')
ax[2].plot([d,d],[0,0.4], 'purple', ls='dashed')
ax[2].plot([0,d],[0.3,0.3], 'purple')
ax[2].text(d/2, 0.31, 'd', ha='center', va='bottom', color='purple', fontweight='bold' )  
ax[2].text(-2, 0.21, '(%.3f)' %d, ha='center', va='bottom', color='purple', fontsize=12 )  
ax[2].set_ylabel('Probabilidad')           #Damos un nombre al eje de las ordenadas
ax[2].axis([-3.0, 5.0, 0.0, 0.5])           #Especificamos las dimensiones de la grafica principal; los primeros dos valores corresponden al rango abarcado por el eje X y los ultimos, al eje Y.
ax[2].set_xlabel('Evidencia')    #Damos un nombre al eje de las abscisas

 

ax_hits = plt.axes([0.15, 0.07, 0.65, 0.03], axisbg='#BCE2C2')     #Dibujamos el primer slider, especificamos su ubicacion (Limite izquierdo en X, limite inferior en y, limite derecho en X y altura apartir de su origen en Y), y el color.
s_hits = Slider(ax_hits, 'Hit Rate', 0.01, 1.0, facecolor='#289F16', valinit=hitRate)             #Asignamos la funcionalidad de slider, le damos un nombre, especificamos los valores entre los que puede variar y asignamos como valor inicial el default especificado al principio del codigo

ax_fa = plt.axes([0.15, 0.12, 0.65, 0.03], axisbg='#BCC5E2')      #Dibujamos el segundo slider, con las mismas dimensiones que el primero, pero situandolo en una altura distinta
s_fa = Slider(ax_fa, 'F.A. Rate', 0.01, 1.0, facecolor='#9F169A', valinit=faRate)          #Asignamos la funcion Slider, le damos unn nombre, definimos los valores entre los que peude variar y asignamos un valor inicial

def update(adri):   # Creamos una funcion para actualizar nuestra grafica
    hitR = s_hits.val
    faR = s_fa.val
    k_ = scipy.stats.norm(0, 1).ppf(1-faR)
    d_ = (scipy.stats.norm(0,1).ppf(hitR))-(scipy.stats.norm(0,1).ppf(faR))
    c_ = k_-(d_/2)
    b_ = (scipy.stats.norm(d_,1).pdf(k_))/(scipy.stats.norm(0,1).pdf(k_))
    yes = np.arange(k_, 6.0, 0.01)      #Delimitamos el espacio de ‘respuestas afirmativas’, a la derecha del criterio.
    no = np.arange(-6.0, k_, 0.01)      #Delimitamos el espacio de ‘respuestas negativas’, a la izquierda del criterio.
    ax[0].clear() #Limpiamos la grafica para poder dibujar sobre ella
    ax[0].plot(x,mlab.normpdf(x, mu, sigma), 'black')      
    ax[0].plot(x,mlab.normpdf(x, d_, sigma), 'black')    
    ax[0].text(-0.9, 0.34, 'Ruido', ha='center', va='bottom')  
    ax[0].text((d_+0.9), 0.34, 'Senal', ha='center', va='bottom')
    ax[0].text((k_+0.5), 0.17, 'F.A.', color='purple', fontweight='bold', ha='center', va='bottom')
    ax[0].fill_between(yes, 0, scipy.stats.norm(0,1).pdf(yes), facecolor='#9F169A', alpha=0.5)
    ax[0].plot([k_,k_],[0,0.5], 'red')
    ax[0].plot([0,0],[0,0.4], 'black', ls='dashed')
    ax[0].plot([0,k_],[0.3,0.3], 'black')
    ax[0].text((k_+0.1), 0.38, 'k', ha='center', va='bottom', color='red')      
    ax[0].text(-2, 0.21, '(%.3f)' %k_, ha='center', va='bottom', color='black', fontsize=12 )  
    ax[0].axis([-3.0, 5.0, 0.0, 0.5]) #Mantenemos las dimensiones de la grafica como en un inicio
    ax[0].set_title('Discriminabilidad', fontsize=18, fontweight='bold') #Reiteramos el titulo
    ax[0].set_ylabel('Probabilidad') #Reiteramos el nombre del eje de las ordenadas

    ax[1].clear() #Limpiamos la grafica para poder dibujar sobre ella
    ax[1].plot(x,mlab.normpdf(x, mu, sigma), 'black')      
    ax[1].plot(x,mlab.normpdf(x, d_, sigma), 'black')    
    ax[1].text(-0.9, 0.34, 'Ruido', ha='center', va='bottom')  
    ax[1].text((d_+0.9), 0.34, 'Senal', ha='center', va='bottom')
    ax[1].text((d_), 0.2, 'Hits', color='Green', fontweight='bold', ha='center', va='bottom')
    ax[1].fill_between(yes, 0, scipy.stats.norm(d_,1).pdf(yes), facecolor='#289F16', alpha=0.5)         #Coloreamos los Rechazos Correctos
    ax[1].plot([k_,k_],[0,0.5], 'red')
    ax[1].plot([d_,d_],[0,0.4], 'black', ls='dashed')
    ax[1].plot([k_,d_],[0.3,0.3], 'black')
    ax[1].text((k_+0.1), 0.38, 'k', ha='center', va='bottom', color='red')      
    ax[1].text(-2, 0.21, '(%.3f)' %(d_-k_), ha='center', va='bottom', color='black', fontsize=12 )  
    ax[1].axis([-3.0, 5.0, 0.0, 0.5]) #Mantenemos las dimensiones de la grafica como en un inicio
    ax[1].set_ylabel('Probabilidad') #Reiteramos el nombre del eje de las ordenadas

    ax[2].clear() #Limpiamos la grafica para poder dibujar sobre ella
    ax[2].plot(x,mlab.normpdf(x, mu, sigma), 'black')      
    ax[2].plot(x,mlab.normpdf(x, d_, sigma), 'black')    
    ax[2].text(-0.9, 0.34, 'Ruido', ha='center', va='bottom')  
    ax[2].text((d_+0.9), 0.34, 'Senal', ha='center', va='bottom')
    ax[2].fill_between(yes, 0, scipy.stats.norm(d_,1).pdf(yes), facecolor='#289F16', alpha=0.5)         #Coloreamos los Rechazos Correctos
    ax[2].fill_between(yes, 0, scipy.stats.norm(0,1).pdf(yes), facecolor='#9F169A', alpha=0.5)
    ax[2].plot([k_,k_],[0,0.5], 'red', ls='dashed')
    ax[2].plot([0,0],[0,0.4], 'purple', ls='dashed')
    ax[2].plot([d_,d_],[0,0.4], 'purple', ls='dashed')
    ax[2].plot([0,d_],[0.3,0.3], 'purple')
    ax[2].text(d_/2, 0.32, 'd', ha='center', va='bottom', color='purple', fontweight='bold')      
    ax[2].text(-2, 0.21, '(%.3f)' %d_, ha='center', va='bottom', color='purple', fontsize=12 )  
    ax[2].axis([-3.0, 5.0, 0.0, 0.5]) #Mantenemos las dimensiones de la grafica como en un inicio
    ax[2].set_xlabel('Evidencia') #Reiteramos el nombre del eje de las abscisas
    ax[2].set_ylabel('Probabilidad') #Reiteramos el nombre del eje de las ordenadas

s_hits.on_changed(update) #Llamamos la funcion de actualizacion por cada movimiento en el Slider de la Prior
s_fa.on_changed(update) #Llamamos la funcion de actualizacion por cada movimiento en el Slider de la Verosimilitud
plt.show() #Imprimimos la grafica
