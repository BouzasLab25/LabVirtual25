# -*- coding: utf-8 -*-
"""
Created on Fri Jun 30 11:41:32 2017

@author: Adriana
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

###########################################################
# Ajustamos el Output
###########################################################
fig, ax = plt.subplots()                       #Ampliamos nuestro espacio para generar dos areas independientes para la grafica principal y los sliders
plt.subplots_adjust(left=0.1, bottom=0.25)     #Especificamos la relación en el espacio entre dichas areas

##########################################
#DISTRIBUCION
########################################## 
mu = 0
varianza = 1
sigma = math.sqrt(varianza)
x = np.arange(-6.0,6.0,0.01)
valor = 0

above = np.arange(valor,6.0,0.01)
below = np.arange(-6.0,valor,0.01)

ax.plot([valor,valor],[0,0.5],'red')
ax.plot(x,mlab.normpdf(x,mu,sigma), 'black')
ax.fill_between(below, 0, scipy.stats.norm(0,1).pdf(below), facecolor='#741D97', alpha=0.5)
ax.fill_between(above, 0, scipy.stats.norm(0,1).pdf(above), facecolor='#CBECF4', alpha=0.5)

#########################################
# Personalizar la grafica!
#########################################
ax.axis([-4.0,4.0, 0.0,0.7])
"""Insertar valores"""
ax.plot([-3,3],[0.6,0.6], 'k', linewidth=1)
ax.text(-2.3, 0.61, 'PDF', color='black', ha='center', va='bottom', fontsize=10)
ax.text(0,0.61, 'CDF', color='#741D97', ha='center',va='bottom',fontsize=10)
ax.text(2.3,0.61, 'Z Score', color='red', ha='center',va='bottom',fontsize=10)
ax.text(-2.3,0.56, '%.2f' %scipy.stats.norm(0,1).pdf(valor), color='black', ha='center', va='bottom', fontsize=10)
ax.text(0,0.56, '%.2f' %scipy.stats.norm(0,1).cdf(valor), color='#741D97', ha='center', va='bottom', fontsize=10)
ax.text(2.3,0.56, '%.2f' %scipy.stats.norm(0,1).ppf(scipy.stats.norm(0,1).cdf(valor)), color='red', ha='center', va='bottom', fontsize=10)
"""Personalizacion"""
ax.set_title('Distribucion Normal', fontsize=18)
ax.set_xlabel('Valores X')
ax.set_ylabel('Probabilidad')

############################################
# SLIDERS!
############################################
rect_valor = plt.axes([0.10,0.12,0.80,0.03], axisbg='yellow')
slider_valor = Slider(rect_valor, 'Valor X', -4.0, 4.0, facecolor='green', valinit=valor)

#############################################
# Actualizamos la Grafica con el SLIDER
##############################################
def update(adri):
    valor = slider_valor.val
    above = np.arange(valor, 6.0, 0.01)
    below = np.arange(-6.0, valor, 0.01)
    ax.clear()
    ax.plot(x,mlab.normpdf(x,mu,sigma), 'black')
    ax.fill_between(below, 0, scipy.stats.norm(0,1).pdf(below), facecolor='#741D97', alpha=0.5)
    ax.fill_between(above, 0, scipy.stats.norm(0,1).pdf(above), facecolor='#CBECF4', alpha=0.5)
    ax.axis([-4.0,4.0, 0.0,0.7])
    ax.plot([-3,3],[0.6,0.6], 'k', linewidth=1)
    ax.text(-2.3, 0.61, 'PDF', color='black', ha='center', va='bottom', fontsize=10)
    ax.text(0,0.61, 'CDF', color='#741D97', ha='center',va='bottom',fontsize=10)
    ax.text(2.3,0.61, 'Z Score', color='red', ha='center',va='bottom',fontsize=10)
    ax.text(-2.3,0.56, '%.2f' %scipy.stats.norm(0,1).pdf(valor), color='black', ha='center', va='bottom', fontsize=10)
    ax.text(0,0.56, '%.2f' %scipy.stats.norm(0,1).cdf(valor), color='#741D97', ha='center', va='bottom', fontsize=10)
    ax.text(2.3,0.56, '%.2f' %scipy.stats.norm(0,1).ppf(scipy.stats.norm(0,1).cdf(valor)), color='red', ha='center', va='bottom', fontsize=10)
    ax.set_title('Distribucion Normal', fontsize=18)
    ax.set_xlabel('Valores X')
    ax.set_ylabel('Probabilidad')
    ax.plot([valor,valor],[0,0.5],'red')
slider_valor.on_changed(update)
plt.show()










                  
                
                   
                   
                   