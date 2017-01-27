import math
import numpy                      #Biblioteca para operaciones matematicas complejas
from matplotlib.widgets import Slider, Button  #Bajamos la libreria para hacer Sliders
import matplotlib.pyplot as plt #Bajamos la libreria para hacer graficas

tiempo = range(100)  #Genera arreglo de 0 a 99<
respuesta = []
A = 1000.0
alfa = 1.0

for i in tiempo:
    respuesta.append(A*math.exp(-tiempo[i]/alfa))

fig, ax = plt.subplots(2)
max_time = tiempo[len(tiempo) - 1] + 1
max_resp = numpy.amax(respuesta) + 1;
ax[1].set_yscale('log') #Fijar escala logaritmica
ax[0].axis([0,max_time,-1, max_resp]) #Fijar limites de los ejes
ax[1].axis([0,max_time, 1, max_resp]) 
ax[0].plot(tiempo, respuesta)  #La grafica en si
ax[1].plot(tiempo, respuesta)
plt.show();

