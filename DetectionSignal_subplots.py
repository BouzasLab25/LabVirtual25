# -*- coding: utf-8 -*-
"""
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
f, ax = plt.subplots(5, sharex=False)
plt.subplots_adjust(hspace=0.6)


k = scipy.stats.norm(0, 1).ppf(1-faRate)
d = (scipy.stats.norm(0,1).ppf(hitRate))-(scipy.stats.norm(0,1).ppf(faRate))
c = k-(d/2)
b = (scipy.stats.norm(d,1).pdf(k))/(scipy.stats.norm(0,1).pdf(k))
#print(d,k,c,b)

#Dibujamos la distribucion de ruido
mu = 0
variance = 1
sigma = math.sqrt(variance)
x = np.linspace(-4, 6, 100)
ax[0].plot(x,mlab.normpdf(x, mu, sigma), 'black')
ax[0].plot(x,mlab.normpdf(x, d, sigma), 'blue')
ax[0].set_ylim(0,0.5)
ax[0].set_ylabel('Probabilidad')
ax[0].text(0,0.41, 'Ruido', ha='center', va='bottom')
ax[0].text(d,0.41, 'Senal', ha='center', va='bottom')
ax[0].fill_between(x, 0, scipy.stats.norm(d,1).pdf(x), facecolor='blue', alpha=0.5)
ax[0].fill_between(x, 0, scipy.stats.norm(0,1).pdf(x), facecolor='gray', alpha=0.5)
ax[0].set_title('Representacion Grafica TDS',fontweight='bold')


#D'
ax[1].plot(x,mlab.normpdf(x, mu, sigma), 'black')
ax[1].plot(x,mlab.normpdf(x, d, sigma), 'blue')
ax[1].set_ylim(0,0.5)
ax[1].set_ylabel('Probabilidad')
ax[1].text(0,0.41, 'Ruido', ha='center', va='bottom')
ax[1].text(d,0.41, 'Senal', ha='center', va='bottom')
ax[1].plot([0,0],[0,0.4], 'purple')
ax[1].plot([d,d],[0,0.4], 'purple')
ax[1].plot([0,d],[0.3,0.3], 'purple')
ax[1].text(d/2, 0.32, 'd', ha='center', va='bottom', color='purple' )
ax[1].set_title('Discriminabilidad: D prima',fontweight='bold')



#K
ax[2].plot(x,mlab.normpdf(x, mu, sigma), 'black')
ax[2].plot(x,mlab.normpdf(x, d, sigma), 'blue')
ax[2].set_ylim(0,0.5)
ax[2].set_ylabel('Probabilidad')
ax[2].text(0,0.41, 'Ruido', ha='center', va='bottom')
ax[2].text(d,0.41, 'Senal', ha='center', va='bottom')
ax[2].plot([k,k],[0,0.5], 'red')
ax[2].text(k+0.3, 0.32, 'k', ha='center', va='bottom', color='red' )
ax[2].set_title('Criterio: K',fontweight='bold')


#C
ax[3].plot(x,mlab.normpdf(x, mu, sigma), 'black')
ax[3].plot(x,mlab.normpdf(x, d, sigma), 'blue')
ax[3].set_ylim(0,0.5)
ax[3].set_ylabel('Probabilidad')
ax[3].text(0,0.41, 'Ruido', ha='center', va='bottom')
ax[3].text(d,0.41, 'Senal', ha='center', va='bottom')
ax[3].plot([d/2,d/2],[0,0.5], '#A76100')
ax[3].plot([k,k],[0,0.5], '#A76100')
ax[3].plot([d/2,k],[0.3,0.3], '#A76100')
ax[3].text(d/2+0.3, 0.37, 'c', ha='center', va='bottom', color='#A76100' )
ax[3].set_title('Sesgo: C',fontweight='bold')


#B
ax[4].plot(x,mlab.normpdf(x, mu, sigma), 'black')
ax[4].plot(x,mlab.normpdf(x, d, sigma), 'blue')
ax[4].set_ylim(0,0.5)
ax[4].set_ylabel('Probabilidad')
ax[4].text(0,0.41, 'Ruido', ha='center', va='bottom')
ax[4].text(d,0.41, 'Senal', ha='center', va='bottom')
ax[4].plot([k,k],[scipy.stats.norm(d,1).pdf(k),scipy.stats.norm(0,1).pdf(k)], 'bo')
ax[4].plot([k,k],[0,0.5], 'blue')
ax[4].text(d/2, 0.32, 'd', ha='center', va='bottom', color='purple' )
ax[4].set_title('Sesgo: Beta',fontweight='bold')
plt.show()