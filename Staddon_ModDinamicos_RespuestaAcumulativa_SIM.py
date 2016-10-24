#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
	Codigo de "Registro acumulativo de respuestas"
	Traducido de codigo R
"""

import numpy as np
import scipy.stats as st
import matplotlib.pyplot as plt

Kn = 0.9
Kr = 0.9

ensayos = 120
sim = 3

p = np.zeros((ensayos, sim))
print(p)
c = np.zeros((ensayos, sim))
suma = np.zeros((ensayos, sim))
x = np.linspace(0, ensayos, ensayos)
#print(c)

FI_value = 10
FI = np.zeros((ensayos))

a = 0

for i in range(ensayos):
    if a == 9:
        FI[i] = 1
        a = 0
    else:
        FI[i] = 0
        a = a + 1
        
print(FI)

for i in range(ensayos):
    for j in range(sim):
        if i < ensayos-1:
            p[i+1][j] = Kn*p[i][j]+(FI[i]*Kr*(1-p[i][j]))
            c[i][j] = st.binom.rvs(1,p[i][j])
            suma[i+1][j]= c[i][j]+suma[i][j]
print(p)
print (c)
print (suma)


plt.axis([0.0, ensayos, 0.0, ensayos-9]) 
plt.title('Modelo 1', fontsize=25, fontweight='bold')  #Añadimos un titulo a la grafica
plt.xlabel('Tiempo')    #Damos un nombre al eje de las abscisas
plt.ylabel('Respuestas Acumuladas')  
plt.plot(x, suma)
plt.show()