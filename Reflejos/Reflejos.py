import math
import numpy                      #Biblioteca para operaciones matematicas complejas
from matplotlib.widgets import Slider, Button  #Bajamos la libreria para hacer Sliders
import matplotlib.pyplot as plt #Bajamos la libreria para hacer graficas

tiempo = range(300)  #Genera arreglo de 0 a 99<
respuesta = []
B = 14.5
b= ([60,120,180,240,300,360], [17,18,15,14,13,10])
C = 12.5
c= ([60,120,180,240,300], [13,14,14,14,13,13,12,11,11,10])
D =  9
d= ([0,60,120,180,240,300], [10,9,7,8,5,6])
alfa = 30

for i in tiempo:
    respuesta.append(D*math.exp(-tiempo[i]/alfa))

fig, ax = plt.subplots(2)
max_time = tiempo[len(tiempo) - 1] + 1
max_resp = numpy.amax(respuesta) + 1;
ax[1].set_yscale('log') #Fijar escala logaritmica
ax[0].axis([0,max_time,-1, max_resp]) #Fijar limites de los ejes
ax[1].axis([0,max_time, 1, max_resp]) 
ax[0].plot(tiempo, respuesta)  #La grafica en si
ax[1].plot(tiempo, respuesta)
ax[0].scatter([0,60,120,180,240,300], [10,9,7,8,5,6])
ax[0].set_title('Respuestas por minuto ', fontsize=14, fontweight='bold') 
ax[1].set_title('', fontsize=18, fontweight='bold') 

plt.show();