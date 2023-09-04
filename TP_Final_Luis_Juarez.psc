//******************************************************************
//***** Autor: Luis Antonio Juarez								 ****
//***** Comisión: 11/21654										 ****
//***** Profesor: Aldo Ferrari									 ****
//***** Descripción: El siguiente codigo corresponde al proyecto ****
//***** de trabajo final del Curso introductorio al pensamiento  ****
//***** computacional.					 						 ****
//*****	 El proyecto trata de un gestor de turnos para clientes  **** 
//*****  de un servicio tecnico de aires acondicionados.		 ****
//*******************************************************************

//El siguiente SubAlgoritmo es la base de datos del administrador
SubAlgoritmo admin_turnos_costos(dias,turno,tareas,precio) //[Nombre,DNI,Telefono,Direccion,Asunto]
	Escribir "Turnos de la semana:"
	Para i=0 Hasta 5 hacer
		Escribir "------------------------------------------"
		Escribir dias[i,0],":",turno[i,0]," - ", "DNI:",turno[i,1]
		Escribir "Teléfono: ",turno[i,2]
		Escribir "Dirección: ",turno[i,3]
		Escribir "Asunto: ", turno[i,4]
		Escribir "------------------------------------------"
	Fin Para
	Repetir
		Escribir "+--------+", " +----------------+", " +--------------------+"
		Escribir Sin Saltar "1) Salir |"
		Escribir Sin Saltar" |2) Borrar turnos|"
		Escribir " |3) Actualizar costos|"
		Escribir "+--------+", " +----------------+", " +--------------------+"
		Leer x1
		Si x1=2 Entonces
			Escribir "¿Está seguro que desea borrar la base de datos? (2: Sí / 0: No)"
			Leer x
			Si x=2 Entonces
				Para i=0 Hasta 5 Hacer
					dias[i,1]="Disponible"
					Para j=0 Hasta 4 Hacer
						turno[i,j]=""
					FinPara
				FinPara
				Escribir "Base de datos borrada con éxito"
			SiNo
				Escribir ""
			Fin Si
		Fin Si
		Si x1=3 Entonces
			Repetir
				Escribir " Desea actualizar costos de: "
				Para i=0 Hasta 3 Hacer 
					Escribir i," -" tareas[i]," - ", "Precio: $",precio[i]
				FinPara
				Escribir "Presione (8) para salir"
				Leer x
				
				Segun x Hacer
					0:
						Escribir "Ingrese nuevo precio de: "
						Escribir tareas[0]
						Leer x
						precio[0]=x
						Escribir "****ACTUALIZACION CORRECTA****"
					1:
						Escribir "Ingrese nuevo precio de: "
						Escribir tareas[1]
						Leer x
						precio[1]=x
						Escribir "****ACTUALIZACION CORRECTA****"
					2:
						Escribir "Ingrese nuevo precio de: "
						Escribir tareas[2]
						Leer x
						precio[2]=x
						Escribir "****ACTUALIZACION CORRECTA****"
					3:
						Escribir "Ingrese nuevo precio de: "
						Escribir tareas[3]
						Leer x
						precio[3]=x
						Escribir "****ACTUALIZACION CORRECTA****"
				Fin Segun
				
			Hasta Que x = 8
			
		Fin Si
		
	Hasta Que x1=1
FinSubAlgoritmo

SubAlgoritmo mostrar_turnos(dias,turno) //dias[dias,condicion],[Nombre,DNI,Telefono, Direccion,Asunto]
	Borrar Pantalla
	Repetir
	Escribir "-------------------------------------------"
	Escribir "--- Se disponen de los siguientes días:  --"
	Escribir "-------------------------------------------"
	Para i=0 Hasta 5 Hacer
		Escribir i,". ",dias[i,0], ": ", dias[i,1]
	FinPara
	
		Escribir "+---------------------------+"
		Escribir Sin Saltar" Presione 0-5 para solicitar"
		Escribir "| ** 8) Salir "
		Escribir "+---------------------------+"
		Leer x
		Si x>=0 y x<=5 Entonces
			d=x
			Repetir
				Escribir "Seleccionó ",dias[d,0]," ¿está seguro? (1: Sí / 2: No)"
				Leer x
				Si x=1 Entonces
					
					Si dias[d,1]="Reservado" Entonces
						Escribir "******Lo sentimos*******"
						Escribir "El turno del dia ",dias[d,0]," se encuentra Reservado"
						Escribir "***Intente con otro dia disponible***"
					SiNo
						
						//[Nombre,DNI,Telefono,Direccion,Asunto]
						Escribir "Ingrese el nombre completo"
						Leer dato 
						turno[d,0] = dato  
						
						Escribir "Ingrese DNI"
						Leer dato 
						turno[d,1] = dato
						
						Escribir "Ingrese número de Telefono/Whatsapp"
						Leer dato 
						turno[d,2] = dato
						
						
						Escribir "Ingrese dirección para ser visitado por el técnico"
						Leer dato 
						turno[d,3] = dato
						
						Escribir "Brevemente escriba el servicio que necesita"
						Leer dato 
						turno[d,4] = dato
						
						dias[d,1]="Reservado"
						Escribir "Su turno fue reservado con éxito"
						
						
					Fin Si
					
				SiNo
					Escribir ""
				Fin Si
				x=2
			Hasta Que x=2
			
			
		Fin Si
	Hasta Que x=8
	
FinSubAlgoritmo

SubAlgoritmo tareas_cotizacion(precio)	//Funcion de cotizacion
	//a=12000 	//Costo de la tarea 1)
	//b=6000		//Costo de la tarea 2)
	//c=8000		//Costo de la tarea 3)
	//d=4000		//Costo de la tarea 4)
	costo = 0
	tildea=""
	tildeb=""
	tildec=""
	tilded=""
	band=Verdadero
	Repetir
		Escribir "Seleccione la/s tarea/s a realizar"
		Escribir "1) Instalación basica hasta 4500 frig ","- Precio: ","$",precio[0]," -->",tildea
		Escribir "2) Desinstalación hasta 6000 frig ","- Precio: ","$",precio[1]," -->",tildeb
		Escribir "3) Limpieza y mantenimiento ","- Precio: ","$",precio[2]," -->",tildec
		Escribir "4) Visita técnica con diagnostico/presupuesto ","- Precio: ","$",precio[3]," -->",tilded
		Escribir "5) Borrar selección"
		Escribir "6) Salir"
		Escribir ""
		Escribir "El costo actual seleccionado es $",costo
		Escribir "Agregar más tareas:"
		Leer x
		Segun x Hacer
			1:
				costo=costo+precio[0]
				tildea="((OK))"
			2:
				costo=costo+precio[1]
				tildeb="((OK))"
			3:
				costo=costo+precio[2]
				tildec="((OK))"
			4:
				costo=costo+precio[3]
				tilded="((OK))"
			5:
				costo=0
				tildea =""
				tildeb =""
				tildec =""
				tilded =""
			6:
				band = Falso
			De Otro Modo:
				
		Fin Segun
	Hasta Que band=falso
	
FinSubAlgoritmo

SubAlgoritmo bienvenida(void) //Pantalla de Bienvenida 
	n=50
	Repetir
		Escribir Sin Saltar "*";
		n=n-1
	Hasta Que n=0
	Escribir ""
	Escribir Sin Saltar "*** "
	Escribir Sin Saltar "Bienvenidos al gestor de turnos de Tecfrio"
	Escribir Sin Saltar " ***"
	Escribir ""
	n=50
	Repetir
		Escribir Sin Saltar "*"
		n=n-1
	Hasta Que n=0
	Escribir ""
FinSubAlgoritmo

SubAlgoritmo x <- menu(void) //Menu de opciones
	Escribir "Solicite turnos disponibles y cotización aproximada"
	Escribir "Elija algunas de las siguientes opciones"
	Escribir "----------------------------------------------------"
	Escribir "1) Ver turnos disponibles/Solicitar un turno"
	Escribir "2) Tareas y cotización"
	Escribir "3) Salir"
	Escribir "----------------------------------------------------"
	Escribir "*Administrador presione (5) para actualizacion de precios/ver turnos"
	Escribir " e ingrese la contraseña"
	Leer x
	Si x <>1 y x<>2 y x<>3 y x<>5 Entonces
		Escribir "*******Su opción no es válida***********"
		Escribir "**********Intente nuevamente*************"
	Fin Si
FinSubAlgoritmo

//Main
Algoritmo turnos_presupuesto
	s=1
	Dimension tareas(4)	//[tarea,costo] 0:Instalacion basica - 1: Desinstalacion - 2: Limpieza y Mantenimiento - 3: Diagnostico/Presupuesto
	tareas[0]=" Instalación basica hasta 4500 frig "
	tareas[1]=" Desinstalación hasta 6000 frig "
	tareas[2]=" Limpieza y mantenimiento "
	tareas[3]=" Visita técnica con diagnostico/presupuesto "
	
	Dimension precio(4)
	precio[0]=12000
	precio[1]=6000
	precio[2]=8000
	precio[3]=4000
	
	Dimension dias(6,2) //Inicializamos Turnos y dias disponibles
	dias[0,0]="Lunes"
	dias[1,0]="Martes"
	dias[2,0]="Miércoles"
	dias[3,0]="Jueves"
	dias[4,0]="Viernes"
	dias[5,0]="Sábado"
	Para i=0 Hasta 5 Hacer
		dias[i,1]="Disponible"
	FinPara
	
	Dimension turno(6,5) //[Nombre,DNI,Telefono,Direccion,Asunto] 
	// Valores de ejemplo que posteriormente serán reemplazados
	turno[0,0]="Luis Antonio Juarez"
	turno[0,1]="32018634"
	turno[0,2]="3814756932"
	turno[0,3]="Pje Federico Helguera 610 - El Manantial"
	turno[0,4]="Instalación"
	
	Repetir
		bienvenida(void)
		s = menu(void)
		Segun s Hacer
			1:
				mostrar_turnos(dias,turno) //Funcion mostrar
			2:
				tareas_cotizacion(precio)		//Funcion cotizar
				
			5:
				Escribir "Ingrese la contraseña"
				Leer pass
				Si pass=="12345" Entonces
					admin_turnos_costos(dias,turno,tareas,precio)
				SiNo
					Escribir "***La contraseña es incorrecta intente de nuevo***"
				Fin Si
			De Otro Modo:
				
		Fin Segun
	Hasta Que s=3
	
FinAlgoritmo
