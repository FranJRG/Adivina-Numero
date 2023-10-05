<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%!
		String mensaje = "";
		int contador = 3;
		int random = (int) (Math.random() * 15) + 1;
	
	%>

	
	<%
	
		String numero = request.getParameter("numero");
		
		out.println(random);
		
		if(request.getParameter("reiniciar")!=null){
			random = (int) (Math.random() * 15) + 1;
			contador=3;
			mensaje="";
		}
		
		if(request.getParameter("prueba")!=null){
			if(numero.equals(String.valueOf(random))){
				mensaje = "Enhorabuena ha acertado el número!!!";
				contador = 3;
				out.println(mensaje);
			}else if(!numero.equals(String.valueOf(random))){
				
				if(Integer.valueOf(numero)>random){
					contador--;
					mensaje = "Su numero es mayor que el aleatorio tiene " + contador;
					out.println(mensaje);
				}else if(Integer.valueOf(numero)<random){
					contador--;
					mensaje = "Su numero es menor que el aleatorio tiene " + contador;
					out.println(mensaje);
				}
			}else if(numero.equals(" ")){
				contador--;
				mensaje = "Cuidado! Al introducir una cadena vacia los intentos cuentan";
				out.println(mensaje);
			}
			
			if(contador==0){
				mensaje="Lo sentimos se le han acabado los intentos reinicie el juego";
				if(request.getParameter("prueba")!=null){
					mensaje = "Lo sentimos no puede seguir jugando";
					out.println(mensaje);
				}
				out.println(mensaje);
			}
			
		}
		
	
	%>


	<h2>BIENVENIDO A... ADIVINA MI NÚMERO!!!</h2>
	
	<form method="get" action="Juego.jsp">
	
		<input type="number" name="numero" placeholder="Introduce un número"><br>
		
		<br>
		
		<button name="prueba">Probar número</button>
		<button name="reiniciar">Reiniciar juego</button>
		
	</form>

</body>
</html>