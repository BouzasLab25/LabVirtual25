# -*- coding: utf-8 -*-
"""
Created on Fri Sep 30 13:33:09 2016

@author: AdriFelCha
"""
#Cargamos las librerias necesarias 
from matplotlib.pylab import hist, show  #Importar la propiedad de histograma y mostrar, desde la libreria matplotlib
import matplotlib.pyplot as plt #Importamos la propiedad de gráficos desde la libreria matplotlib


#Ubicamos los datos relevantes en nuestro problema:
#1) Preparaste 50 tartas de vainilla y 50 tartas de fresa envenenadas.
#2) En el castillo ya habían 170 tartas de vainilla y 30 tartas de fresa hechas.
#3) Revuelves las tartas Envenenadas con las No envenenadas.
#4) Te obligan a comer una tarta extraida aleatoriamente del monton. 
#5)La tarta es de vainilla. 
#¿Cuál es la probabilidad de que mueras al comerla?

#Definimos los eventos posibles, siendo estos mutuamente exclusivos.
Evento_A = 'Veneno'
Evento_B = 'No Veneno'
#Ubicamos los eventos posibles dentro de un arreglo '[]'
#esto nos servirá más adelante para facilitar su representación gráfica.
Eventos_Posibles = [Evento_A,Evento_B]

#Definimos las Priors
#Cuando sólo existen dos escenarios posibles, mutuamente excluyentes,
#solo necesitamos especificar una de las priors; asumiendo que la segunda 
#es simplemente su complemento.
Prior_A = 0.333 #Solo 100 de las 300 tartas en el castillo estan envenenadas
Prior_B = 1-Prior_A
#Graficamos las probabilidades prior 
Priors =[Prior_A,Prior_B] #Creamos un arreglo que contenga las priors
plt.bar(0.6,Priors[0],facecolor='#52E150')  #Dibujamos una barra para representar la primera prior 
plt.bar(1.6,Priors[1],facecolor='#B9E0B9') #Dibujamos una barra para representar la segunda prior
plt.text(1,Priors[0]+0.05,'%.4f' %Priors[0], ha='center', va='bottom') #Escribimos el valor de la primer prior encima de la barra
plt.text(2, Priors[1]+0.05, '%.4f' %Priors[1], ha='center',va='bottom') #Escribimos el valor de la segunda prior
plt.xlabel('Escenarios posibles') #Asignamos una etiqueta al eje de las abscisas
plt.ylabel('Probabilidad') #Asignamos una etiqueta al eje de las ordenadas
plt.title('Priors') #Titulo de nuestro primer gráfico
plt.ylim(0,1) #Rango de valores cubierto por el eje de las ordenadas
plt.xlim(0,3) #Longitud del eje de las abscisas
plt.xticks([1,2], Eventos_Posibles) # Pedimos que coloque cada uno de nuestros eventos posibles en las ubicaciones 1y 2 en X
plt.margins(0.2) 
plt.subplots_adjust(bottom=0.15)
show() #Imprimimos la grafica

#Especificamos la Verosimilitud que relaciona los datos con cada escenario posible

#Para el Escenario 1 tenemos que:
Tartas_Veneno = 100.0 #Total de tartas envenenadas
Veneno_Vainilla = 50.0 #De las cuales, la mitad son de vainilla
Veneno_Fresa = 50.0 #Y la otra mitad, de fresa
Verosim_Vainilla_Veneno = Veneno_Vainilla/Tartas_Veneno #La probabilidad de sacar una tarta de vainilla puede expresarse como la razón de tartas de vainilla y tartas envenenadas
Verosim_Fresa_Veneno = Veneno_Fresa/Tartas_Veneno #La probabilidad de sacar una tarta de fresa, tambien puede expresarse como una razon
Verosimilitud_A = Verosim_Vainilla_Veneno #La verosimilitud que relaciona los datos (Tarta de Vainilla) con el Escenario 1 (Veneno) corresponde a la probabilidad de sacar una tarta de vainillad e dicho monton

#Para el Escenario 2
Tartas_NoVeneno = 200.0 #Total de tartas NO envenenadas
NoVeneno_Vainilla = 170.0 #De las cuales, 170 son de vainilla
NoVeneno_Fresa = 30.0 #y 30 de fresa
Verosim_Vainilla_NoVeneno = NoVeneno_Vainilla/Tartas_NoVeneno #La probabilidad de sacar una tarta de vainilla NO envenenada se expresa como una razon
Verosim_Fresa_NoVeneno = NoVeneno_Fresa/Tartas_NoVeneno #La probabilidad de sacar una tarta de fresa NO envenenada
Verosimilitud_B = Verosim_Vainilla_NoVeneno #La verosimilitud que relaciona la Tarta de Vainilla con el lote de tartas NO envenenadas, corresponde a la probabilidad de sacar una tarta de fresa de dicho monton



#Graficamos la Verosimilitud
Verosimilitudes =[Verosim_Vainilla_Veneno, Verosim_Fresa_Veneno,Verosim_Vainilla_NoVeneno, Verosim_Fresa_NoVeneno] #Creamos un arreglo quecontenga la verosimilitud que relaciona todos los datos posibkles (Sacar una tarta de vainilla o fresa) con los distintos escenarios contemplados (Veneno o No veneno)
plt.bar(0.4,Verosimilitudes[0],facecolor='#0B63AB', width=2) #Dibujamos la barra que corresponde a la probabilidad de sacar una tarta de Vainilla del lote Envenenado
plt.bar(3.5,Verosimilitudes[1],facecolor='#7AB7E8', width=2) #Dibujamos la barra que corresponde a la probabilidad de sacar una tarta de fresa del lote Envenenado
plt.bar(7.4,Verosimilitudes[2],facecolor='#0B63AB', width=2) #Dibujamos una barra para la probabilidad de sacar una tarta de vainilla del lote NO envenenado
plt.bar(11.5,Verosimilitudes[3],facecolor='#7AB7E8', width=2) #Dibujamos unabarra para la probabilidad de sacar una tarta de fresa del lote NO envenenado
plt.text(1.3,Verosimilitudes[0]+0.05,'%.4f' %Verosimilitudes[0], ha='center', va='bottom') #Escribimos los valores de cada barra
plt.text(3.9, Verosimilitudes[1]+0.05, '%.4f' %Verosimilitudes[1], ha='center',va='bottom')
plt.text(8.4,Verosimilitudes[2]+0.05,'%.4f' %Verosimilitudes[2], ha='center', va='bottom')
plt.text(12.5, Verosimilitudes[3]+0.05, '%.4f' %Verosimilitudes[3], ha='center',va='bottom')
plt.xlabel('La probabilidad de cada evidencia posible bajo cada escenario posible')
plt.ylabel('Probabilidad') #Colocamos una etiqueta a los ejes de las ordenadas y abscisas
plt.title('Verosimilitud')
plt.ylim(0,1)
plt.xlim(0,14) #Especificamos el espacio sobre el cual vamos a dibujar nuestras barras
plt.xticks([1.3,4.5,8.5,12.5], ['Vainilla|Veneno','Fresa|Veneno', 'Vainilla|No Veneno','Fresa|No Veneno']) #Pobemos un titulo a cada Barra, especificando la ubicacion donde se escribira
plt.margins(0.2) 
plt.subplots_adjust(bottom=0.15)
show()  

#Calculamos la verosimilitud marginal
#Escribimos tal cual la ecuacion revisada en el capitulo donde se define la verosimilitud marginal
#como la sumaatoria de los productos de las prior y verosimilitudes de los distintos escenarios posibles
verosimilitud_marg = (((Prior_A)*(Verosimilitud_A))+((Prior_B)*(Verosimilitud_B)))

#Aplicamos la Regla de Bayes
#Escribimos la ecuacion sustituyendo cada termino por las variables previamente identificadas en el codigo
Posterior_A = ((Prior_A)*(Verosimilitud_A))/verosimilitud_marg
Posterior_B = ((Prior_B)*(Verosimilitud_B))/verosimilitud_marg
#Obtenemos una representacion grafica de nuestros resultados posteriores
probabilidades =[Posterior_A,Posterior_B] #Creamos un arreglo que contenga las Posteriores computadas
plt.bar(0.6,probabilidades[0],facecolor='#BA0505') #dibujamos la barra correspondiente a la probabilidad posterior del Escenario 1
plt.bar(1.6,probabilidades[1],facecolor='#F0A8BF')#Dibujamos la barra correspondiente al Escenario 2
plt.text(1,probabilidades[0]+0.05,'%.4f' %probabilidades[0], ha='center', va='bottom') #Escribimos el valor de la primer posterior
plt.text(2, probabilidades[1]+0.05, '%.4f' %probabilidades[1], ha='center',va='bottom') # Escribimos el valor de la segunda posterior
plt.xlabel('Escenarios posibles')
plt.ylabel('Probabilidad')
plt.title('Probabilidades Posteriores')
plt.ylim(0,1)
plt.xlim(0,3)
plt.xticks([1,2], Eventos_Posibles)
plt.margins(0.2)
plt.subplots_adjust(bottom=0.15)
show()

