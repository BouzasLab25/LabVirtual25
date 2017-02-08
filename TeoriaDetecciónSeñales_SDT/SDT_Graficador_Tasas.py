# -*- coding: utf-8 -*-
"""
Created on Wed Oct 12 16:47:32 2016
@author: Adriana Felisa
"""

#########################################
#Cargamos las librerias necesarias
#########################################
from matplotlib.widgets import Slider   #Libreria para hacer Sliders
import matplotlib.pyplot as plt         #Libreria para hacer graficas
import numpy as np                      #Librería para hacer operaciones matematicas
import matplotlib.mlab as mlab	      #Libreria para personalizar graficas
import math			                  #Librería matematica
import scipy			            #Librería para hacer distribuciones de probabilidad
import scipy.stats			      #Librerias para hacer operaciones estadisticas

##############################################################
# Especificamos los datos obtenidos en una tarea de detección
##############################################################
hits = 90             #Empezamos especificando un numero de Hits
Falarms = 15          #Especificamos el numero de Falsas Alarmas
hitRate = hits/100.0         # Computamos la Tasa de Hits, dividiendo el número de Hits entre el Numero total de ensayos con Senal
faRate = Falarms/100.0       # Computamos la Tasa de F.Alarmas, (numero de Falsas Alarmas entre el numero de ensayos con Ruido)
 
###########################################################
#Calculamos los parámetros
###########################################################
d = (scipy.stats.norm(0,1).ppf(hitRate))-(scipy.stats.norm(0,1).ppf(faRate))      #Definimos d’ (calculándola)
#Calculamos d' (Revisar el capítulo teorico para más detalles en la ecuación; la función 'scipy.stats.norm' contiene dos argumentos: la media y la varianza de una distribución normal.)
k = (d/2)       #Definimos la localización del criterio (ARBITRARIAMENTE)
#Arbitrariamente, colocamos el criterio a la mitad de las distribuciones
#Dado que d' es la distancia entre las distribuciones, 

###########################################################
# Graficamos el Output
###########################################################
fig, ax = plt.subplots()                       #Ampliamos nuestro espacio para generar dos areas independientes para la grafica principal y los sliders
plt.subplots_adjust(left=0.1, bottom=0.25)     #Especificamos la relación en el espacio entre dichas areas

mu = 0               #La media de la distribucion de ruido, de acuerdo a la teoria
variance = 1         #De acuerdo a los supuestos, las distribuciones son equivariantes. Definimos una varianza de 1.
sigma = math.sqrt(variance)        #Calculamos la desviación estándar a partir de la varianza
x = np.arange(-6.0, 6.0, 0.01)     #Especificamos la longitud del soporte de las distribuciones (El Eje X)
yes = np.arange(k, 6.0, 0.01)      #Delimitamos el espacio de ‘respuestas afirmativas’, a la derecha del criterio.
no = np.arange(-6.0, k, 0.01)      #Delimitamos el espacio de ‘respuestas negativas’, a la izquierda del criterio.
 
d1 = ax.plot(x,mlab.normpdf(x, mu, sigma), 'black')      #Dibujamos la primer distribucion (Ruido)
d2 = ax.plot(x,mlab.normpdf(x, d, sigma), 'black')       #Dibujamos la segunda distribucion, con media en d’ (Senal)

ax.plot([k,k],[0,0.55], 'red')   #Dibujamos el criterio como una linea vertical que cruza las distribuciones
ax.fill_between(yes, 0, (scipy.stats.norm(d,1).pdf(yes)), facecolor='#19D386', alpha=0.5)     #Coloreamos los Hits
ax.fill_between(yes, 0, (scipy.stats.norm(0,1).pdf(yes)), facecolor='#F7C11D', alpha=0.5)     #Coloreamos las Falsas Alarmas
ax.fill_between(no, 0, scipy.stats.norm(0,1).pdf(no), facecolor='#C81BE2', alpha=0.5)         #Coloreamos los Rechazos Correctos
ax.fill_between(no, 0, scipy.stats.norm(d,1).pdf(no), facecolor='#003797', alpha=0.5)         #Coloreamos las Omisiones
     
ax.plot([-2.5,4.5],[0.6,0.6], 'k', linewidth=1)      #Insertamos una línea horizontal en la parte superior de la grafica
ax.text(-1.6, 0.61, 'Rechazos', color='#C81BE2', ha='center', va='bottom', fontsize=10, fontweight='bold')   #Escribimos los nombres de los cuatro posibles Outcomes a obtener, dependiendo la correspondencia entre la respuesta dada y la distribucion de origen del estimulo.
ax.text(0.2, 0.61, 'Omisiones', color='#003797', ha='center', va='bottom', fontsize=10, fontweight='bold')   
ax.text(2.3, 0.61, 'FalsasAlarmas', color='#D3A519', ha='center', va='bottom', fontsize=10, fontweight='bold')   
ax.text(4.05, 0.61, 'Hits', ha='center', color='#188A5B', va='bottom', fontsize=10)   
ax.text(-1.6, 0.56, '(%.2f)' %scipy.stats.norm(0,1).cdf(k), color='#C81BE2', ha='center', va='bottom', fontsize=10)     #Calculamos y escribimos cuál es el área bajo la curva que corresponde a los Rechazos
ax.text(0.2, 0.56, '(%.2f)' %scipy.stats.norm(d,1).cdf(k), color='#003797', ha='center', va='bottom', fontsize=10)      #Especificamos el área bajo la curva que corresponde a las Omisiones
ax.text(2.3, 0.56, '(%.2f)' %(1-scipy.stats.norm(0,1).cdf(k)), color='#D3A519', ha='center', va='bottom', fontsize=10)  #Especificamos el área bajo la curva que corresponde a las Falsas Alarmas
ax.text(4.05, 0.56, '(%.2f)' %(1-scipy.stats.norm(d,1).cdf(k)), ha='center', color='#188A5B', va='bottom', fontsize=10) #Especificamos el área bajo la curva que corresponde a los Hits
ax.text(0, 0.42, 'Ruido', ha='center', va='bottom')    #Identificamos la Distribucion de Ruido con una etiqueta
ax.text(d, 0.42, 'Senal', ha='center', va='bottom')    #Etiqueta para la Distribucion de Senal

ax.set_title('Teoria de Deteccion de Senales', fontsize=18, fontweight='bold')  #Añadimos un titulo a la grafica
ax.set_xlabel('Evidencia')                                                      #Damos un nombre al eje de las abscisas
ax.set_ylabel('Probabilidad')                                                   #Damos un nombre al eje de las ordenadas
ax.axis([-3.0, 5.0, 0.0, 0.7])                                                  #Especificamos las dimensiones de la grafica principal: (rango en x, rango en y)
 
ax_k = plt.axes([0.10, 0.12, 0.80, 0.03], axisbg='white')                    #Dibujamos un rectangulo especificando sus coordenadas
s_k = Slider(ax_k, 'Criterio', -3.0, 5.0, facecolor='white', valinit=k)      #Asignamos la funcionalidad de slider al rectángulo; especificamos los valores entre los que puede variar y asignamos como valor inicial el calculado al principio del codigo

def update(adri):          # Creamos una funcion para actualizar nuestra grafica 
    hitR = 90.0/100.0      #Computamos directamente la tasa de hits y falsas alarmas, para mantener las distribuciones estaticas
    faR = 15.0/100.0
    k_ = s_k.val           #El criterio se va a obtener directamente del slider
    yes = np.arange(k_, 6.0, 0.01)       #A partir de la ubicacion del slider, definimos cual es el espacio de ‘respuestas afirmatorias’
    no = np.arange(-6.0, k_, 0.01)       #y definimos el espacio de ‘respuestas negativas’ antes del slider
    d_ = (scipy.stats.norm(0,1).ppf(hitR))-(scipy.stats.norm(0,1).ppf(faR))    #Calculamos d’ a partir de las tasas de hits y fa estaticas
    ax.clear()                           #Limpiamos la grafica para poder dibujar sobre ella
    ax.plot(x,mlab.normpdf(x, mu, sigma), 'black')         #Volvemos a dibujar la distribucion de Ruido
    ax.plot(x,mlab.normpdf(x, d_, sigma), 'black')         #Dibujamos la distribucion de senal
    ax.plot([-2.5,4.5],[0.6,0.6], 'k', linewidth=1)        #Dibujamos la línea arriba de la grafica
    ax.text(-1.6, 0.61, 'Rechazos', color='#C81BE2', ha='center', va='bottom', fontsize=10, fontweight='bold')   #Escribimos por titulo los cuatro posibles Outcomes
    ax.text(0.2, 0.61, 'Omisiones', color='#003797', ha='center', va='bottom', fontsize=10, fontweight='bold')   
    ax.text(2.3, 0.61, 'FalsasAlarmas', color='#D3A519', ha='center', va='bottom', fontsize=10, fontweight='bold')   
    ax.text(4.05, 0.61, 'Hits', ha='center', color='#188A5B', va='bottom', fontsize=10)   
    ax.text(-1.6, 0.56, '(%.2f)' %scipy.stats.norm(0,1).cdf(k_), color='#C81BE2', ha='center', va='bottom', fontsize=10)     #Especificamos las áreas bajo la curva correspondientes a cada una: Rechazos correctos
    ax.text(0.2, 0.56, '(%.2f)' %scipy.stats.norm(d,1).cdf(k_), color='#003797', ha='center', va='bottom', fontsize=10)      #Omisiones
    ax.text(2.3, 0.56, '(%.2f)' %(1-scipy.stats.norm(0,1).cdf(k_)), color='#D3A519', ha='center', va='bottom', fontsize=10)  #Falsas alarmas
    ax.text(4.05, 0.56, '(%.2f)' %(1-scipy.stats.norm(d,1).cdf(k_)), ha='center', color='#188A5B', va='bottom', fontsize=10) #Hits
    ax.plot([k_,k_],[0,0.55], 'red') #Dibujamos el criterio
    ax.fill_between(yes, 0, (scipy.stats.norm(d,1).pdf(yes)), facecolor='#19D386', alpha=0.5)   #Coloreamos los Hits
    ax.fill_between(yes, 0, (scipy.stats.norm(0,1).pdf(yes)), facecolor='#F7C11D', alpha=0.5)   #Coloreamos las falsas alarmas
    ax.fill_between(no, 0, scipy.stats.norm(0,1).pdf(no), facecolor='#C81BE2', alpha=0.5)       #Coloreamos los Rechazos correctos
    ax.fill_between(no, 0, scipy.stats.norm(d,1).pdf(no), facecolor='#003797', alpha=0.5)        #Coloreamos las Omisiones
    ax.text(0, 0.42, 'Ruido', ha='center', va='bottom')       #Colocamos una etiqueta a la distribucion de Ruido   
    ax.text(d_, 0.42, 'Senal', ha='center', va='bottom')      #Colocamos una etiqueta a la distribucion de Senal
    ax.axis([-3.0, 5.0, 0.0, 0.7])                            #Mantenemos las dimensiones de la grafica 
    ax.set_title('Teoria de Deteccion de Senales', fontsize=18, fontweight='bold') #Reiteramos el titulo
    ax.set_xlabel('Evidencia')                                                      #Reiteramos el nombre del eje de las abscisas
    ax.set_ylabel('Probabilidad')                                                    #Reiteramos el nombre del eje de las ordenadas
s_k.on_changed(update)                    #Llamamos la funcion de actualizacion por cada movimiento en el Slider 
plt.show() #Imprimimos la grafica

