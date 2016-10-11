#Librerias necesarias para crear ventanas y graficas a la vez
import matplotlib
import math
import numpy
matplotlib.use("TkAgg")
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg, NavigationToolbar2TkAgg
from matplotlib.figure import Figure
from Tkinter import *
import matplotlib.animation as animation
import matplotlib.pyplot as plt
import Tkinter as tk
import ttk


LARGE_FONT = ("Verdana", 14) 



root = Tk()
var = DoubleVar()

f = Figure(figsize=(4,4), dpi=100)
graph = f.add_subplot(111)


### RESCORLA-WAGNER ###

#Parametros del modelo
a = 0.3  #alpha
b = 0.15 #beta
l = 100  #lambda

#Variables del modelo
Ensayos= 100
AV = [0]*(Ensayos) #Incremento en V
V = [0]*(Ensayos)  #Valor de V

for k in range(0,(Ensayos-1)):
    AV[k] = a*b*(l - V[k])

    V[k+1] = V[k] + AV[k]
   
    print "AV: " + str(AV[k]) + " - " + " V: "+ str(V[k]) + " alpha: " + str(a) + " beta: " + str(b) + "lambda:" + str(l)


graph.clear()
graph.plot(Ensayos,V)

label = tk.Label(root, text="Ventana temporal (Estimulo unico)", font=LARGE_FONT)
label.pack(pady=10,padx=10)

canvas = FigureCanvasTkAgg(f, root)
canvas.show()
canvas.get_tk_widget().pack(side=tk.BOTTOM, fill=tk.BOTH, expand=True)

toolbar = NavigationToolbar2TkAgg(canvas, root)
toolbar.update()
canvas._tkcanvas.pack(side=tk.TOP, fill=tk.BOTH, expand=True)

label = tk.Label(root, text="a = 0.2", font=LARGE_FONT)
label.pack(pady=10,padx=10)

scale = Scale( root, from_=0, to=1.2, orient="horizontal", variable = var )
scale.pack(anchor=CENTER)

label = Label(root)
label.pack()

root.mainloop()