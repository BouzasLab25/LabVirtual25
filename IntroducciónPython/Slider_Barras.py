# -*- coding: utf-8 -*-
"""
GRAFICADORES CON SLIDER

Created on Tue Jun 27 23:02:50 2017
@author: Adriana Felisa

#OBJETIVO: Trazar una gráfica de barras para dos valores (dos barras) que se actualice con un slider
#NOTA: Recordemos que se recomienda correr este codigo con la configuración:
    #Ejecutar -> Configurar -> Ejecutar en una terminal de Python dedicada...
    
    http://html-color-codes.info/            <- Sitio recomendado para obtener codigos HTML por color"""

    
#######################################################################################################
#######################################################################################################
"""Cargamos nuestras librerias"""
from matplotlib.widgets import Slider          #Cargamos la libreria para hacer Sliders
import matplotlib.pyplot as plt                #Cargamos la libreria para hacer graficas y la nombramos 'plt' (pa' más corto)

"""Variables a plotear """
Ana = 8.0                 #Creamos dos variables con los valores a graficar
Pepe = 6.0
Alumnos = [Ana, Pepe]     #Acomodamos nuestros datos en un arreglo

"""Distribuimos el espacio"""
fig, ax = plt.subplots()                           #Ampliamos nuestro espacio para poder generar dos sub-graficos (uno para la grafica principal y otro para mostrar los sliders)
plt.subplots_adjust(left=0.1, bottom=0.25)         #Especificamos los márgenes de nuestras figuras respecto de la ventana

"""Dibujamos BARRAS"""                
b_Ana = ax.bar(0.3, Alumnos[0], facecolor='#48B21E', width=0.5)      #Dibujamos la primer barra para Ana
b_Pepe = ax.bar(1, Alumnos[1], facecolor='#1E1EB2', width=0.5)        #Dibujamos una segunda barra para Pepe
        #La función bar (Barra) tiene los siguientes argumentos:  (Ubicación en x, valor a graficar, color, ancho)
ax.axis([0.1, 1.7, 0.0, 10.15])                                   #Especificamos las dimensiones de nuestra gráfica
     #La función axis (Dimensión de los ejes) tiene los siguientes argymentos:
     #los primeros dos valores corresponden al rango abarcado en el eje X y los ultimos fod, en Y.

"""Personalizamos la grafica"""
ax.set_title('Bar Plot con Slider', fontsize=17, fontweight='bold')  #Añadimos un titulo a la grafica
ax.set_xlabel('Casos')                  #Damos un nombre al eje de las abscisas
ax.set_ylabel('Frecuencia')             #Damos un nombre al eje de las ordenadas

"""Añadimos un texto con el valor de cada barra"""
ax.text(0.55, Alumnos[0]+0.02, '%.2f' %Alumnos[0], ha='center', va='bottom') #Escribimos el valor correspondiente a la barra 'Ana'
ax.text(1.25, Alumnos[1]+0.02, '%.2f' %Alumnos[1], ha='center', va='bottom') #Escribimos el valor correspondiente a la barra 'Pepe'
    #La función text tiene los siguientes argumentos
            #(Coordenadas x, coordenadas y, valor a pegar, posición horizontal, posición vertical)
            #'%.2f'indica que sólo pegue los primeros dos valores flotantes de la variable identificada con un % (%Alumnos)
    
"""¡Hacemos los Sliders!"""
rect_A = plt.axes([0.15, 0.12, 0.65, 0.03], axisbg='#BCE2C2')     #Comenzamos dibujando un rectángulo, indicando su área y color default (El fondo)
                    #Especificamos su ubicacion (Punto de partida en X, Punto de partida en y, ancho (respecto al punto inicial x), y alto (respecto a y) 
                    #Esta ubicación es respecto a la ventana donde sale el output, NO A LA GRAFICA DE BARRAS
                    
slider_A = Slider(rect_A, 'Ana', 0.01, 10.0, facecolor='#03B335', valinit=Ana)      #Le asignamos la función Slider
              #Asignamos la función Slider al rectángulo dibujado antes, le damos un nombre, asignamos el valor mínimo y máximo del slider
              #Ponemos un color al área sombreada del Slider y asignamos como valor inicial el valor default declarado al comienzo del código
              
rect_B = plt.axes([0.15, 0.07, 0.65, 0.03], axisbg='#BCC5E2')     #Dibujamos un segundo rectángulo para el Slider de Pepe
slider_B = Slider(rect_B, 'Pepe', 0.01, 10.0, facecolor='#0332B3', valinit=Pepe)          #Asignamos la funcion Slider


"""Comienza LA MAGIA... al pedirle a Python que genere una nueva gráfica cada que se cambie el valor del Slider..."""
def update(adri):         # Creamos una funcion para actualizar nuestra grafica
    Ana = slider_A.val    # Esta vez, definimos el valor de las variables con el valor de los Slider 
    Pepe = slider_B.val 
    Alumnos[0] = Ana      # Sobreescribimos los elementos en nuestro arreglo original
    Alumnos[1] = Pepe 
    ax.clear()            #Limpiamos la grafica para poder dibujar sobre ella
    ax.bar(0.3, Alumnos[0], facecolor='#48B21E', width=0.5)   #Trazamos nuestra barra para Ana actualizada al Slider
    ax.bar(1, Alumnos[1], facecolor='#1E1EB2', width=0.5)     #Trazamos la barra de Pepe actualizado
    ax.text(0.55, Alumnos[0]+0.02, '%.2f' %Alumnos[0], ha='center', va='bottom') #Escribimos el valor correspondiente al valor del Slider Ana
    ax.text(1.25, Alumnos[1]+0.02, '%.2f' %Alumnos[1], ha='center', va='bottom') #Escribimos el valor del Slider Pepe
    ax.axis([0.1, 1.7, 0.0, 10.15])                                              #Mantenemos las mismas dimensiones de la gráfica
    ax.set_title('Bar Plot con Sliders', fontsize=25, fontweight='bold')         #Repetimos el titulo
    ax.set_xlabel('Casos')          # Repetimos el nombre del eje de las abscisas
    ax.set_ylabel('Frecuencias')    # Repetimos el nombre del eje de las ordenadas
slider_A.on_changed(update) #Llamamos la funcion de actualizacion por cada movimiento en el Slider de Ana
slider_B.on_changed(update) #Llamamos la funcion de actualizacion por cada movimiento en el Slider de Pepe
plt.show() #Imprimimos la grafica

