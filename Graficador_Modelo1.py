# -*- coding: utf-8 -*-
"""
Created on Sun Oct 23 13:15:47 2016

@author: Adrifelcha
"""
import numpy as np
import scipy.stats as st
import matplotlib.pyplot as plt
from matplotlib.widgets import Slider    #Libreria para hacer Sliders
import matplotlib.mlab as mlab	         #Libreria para personalizar graficas
import math			                     # Librería matematica
import scipy			                # Librería para hacer distribuciones de probabilidad
import scipy.stats			             # Librerias para hacer operaciones estadisticas


Kn = 0.9
Kr = 0.9

FI_value = 10

ensayos = 120
sim = 3

fig, ax = plt.subplots()                       #Ampliamos nuestro espacio para generar dos areas independientes para la grafica principal y los sliders
plt.subplots_adjust(left=0.1, bottom=0.25) 

FI = np.zeros((ensayos))
a = 0
for i in range(ensayos):
    if a == FI_value-1:
        FI[i] = 1
        a = 0
    else:
        FI[i] = 0
        a = a + 1
print(FI)

p = np.zeros((ensayos, sim))
#print(p)
c = np.zeros((ensayos, sim))
suma = np.zeros((ensayos, sim))
x = np.linspace(0, ensayos, ensayos)
#print(c)

for i in range(ensayos):
    for j in range(sim):
        if i < ensayos-1:
            p[i+1][j] = Kn*p[i][j]+(FI[i]*Kr*(1-p[i][j]))
            c[i][j] = st.binom.rvs(1,p[i][j])
            suma[i+1][j]= c[i][j]+suma[i][j]
print(p)
print (c)
print (suma)


ax.axis([0.0, ensayos, 0.0, ensayos-9]) 
ax.set_title('Modelo 1', fontsize=25, fontweight='bold')  #Añadimos un titulo a la grafica
ax.set_xlabel('Tiempo')    #Damos un nombre al eje de las abscisas
ax.set_ylabel('Respuestas Acumuladas')  
ax.plot(x, suma)
#plt.show()

ax_Sim = plt.axes([0.05, 0.11, 0.35, 0.035], axisbg='#F6EFC2')                    #Dibujamos un rectangulo especificando sus coordenadas
s_Sim = Slider(ax_Sim, 'Simulations', 1, 10, facecolor='#F6EFC2', valinit=sim)

ax_Tr = plt.axes([0.05, 0.06, 0.35, 0.03], axisbg='#F6EFC2')                    #Dibujamos un rectangulo especificando sus coordenadas
s_Tr = Slider(ax_Tr, 'Trials', 100, 500, facecolor='#F6EFC2', valinit=ensayos)

ax_FI = plt.axes([0.05, 0.01, 0.35, 0.03], axisbg='#F6EFC2')                    #Dibujamos un rectangulo especificando sus coordenadas
s_FI = Slider(ax_FI, 'F.I.', 1, 100, facecolor='#F6EFC2', valinit=FI_value)

ax_Kn = plt.axes([0.60, 0.09, 0.35, 0.03], axisbg='#FF9EA0')                    #Dibujamos un rectangulo especificando sus coordenadas
s_Kn = Slider(ax_Kn, 'Kn', 0.01, 1.0, facecolor='red', valinit=Kn)

ax_Kr = plt.axes([0.60, 0.01, 0.35, 0.03], axisbg='#FF9EA0')                    #Dibujamos un rectangulo especificando sus coordenadas
s_Kr = Slider(ax_Kr, 'Kr', 0.01, 1.0, facecolor='red', valinit=Kr)

def update(adri):          # Creamos una funcion para actualizar nuestra grafica 
    Kn = s_Kn.val
    Kr = s_Kr.val
    FI_value = int(s_FI.val)
    ensayos = int(s_Tr.val)
    sim = int(s_Sim.val)
    FI = np.zeros((ensayos))
    a = 0
    for i in range(ensayos):
        if a == FI_value-1:
            FI[i] = 1
            a = 0
        else:
            FI[i] = 0
            a = a + 1
    p = np.zeros((ensayos, sim))
    c = np.zeros((ensayos, sim))
    suma = np.zeros((ensayos, sim))
    x = np.linspace(0, ensayos, ensayos)
    for i in range(ensayos):
        for j in range(sim):
            if i < ensayos-1:
                p[i+1][j] = Kn*p[i][j]+(FI[i]*Kr*(1-p[i][j]))
                c[i][j] = st.binom.rvs(1,p[i][j])
                suma[i+1][j]= c[i][j]+suma[i][j]
    ax.clear()  
    ax.axis([0.0, ensayos, 0.0, ensayos-9]) 
    ax.set_title('Modelo 1', fontsize=25, fontweight='bold')  #Añadimos un titulo a la grafica
    ax.set_xlabel('Tiempo')    #Damos un nombre al eje de las abscisas
    ax.set_ylabel('Respuestas Acumuladas')  
    ax.plot(x, suma)                                                 #Reiteramos el nombre del eje de las ordenadas
s_Kr.on_changed(update)
s_Kn.on_changed(update)
s_Tr.on_changed(update)
s_Sim.on_changed(update) 
s_FI.on_changed(update)
plt.show() #Imprimimos la grafica
