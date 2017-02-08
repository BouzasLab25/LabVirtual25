#Cargamos las librerias necesarias
import numpy                      #Biblioteca para operaciones matematicas complejas
from matplotlib.widgets import Slider, Button  #Bajamos la libreria para hacer Sliders
import matplotlib.pyplot as plt #Bajamos la libreria para hacer graficas

### Ley de Igualacion ###

#Parametros del modelo
s = 0.5  #sensibilidad
b = 0.5 #sesgo
 
#Variables del modelo
TR = numpy.arange (0, 1.001, 0.001) #Tasa relativa de refuerzo
TB = numpy.zeros(len(TR)) #Tasa relativa de respuesta

fig, ax = plt.subplots()                           #Ampliamos nuestro espacio para poder generar dos graficos por separado (uno para la grafica principal y otro para mostrar los sliders)
plt.subplots_adjust(left=0.1, bottom=0.25)        #Especificamos la relacion entre los espacios fig y ax

for k in range(len(TR)-2):
    TB[k] = b*TR[k]**s

#Despliegue de la grafica
ax.plot(TR, TB, linewidth=5.0)
ax.set_xlabel('Tasa relativa de refuerzo')
ax.set_ylabel('Tasa relativa de respuesta')
ax.set_title('Ley de Igualacion', fontsize=14, fontweight='bold')

ax_s = plt.axes([0.15, 0.1, 0.65, 0.03], axisbg="#BCE2C2")
slider_s = Slider(ax_s,"sensibilidad",0.01, 1, facecolor='#03B335',valinit=0.5)
ax_b = plt.axes([0.15, 0.05, 0.65, 0.03], axisbg='#BCC5E2')
slider_b = Slider(ax_b, 'sesgo', 0.01, 1, facecolor='#0332B3', valinit=0.5)

def update(var):
    s = slider_s.val  
    b = slider_b.val
    for k in range(len(TR)-1):
    	TB[k] = b*TR[k]**s
    ax.clear()
    ax.plot(TR, TB, linewidth=5.0)
    ax.set_xlabel('Tasa relativa de refuerzo')
    ax.set_ylabel('Tasa relativa de respuesta')
    ax.set_title('Ley de Igualacion', fontsize=14, fontweight='bold')
    ax.set_ylim(0, 1.01)
slider_s.on_changed(update)
slider_b.on_changed(update)
plt.show()