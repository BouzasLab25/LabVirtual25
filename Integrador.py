# -*- coding: utf-8 -*-

### Programa en Python Integrador ###
from matplotlib.widgets import Slider
import matplotlib.pyplot as plt

fig, ax = plt.subplots()
plt.subplots_adjust(left=0.1, bottom=0.25)   

# Creamos un arreglo de 30 elelmentos, el primer elemento tiene un valor de 100
# (representa un estimulo en el tiempo) el resto tiene un valor de 0.  
R = [100]*1 + [0]*29
x = range(31)			# Creamos un arreglo de 31 elementos [0, 1, 2, 3, 4....]
y = [0]*31				# Creamos un arreglo que llenaremos con el resultado de la función del integrador
						# Por lo pronto lo llenaremos con ceros

a = 0.55				# Declaramos el parametro de Ventana Temporal
y[0] = 0.0				 
V_ant = 0.0

# Calculamos la función integrador y lo guardamos en la variable Y[]
for i in range(len(R)):	# Este ciclo For, se recorrera para todo el largo del arreglo R[]
	y[i+1] = a*V_ant + (1-a)*R[i]
	V_ant = y[i+1]

ax.set_title("Integrador con Fuga", fontsize=18, fontweight="bold")
ax.set_xlabel("Tiempo")
ax.set_ylabel("Valor")
ax.set_ylim(0.0, 105)
ax.set_xlim(0.0,20)
ax.text(12, 80, r'$V_{i+1} = a V_{i} + (1-a) R_{i}$', ha='center', va='bottom', fontsize=20)   #Escribimos los terminos que componen la Regla
ax.text(12, 72, 'a = %.2f' %a, ha='center', color='#0C2DC2', va='bottom', fontsize=12) 
ax.plot(x, y)

# Creamos un objeto que contendra la informacion de Slider
ax_a = plt.axes([0.25, 0.12, 0.65, 0.03], axisbg='#BCE2C2')
a_value = Slider(ax_a, "Ventana temporal", 0.01, 0.99, valinit=a) 
plt.text(0.4,-2.35, '0 < a < 1', fontsize=13)

def update(val):
	a = a_value.val
	V_ant = 0
	for i in range(len(R)):
		y[i+1] = a*V_ant + (1-a)*R[i]
		V_ant = y[i+1]
	ax.clear()
	ax.set_title("Integrador con Fuga", fontsize=18, fontweight="bold")
	ax.set_xlabel("Tiempo")
	ax.set_ylabel("Valor")
	ax.set_ylim(0.0, 105)
 	ax.set_xlim(0.0, 20)
        ax.text(12, 80, r'$V_{i+1} = a V_{i} + (1-a) R_{i}$', ha='center', va='bottom', fontsize=20)   #Escribimos los terminos que componen la Regla
        ax.text(12, 72, 'a = %.2f' %a, ha='center', color='#0C2DC2', va='bottom', fontsize=12) 
 	ax.plot(x, y)
a_value.on_changed(update)
plt.show()
