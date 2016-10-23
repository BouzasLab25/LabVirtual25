# -*- coding: utf-8 -*-
"""
Created on Tue Oct 11 10:38:21 2016

@author: Alejandro
"""

import matplotlib.pyplot as plt
import numpy as np
import matplotlib.mlab as mlab
import math
import scipy.stats


hits = 90
Falarms = 20
hitRate = hits/100.0
faRate = Falarms/100.0

k = scipy.stats.norm(0, 1).ppf(1-faRate)
d = (scipy.stats.norm(0,1).ppf(hitRate))-(scipy.stats.norm(0,1).ppf(faRate))
c = k-(d/2)
b = (scipy.stats.norm(d,1).pdf(k))/(scipy.stats.norm(0,1).pdf(k))
print(d,k,c,b)

#Dibujamos la distribucion de ruido
mu = 0
variance = 1
sigma = math.sqrt(variance)
x = np.linspace(-4, 6, 100)
plt.plot(x,mlab.normpdf(x, mu, sigma), 'black')
plt.plot(x,mlab.normpdf(x, d, sigma), 'blue')
plt.ylim(0,0.5)
plt.xlabel('Evidencia')
plt.ylabel('Probabilidad')
plt.text(0,0.41, 'Ruido', ha='center', va='bottom')
plt.text(d,0.41, 'Senal', ha='center', va='bottom')
plt.fill_between(x, 0, scipy.stats.norm(d,1).pdf(x), facecolor='blue', alpha=0.5)
plt.fill_between(x, 0, scipy.stats.norm(0,1).pdf(x), facecolor='gray', alpha=0.5)
plt.title('Representacion Grafica TDS',fontweight='bold')
plt.show()


#D'
plt.plot(x,mlab.normpdf(x, mu, sigma), 'black')
plt.plot(x,mlab.normpdf(x, d, sigma), 'blue')
plt.ylim(0,0.5)
plt.xlabel('Evidencia')
plt.ylabel('Probabilidad')
plt.text(0,0.41, 'Ruido', ha='center', va='bottom')
plt.text(d,0.41, 'Senal', ha='center', va='bottom')
plt.plot([0,0],[0,0.4], 'purple')
plt.plot([d,d],[0,0.4], 'purple')
plt.plot([0,d],[0.3,0.3], 'purple')
plt.text(d/2, 0.32, 'd', ha='center', va='bottom', color='purple' )
plt.title('Discriminabilidad: D prima',fontweight='bold')
plt.show()


#K
plt.plot(x,mlab.normpdf(x, mu, sigma), 'black')
plt.plot(x,mlab.normpdf(x, d, sigma), 'blue')
plt.ylim(0,0.5)
plt.xlabel('Evidencia')
plt.ylabel('Probabilidad')
plt.text(0,0.41, 'Ruido', ha='center', va='bottom')
plt.text(d,0.41, 'Senal', ha='center', va='bottom')
plt.plot([k,k],[0,0.5], 'red')
plt.text(k+0.3, 0.32, 'k', ha='center', va='bottom', color='red' )
plt.title('Criterio: K',fontweight='bold')
plt.show()


#C
plt.plot(x,mlab.normpdf(x, mu, sigma), 'black')
plt.plot(x,mlab.normpdf(x, d, sigma), 'blue')
plt.ylim(0,0.5)
plt.xlabel('Evidencia')
plt.ylabel('Probabilidad')
plt.text(0,0.41, 'Ruido', ha='center', va='bottom')
plt.text(d,0.41, 'Senal', ha='center', va='bottom')
plt.plot([d/2,d/2],[0,0.5], '#A76100')
plt.plot([k,k],[0,0.5], '#A76100')
plt.plot([d/2,k],[0.3,0.3], '#A76100')
plt.text(d/2+0.3, 0.47, 'c', ha='center', va='bottom', color='#A76100' )
plt.title('Sesgo: C',fontweight='bold')
plt.show()


#B
plt.plot(x,mlab.normpdf(x, mu, sigma), 'black')
plt.plot(x,mlab.normpdf(x, d, sigma), 'blue')
plt.ylim(0,0.5)
plt.xlabel('Evidencia')
plt.ylabel('Probabilidad')
plt.text(0,0.41, 'Ruido', ha='center', va='bottom')
plt.text(d,0.41, 'Senal', ha='center', va='bottom')
plt.plot([k,k],[scipy.stats.norm(d,1).pdf(k),scipy.stats.norm(0,1).pdf(k)], 'bo')
plt.plot([k,k],[0,0.5], 'blue')
plt.text(d/2, 0.32, 'd', ha='center', va='bottom', color='purple' )
plt.title('Sesgo: Beta',fontweight='bold')
plt.show()