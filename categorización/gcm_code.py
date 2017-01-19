import math

Ejemplares_A = [[10, 5], [7, 8], [9, 5], [10, 10], [1, 7]] 
Ejemplares_B = [[2, 5], [7, 6], [5, 5], [9, 4], [4, 5]]
Pruebas = [[2,3],[2,8],[5,5],[4,9],[8,10],[9,8]]
rho = 2.0 # Parámetro de métrica r-minkowsky
w = 0.5 # Parámetro atención
c = 1.0 # Parámetro sensibilidad

s_A = [] #
s_B = [] # Necesario abrir vector nulo para poder agregar valores a lista



for i in range(len(Pruebas)):
	s_A.append(0)
	d_A = 0 
	
	for a in range(len(Ejemplares_A)):

		d_A = d_A + c*((w*(abs(Ejemplares_A[a][0] - Pruebas[i][0])**rho) + 
		(1 - w)*(abs(Ejemplares_A[a][1] - Pruebas[i][1])**rho))**(1/rho))
	
	d_A = d_A/len(Ejemplares_A) #Promedia la distancia entre prueba y cada ejemplo de la categoría

	s_A[i]= math.exp(-d_A)

	print "similitudes de pruebas con categoria A " + ":"  + str(s_A[i])

				

for i in range(len(Pruebas)):
	s_B.append(0) #append agrega valores de similitud a este vector
	d_B = 0

	for b in range(len(Ejemplares_B)):

		d_B = d_B+ c*((w*(abs(Ejemplares_B[b][0] - Pruebas[i][0])**rho) + 
		(1 - w)*(abs(Ejemplares_B[b][1] - Pruebas[i][1]))**rho)**(1/rho))

		


	d_B = d_B/len(Ejemplares_B)

	s_B[i]= math.exp(-d_B)

	print "similitud de " + str(Pruebas[i]) + "con categoria B " + ":" + str(s_A[i])

for i in range(len(s_B)):

	if s_B[i] > s_A[i]: 		
		print "Prueba " + str(Pruebas[i]) + " pertenece a categoria B"
	else:
		print "Prueba pertenece a categoria A"



