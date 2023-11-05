Algoritmo tpProgramacion
	
	Definir rutasAereas, datosPasajeros, opcion como caracter
	Definir cantidadPasajeros, eleccion ,rutaSeleccionada Como Entero
	Dimension rutasAereas[4]
	Dimension cantidadPasajeros[4]
	Dimension plazasVendidas[4]
	Dimension datosPasajeros[4, 120, 8] 
	
	//	ruta = rutasAereas[rutaSeleccionada - 1]
	rutasAereas[0] = "1. Buenos Aires - Bariloche"
	rutasAereas[1] = "2. Bueno Aires - Salta"
	rutasAereas[2] = "3. Rosario - Buenos Aires"
	rutasAereas[3] = "4. Mar Del Plata - Mendoza"
	
	cantidadPasajeros[0] = 120
	cantidadPasajeros[1] = 120
	cantidadPasajeros[2] = 80
	cantidadPasajeros[3] = 80
	
	plazasVendidas[0] = 0
	plazasVendidas[1] = 0
	plazasVendidas[2] = 0
	plazasVendidas[3] = 0
	
	
	Escribir "Bienvenido/a"
	Repetir 
		Escribir "------------------------"
		Escribir "1. Venta pasaje"
		Escribir "2. Buscar pasaje vendido"
		Escribir "3. Buscar pasaje"
		Escribir "4.Ordenar y mostrar lista pasajeros"
		Escribir "    1. Por numero de asiento Ascendente"
		Escribir "    2. Por numero de asiento Descendente"
		Escribir "5. Listado/s"
		Escribir "    1. Cantidad de pasajes vendido por ruta aerea"
		Escribir "    2. Porcentaje de ventas por ruta aerea"
		Escribir "6. Ingrese salir para salir del programa"
		Leer opcion
		
		Segun opcion 
			"1":
				venta <- ventaPasaje(rutasAereas, plazasVendidas, cantidadPasajeros, datosPasajeros)
				
			"2":
				Escribir "Ingrese el destino de su vuelo"
				Escribir "1. Buenos Aires - Bariloche"
				Escribir "2. Bueno Aires - Salta"
				Escribir "3. Rosario - Buenos Aires"
				Escribir "4. Mar Del Plata - Mendoza"
				Leer rutaSeleccionada
				Escribir "------------------------"
				Escribir "Ingrese el número de asiento que desea buscar:"
				Leer asientoNumerico
				Escribir "------------------------"
				Escribir "Nombre y Apellido: ", datosPasajeros[rutasAereas[rutaSeleccionada -1], asientoNumerico-1, 0]
				Escribir "Ruta: ", datosPasajeros[rutasAereas[rutaSeleccionada -1], asientoNumerico -1, 2]
				Escribir "DNI: ", datosPasajeros[rutasAereas[rutaSeleccionada -1], asientoNumerico -1, 1]
				
				//					buscarPasajeroAsiento(datosPasajeros, numeroAsiento, plazasVendidas, dim, rutaSeleccionada, rutasAereas)
			"3": 
				Escribir "Ingrese el nombre y apellido a buscar"
				Leer nombreApellidoBuscado
				Escribir "Ingrese el destino"
				Escribir "1. Buenos Aires - Bariloche"
				Escribir "2. Bueno Aires - Salta"
				Escribir "3. Rosario - Buenos Aires"
				Escribir "4. Mar Del Plata - Mendoza"
				Leer rutaSeleccionada
				
				buscarPorNombreyApellido(datosPasajeros, dim, nombreApellidoBuscado, rutasAereas, rutaSeleccionada, asientoNumerico)
				//busqueda pasaje
			"4":
				Escribir "Ingrese el destino que desea mostrar"
				Escribir "1. Buenos Aires - Bariloche"
				Escribir "2. Bueno Aires - Salta"
				Escribir "3. Rosario - Buenos Aires"
				Escribir "4. Mar Del Plata - Mendoza"
				Leer rutaSeleccionada
				
				Escribir "1. Por numero de asiento Ascendente"
				Escribir "2. Por numero de asiento Descendente"
				Leer eleccion
				Si eleccion == 1 Entonces 
					ordenarArregloASC(plazasVendidas, dimFila, rutaSeleccionada, rutasAereas, datosPasajeros, asientoNumerico)
					
				Sino
					ordenarArregloDESC(plazasVendidas, dimFila, rutaSeleccionada, rutasAereas, datosPasajeros, asientoNumerico)
				FinSi
				
			"5":
				Escribir "    1. Cantidad de pasajes vendido por ruta aerea"
				Escribir "    2. Porcentaje de ventas por ruta aerea"
				Leer eleccion
				Si eleccion == 1 Entonces
					
					Escribir "------------------------"
					Escribir "Pasajes vendidos: ", plazasVendidas[0]
					Escribir "Pasajes vendidos: ", plazasVendidas[1]
					Escribir "Pasajes vendidos: ", plazasVendidas[2]
					Escribir "Pasajes vendidos: ", plazasVendidas[3]
					Escribir "------------------------"
					
				SiNo
					porcentajeVentas(plazasVendidas, cantidadPasajeros, dim, rutasAereas, dim)
				FinSi
				
		FinSegun
	Mientras que (opcion <> "salir" y opcion <> "SALIR")
	Escribir "Gracias por usar el sistema. Hasta luego."
FinAlgoritmo

	//calculo el costo del pasaje
	Funcion  costo <- costoPasaje(rutaSeleccionada, plazasVendidas, equipaje)
		
		Definir costo Como real
		costo = 0
		
		Segun rutaSeleccionada Hacer
			Caso 1:
				Si plazasVendidas[0] <= 20 Entonces
					costo = 150000
					Si equipaje == Verdadero Entonces
						costo = costo * 0.05 + costo
					FinSi
					Escribir "El costo del pasaje es: $", costo
				Sino 
					Si plazasVendidas[0] > 20 y plazasVendidas[0] <= 60 Entonces
						costo = 150000 * 0.10 + 150000
						Si equipaje == Verdadero Entonces
							costo = costo * 0.05 + costo
						FinSi
						Escribir "El costo del pasaje es: $", costo
					SiNo
						costo = 180000
						Si equipaje == Verdadero Entonces
							costo = costo * 0.05 + costo
						FinSi
						Escribir "El costo del pasaje es: $", costo
					FinSi
				FinSi
				
			Caso 2:
				Si plazasVendidas[1] <= 20 Entonces
					costo = 120000
					Si equipaje == Verdadero Entonces
						costo = costo * 0.05 + costo
					FinSi
					Escribir "El costo del pasaje es: $", costo
				SiNo
					Si plazasVendidas[1] > 20 y plazasVendidas[1] <= 60 Entonces
						costo = 120000 * 0.10 + 120000
						Si equipaje == Verdadero Entonces
							costo = costo * 0.05 + costo
						FinSi
						Escribir "El costo del pasaje es: $", costo
					Sino
						costo = 150000
						Si equipaje == Verdadero Entonces
							costo = costo * 0.05 + costo
						FinSi
						Escribir "El costo del pasaje es: $", costo
					FinSi
				FinSi
				
			Caso 3:
				Si plazasVendidas[2] <= 10 Entonces
					costo = 7000
					Si equipaje == Verdadero Entonces
						costo = costo * 0.05 + costo
					FinSi
					Escribir "El costo del pasaje es: $", costo
				Sino 
					Si plazasVendidas[2] > 10 y plazasVendidas[2] <= 40 Entonces
						costo = 70000 * 0.15 + 70000
						Si equipaje == Verdadero Entonces
							costo = costo * 0.05 + costo
						FinSi
						Escribir "El costo del pasaje es: $", costo
					Sino
						costo = 95000
						Si equipaje == Verdadero Entonces
							costo = costo * 0.05 + costo
						FinSi
						Escribir "El costo del pasaje es: $", costo
					FinSi
				FinSi
			Caso 4:
				Si plazasVendidas[3] <= 10 Entonces
					costo = 95000
					Si equipaje == Verdadero Entonces
						costo = costo * 0.05 + costo
					FinSi
					Escribir "El costo del pasaje es: $", costo
				Sino
					Si plazasVendidas[3] > 10 y plazasVendidas[3] <= 40 Entonces
						costo = 95000 * 0.15 + 95000
						Si equipaje == Verdadero Entonces
							costo = costo * 0.05 + costo
						FinSi
						Escribir "El costo del pasaje es: $", costo
					Sino
						costo = 125000
						Si equipaje == Verdadero Entonces
							costo = costo * 0.05 + costo
						FinSi
						Escribir "El costo del pasaje es: $", costo
					FinSi
				FinSi
		FinSegun
		
FinFuncion

FinProceso
SubProceso ordenarArregloASC(plazasVendidas, dimFila, rutaSeleccionada, rutasAereas, datosPasajeros, asientoNumerico)
	Definir i como entero
	i = 0
	Si rutaSeleccionada == 1 Entonces
		
		para i<-0 hasta asientoNumerico+1
			Escribir "Nombre y Apellido: ", datosPasajeros[rutasAereas[rutaSeleccionada -1], i, 0]
			Escribir "Asiento: ", datosPasajeros[rutasAereas[rutaSeleccionada -1], i, 5] 
		Fin para
		
	FinSi
	Si rutaSeleccionada == 2 Entonces
		
		para i<-0 hasta asientoNumerico+1
			Escribir "Nombre y Apellido: ", datosPasajeros[rutasAereas[rutaSeleccionada -1], i, 0]
			Escribir "Asiento: ",  datosPasajeros[rutasAereas[rutaSeleccionada -1], i, 5] 
		Fin para
		
	FinSi
	Si rutaSeleccionada == 3 Entonces
		
		para i<-0 hasta asientoNumerico+1
			Escribir "Nombre y Apellido: ", datosPasajeros[rutasAereas[rutaSeleccionada -1], i, 0]
			Escribir "Asiento: ",  datosPasajeros[rutasAereas[rutaSeleccionada -1], i, 5]  
		Fin para
		
	FinSi
	Si rutaSeleccionada == 4 Entonces
		
		para i<-0 hasta asientoNumerico+1
			Escribir "Nombre y Apellido: ", datosPasajeros[rutasAereas[rutaSeleccionada -1], i, 0]
			Escribir "Asiento: ",  datosPasajeros[rutasAereas[rutaSeleccionada -1], i, 5]  
		Fin para
		
	FinSi
	
FinSubProceso

SubProceso ordenarArregloDESC(plazasVendidas, dimFila, rutaSeleccionada, rutasAereas, datosPasajeros, asientoNumerico)
	Definir i como entero
	i = 0
	Si rutaSeleccionada == 1 Entonces
		
		para i<-asientoNumerico+1 hasta 0 con paso -1
			Escribir "Nombre y Apellido: ", datosPasajeros[rutasAereas[rutaSeleccionada -1], i, 0]
			Escribir "Asiento: ", datosPasajeros[rutasAereas[rutaSeleccionada -1], i, 5] 
		Fin para
		
	FinSi
	Si rutaSeleccionada == 2 Entonces
		
		para i<-asientoNumerico+1 hasta 0 con paso -1
			Escribir "Nombre y Apellido: ", datosPasajeros[rutasAereas[rutaSeleccionada -1], i, 0]
			Escribir "Asiento: ",  datosPasajeros[rutasAereas[rutaSeleccionada -1], i, 5] 
		Fin para
		
	FinSi
	Si rutaSeleccionada == 3 Entonces
		
		para i<-asientoNumerico+1 hasta 0 con paso -1
			Escribir "Nombre y Apellido: ", datosPasajeros[rutasAereas[rutaSeleccionada -1], i, 0]
			Escribir "Asiento: ",  datosPasajeros[rutasAereas[rutaSeleccionada -1], i, 5]  
		Fin para
		
	FinSi
	Si rutaSeleccionada == 4 Entonces
		
		para i<-asientoNumerico+1 hasta 0 con paso -1
			Escribir "Nombre y Apellido: ", datosPasajeros[rutasAereas[rutaSeleccionada -1], i, 0]
			Escribir "Asiento: ",  datosPasajeros[rutasAereas[rutaSeleccionada -1], i, 5]  
		Fin para
		
	FinSi
	
FinSubProceso
