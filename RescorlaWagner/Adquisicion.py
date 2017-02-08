#Cargamos las librerias necesarias
import numpy                      #Biblioteca para operaciones matematicas complejas
#from matplotlib.widgets import Slider, Button  #Bajamos la libreria para hacer Sliders
import matplotlib.pyplot as plt #Bajamos la libreria para hacer graficas

a = 0.05  #alpha
l = 100  #lambda
ensayos = 100

#est1      = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
#est2      = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
#est3      = [1,1,1,1,1,1,1,1,1,1]
#est4      = [1,1,1,1,1,1,1,1,1,1]
#refuerzo  = [1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0]

est1      = numpy.ones(150)
est2      = numpy.concatenate((numpy.zeros(50), numpy.ones(100)))
est3      = numpy.concatenate((numpy.zeros(50), numpy.ones(100)))
est4      = numpy.concatenate((numpy.zeros(50), numpy.ones(100)))
refuerzo  = numpy.concatenate((numpy.ones(100), numpy.zeros(50)))
fases = 3

#est1      = numpy.ones(100)
#est2      = numpy.concatenate((numpy.zeros(50), numpy.ones(50)))
#est3      = numpy.concatenate((numpy.zeros(50), numpy.ones(50)))
#est4      = numpy.concatenate((numpy.zeros(50), numpy.ones(50)))
#refuerzo  = numpy.ones(100)
#fases = 2

V1 = [];
V2 = [];
V3 = [];
V4 = [];


estimulos = [[est1, est2], [est3, est4]]
Vx = [[V1, V2], [V3, V4]]

for i in range(len(Vx)):
    for j in range(len(Vx[i])):
        for k in range(len(est1)):
            Vx[i][j].append(0)

for k in range(len(est1) - 1):
    for i in range(len(Vx)):
        Vt = 0
        for j in range(len(Vx[i])):
            Vt = Vt + Vx[i][j][k];
        for j in range(len(Vx[i])):
            if refuerzo[k] !=0:
                l = 100
            else:
                l = 0
            if estimulos[i][j][k] != 0:
                Vx[i][j][k+1] = Vx[i][j][k] + a*(l -Vt)
            else:
                Vx[i][j][k+1] = Vx[i][j][k]

time = range(len(est1))
max_time = len(time)
fig, ax = plt.subplots(len(estimulos)*len(estimulos[0]),2*fases)
for i in range(len(estimulos)):
    for j in range(len(estimulos[i])):
        for k in range(fases):
            idx0 = max_time/fases*k
            idx1 = max_time/fases*(k+1) - 1
            #ax[i*len(estimulos[i]) + j,k*2 + 0].axis([idx0,idx1, -0.2, 1.2])
            ax[i*len(estimulos[i]) + j,k*2 + 0].axis([idx0,idx1, -0.2, 1.2])
            ax[i*len(estimulos[i]) + j,k*2 + 0].plot(time[idx0:idx1], estimulos[i][j][idx0:idx1], 'ro')
            ax[0,k*2 + 0].set_title('Fase' + str(k+1), fontsize=16)
            #ax[i*len(estimulos[i]) + j,k*2 + 1].axis([idx0,idx1,-3,110])
            ax[i*len(estimulos[i]) + j,k*2 + 1].axis([idx0,idx1,-3,110])
            ax[i*len(estimulos[i]) + j,k*2 + 1].plot(time[idx0:idx1], Vx[i][j][idx0:idx1], linewidth=5.0)
            #ax[0,k*2 + 1].set_title('Aprendizaje')
       
fig.suptitle('Modelo Rescorla & Wagner', fontsize=14, fontweight='bold')
fig.text(0.06, 0.7, 'Bloqueo', va='center', rotation='vertical', fontsize=16)
fig.text(0.06, 0.3, 'Control', va='center', rotation='vertical', fontsize=16)
#ax[len(estimulos),0].axis([0,max_time,-1, 2])
#ax[len(estimulos),0].plot(time, refuerzo)
plt.show()
