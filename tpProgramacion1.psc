Algoritmo tpProgramacion
	
	Definir rutasAereas, datosPasajeros, opcion como caracter
	Definir cantidadPasajeros, eleccion ,rutaSeleccionada Como Entero
	Dimension rutasAereas[4]
	Dimension cantidadPasajeros[4]
	Dimension plazasVendidas[4]
	Dimension datosPasajeros[4, 120, 8] 
	
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
Funcion venta <- ventaPasaje(rutasAereas, plazasVendidas, cantidadPasajeros, datosPasajeros Por Referencia)
	
	Definir nombreApellido, nroDni, ruta, telefono, numPasajeroFrec, confirmacionAsiento  Como Caracter
	Definir equipaje Como Logico
	equipaje = falso
	Definir rutaSeleccionada, eleccionEquipaje, asiento Como Entero
	Definir costo Como entero
	
	
	Escribir "Selecciona la ruta aérea disponible que desea tomar:"
	Repetir 
		Para i <- 0 Hasta 3 Con Paso 1 Hacer
			Escribir rutasAereas[i]
			
		FinPara
		Leer rutaSeleccionada 
	Mientras Que rutaSeleccionada < 1 o rutaSeleccionada > 4
	ruta = rutasAereas[rutaSeleccionada - 1] //
	Escribir "Ha elegido: ", ruta
	
	Segun rutasAereas[rutaSeleccionada -1] Hacer
		"1. Buenos Aires - Bariloche":
			datos <- cargaDatosPasajero(datosPasajeros, cantidadPasajeros, rutasAereas, rutaSeleccionada, plazasVendidas,cantidadPasajesVendidos)
		"2. Bueno Aires - Salta":
			datos <- cargaDatosPasajero(datosPasajeros, cantidadPasajeros, rutasAereas, rutaSeleccionada, plazasVendidas,cantidadPasajesVendidos)
		"3. Rosario - Buenos Aires":
			datos <- cargaDatosPasajero(datosPasajeros, cantidadPasajeros, rutasAereas, rutaSeleccionada, plazasVendidas,cantidadPasajesVendidos)
		"4. Mar Del Plata - Mendoza":
			datos <- cargaDatosPasajero(datosPasajeros, cantidadPasajeros, rutasAereas, rutaSeleccionada, plazasVendidas,cantidadPasajesVendidos)
	FinSegun
	
FinFuncion

//cargo datos del pasajero
Funcion datos <- cargaDatosPasajero(datosPasajeros, cantidadPasajeros, rutasAereas, rutaSeleccionada, plazasVendidas,cantidadPasajesVendidos)
	Definir nombreApellido, nroDni, ruta, telefono, numPasajeroFrec, confirmacionAsiento, pasajero Como Caracter
	Definir  equipaje Como Logico
	Definir asientoNumerico Como Entero
	equipaje = falso
	
	//valido que haya asientos disponibles en las rutas
	Si cantidadPasajeros[rutaSeleccionada - 1] > plazasVendidas[rutaSeleccionada - 1] Entonces
		
		Escribir "Hay asientos disponibles"
		Escribir "Desea reservar un asiento para esta ruta?"
		Leer confirmacionAsiento
		
		Si confirmacionAsiento == "si" o confirmacionAsiento == "Si" o confirmacionAsiento == "SI" Entonces
			plazasVendidas[rutaSeleccionada - 1] = plazasVendidas[rutaSeleccionada - 1] + 1 // asiento vendido
			asientoNumerico = plazasVendidas[rutaSeleccionada - 1] // asigno asiento
			Escribir "Ruta ", rutaSeleccionada, ", Asiento ", asientoNumerico, " - Plazas Vendidas: ", plazasVendidas[rutaSeleccionada-1]
		FinSi
		
		Escribir "Ingrese su nombre y apellido"
		Leer nombreApellido
		Mientras nombreApellido == "" Hacer
			Escribir "Error. Ingrese nuevamente su nombre y apellido"
			Leer nombreApellido
		FinMientras
		
		Escribir "Ingrese su dni"
		Leer nroDni
		Mientras (nroDni < "1000000") o (nroDni > "999999999") Hacer
			escribir "El dni ingresado es erroneo, vuelva a ingresarlo."
			Leer nroDni
		FinMientras
		
		Escribir "Ingrese su numero de telefono (+54: 10 dígitos sin espacios ni guiones)"
		Leer telefono
		
		Escribir "Si desea llevar equipaje en bodega ingrese 1 de lo contrario ingrese 0"
		Leer eleccionEquipaje
		Mientras eleccionEquipaje <> 1 y eleccionEquipaje <> 0
			Escribir "Error. Ingrese una opcion correcta."
			Leer eleccionEquipaje
		FinMientras
		Si eleccionEquipaje = 1 Entonces
			equipaje = Verdadero
		FinSi
		
		Escribir "Ingrese su numero de pasajero frecuente (4 numeros)"
		Leer numPasajeroFrec
		Mientras longitud(numPasajeroFrec) < 4 o Longitud(numPasajeroFrec) >4 Hacer
			Escribir "El numero de pasajero es invalido. Ingrese nuevamente."
			Leer numPasajeroFrec
		FinMientras
		
		// Almaceno los datos en el arreglo datosPasajeros
		datosPasajeros[rutasAereas[rutaSeleccionada - 1], asientoNumerico -1,  0] = nombreApellido
		datosPasajeros[rutasAereas[rutaSeleccionada -1], asientoNumerico -1, 1] = nroDni
		datosPasajeros[rutasAereas[rutaSeleccionada -1], asientoNumerico -1, 2] = rutasAereas[rutaSeleccionada - 1]
		datosPasajeros[rutasAereas[rutaSeleccionada -1], asientoNumerico -1,3] = telefono
		datosPasajeros[rutasAereas[rutaSeleccionada -1], asientoNumerico -1,4] = numPasajeroFrec
		datosPasajeros[rutasAereas[rutaSeleccionada -1], asientoNumerico -1,5] = ConvertirATexto(asientoNumerico)
		
		//Resumen venta
		Escribir "Resumen del vuelo"
		Escribir "------------------"
		Escribir "Ruta: ", datosPasajeros[rutasAereas[rutaSeleccionada -1], asientoNumerico -1, 2]
		Escribir "Nombre y Apellido: ", datosPasajeros[rutasAereas[rutaSeleccionada -1], asientoNumerico -1, 0]
		Escribir "Dni: ", datosPasajeros[rutasAereas[rutaSeleccionada -1], asientoNumerico -1, 1]
		Escribir "Telefono: ", datosPasajeros[rutasAereas[rutaSeleccionada -1], asientoNumerico -1, 3]
		Escribir "Equipaje en bodega: ", equipaje
		Escribir "Número pasajero frecuente: ", datosPasajeros[rutasAereas[rutaSeleccionada -1], asientoNumerico -1, 4]
		Escribir "Asiento: ", datosPasajeros[rutasAereas[rutaSeleccionada -1], asientoNumerico -1, 5] 
		
		costo <- costoPasaje(rutaSeleccionada, plazasVendidas, equipaje) 
	Sino 
		Escribir "No hay asientos disponibles en esta ruta"
	FinSi
FinFuncion

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



//ordenar pasajes en orden ascendente
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

//ordenar pasajes en orden descendente
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

//busco por nombre y apellido
Subproceso buscarPorNombreyApellido(datosPasajeros, dim, nombreApellidoBuscado, rutasAereas, rutaSeleccionada, asientoNumerico Por Valor)
	
	Definir i Como Entero
	i = 0
	Definir encontrado como logico
    encontrado = falso  
	
    Mientras i <= dim Hacer
		
        Si datosPasajeros[rutasAereas[rutaSeleccionada - 1], i, 0] == nombreApellidoBuscado Entonces
			Escribir "------------------------"
			Escribir "Nombre y Apellido: ", datosPasajeros[rutasAereas[rutaSeleccionada - 1], i, 0]
			Escribir "Ruta: ", datosPasajeros[rutasAereas[rutaSeleccionada - 1], i, 2]
			Escribir "DNI: ", datosPasajeros[rutasAereas[rutaSeleccionada - 1], i, 1]
			Escribir "------------------------"
            encontrado = verdadero
        FinSi
		i = i + 1
    FinMientras
	
	Si encontrado == Falso Entonces
		Escribir "Pasajero no encontrado para el nombre y apellido: ", nombreApellidoBuscado
	FinSi
FinSubProceso

Subproceso porcentajeVentas(plazasVendidas, cantidadPasajeros, dim, rutasAereas, dim)
    // Lista de porcentaje de ventas por ruta aerea
	Definir i, porcentaje Como real
	porcentaje = 0 
	
	Escribir "Porcentaje de ventas por ruta aerea:"
	
	Si cantidadPasajeros[0] > 0 Entonces
		porcentaje = (plazasVendidas[0] * 100) / cantidadPasajeros[0]
		Escribir rutasAereas[0], ": ", porcentaje, "%"
	FinSi
	Si cantidadPasajeros[1] > 0 Entonces
		porcentaje = (plazasVendidas[1] * 100) / cantidadPasajeros[1]
		Escribir rutasAereas[1], ": ", porcentaje, "%"
	FinSi
	Si cantidadPasajeros[2] > 0 Entonces
		porcentaje = (plazasVendidas[2] * 100) / cantidadPasajeros[2]
		Escribir rutasAereas[2], ": ", porcentaje, "%"
	FinSi
	Si cantidadPasajeros[3] > 0 Entonces
		porcentaje = (plazasVendidas[3] * 100) / cantidadPasajeros[3]
		Escribir rutasAereas[3], ": ", porcentaje, "%"
	FinSi
	
FinSubproceso
