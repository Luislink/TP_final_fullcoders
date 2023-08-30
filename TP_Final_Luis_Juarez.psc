//El siguiente SubAlgoritmo es la base de datos del administrador
SubAlgoritmo admi_turnos(dias,turno)
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
		Escribir "+--------+", " +----------------+"
		Escribir Sin Saltar "1) Salir |"
		Escribir " |2) Borrar turnos|"
		Escribir "+--------+", " +----------------+"
		Leer x1
		//A continuacion se borran los datos del arreglo turno[] y ademas se establecen como disponibles en arreglo dias[]
		Si x1=2 Entonces
			Escribir "¿Está seguro que desea borrar la base de datos? (2: Sí / 0: No)"
			Leer x
			Si x==2 Entonces
				Para i=0 Hasta 5 Hacer
					dias[i,1]="Disponible"
				Fin Para
				//Aqui se recorre todo el arreglo turno para borrar su contenido
				Para i=0 Hasta 5 Hacer
					
					Para j=0 Hasta 4 Hacer
						
						turno[i,j]=""
						
					Fin Para
					
				Fin Para
				
				Escribir "Base de datos borrada con éxito"
			SiNo
				Escribir ""
			Fin Si
		Fin Si
	Hasta Que x1=1
FinSubAlgoritmo

SubAlgoritmo mostrar_turnos(dias,turno) //dias[dias,condicion]
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
		Si 0<=x y x<=5 Entonces
			d=x
			Repetir
				Escribir "Seleccionó ",dias[d,0]," ¿está seguro? (1: Sí / 2: No)"
				Leer x
				Si x=1 Entonces
					
					Si dias[d,1]="Disponible" Entonces
						
						//[Nombre,DNI,Telefono,Direccion,Asunto]
						Escribir "Ingrese DNI"
						Leer dato 
						turno[d,1] = dato
						//A futuro se hara una validación de datos para no otorgar turnos repetidos al mismo DNI
						Escribir "Ingrese el nombre completo"
						Leer dato 
						turno[d,0] = dato
						
						Escribir "Número de telefono Celular/WhatsApp"
						Leer dato 
						turno[d,2] = dato
						
						Escribir "Ingrese dirección para realizar el trabajo"
						Leer dato
						turno[d,3] = dato
						
						Escribir "Descripción: Tarea/Comentario"
						Leer dato
						turno[d,4]=dato
						
						dias[d,1]="Reservado"
						
						
					SiNo
						Escribir "***********************************************************"
						Escribir "*** Lo sentimos, el dia ",dias[d,0]," ya se encuentra reservado ***"
						Escribir "***********************************************************"
					Fin Si
					
				
				Fin Si
				x=2
			Hasta Que x=2
			
			
		Fin Si
	Hasta Que x=8
	
FinSubAlgoritmo
SubAlgoritmo tareas_cotizacion(void)
	a=12000 	//Costo de la tarea 1)
	b=6000		//Costo de la tarea 2)
	c=8000		//Costo de la tarea 3)
	d=4000		//Costo de la tarea 4)
	costo = 0
	tildea=""
	tildeb=""
	tildec=""
	tilded=""
	band=Verdadero
	Repetir
		Escribir "Seleccione la/s tarea/s a realizar"
		Escribir "1) Instalación basica hasta 4500 frig ",tildea
		Escribir "2) Desinstalación hasta 6000 frig ",tildeb
		Escribir "3) Limpieza y mantenimiento ",tildec
		Escribir "4) Visita técnica con diagnostico/presupuesto ",tilded
		Escribir "5) Borrar selección"
		Escribir "6) Salir"
		Escribir ""
		Escribir "El costo actual seleccionado es $",costo
		Escribir "Agregar más tareas:"
		Leer x
		Segun x Hacer
			1:
				costo=costo+a
				tildea="((OK))"
			2:
				costo=costo+b
				tildeb="((OK))"
			3:
				costo=costo+c
				tildec="((OK))"
			4:
				costo=costo+d
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
	Escribir "Para administrar de turnos presione (5) e ingrese la contraseña"
	Leer x
	Si x <>1 y x<>2 y x<>3 y x<>5 Entonces
		Escribir "*******Su opción no es válida***********"
		Escribir "**********Intente nuevamente*************"
	Fin Si
FinSubAlgoritmo

Algoritmo turnos_presupuesto
	s=1
		
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
	//Turno de prueba precargado para observar
	turno[0,0]="Luis Antonio Juarez"
	turno[0,1]="32018634"
	turno[0,2]="3814864626"
	turno[0,3]="Pje Las Rosas 500"
	turno[0,4]="Instalación de aire de 3000 frig"
	
	Repetir
		bienvenida(void)
		s = menu(void)
		Segun s Hacer
			1:
				mostrar_turnos(dias,turno) //Funcion mostrar
			2:
				tareas_cotizacion(void)		//Funcion cotizar
				
			5:
				Escribir "Ingrese la contraseña"
				Leer pass
				Si pass=="12345" Entonces
					admi_turnos(dias,turno)
				SiNo
					Escribir "***La contraseña es incorrecta intente de nuevo***"
				Fin Si
			De Otro Modo:
				
		Fin Segun
	Hasta Que s=3
	
FinAlgoritmo
