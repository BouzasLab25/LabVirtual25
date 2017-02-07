# -*- coding: utf-8 -*-

### Programa en Python Integrador ###
#Autores: Yuznhio Sierra & Edgar Vazquez

from matplotlib.widgets import Slider, Button, RadioButtons
import matplotlib.pyplot as plt
import numpy as np


# Creamos un arreglo de "100" elelmentos, el primer elemento tiene un valor de 100
# (representa un estimulo en el tiempo) el resto tiene un valor de 0.
R = [100]*20 + [0]*(79)
x = range(100)           # Creamos un arreglo de 100 elementos [0, 1, 2, 3, 4....]
y = [0]*(100)            # Creamos un arreglo que llenaremos con el resultado de la función del integrador
ruido_1 = [0]*(100)      # Por lo pronto lo llenaremos con ceros
ruido_2 = [0]*(100)
ruido_3 = [0]*(100)

global randn
randn = False

a = 0.55                 # Declaramos el parametro de Ventana Temporal
y[0] = 0.0
V_ant = 0.0

fig, ax = plt.subplots()
plt.subplots_adjust(left=0.1, bottom=0.25)


# Calculamos la función integrador y lo guardamos en la variable Y[]
for i in range(len(R)):     # Este ciclo For, se recorrera para todo el largo del arreglo R[]
    y[i+1] = a*V_ant + (1-a)*R[i]
    ruido_1[i+1] = y[i+1] + (np.random.randn()*3)
    ruido_2[i+1] = y[i+1] + (np.random.randn()*3)
    ruido_3[i+1] = y[i+1] + (np.random.randn()*3)
    V_ant = y[i+1]

ax.set_title("Integrador", fontsize=18, fontweight="bold")
ax.set_xlabel("Tiempo")
ax.set_ylabel("Valor")
ax.set_ylim(0.0, 105)
ax.plot(x, y)


## Descomentar estas lineas para datos aleatorios
#ax.plot(x, ruido_1, 'ro')
#ax.plot(x, ruido_2, 'ro')
#ax.plot(x, ruido_3, 'ro')



# Creamos un objeto que contendra la informacion de Slider para modificar
# el valor de la ventana temporal "a"
ax_a = plt.axes([0.25, 0.12, 0.65, 0.03], axisbg='#BCE2C2')
a_value = Slider(ax_a, "Ventana temporal", 0.01, 0.99, valinit=a)

# Creamos un objeto que contendra la informacion de Slider para modificar
# la cantidad de los estímulos de los  estimulos
ax_est = plt.axes([0.25, 0.08, 0.65, 0.03], axisbg='#BCE2C2')
est_value = Slider(ax_est, "Numero de estimulos", 1, 60, valinit=20)

def update(val):
    global randn
    a = a_value.val
    est = int(est_value.val)
    R = [100]*est + [0]*(98 - est)
    V_ant = 0
    for i in range(len(R)):
        y[i+1] = a*V_ant + (1-a)*R[i]
        ruido_1[i+1] = y[i+1] + (np.random.randn()*3)
        ruido_2[i+1] = y[i+1] + (np.random.randn()*3)
        ruido_3[i+1] = y[i+1] + (np.random.randn()*3)
        V_ant = y[i+1]

    ax.clear()
    ax.set_title("Integrador", fontsize=18, fontweight="bold")
    ax.set_xlabel("Tiempo")
    ax.set_ylabel("Valor")
    ax.set_ylim(0.0, 110)
    ax.plot(x, y)

    ## Descomentar estas lineas para datos aleatorios
    #ax.plot(x, ruido_1, 'ro')
    #ax.plot(x, ruido_2, 'ro')
    #ax.plot(x, ruido_3, 'ro')



a_value.on_changed(update)
est_value.on_changed(update)

plt.show()
