import math
import numpy
from matplotlib.widgets import Slider, Button
import matplotlib.pyplot as plt


tiempo = range(300)
respuesta = []
A = 14.5
a =([0,30,60,90,120,150,180,210,240,270,300],[15,16,12,11,10,9,8,7,6,5,5])
alfaA=315.0


for i in tiempo:
    respuesta.append(A*math.exp(-tiempo[i]/alfaA))

fig, ax = plt.subplots(2)
max_time = tiempo[len(tiempo) - 1] + 10
max_resp = numpy.amax(respuesta) + 4;
ax[1].set_yscale('log') #Fijar escala logaritmica
ax[0].axis([0,max_time,-1, max_resp]) #Fijar limites de los ejes
ax[1].axis([0,max_time, 1, max_resp]) 
ax[0].plot(tiempo, respuesta)  #La grafica en 
ax[1].plot(tiempo, respuesta)
ax[1].scatter([0,30,60,90,120,150,180,210,240,270,300],[15,16,12,11,10,9,8,7,6,5,5])
ax[0].set_title("Respuestas por minuto3",fontsize=14, fontweight="bold")
plt.show();

