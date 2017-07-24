# -*- coding: utf-8 -*-
"""
Created on Mon Jul 24 16:47:32 2017
@author: Adriana Felisa
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
k = (d/2)                               						                  #Calculamos la localización del criterio
beta = (scipy.stats.norm(d,1).pdf(k))/(scipy.stats.norm(0,1).pdf(k))
c = k-(d/2)

fig, ax = plt.subplots(1,2)                    #Ampliamos nuestro espacio para generar dos areas independientes para la grafica principal y los sliders
plt.subplots_adjust(left=0.1, bottom=0.25)     #Especificamos la relación en el espacio entre dichas areas

mu = 0               #La media de la distribucion de ruido, de acuerdo a la teoria
variance = 1         #Un valor único para la varianza de ambas distribuciones, de acuerdo a la teoria
sigma = math.sqrt(variance)        #Calculamos la desviación estándar a partir de la varianza
x = np.arange(-6.0, 6.0, 0.01)     #Especificamos la longitud del soporte de las distribuciones
yes = np.arange(k, 6.0, 0.01)      #Delimitamos el espacio de ‘respuestas afirmativas’, a la derecha del criterio.
no = np.arange(-6.0, k, 0.01)      #Delimitamos el espacio de ‘respuestas negativas’, a la izquierda del criterio.
 
d1 = ax[0].plot(x,mlab.normpdf(x, mu, sigma), 'purple')      #Dibujamos la primer distribucion (Ruido)
d2 = ax[0].plot(x,mlab.normpdf(x, d, sigma), 'green')       #Dibujamos la segunda distribucion, con media en d’ (Senal)
d1 = ax[1].plot(x,mlab.normpdf(x, mu, sigma), 'black')      #Dibujamos la primer distribucion (Ruido)
d2 = ax[1].plot(x,mlab.normpdf(x, d, sigma), 'black')       #Dibujamos la segunda distribucion, con media en d’ (Senal)


ax[0].plot([k,k],[0,0.465], 'black', linestyle=':')   #Dibujamos el criterio como una linea vertical que cruza las distribuciones
ax[0].fill_between(yes, 0, (scipy.stats.norm(d,1).pdf(yes)), facecolor='#19D386', alpha=0.5)     #Coloreamos los Hits
ax[0].fill_between(yes, 0, (scipy.stats.norm(0,1).pdf(yes)), facecolor='#F7C11D', alpha=0.5)     #Coloreamos las Falsas Alarmas
ax[0].fill_between(no, 0, scipy.stats.norm(0,1).pdf(no), facecolor='#C81BE2', alpha=0.5)         #Coloreamos los Rechazos Correctos
ax[0].fill_between(no, 0, scipy.stats.norm(d,1).pdf(no), facecolor='#003797', alpha=0.5)         #Coloreamos las Omisiones
ax[0].text((d/2), 0.65, 'Ejecucion de acuerdo al criterio', ha='center', va='bottom', fontsize=10, fontweight='bold')   #Escribimos los nombres de los cuatro posibles Outcomes a obtener, dependiendo la correspondencia entre la respuesta dada y la distribucion de origen del estimulo.
ax[0].plot([-2.5,4.5],[0.595,0.595], 'k', linewidth=1)      #Insertamos una línea horizontal en la parte superior de la grafica
ax[0].text(-1.6, 0.6, 'Rechazos', color='#C81BE2', ha='center', va='bottom', fontsize=10, fontweight='bold')   #Escribimos los nombres de los cuatro posibles Outcomes a obtener, dependiendo la correspondencia entre la respuesta dada y la distribucion de origen del estimulo.
ax[0].text(0.2, 0.60, 'Omisiones', color='#003797', ha='center', va='bottom', fontsize=10, fontweight='bold')   
ax[0].text(2.3, 0.60, 'FalsasAlarmas', color='#D3A519', ha='center', va='bottom', fontsize=10, fontweight='bold')   
ax[0].text(4.05, 0.6, 'Hits', ha='center', color='#188A5B', va='bottom', fontsize=10)   
ax[0].text(-1.6, 0.57, '(%.2f)' %scipy.stats.norm(0,1).cdf(k), color='#C81BE2', ha='center', va='bottom', fontsize=10)     #Calculamos y escribimos cuál es el área bajo la curva que corresponde a los Rechazos
ax[0].text(0.2, 0.57, '(%.2f)' %scipy.stats.norm(d,1).cdf(k), color='#003797', ha='center', va='bottom', fontsize=10)      #Especificamos el área bajo la curva que corresponde a las Omisiones
ax[0].text(2.3, 0.57, '(%.2f)' %(1-scipy.stats.norm(0,1).cdf(k)), color='#D3A519', ha='center', va='bottom', fontsize=10)  #Especificamos el área bajo la curva que corresponde a las Falsas Alarmas
ax[0].text(4.05, 0.57, '(%.2f)' %(1-scipy.stats.norm(d,1).cdf(k)), ha='center', color='#188A5B', va='bottom', fontsize=10) #Especificamos el área bajo la curva que corresponde a los Hits
ax[0].text(-2, 0.43, 'Ruido', ha='center', va='bottom', color = 'purple')       #Colocamos una etiqueta a la distribucion de Ruido   
ax[0].text(4, 0.43, 'Senal', ha='center', va='bottom', color = 'green')      #Colocamos una etiqueta a la distribucion de Senal
ax[0].text(k+0.8, (scipy.stats.norm(0,1).pdf(k))-.03, '%.2f' %(scipy.stats.norm(0,1).pdf(k)), ha='center', va='bottom', color ='purple')       #Colocamos una etiqueta a la distribucion de Ruido   
ax[0].text(k-0.8, (scipy.stats.norm(d,1).pdf(k))+.015, '%.2f' %(scipy.stats.norm(d,1).pdf(k)), ha='center', va='bottom', color = 'green')      #Colocamos una etiqueta a la distribucion de Senal
ax[0].plot([-2,4],[0.465,0.465], 'k', linewidth=1)        #Dibujamos la línea arriba de la grafica
ax[0].text((d/2), 0.47, 'Beta = %.4f' %beta, ha='center', va='bottom', color = 'red')      #Colocamos una etiqueta a la distribucion de Senal
ax[0].set_title('Beta', fontsize=18, fontweight='bold')  #Añadimos un titulo a la grafica
ax[0].set_xlabel('Evidencia')                                                      #Damos un nombre al eje de las abscisas
ax[0].set_ylabel('Probabilidad')                                                   #Damos un nombre al eje de las ordenadas
ax[0].axis([-3.0, 5.0, 0.0, 0.7])                                                  #Especificamos las dimensiones de la grafica principal: (rango en x, rango en y)
ax[0].scatter(k, (scipy.stats.norm(d,1).pdf(k)))
ax[0].scatter(k, (scipy.stats.norm(0,1).pdf(k)))
 
ax[1].plot([k,k],[0,0.48], 'black')   #Dibujamos el criterio como una linea vertical que cruza las distribuciones
ax[1].fill_between(yes, 0, (scipy.stats.norm(d,1).pdf(yes)), facecolor='#19D386', alpha=0.5)     #Coloreamos los Hits
ax[1].fill_between(yes, 0, (scipy.stats.norm(0,1).pdf(yes)), facecolor='#F7C11D', alpha=0.5)     #Coloreamos las Falsas Alarmas
ax[1].fill_between(no, 0, scipy.stats.norm(0,1).pdf(no), facecolor='#C81BE2', alpha=0.5)         #Coloreamos los Rechazos Correctos
ax[1].fill_between(no, 0, scipy.stats.norm(d,1).pdf(no), facecolor='#003797', alpha=0.5)         #Coloreamos las Omisiones
ax[1].text((d/2), 0.65, 'Ejecucion en sistema sin sesgo', ha='center', va='bottom', fontsize=10, fontweight='bold')   #Escribimos los nombres de los cuatro posibles Outcomes a obtener, dependiendo la correspondencia entre la respuesta dada y la distribucion de origen del estimulo.
ax[1].plot([-2.5,4.5],[0.595,0.595], 'k', linewidth=1)      #Insertamos una línea horizontal en la parte superior de la grafica
ax[1].text(-1.6, 0.6, 'Rechazos', color='#C81BE2', ha='center', va='bottom', fontsize=10, fontweight='bold')   #Escribimos los nombres de los cuatro posibles Outcomes a obtener, dependiendo la correspondencia entre la respuesta dada y la distribucion de origen del estimulo.
ax[1].text(0.2, 0.60, 'Omisiones', color='#003797', ha='center', va='bottom', fontsize=10, fontweight='bold')   
ax[1].text(2.3, 0.60, 'FalsasAlarmas', color='#D3A519', ha='center', va='bottom', fontsize=10, fontweight='bold')   
ax[1].text(4.05, 0.6, 'Hits', ha='center', color='#188A5B', va='bottom', fontsize=10)   
ax[1].text(-1.6, 0.57, '(%.2f)' %scipy.stats.norm(0,1).cdf(k), color='#C81BE2', ha='center', va='bottom', fontsize=10)     #Calculamos y escribimos cuál es el área bajo la curva que corresponde a los Rechazos
ax[1].text(0.2, 0.57, '(%.2f)' %scipy.stats.norm(d,1).cdf(k), color='#003797', ha='center', va='bottom', fontsize=10)      #Especificamos el área bajo la curva que corresponde a las Omisiones
ax[1].text(2.3, 0.57, '(%.2f)' %(1-scipy.stats.norm(0,1).cdf(k)), color='#D3A519', ha='center', va='bottom', fontsize=10)  #Especificamos el área bajo la curva que corresponde a las Falsas Alarmas
ax[1].text(4.05, 0.57, '(%.2f)' %(1-scipy.stats.norm(d,1).cdf(k)), ha='center', color='#188A5B', va='bottom', fontsize=10) #Especificamos el área bajo la curva que corresponde a los Hits
ax[1].text(0, 0.42, 'Ruido', ha='center', va='bottom')    #Identificamos la Distribucion de Ruido con una etiqueta
ax[1].text(d, 0.42, 'Senal', ha='center', va='bottom')    #Etiqueta para la Distribucion de Senal
ax[1].set_title('C', fontsize=18, fontweight='bold')  #Añadimos un titulo a la grafica
ax[1].text((d/2), 0.5, 'C = %.4f' %c, ha='center', va='bottom', color = 'red')      #Colocamos una etiqueta a la distribucion de Senal
ax[1].set_xlabel('Evidencia')                                                      #Damos un nombre al eje de las abscisas
ax[1].set_ylabel('Probabilidad')                                                   #Damos un nombre al eje de las ordenadas
ax[1].axis([-3.0, 5.0, 0.0, 0.7])                                                  #Especificamos las dimensiones de la grafica principal: (rango en x, rango en y)
 
ax_k = plt.axes([0.10, 0.12, 0.80, 0.03], axisbg='white')                    #Dibujamos un rectangulo especificando sus coordenadas
s_k = Slider(ax_k, 'Criterio', -3.0, 5.0, facecolor='white', valinit=k)      #Asignamos la funcionalidad de slider al rectángulo; especificamos los valores entre los que puede variar y asignamos como valor inicial el calculado al principio del codigo

ax_d = plt.axes([0.10, 0.07, 0.80, 0.03], axisbg='white')                    #Dibujamos un rectangulo especificando sus coordenadas
s_d = Slider(ax_d, 'D prima', 0.01, 5.0, facecolor='white', valinit=d) 

def update(adri):          # Creamos una funcion para actualizar nuestra grafica 
    hitR = 90.0/100.0      #Computamos directamente la tasa de hits y falsas alarmas, para mantener las distribuciones estaticas
    faR = 15.0/100.0
    d_ = s_d.val
    k_ = s_k.val           #El criterio se va a obtener directamente del slider
    beta_ = (scipy.stats.norm(d_,1).pdf(k_))/(scipy.stats.norm(0,1).pdf(k_))
    c_ = k_-(d_/2)
    yes = np.arange(k_, 6.0, 0.01)       #A partir de la ubicacion del slider, definimos cual es el espacio de ‘respuestas afirmatorias’
    no = np.arange(-6.0, k_, 0.01)       #y definimos el espacio de ‘respuestas negativas’ antes del slider
    yes_ideal = np.arange(k, 6.0, 0.01)       #A partir de la ubicacion del slider, definimos cual es el espacio de ‘respuestas afirmatorias’
    no_ideal = np.arange(-6.0, k, 0.01)       #y definimos el espacio de ‘respuestas negativas’ antes del slider
    pHit = 1-scipy.stats.norm(d_,1).cdf(k_)
    pFA = 1-scipy.stats.norm(0,1).cdf(k_)
    pMiss = scipy.stats.norm(d_,1).cdf(k_)
    pReject = scipy.stats.norm(0,1).cdf(k_)
    ax[0].clear()                           #Limpiamos la grafica para poder dibujar sobre ella
    ax[0].plot(x,mlab.normpdf(x, mu, sigma), 'purple')         #Volvemos a dibujar la distribucion de Ruido
    ax[0].plot(x,mlab.normpdf(x, d_, sigma), 'green')         #Dibujamos la distribucion de senal
    ax[0].text((d/2), 0.65, 'Ejecucion de acuerdo al criterio', ha='center', va='bottom', fontsize=10, fontweight='bold')   #Escribimos los nombres de los cuatro posibles Outcomes a obtener, dependiendo la correspondencia entre la respuesta dada y la distribucion de origen del estimulo.
    ax[0].plot([-2.5,4.5],[0.595,0.595], 'k', linewidth=1)      #Insertamos una línea horizontal en la parte superior de la grafica
    ax[0].text(-1.6, 0.6, 'Rechazos', color='#C81BE2', ha='center', va='bottom', fontsize=10, fontweight='bold')   #Escribimos los nombres de los cuatro posibles Outcomes a obtener, dependiendo la correspondencia entre la respuesta dada y la distribucion de origen del estimulo.
    ax[0].text(0.2, 0.60, 'Omisiones', color='#003797', ha='center', va='bottom', fontsize=10, fontweight='bold')   
    ax[0].text(2.3, 0.60, 'FalsasAlarmas', color='#D3A519', ha='center', va='bottom', fontsize=10, fontweight='bold')   
    ax[0].text(4.05, 0.6, 'Hits', ha='center', color='#188A5B', va='bottom', fontsize=10)   
    ax[0].text(-1.6, 0.57, '(%.2f)' %scipy.stats.norm(0,1).cdf(k_), color='#C81BE2', ha='center', va='bottom', fontsize=10)     #Calculamos y escribimos cuál es el área bajo la curva que corresponde a los Rechazos
    ax[0].text(0.2, 0.57, '(%.2f)' %scipy.stats.norm(d_,1).cdf(k_), color='#003797', ha='center', va='bottom', fontsize=10)      #Especificamos el área bajo la curva que corresponde a las Omisiones
    ax[0].text(2.3, 0.57, '(%.2f)' %(1-scipy.stats.norm(0,1).cdf(k_)), color='#D3A519', ha='center', va='bottom', fontsize=10)  #Especificamos el área bajo la curva que corresponde a las Falsas Alarmas
    ax[0].text(4.05, 0.57, '(%.2f)' %(1-scipy.stats.norm(d_,1).cdf(k_)), ha='center', color='#188A5B', va='bottom', fontsize=10) #Especificamos el área bajo la curva que corresponde a los Hits
    ax[0].plot([k_,k_],[0,0.465], 'black', linestyle = ':') #Dibujamos el criterio
    ax[0].plot([-2,4],[0.465,0.465], 'k', linewidth=1)        #Dibujamos la línea arriba de la grafica
    ax[0].text((d/2), 0.47, 'Beta = %.4f' %beta_, ha='center', va='bottom', color = 'red')      #Colocamos una etiqueta a la distribucion de Senal
    ax[0].fill_between(yes, 0, (scipy.stats.norm(d_,1).pdf(yes)), facecolor='#19D386', alpha=0.5)   #Coloreamos los Hits
    ax[0].fill_between(yes, 0, (scipy.stats.norm(0,1).pdf(yes)), facecolor='#F7C11D', alpha=0.5)   #Coloreamos las falsas alarmas
    ax[0].fill_between(no, 0, scipy.stats.norm(0,1).pdf(no), facecolor='#C81BE2', alpha=0.5)       #Coloreamos los Rechazos correctos
    ax[0].fill_between(no, 0, scipy.stats.norm(d_,1).pdf(no), facecolor='#003797', alpha=0.5)        #Coloreamos las Omisiones
    ax[0].text(-2, 0.43, 'Ruido', ha='center', va='bottom', color = 'purple')       #Colocamos una etiqueta a la distribucion de Ruido   
    ax[0].text(4, 0.43, 'Senal', ha='center', va='bottom', color = 'green')      #Colocamos una etiqueta a la distribucion de Senal
    ax[0].text(k_+0.8, (scipy.stats.norm(0,1).pdf(k_))-.03, '%.2f' %(scipy.stats.norm(0,1).pdf(k_)), ha='center', va='bottom', color ='purple')       #Colocamos una etiqueta a la distribucion de Ruido   
    ax[0].text(k_-0.8, (scipy.stats.norm(d_,1).pdf(k_))+.015, '%.2f' %(scipy.stats.norm(d_,1).pdf(k_)), ha='center', va='bottom', color = 'green')      #Colocamos una etiqueta a la distribucion de Senal
    ax[0].axis([-3.0, 5.0, 0.0, 0.7])                            #Mantenemos las dimensiones de la grafica 
    ax[0].set_title('Beta', fontsize=18, fontweight='bold') #Reiteramos el titulo
    ax[0].set_xlabel('Evidencia')                                                      #Reiteramos el nombre del eje de las abscisas
    ax[0].set_ylabel('Probabilidad')         
    ax[0].scatter(k_, (scipy.stats.norm(d_,1).pdf(k_)), color = 'green')
    ax[0].scatter(k_, (scipy.stats.norm(0,1).pdf(k_)), color = 'purple')                                           #Reiteramos el nombre del eje de las ordenadas
    ax[0].plot([k_,k_],[(scipy.stats.norm(d_,1).pdf(k_)),(scipy.stats.norm(0,1).pdf(k_))], 'red')   #Dibujamos el criterio como una linea vertical que cruza las distribuciones
    

    ax[1].clear()     
    ax[1].plot(x,mlab.normpdf(x, mu, sigma), 'black')         #Volvemos a dibujar la distribucion de Ruido
    ax[1].plot(x,mlab.normpdf(x, d_, sigma), 'black')         #Dibujamos la distribucion de senal
    ax[1].plot([k_,k_],[0,0.465], 'black', linestyle = '--')   #Dibujamos el criterio como una linea vertical que cruza las distribuciones
    ax[1].plot([(d_/2),(d_/2)],[0,0.48], 'black')   #Dibujamos el criterio como una linea vertical que cruza las distribuciones
    ax[1].plot([(d_/2),k_],[0.48,0.48], 'red')   #Dibujamos el criterio como una linea vertical que cruza las distribuciones
    ax[1].fill_between(yes_ideal, 0, (scipy.stats.norm(d_,1).pdf(yes_ideal)), facecolor='#19D386', alpha=0.5)     #Coloreamos los Hits
    ax[1].fill_between(yes_ideal, 0, (scipy.stats.norm(0,1).pdf(yes_ideal)), facecolor='#F7C11D', alpha=0.5)     #Coloreamos las Falsas Alarmas
    ax[1].fill_between(no_ideal, 0, scipy.stats.norm(0,1).pdf(no_ideal), facecolor='#C81BE2', alpha=0.5)         #Coloreamos los Rechazos Correctos
    ax[1].fill_between(no_ideal, 0, scipy.stats.norm(d_,1).pdf(no_ideal), facecolor='#003797', alpha=0.5)         #Coloreamos las Omisiones
    ax[1].plot([-2.5,4.5],[0.595,0.595], 'k', linewidth=1)      #Insertamos una línea horizontal en la parte superior de la grafica
    ax[1].text((d_/2), 0.65, 'Ejecucion en sistema sin sesgo', ha='center', va='bottom', fontsize=10, fontweight='bold')   #Escribimos los nombres de los cuatro posibles Outcomes a obtener, dependiendo la correspondencia entre la respuesta dada y la distribucion de origen del estimulo.
    ax[1].text(-1.6, 0.6, 'Rechazos', color='#C81BE2', ha='center', va='bottom', fontsize=10, fontweight='bold')   #Escribimos los nombres de los cuatro posibles Outcomes a obtener, dependiendo la correspondencia entre la respuesta dada y la distribucion de origen del estimulo.
    ax[1].text(0.2, 0.60, 'Omisiones', color='#003797', ha='center', va='bottom', fontsize=10, fontweight='bold')   
    ax[1].text(2.3, 0.60, 'FalsasAlarmas', color='#D3A519', ha='center', va='bottom', fontsize=10, fontweight='bold')   
    ax[1].text(4.05, 0.6, 'Hits', ha='center', color='#188A5B', va='bottom', fontsize=10)   
    ax[1].text(-1.6, 0.57, '(%.2f)' %scipy.stats.norm(0,1).cdf(k_), color='#C81BE2', ha='center', va='bottom', fontsize=10)     #Calculamos y escribimos cuál es el área bajo la curva que corresponde a los Rechazos
    ax[1].text(0.2, 0.57, '(%.2f)' %scipy.stats.norm(d_,1).cdf(k_), color='#003797', ha='center', va='bottom', fontsize=10)      #Especificamos el área bajo la curva que corresponde a las Omisiones
    ax[1].text(2.3, 0.57, '(%.2f)' %(1-scipy.stats.norm(0,1).cdf(k_)), color='#D3A519', ha='center', va='bottom', fontsize=10)  #Especificamos el área bajo la curva que corresponde a las Falsas Alarmas
    ax[1].text(4.05, 0.57, '(%.2f)' %(1-scipy.stats.norm(d_,1).cdf(k_)), ha='center', color='#188A5B', va='bottom', fontsize=10) #Especificamos el área bajo la curva que corresponde a los Hits
    ax[1].text(0, 0.42, 'Ruido', ha='center', va='bottom')    #Identificamos la Distribucion de Ruido con una etiqueta
    ax[1].text(d_, 0.42, 'Senal', ha='center', va='bottom')    #Etiqueta para la Distribucion de Senal
    ax[1].text((d/2), 0.5, 'C = %.4f' %c_, ha='center', va='bottom', color = 'red')      #Colocamos una etiqueta a la distribucion de Senal
    ax[1].set_title('C', fontsize=18, fontweight='bold')  #Añadimos un titulo a la grafica
    ax[1].set_xlabel('Evidencia')                                                      #Damos un nombre al eje de las abscisas
    ax[1].set_ylabel('Probabilidad')                                                   #Damos un nombre al eje de las ordenadas
    ax[1].axis([-3.0, 5.0, 0.0, 0.7])         
    
#    print ("pFA: " + str(pFA) + " pHits: " + str(pHit))
s_k.on_changed(update)    
s_d.on_changed(update)
plt.show() #Imprimimos la grafica

