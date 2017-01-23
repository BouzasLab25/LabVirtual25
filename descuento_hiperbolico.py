# -*- coding: utf-8 -*-
"""
Editor de Spyder

Este es un archivo temporal
"""
#%%
"""Descuento temporal (Modelo hiperbolico)
                          v= M/(1+kD)                                 """
                    
import matplotlib.pyplot as plt

#Dibujemos la gráfica
def draw_graph(x,y):
    plt.plot(x,y)
    plt.xlabel("Demora del Reforzador")
    plt.ylabel("Valor del Reforzador")
    plt.title("Descuento Hiperbolico")
    plt.ylim(ymax = 3500, ymin = 0)
    plt.xlim(xmax=0, xmin=-150)
    
#Generando valores para la demora larga demorada
def generate_v_d_l(m):
    r = range(-150,0)
    #Creando una varibale vacía
    v = []
    # La constante de descuento k y la magnitud M
    #m = 100
    k = 1

    #Calculemos los diferentes valores de un reforzador en funcion de la demora
    for demora in r:
        valor= m / (1+k*-demora)
        v.append(valor)
    return r,v
    
#Generando para la demora corta inmediata
    
def generate_v_d_c(m):
    r = range(-140,0)
    #Creando una varibale vacía
    v = []
    # La constante de descuento k y la magnitud M
    #m = 100
    k = 1

    #Calculemos los diferentes valores de un reforzador en funcion de la demora
    for demora in r:
        valor= m / (1+k*-demora)
        v.append(valor)
    r=range(-150,-10)
    return r,v   
    #Llamando a la grafica
    
[delays, values] = generate_v_d_l(7000)
draw_graph(delays,values)
[delays, values] = generate_v_d_c(2000)
draw_graph(delays,values)

print(values)
plt.show()
#%%