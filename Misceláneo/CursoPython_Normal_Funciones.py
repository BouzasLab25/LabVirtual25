# -*- coding: utf-8 -*-
"""
Created on Fri Jun 30 11:07:06 2017

@author: Adriana
"""
import matplotlib.pyplot as plt
import numpy as np
import matplotlib.mlab as mlab
import math
import scipy.stats

mu = 0
varianza = 1
sigma = math.sqrt(varianza)
x = np.linspace(-6,6, 100)

valor = 3


plt.plot(x,mlab.normpdf(x,mu, sigma))
plt.plot([valor,valor], [0,0.55], 'red')

plt.show()

"""Obteniendo PDF's"""
pdf = scipy.stats.norm(0,1).pdf(valor)
print(pdf)
print(scipy.stats.norm(0,1).pdf(valor))
"""Obtener CDF's"""
cumulative = scipy.stats.norm(0,1).cdf(valor)
print(cumulative)
print(scipy.stats.norm(0,1).cdf(valor))
"""Obtener Puntajes Z"""
Z = scipy.stats.norm(0,1).ppf(cumulative)
print(Z)

















