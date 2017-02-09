import math
import numpy
from matplotlib.widgets import Slider, Button
import matplotlib.pyplot as plt

tiempo = range(600)  #Genera arreglo de 0 a 99<
respuesta = []
B =12.5
b =([0,60,120,180,240,300,360,420,480,540,600],[13,14,10,9,7,4,4,4,3,2,2])
alfaB=300.0

for i in tiempo:
    respuesta.append(B*math.exp(-tiempo[i]/alfaB))

fig, ax = plt.subplots(2)
max_time = tiempo[len(tiempo) - 1] + 10
max_resp = numpy.amax(respuesta) + 5;
ax[1].set_yscale('log') #Fijar escala logaritmica
ax[0].axis([0,max_time,-1, max_resp]) #Fijar limites de los ejes
ax[1].axis([0,max_time, 1, max_resp]) 
ax[0].plot(tiempo, respuesta)  #La grafica en si
ax[1].plot(tiempo, respuesta)
ax[1].scatter([0,60,120,180,240,300,360,420,480,540,600],[13,14,10,9,7,4,4,4,3,2,2])
ax[0].set_title("Respuestas por minuto2",fontsize=14, fontweight="bold")
plt.show();