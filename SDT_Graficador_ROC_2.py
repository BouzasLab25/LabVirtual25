# -*- coding: utf-8 -*-
"""
Created on Wed Oct 12 16:47:32 2016
@author: Adriana F. Chávez
"""
#Cargamos las librerias necesarias
from matplotlib.widgets import Slider    #Libreria para hacer Sliders
import matplotlib.pyplot as plt          #Libreria para hacer graficas
import numpy as np                       #Librería para hacer operaciones matematicas
import matplotlib.mlab as mlab	         #Libreria para personalizar graficas
import math			                     # Librería matematica
import scipy			                # Librería para hacer distribuciones de probabilidad
import scipy.stats			             # Librerias para hacer operaciones estadisticas

hits = 88             #Empezamos especificando un numero de Hits
Falarms = 20           #Especificamos el numero de Falsas Alarmas
hitRate = hits/100.0         #Computamos la Tasa de Hits, dividiendo el número de Hits entre el Numero total de ensayos con Senal
faRate = Falarms/100.0        # Tasa de F.Alarmas, (numero de Falsas Alarmas entre el numero de ensayos con ruido)
 
d = (scipy.stats.norm(0,1).ppf(hitRate))-(scipy.stats.norm(0,1).ppf(faRate))      #Calculamos d’
global d_ant
d_ant = d
k = (d/2)                               						                  #Calculamos la localización del criterio

fig, ax = plt.subplots(1,2)                       #Ampliamos nuestro espacio para generar dos areas independientes para la grafica principal y los sliders
plt.subplots_adjust(left=0.1, bottom=0.25)     #Especificamos la relación en el espacio entre dichas areas

mu = 0               #La media de la distribucion de ruido, de acuerdo a la teoria
variance = 1         #Un valor único para la varianza de ambas distribuciones, de acuerdo a la teoria
sigma = math.sqrt(variance)        #Calculamos la desviación estándar a partir de la varianza
x = np.arange(-6.0, 6.0, 0.01)     #Especificamos la longitud del soporte de las distribuciones
yes = np.arange(k, 6.0, 0.01)      #Delimitamos el espacio de ‘respuestas afirmativas’, a la derecha del criterio.
no = np.arange(-6.0, k, 0.01)      #Delimitamos el espacio de ‘respuestas negativas’, a la izquierda del criterio.
 
d1 = ax[0].plot(x,mlab.normpdf(x, mu, sigma), 'black')      #Dibujamos la primer distribucion (Ruido)
d2 = ax[0].plot(x,mlab.normpdf(x, d, sigma), 'black')       #Dibujamos la segunda distribucion, con media en d’ (Senal)

ax[0].plot([k,k],[0,0.55], 'red')   #Dibujamos el criterio como una linea vertical que cruza las distribuciones
ax[0].fill_between(yes, 0, (scipy.stats.norm(d,1).pdf(yes)), facecolor='#19D386', alpha=0.5)     #Coloreamos los Hits
ax[0].fill_between(yes, 0, (scipy.stats.norm(0,1).pdf(yes)), facecolor='#F7C11D', alpha=0.5)     #Coloreamos las Falsas Alarmas
ax[0].fill_between(no, 0, scipy.stats.norm(0,1).pdf(no), facecolor='#C81BE2', alpha=0.5)         #Coloreamos los Rechazos Correctos
ax[0].fill_between(no, 0, scipy.stats.norm(d,1).pdf(no), facecolor='#003797', alpha=0.5)         #Coloreamos las Omisiones
ax[0].plot([-2.5,4.5],[0.6,0.6], 'k', linewidth=1)      #Insertamos una línea horizontal en la parte superior de la grafica
ax[0].text(-1.6, 0.61, 'Rechazos', color='#C81BE2', ha='center', va='bottom', fontsize=10, fontweight='bold')   #Escribimos los nombres de los cuatro posibles Outcomes a obtener, dependiendo la correspondencia entre la respuesta dada y la distribucion de origen del estimulo.
ax[0].text(0.2, 0.61, 'Omisiones', color='#003797', ha='center', va='bottom', fontsize=10, fontweight='bold')   
ax[0].text(2.3, 0.61, 'FalsasAlarmas', color='#D3A519', ha='center', va='bottom', fontsize=10, fontweight='bold')   
ax[0].text(4.05, 0.61, 'Hits', ha='center', color='#188A5B', va='bottom', fontsize=10)   
ax[0].text(-1.6, 0.56, '(%.2f)' %scipy.stats.norm(0,1).cdf(k), color='#C81BE2', ha='center', va='bottom', fontsize=10)     #Calculamos y escribimos cuál es el área bajo la curva que corresponde a los Rechazos
ax[0].text(0.2, 0.56, '(%.2f)' %scipy.stats.norm(d,1).cdf(k), color='#003797', ha='center', va='bottom', fontsize=10)      #Especificamos el área bajo la curva que corresponde a las Omisiones
ax[0].text(2.3, 0.56, '(%.2f)' %(1-scipy.stats.norm(0,1).cdf(k)), color='#D3A519', ha='center', va='bottom', fontsize=10)  #Especificamos el área bajo la curva que corresponde a las Falsas Alarmas
ax[0].text(4.05, 0.56, '(%.2f)' %(1-scipy.stats.norm(d,1).cdf(k)), ha='center', color='#188A5B', va='bottom', fontsize=10) #Especificamos el área bajo la curva que corresponde a los Hits
ax[0].text(-0.9, 0.34, 'Ruido', ha='center', va='bottom')    #Identificamos la Distribucion de Ruido con una etiqueta
ax[0].text((d+0.9), 0.34, 'Senal', ha='center', va='bottom')    #Etiqueta para la Distribucion de Senal
ax[0].set_title('Teoria de Deteccion de Senales', fontsize=18, fontweight='bold')  #Añadimos un titulo a la grafica
ax[0].set_xlabel('Evidencia')                                                      #Damos un nombre al eje de las abscisas
ax[0].set_ylabel('Probabilidad')                                                   #Damos un nombre al eje de las ordenadas
ax[0].axis([-3.0, 5.0, 0.0, 0.7])                                                  #Especificamos las dimensiones de la grafica principal: (rango en x, rango en y)
 

ax[1].set_title('ROC', fontsize=18, fontweight='bold')  #Añadimos un titulo a la grafica
ax[1].set_xlabel('Falsas Alarmas')                                                      #Damos un nombre al eje de las abscisas
ax[1].set_ylabel('Hits')                                                   #Damos un nombre al eje de las ordenadas
ax[1].axis([-0.02, 1.02, -0.02, 1.02])       

ax_k = plt.axes([0.10, 0.12, 0.80, 0.03], axisbg='white')                    #Dibujamos un rectangulo especificando sus coordenadas
s_k = Slider(ax_k, 'Criterio', -3.0, 7.0, facecolor='white', valinit=k)      #Asignamos la funcionalidad de slider al rectángulo; especificamos los valores entre los que puede variar y asignamos como valor inicial el calculado al principio del codigo

ax_d = plt.axes([0.10, 0.07, 0.80, 0.03], axisbg='white')                    #Dibujamos un rectangulo especificando sus coordenadas
s_d = Slider(ax_d, 'D prima', 0.01, 4.0, facecolor='white', valinit=d) 

def update(adri):          # Creamos una funcion para actualizar nuestra grafica 
    global d_ant
    hitR = 90.0/100.0      #Computamos directamente la tasa de hits y falsas alarmas, para mantener las distribuciones estaticas
    faR = 15.0/100.0
    d_ = s_d.val
    k_ = s_k.val           #El criterio se va a obtener directamente del slider
    yes = np.arange(k_, 6.0, 0.01)       #A partir de la ubicacion del slider, definimos cual es el espacio de ‘respuestas afirmatorias’
    no = np.arange(-6.0, k_, 0.01)       #y definimos el espacio de ‘respuestas negativas’ antes del slider
    pHit = 1-scipy.stats.norm(d_,1).cdf(k_)
    pFA = 1-scipy.stats.norm(0,1).cdf(k_)
    pMiss = scipy.stats.norm(d_,1).cdf(k_)
    pReject = scipy.stats.norm(0,1).cdf(k_)
    ax[0].clear()                           #Limpiamos la grafica para poder dibujar sobre ella
    ax[0].plot(x,mlab.normpdf(x, mu, sigma), 'black')         #Volvemos a dibujar la distribucion de Ruido
    ax[0].plot(x,mlab.normpdf(x, d_, sigma), 'black')         #Dibujamos la distribucion de senal
    ax[0].plot([-2.5,4.5],[0.6,0.6], 'k', linewidth=1)        #Dibujamos la línea arriba de la grafica
    ax[0].text(-1.6, 0.61, 'Rechazos', color='#C81BE2', ha='center', va='bottom', fontsize=10, fontweight='bold')   #Escribimos por titulo los cuatro posibles Outcomes
    ax[0].text(0.2, 0.61, 'Omisiones', color='#003797', ha='center', va='bottom', fontsize=10, fontweight='bold')   
    ax[0].text(2.3, 0.61, 'FalsasAlarmas', color='#D3A519', ha='center', va='bottom', fontsize=10, fontweight='bold')   
    ax[0].text(4.05, 0.61, 'Hits', ha='center', color='#188A5B', va='bottom', fontsize=10)   
    ax[0].text(-1.6, 0.56, '(%.2f)' %pReject, color='#C81BE2', ha='center', va='bottom', fontsize=10)     #Especificamos las áreas bajo la curva correspondientes a cada una: Rechazos correctos
    ax[0].text(0.2, 0.56, '(%.2f)' %pMiss, color='#003797', ha='center', va='bottom', fontsize=10)      #Omisiones
    ax[0].text(2.3, 0.56, '(%.2f)' %pFA, color='#D3A519', ha='center', va='bottom', fontsize=10)  #Falsas alarmas
    ax[0].text(4.05, 0.56, '(%.2f)' %pHit, ha='center', color='#188A5B', va='bottom', fontsize=10) #Hits
    ax[0].plot([k_,k_],[0,0.55], 'red') #Dibujamos el criterio
    ax[0].fill_between(yes, 0, (scipy.stats.norm(d_,1).pdf(yes)), facecolor='#19D386', alpha=0.5)   #Coloreamos los Hits
    ax[0].fill_between(yes, 0, (scipy.stats.norm(0,1).pdf(yes)), facecolor='#F7C11D', alpha=0.5)   #Coloreamos las falsas alarmas
    ax[0].fill_between(no, 0, scipy.stats.norm(0,1).pdf(no), facecolor='#C81BE2', alpha=0.5)       #Coloreamos los Rechazos correctos
    ax[0].fill_between(no, 0, scipy.stats.norm(d_,1).pdf(no), facecolor='#003797', alpha=0.5)        #Coloreamos las Omisiones
    ax[0].text(-0.9, 0.34, 'Ruido', ha='center', va='bottom')       #Colocamos una etiqueta a la distribucion de Ruido   
    ax[0].text((d_+0.9), 0.34, 'Senal', ha='center', va='bottom')      #Colocamos una etiqueta a la distribucion de Senal
    ax[0].axis([-3.0, 5.0, 0.0, 0.7])                            #Mantenemos las dimensiones de la grafica 
    ax[0].set_title('Teoria de Deteccion de Senales', fontsize=18, fontweight='bold') #Reiteramos el titulo
    ax[0].set_xlabel('Evidencia')                                                      #Reiteramos el nombre del eje de las abscisas
    ax[0].set_ylabel('Probabilidad')                                                    #Reiteramos el nombre del eje de las ordenadas   
    

    ax[1].set_title('ROC', fontsize=18, fontweight='bold')  #Añadimos un titulo a la grafica
    ax[1].set_xlabel('Falsas Alarmas')                                                      #Damos un nombre al eje de las abscisas
    ax[1].set_ylabel('Hits')                                                   #Damos un nombre al eje de las ordenadas
    ax[1].axis([-0.02, 1.02, -0.02, 1.02])  
    if d_ant == d_:
        ax[1].scatter(pFA,pHit)
    d_ant = d_
    
s_k.on_changed(update)                    #Llamamos la funcion de actualizacion por cada movimiento en el Slider 
s_d.on_changed(update)
plt.show() #Imprimimos la grafica

