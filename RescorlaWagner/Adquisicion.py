#Cargamos las librerias necesarias
import numpy                      #Biblioteca para operaciones matematicas complejas
from matplotlib.widgets import Slider, Button  #Bajamos la libreria para hacer Sliders
import matplotlib.pyplot as plt #Bajamos la libreria para hacer graficas

a = 0.75  #alpha
l = 100  #lambda
ensayos = 100

#est1      = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
#est2      = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
#est3      = [1,1,1,1,1,1,1,1,1,1]
#est4      = [1,1,1,1,1,1,1,1,1,1]
#refuerzo  = [1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0]

est1      = [1,1,1,1,1,1,1,1,1,1]
est2      = [0,0,0,0,0,1,1,1,1,1]
est3      = [1,1,1,1,1,1,1,1,1,1]
est4      = [1,1,1,1,1,1,1,1,1,1]
refuerzo  = [1,1,1,1,1,1,1,1,1,1]

V1 = [];
V2 = [];
V3 = [];
V4 = [];

estimulos = [est1, est2]#, est3, est4]
Vx = [V1, V2]#, V3, V4]

for i in range(len(est1)):
    for j in range(len(Vx)):
        Vx[j].append(0)

for i in range(len(est1)-1):
    Vt = 0
    for j in range(len(Vx)):
        Vt = Vt + Vx[j][i]
    for j in range(len(Vx)):
        if refuerzo[i] !=0:
            l = 100
        else:
            l = 0
        if estimulos[j][i] != 0:
            Vx[j][i+1] = Vx[j][i] + a*(l - Vt)
        else:
            Vx[j][i+1] = Vx[j][i]
    

time = range(len(est1))
max_time = len(time)
fig, ax = plt.subplots(len(estimulos)+1,2)
for i in range(len(estimulos)):
    ax[i,0].axis([0,max_time,-1, 2])
    ax[i,0].plot(time, estimulos[i] , 'ro')
    ax[i,1].axis([0,max_time,-1,110])
    ax[i,1].plot(time, Vx[i])
ax[len(estimulos),0].axis([0,max_time,-1, 2])
ax[len(estimulos),0].plot(time, refuerzo)
plt.show()
