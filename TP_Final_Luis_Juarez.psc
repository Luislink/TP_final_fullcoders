
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
	Escribir "Solicite turnos disponibles y cotizaci�n aproximada"
	Escribir "1) Para turnos disponibles en la semana"
	Escribir "2) Tareas y cotizaci�n"
	Leer x
	Si x <>1 y x<>2 Entonces
		Escribir "Su opci�n no es v�lida"
		Escribir "Intente nuevamente"
	SiNo
		Escribir "La opci�n elegida es ", x
	Fin Si
FinSubAlgoritmo
Algoritmo turnos_presupuesto
	entrada=0
	Mientras entrada <> 1 y entrada <> 2 Hacer
		bienvenida(void)
		entrada = menu(void)
	Fin Mientras
	Escribir entrada
FinAlgoritmo
