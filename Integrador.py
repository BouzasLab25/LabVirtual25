# -*- coding: utf-8 -*-
### Programa en Python Integrador ###
from matplotlib.widgets import Slider
import matplotlib.pyplot as plt

fig, ax = plt.subplots()
plt.subplots_adjust(left=0.1, bottom=0.25)   

a = 0.55

R = [100]*1 + [0]*29
x = [0]*31
y = [0]*31
V_ant = 0

x[0] = 0.0
y[0] = 0.0

for i in range(len(R)):
	x[i+1] = i+1
	y[i+1] = a*V_ant + (1-a)*R[i]
	V_ant = y[i+1]

ax.set_title("Integrador", fontsize=18, fontweight="bold")
ax.set_xlabel("Tiempo")
ax.set_ylabel("Valor")
ax.set_ylim(0.0, 105)
ax.plot(x, y)

# Creamos un objeto que contendra la informacion de Slider
ax_a = plt.axes([0.25, 0.12, 0.65, 0.03], axisbg='#BCE2C2')
a_value = Slider(ax_a, "Ventana temporal", 0.01, 0.99, valinit=a) 

def update(val):
	a = a_value.val
	V_ant = 0
	for i in range(len(R)):
		x[i+1] = i + 1
		y[i+1] = a*V_ant + (1-a)*R[i]
		V_ant = y[i+1]
	ax.clear()
	ax.set_title("Integrador", fontsize=18, fontweight="bold")
	ax.set_xlabel("Tiempo")
	ax.set_ylabel("Valor")
	ax.set_ylim(0.0, 105)
	ax.plot(x, y)


a_value.on_changed(update)
plt.show()
