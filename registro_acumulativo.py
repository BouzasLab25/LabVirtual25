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

ensayos = []
sim = 1

x = np.linspace(-3.0, 3.0, 301)

y = st.norm.rvs(loc=2, scale=1, size=301)

print y

plt.plot(x, st.norm.pdf(x, loc = 0, scale = np.sqrt(0.5)))

#plt.plot(x, y)

plt.axis([-3.0, 3.0, 0.0, 1.15])

plt.show()