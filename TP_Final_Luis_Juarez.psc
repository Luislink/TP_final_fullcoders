SubAlgoritmo tareas_cotizacion(void)
	a=12000
	b=6000
	c=8000
	d=4000
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

SubAlgoritmo bienvenida(void)
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
		Escribir Sin Saltar "*";
		n=n-1
	Hasta Que n=0
	Escribir ""
FinSubAlgoritmo

SubAlgoritmo x <- menu(void)
	Escribir "Solicite turnos disponibles y cotización aproximada"
	Escribir "Elija algunas de las siguientes opciones"
	Escribir "1) Ver turnos disponibles de la semana"
	Escribir "2) Pedir un turno"
	Escribir "3) Tareas y cotización"
	Escribir "4) Salir"
	Leer x
	Si x <>1 y x<>2 y x<>3 Entonces
		Escribir "*******Su opción no es válida***********"
		Escribir "**********Intente nuevamente*************"
	Fin Si
FinSubAlgoritmo

Algoritmo turnos_presupuesto
	s=1
	Dimension dias(6)
	dias[0]="Lunes"
	dias[1]="Martes"
	dias[2]="Miercoles"
	dias[3]="Jueves"
	dias[4]="Viernes"
	dias[5]="Sabado"
	
	Repetir
		bienvenida(void)
		s = menu(void)
		Segun s Hacer
			1:
				Escribir "1"
			2:
				Escribir "2"
			3:
				tareas_cotizacion(void)
			De Otro Modo:
				
		Fin Segun
	Hasta Que s=4
	
FinAlgoritmo
