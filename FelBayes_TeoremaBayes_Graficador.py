# -*- coding: utf-8 -*-
"""
Created on Mon Oct 03 15:25:42 2016

@author: Felisa & Edgar
"""
#Cargamos las librerias necesarias
from matplotlib.widgets import Slider, Button  #Bajamos la libreria para hacer Sliders
import matplotlib.pyplot as plt #Bajamos la libreria para hacer graficas

#Definimos los valores iniciales, con los que va a correr el simulador 'por default'
A = 0.5                     #Prior inicial del Evento A
NoA = 1-A                   #Prior inicial del Evento No A
v_A = 0.5                   #Verosimilitud inicial del Evento A respecto de los Datos
v_NoA = 0.5                 #Verosimilitud inicial del Evento B respecto de los Datos
v_m = ((A)*(v_A))+((NoA)*(v_NoA))   #Verosimilitud marginal, calculada a partir de los valores iniciales
post_A=((A)*(v_A))/v_m              #Posterior del Evento 1, de acuerdo a los valores iniciales
post_NoA=1-post_A                   #Posterior del Evento 2, definida como complemento de la Posterior del Evento 1
prob= [post_A,post_NoA]             #Agrupamos las posteriores en un arreglo, para facilitar su representacion

fig, ax = plt.subplots()                           #Ampliamos nuestro espacio para poder generar dos graficos por separado (uno para la grafica principal y otro para mostrar los sliders)
plt.subplots_adjust(left=0.1, bottom=0.25)        #Especificamos la relacion entre los espacios fig y ax

b1 = ax.bar(0.3, prob[0], facecolor='#F70C0C')        #Dibujamos la primer barra, correspondiente a la Posterior de A dados los valores iniciales
b2 = ax.bar(1.5, prob[1], facecolor='#BF6E6E')        #Dibujamos una segunda barra, correspondiente al Complemento de la Posterior de A

ax.text(0.72, prob[0]+0.02, '%.6f' %prob[0], ha='center', va='bottom')   #Escribimos encima de cada barra el valor
ax.text(1.9, prob[1]+0.02, '%.6f' %prob[1], ha='center', va='bottom')   #correspondiente a su posterior

labels = ['Evento A','Evento B']        #Creamos un arreglo con las etiquetas que colocaremos en el eje de las abscisas
ax.set_xticks([1, 2], labels)           #Colocamos las etiquetas en los espacios correspondientes
ax.set_title('Teorema de Bayes', fontsize=25, fontweight='bold')  #Añadimos un titulo a la grafica
ax.set_xlabel('Escenarios Posibles')    #Damos un nombre al eje de las abscisas
ax.set_ylabel('Probabilidad Posterior')           #Damos un nombre al eje de las ordenadas
ax.axis([0.0, 5.0, 0.0, 1.15])           #Especificamos las dimensiones de la grafica principal; los primeros dos valores corresponden al rango abarcado por el eje X y los ultimos, al eje Y.
 
#Insertamos la Ecuacion de Bayes en la grafica
ax.plot([3.5,4.8],[0.9,0.9], 'k', linewidth=2) #Insertamos dos lineas
ax.plot([3.5,4.8],[0.4,0.4], 'k', linewidth=2)
ax.text(3.1, 0.86, 'p(A|B) =', color='#F70C0C', ha='center', va='bottom', fontsize=15)   #Escribimos los terminos que componen la Regla
ax.text(3.8, 0.92, 'p(A)', ha='center', va='bottom', fontsize=15)   
ax.text(4.5, 0.92, 'p(B|A)', ha='center', va='bottom', fontsize=15)   
ax.text(4.15, 0.81, 'p(B)', ha='center', va='bottom', fontsize=15)   

ax.text(3.1, 0.36, 'p(A|B) =', color='#F70C0C', ha='center', va='bottom',fontsize=15)   #Volvemos a insertar los terminos, sustituyendolos por el valor de los sliders
ax.text(3.8, 0.42, '(%.3f)' %A, color='#2C8409', ha='center', va='bottom') 
ax.text(4.5, 0.42, '(%.3f)' %v_A, color='#3552D5', ha='center', va='bottom')  
ax.text(4.15, 0.32, '(%.3f)' %v_m, color='#32A5E7', ha='center', va='bottom')   

ax_probA = plt.axes([0.15, 0.12, 0.65, 0.03], axisbg='#BCE2C2')     #Dibujamos el primer slider, especificamos su ubicacion (Limite izquierdo en X, limite inferior en y, limite derecho en X y altura apartir de su origen en Y), y el color.
s_prob = Slider(ax_probA, 'p(A)', 0.01, 1.0, valinit=A)             #Asignamos la funcionalidad de slider, le damos un nombre, especificamos los valores entre los que puede variar y asignamos como valor inicial el default especificado al principio del codigo

ax_verA = plt.axes([0.15, 0.07, 0.65, 0.03], axisbg='#BCC5E2')      #Dibujamos el segundo slider, con las mismas dimensiones que el primero, pero situandolo en una altura distinta
s_verA = Slider(ax_verA, 'p(B|A)', 0.01, 1.0, valinit=v_A)          #Asignamos la funcion Slider, le damos unn nombre, definimos los valores entre los que peude variar y asignamos un valor inicial

ax_verNoA = plt.axes([0.15, 0.02, 0.65, 0.03], axisbg='#BCE1E2')    #Dibujamos el tercer slider
s_verNoA = Slider(ax_verNoA, 'p(B|No A)', 0.01, 1.0, valinit=v_NoA) #Asignamos la funcion de Slider, le damos nombre, un rango de valores y un valor inicial.

def update(adri):   # Creamos una funcion para actualizar nuestra grafica
    ver_mar = (((s_prob.val)*(s_verA.val))+((1-s_prob.val)*(s_verNoA.val)))  #Actualizamos el computo de la verosimilitud marginal, jalando los valores obtenidos por el slider
    posteriorA = (((s_prob.val)*(s_verA.val))/ver_mar) #Actualizamos el valor de la Posterior del Evento A, jalando los valores del slider.
    prob[0] = posteriorA # Graficamos la posterior del Evento A
    prob[1] = 1-prob[0] # Graficamos el complemento de la posterior del Evento A
    ax.clear() #Limpiamos la grafica para poder dibujar sobre ella
    ax.bar(0.3, prob[0], facecolor='#F70C0C') #Trazamos la Posterior Actiualizada del Evento A
    ax.bar(1.5, prob[1], facecolor='#BF6E6E') #Trazamos la Posterior Complementaria del Evento A
    ax.text(0.72, prob[0]+0.02, '%.6f' %prob[0], ha='center', va='bottom') #Escribimos el valor correspondiente a la Posterior Actualizada del Evento A
    ax.text(1.9, prob[1]+0.02, '%.6f' %prob[1], ha='center', va='bottom') #Escribimos el valor correspondiente a la Postrior Complementaria del Evento A
    ax.axis([0.0, 5.0, 0.0, 1.15]) #Mantenemos las dimensiones de la grafica como en un inicio
    ax.set_title('Teorema de Bayes', fontsize=25, fontweight='bold') #Reiteramos el titulo
    ax.set_xlabel('Escenarios Posibles') #Reiteramos el nombre del eje de las abscisas
    ax.set_ylabel('Probabilidad Posterior') #Reiteramos el nombre del eje de las ordenadas
    labels = ['Evento A','Evento B'] #Creamos un arreglo que contiene las etiquetas del eje de las abscisas
    ax.set_xticks([1, 2], labels) #Escribimos las etiquetas en los lugares correspondientes
    ax.plot([3.5,4.8],[0.9,0.9], 'k', linewidth=2) #Insertamos dos lineas
    ax.plot([3.5,4.8],[0.4,0.4], 'k', linewidth=2)
    ax.text(3.1, 0.86, 'p(A|B) =', color='#F70C0C', ha='center', va='bottom',fontsize=15)   #Escribimos los terminos que componen la Regla
    ax.text(3.8, 0.92, 'p(A)', ha='center', va='bottom',fontsize=15)   
    ax.text(4.5, 0.92, 'p(B|A)', ha='center', va='bottom',fontsize=15)   
    ax.text(4.15, 0.81, 'p(B)', ha='center', va='bottom',fontsize=15)   
    ax.text(3.1, 0.36, 'p(A|B) =', color='#F70C0C', ha='center', va='bottom',fontsize=15)   #Volvemos a insertar los terminos, sustituyendolos por el valor de los sliders
    ax.text(3.8, 0.42, '(%.3f)' %s_prob.val, color='#2C8409', ha='center', va='bottom') 
    ax.text(4.5, 0.42, '(%.3f)' %s_verA.val, color='#3552D5', ha='center', va='bottom')  
    ax.text(4.15, 0.32, '(%.3f)' %ver_mar, color='#32A5E7', ha='center', va='bottom')   
s_prob.on_changed(update) #Llamamos la funcion de actualizacion por cada movimiento en el Slider de la Prior
s_verA.on_changed(update) #Llamamos la funcion de actualizacion por cada movimiento en el Slider de la Verosimilitud
s_verNoA.on_changed(update) #Llamamos la funcion de actualizacion por cada movimiento en el Slider de la Verosimilitud del evento No A
plt.show() #Imprimimos la grafica
