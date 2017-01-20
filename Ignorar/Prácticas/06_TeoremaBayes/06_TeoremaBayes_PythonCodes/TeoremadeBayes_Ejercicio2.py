# -*- coding: utf-8 -*-
"""
Created on Fri Sep 30 13:33:09 2016

@author: Felisa
"""
#Cargamos las librerias necesarias 
from matplotlib.pylab import hist, show  #Importar la propiedad de histograma y mostrar, desde la libreria matplotlib
import matplotlib.pyplot as plt #Importamos la propiedad de gráficos desde la libreria matplotlib


#Ubicamos los datos relevantes en nuestro problema:
#Ek asesubi es pelirrojo y zurdo. 
#La probabilidad de ser oelirrojo es de .03 , y .15 de ser zurdo
#Hay un total de 30, 0000 habitantes
#El sospechoso es pelirrojo y zurdo

#Definimos los eventos posibles, siendo estos mutuamente exclusivos.
Evento_A = 'Es el asesino'
Evento_B = 'No es el asesino'
#Ubicamos los eventos posibles dentro de un arreglo '[]' para facilitar su representación gráfica.
Eventos_Posibles = [Evento_A,Evento_B]

#Definimos las Priors
#Solo necesitamos especificar una de las priors; asumiendo que la segunda es simplemente su complemento.
Prior_A = 1.0/30000.0 #Antes de ver su aspecto; la probabilidad de que este individuo en particular sea el asesino es de 1 entre el total de habitantes
Prior_B = 1-Prior_A #La probabilidad de que el asesino este entre cualquier otro de los habitantes, es el complemento
#Graficamos las probabilidades prior 
Priors =[Prior_A,Prior_B] #Arreglo que contiene las priors
plt.bar(0.6,Priors[0],facecolor='#42B419') #Barra para representar la primera prior 
plt.bar(1.6,Priors[1],facecolor='#81ED5A') #Barra para representar la segunda prior
plt.text(1,Priors[0]+0.01,'%.6f' %Priors[0], ha='center', va='bottom') #Escribimos el valor de la primer prior encima de la barra correspondiente
plt.text(2, Priors[1]+0.01, '%.6f' %Priors[1], ha='center',va='bottom') #Escribimos el valor de la segunda prior
plt.xlabel('Escenarios posibles') #Etiqueta del eje de las abscisas
plt.ylabel('Probabilidad') #Etiqueta del eje de las ordenadas
plt.title('Priors') #Titulo del primer gráfico
plt.ylim(0,1.1) #Rango de valores cubierto por el eje de las ordenadas
plt.xlim(0,3) #Longitud del eje de las abscisas
plt.xticks([1,2], Eventos_Posibles) # Etiquetas en el eje de las ordenadas
plt.margins(0.2) 
plt.subplots_adjust(bottom=0.15)
show() #Imprimimos la grafica

#Especificamos la Verosimilitud que relaciona los datos con cada escenario posible

#Para el Escenario 1 tenemos que:
Verosim_SospechosoPelirrojo_EsAsesino = 1  #Si el sospechoso fuera el asesino, la probabilidad de que comparta sus caracteristicas es de 1
Verosim_SospechosoNoPelirrojo_EsASesino=0 #Si el sospechoso fuera el asesino, seria imposible que tuviera un aspecto diferente
Verosimilitud_A = Verosim_SospechosoPelirrojo_EsAsesino  #Verosimilitud que relaciona los datos (Sujeto Pelirrojo y zurdo) con el Escenario a probar (Es el asesino)

#Para el Escenario 2
Verosim_SospechosoPelirrojo_NOAsesino=((0.03)*(0.15)) #Si el sospechoso no fuera el asesino, aun existe una probabilidad (pequeña) de que presente el mismo aspecto que el
Verosim_SospechosoNoPelirrojo_NOAsesino=1-((0.03)*(0.15)) #Si el sospechoso no es el asesino, la probabilidad de que no se vea como el es el complemento
Verosimilitud_B = Verosim_SospechosoPelirrojo_NOAsesino #Verosimilitud que relaciona los datos (Sujeto Pelirrojo y Zurdo) con el Segundo Escenario a probar (No es el asesino)

Verosimilitudes =[Verosim_SospechosoPelirrojo_EsAsesino, Verosim_SospechosoNoPelirrojo_EsASesino, Verosim_SospechosoPelirrojo_NOAsesino, Verosim_SospechosoNoPelirrojo_NOAsesino] #Creamos un arreglo quecontenga la verosimilitud que relaciona los datos posibkles con los escenarios a evaluar
plt.bar(0.4,Verosimilitudes[0],facecolor='#0B63AB', width=2) #Barra que corresponde a la probabilidad de que la apariencia del sospechoso empate con la del asesino, en caso de ser la misma persona
plt.bar(3.5,Verosimilitudes[1],facecolor='#7AB7E8', width=2) #Barra que corresponde a la probabilidad de que la apariencia del sospechoso sea distinta a la del asesino, asumiendo que se trata del mismo individuo
plt.bar(7.4,Verosimilitudes[2],facecolor='#0B63AB', width=2) #Barra para la probabilidad de que el sospechoso se vea como el asesino, sin ser el asesino
plt.bar(11.5,Verosimilitudes[3],facecolor='#7AB7E8', width=2) #DiBarra para la probabilidad de que el sospechoso tenga un aspecto distinto al asesino, dado que no es el mismo individuo
plt.text(1.3,Verosimilitudes[0]+0.01,'%.4f' %Verosimilitudes[0], ha='center', va='bottom') #Escribimos los valores de cada barra
plt.text(3.9, Verosimilitudes[1]+0.01, '%.4f' %Verosimilitudes[1], ha='center',va='bottom')
plt.text(8.4,Verosimilitudes[2]+0.01,'%.4f' %Verosimilitudes[2], ha='center', va='bottom')
plt.text(12.5, Verosimilitudes[3]+0.01, '%.4f' %Verosimilitudes[3], ha='center',va='bottom')
plt.xlabel('La probabilidad de cada evidencia posible bajo cada escenario posible')
plt.ylabel('Probabilidad') #Etiqueta para los ejes de las ordenadas y abscisas
plt.title('Verosimilitud')
plt.ylim(0,1.1)
plt.xlim(0,14) #Especificamos el espacio sobre el cual vamos a dibujar nuestras barras
plt.xticks([1,5,9.3,14], ['Pelirrojo|Asesino','No Pelirrojo|Asesino', 'Pelirrojo|No Asesino','No Pelirrojo|No Asesino']) #Pobemos un titulo a cada Barra, especificando la ubicacion donde se escribira
plt.margins(0.2) 
plt.subplots_adjust(bottom=0.15)
show()

#Calculamos la verosimilitud marginal
verosimilitud_marg = (((Prior_A)*(Verosimilitud_A))+((Prior_B)*(Verosimilitud_B)))

#Aplicamos la Regla de Bayes
#Escribimos la ecuacion sustituyendo cada termino por las variables previamente identificadas en el codigo
Posterior_A = ((Prior_A)*(Verosimilitud_A))/verosimilitud_marg
Posterior_B = ((Prior_B)*(Verosimilitud_B))/verosimilitud_marg
#Obtenemos una representacion grafica de nuestros resultados posteriores
probabilidades =[Posterior_A,Posterior_B] #Creamos un arreglo que contenga las Posteriores calculadas
plt.bar(0.6,probabilidades[0],facecolor='#BA0505') #Barra correspondiente a la probabilidad posterior del Escenario 1
plt.bar(1.6,probabilidades[1],facecolor='#F0A8BF')#Barra correspondiente al Escenario 2
plt.text(1,probabilidades[0]+0.01,'%.4f' %probabilidades[0], ha='center', va='bottom') #Escribimos el valor de la primer posterior
plt.text(2, probabilidades[1]+0.01, '%.4f' %probabilidades[1], ha='center',va='bottom') # Escribimos el valor de la segunda posterior
plt.xlabel('Escenarios posibles')
plt.ylabel('Probabilidad')
plt.title('Probabilidades Posteriores')
plt.ylim(0,1.1)
plt.xlim(0,3)
plt.xticks([1,2], Eventos_Posibles)
plt.margins(0.2)
plt.subplots_adjust(bottom=0.15)
show()
