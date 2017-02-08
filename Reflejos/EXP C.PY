import math
import numpy
from matplotlib.widgets import Slider, Button
import matplotlib.pyplot as plt


tiempo = range(300)
respuesta = []
C = 9.0
c =([0,30,60,90,120,150,180,210,240,270,300],[10,9,7,8,7,6,6,6,5,5,4])
alfaC=463.0

for i in tiempo:
    respuesta.append(C*math.exp(-tiempo[i]/alfaC))

fig, ax = plt.subplots(2)
max_time = tiempo[len(tiempo) - 1] + 10
max_resp = numpy.amax(respuesta) + 4;
ax[1].set_yscale('log') #Fijar escala logaritmica
ax[0].axis([0,max_time,-1, max_resp]) #Fijar limites de los ejes
ax[1].axis([0,max_time, 1, max_resp]) 
ax[0].plot(tiempo, respuesta)  #La grafica en 
ax[1].plot(tiempo, respuesta)
ax[1].scatter([0,30,60,90,120,150,180,210,240,270,300],
[10,9,7,8,7,6,6,6,5,5,4])
ax[0].set_title("Respuestas por minuto3",fontsize=14, fontweight="bold")
plt.show();

