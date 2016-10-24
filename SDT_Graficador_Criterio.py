# -*- coding: utf-8 -*-
"""
Created on Mon Oct 24 13:34:01 2016

@author: Adrifelcha
"""
#Cargamos las librerias necesarias
from matplotlib.widgets import Slider    #Libreria para hacer Sliders
import matplotlib.pyplot as plt          #Libreria para hacer graficas
import numpy as np                       #Librería para hacer operaciones matematicas
import matplotlib.mlab as mlab	         #Libreria para personalizar graficas
import math			                     # Librería matematica
import scipy			                # Librería para hacer distribuciones de probabilidad
import scipy.stats			             # Librerias para hacer operaciones estadisticas

hits = 90             #Empezamos especificando un numero de Hits
Falarms = 15           #Especificamos el numero de Falsas Alarmas
hitRate = hits/100.0         #Computamos la Tasa de Hits, dividiendo el número de Hits entre el Numero total de ensayos con Senal
faRate = Falarms/100.0        # Tasa de F.Alarmas, (numero de Falsas Alarmas entre el numero de ensayos con ruido)
 
d = (scipy.stats.norm(0,1).ppf(hitRate))-(scipy.stats.norm(0,1).ppf(faRate))      #Calculamos d’
k = scipy.stats.norm(0, 1).ppf(1-faRate)                            						                  #Calculamos la localización del criterio

fig, ax = plt.subplots()                       #Ampliamos nuestro espacio para generar dos areas independientes para la grafica principal y los sliders
plt.subplots_adjust(left=0.1, bottom=0.25)     #Especificamos la relación en el espacio entre dichas areas

mu = 0               #La media de la distribucion de ruido, de acuerdo a la teoria
variance = 1         #Un valor único para la varianza de ambas distribuciones, de acuerdo a la teoria
sigma = math.sqrt(variance)        #Calculamos la desviación estándar a partir de la varianza
x = np.arange(-6.0, 6.0, 0.01)     #Especificamos la longitud del soporte de las distribuciones
yes = np.arange(k, 6.0, 0.01)      #Delimitamos el espacio de ‘respuestas afirmativas’, a la derecha del criterio.
no = np.arange(-6.0, k, 0.01)      #Delimitamos el espacio de ‘respuestas negativas’, a la izquierda del criterio.
 
d1 = ax.plot(x,mlab.normpdf(x, mu, sigma), 'black')      #Dibujamos la primer distribucion (Ruido)
d2 = ax.plot(x,mlab.normpdf(x, d, sigma), 'black', ls='dashed')       #Dibujamos la segunda distribucion, con media en d’ (Senal)

ax.plot([k,k],[0,0.55], 'red')   #Dibujamos el criterio como una linea vertical que cruza las distribuciones
ax.fill_between(no, 0, scipy.stats.norm(0,1).pdf(no), facecolor='#D7439F', alpha=0.5)         #Coloreamos los Rechazos Correctos
ax.fill_between(yes, 0, scipy.stats.norm(0,1).pdf(yes), facecolor='#D7D043', alpha=0.5)         #Coloreamos los Rechazos Correctos
     
ax.text(2.3, 0.65, 'Tasa Rechazos', color='#C81BE2', ha='center', va='bottom', fontsize=10, fontweight='bold')   #Escribimos los nombres de los cuatro posibles Outcomes a obtener, dependiendo la correspondencia entre la respuesta dada y la distribucion de origen del estimulo.
ax.text(4.1, 0.65, 'Tasa F.A.', color='#D3A519', ha='center', va='bottom', fontsize=10, fontweight='bold')   
ax.text(2.3, 0.61, '(%.2f)' %scipy.stats.norm(0,1).cdf(k), color='#C81BE2', ha='center', va='bottom', fontsize=10)     #Calculamos y escribimos cuál es el área bajo la curva que corresponde a los Rechazos
ax.text(k-0.6, 0.50, 'Z=(%.2f)' %k, color='red', ha='center', va='bottom', fontsize=10)      #Especificamos el área bajo la curva que corresponde a las Omisiones
ax.text(4.1, 0.61, '(%.2f)' %(1-scipy.stats.norm(0,1).cdf(k)), color='#D3A519', ha='center', va='bottom', fontsize=10)  #Especificamos el área bajo la curva que corresponde a las Falsas Alarmas
ax.text(0, 0.42, 'Ruido', ha='center', va='bottom')    #Identificamos la Distribucion de Ruido con una etiqueta
ax.text(d, 0.42, 'Senal', ha='center', va='bottom')    #Etiqueta para la Distribucion de Senal

ax.set_title('Localizacion del Criterio', fontsize=18, fontweight='bold')  #Añadimos un titulo a la grafica
ax.set_xlabel('Evidencia')                                                      #Damos un nombre al eje de las abscisas
ax.set_ylabel('Probabilidad')                                                   #Damos un nombre al eje de las ordenadas
ax.axis([-3.0, 5.0, 0.0, 0.7])                                                  #Especificamos las dimensiones de la grafica principal: (rango en x, rango en y)
 
ax_Far = plt.axes([0.15, 0.12, 0.70, 0.03], axisbg='white')                    #Dibujamos un rectangulo especificando sus coordenadas
s_Far = Slider(ax_Far, 'Tasa F.A.', 0.01, 1.0, facecolor='#D3A519', valinit=faRate)      #Asignamos la funcionalidad de slider al rectángulo; especificamos los valores entre los que puede variar y asignamos como valor inicial el calculado al principio del codigo

def update(adri):          # Creamos una funcion para actualizar nuestra grafica 
    faR = s_Far.val
    k_ = scipy.stats.norm(0, 1).ppf(1-faR)           #El criterio se va a obtener directamente del slider
    no = np.arange(-6.0, k_, 0.01)       #y definimos el espacio de ‘respuestas negativas’ antes del slider
    yes = np.arange(k_, 6.0, 0.01) 
    d_ = d  #Calculamos d’ a partir de las tasas de hits y fa estaticas
    ax.clear()                           #Limpiamos la grafica para poder dibujar sobre ella
    ax.plot(x,mlab.normpdf(x, mu, sigma), 'black')         #Volvemos a dibujar la distribucion de Ruido
    ax.plot(x,mlab.normpdf(x, d_, sigma), 'black', ls='dashed')         #Dibujamos la distribucion de senal
    ax.text(2.3, 0.65, 'Tasa Rechazos', color='#C81BE2', ha='center', va='bottom', fontsize=10, fontweight='bold')   #Escribimos los nombres de los cuatro posibles Outcomes a obtener, dependiendo la correspondencia entre la respuesta dada y la distribucion de origen del estimulo.
    ax.text(4.1, 0.65, 'Tasa F.A.', color='#D3A519', ha='center', va='bottom', fontsize=10, fontweight='bold')   
    ax.text(2.3, 0.61, '(%.2f)' %scipy.stats.norm(0,1).cdf(k_), color='#C81BE2', ha='center', va='bottom', fontsize=10)     #Calculamos y escribimos cuál es el área bajo la curva que corresponde a los Rechazos
    ax.text(k_-0.6, 0.50, 'Z=(%.2f)' %k_, color='red', ha='center', va='bottom', fontsize=10)      #Especificamos el área bajo la curva que corresponde a las Omisiones
    ax.text(4.1, 0.61, '(%.2f)' %(1-scipy.stats.norm(0,1).cdf(k_)), color='#D3A519', ha='center', va='bottom', fontsize=10)  #Especificamos el área bajo la curva que corresponde a las Falsas Alarmas
    ax.text(0, 0.42, 'Ruido', ha='center', va='bottom')    #Identificamos la Distribucion de Ruido con una etiqueta
    ax.text(d, 0.42, 'Senal', ha='center', va='bottom')    #Etiqueta para la Distribucion de Senal
    ax.plot([k_,k_],[0,0.55], 'red') #Dibujamos el criterio
    ax.fill_between(no, 0, scipy.stats.norm(0,1).pdf(no), facecolor='#D7439F', alpha=0.5)         #Coloreamos los Rechazos Correctos
    ax.fill_between(yes, 0, scipy.stats.norm(0,1).pdf(yes), facecolor='#D7D043', alpha=0.5)
    ax.text(0, 0.42, 'Ruido', ha='center', va='bottom')       #Colocamos una etiqueta a la distribucion de Ruido   
    ax.text(d_, 0.42, 'Senal', ha='center', va='bottom')      #Colocamos una etiqueta a la distribucion de Senal
    ax.axis([-3.0, 5.0, 0.0, 0.7])                            #Mantenemos las dimensiones de la grafica 
    ax.set_title('Localizacion del Criterio', fontsize=18, fontweight='bold') #Reiteramos el titulo
    ax.set_xlabel('Evidencia')                                                      #Reiteramos el nombre del eje de las abscisas
    ax.set_ylabel('Probabilidad')                                                    #Reiteramos el nombre del eje de las ordenadas
s_Far.on_changed(update)                    #Llamamos la funcion de actualizacion por cada movimiento en el Slider 
plt.show() #Imprimimos la grafica

