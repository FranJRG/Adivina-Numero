<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="utility.Numero" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Juego Número</title>
<style>

	body{
		background-color: pink;
	}

	h2{
		font-family: sans-serif;
		font-size: 50px;
		text-shadow: red 0 -2px;
	}
	
	input{
		border-radius: 10px;
		width: 200px;
		height: 30px;
	}
	
	textarea{
		border-radius: 10px;
		box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.2);
		font-family: "Times New Roman", serif;
		font-weight: bold;
	}
	
	form{
		background-color: silver;
		margin-left: 200px;
		margin-right: 200px;
		padding: 25px;
		margin-top: 100px;
		border-style: solid;
		box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);
	}
	
	button[name="prueba"]{
		padding: 5px;
		background-color: orange;
	}
	
	button[name="reiniciar"]{
		padding: 5px;
		background-color: yellow;
	}

</style>
</head>
<body align="center">

	<%!
		int numMax = 100;
	%>

	
	<%
	
		String mensaje = "";
		try{
			
			int numHidden;
			int contador;
			String test = request.getParameter("prueba");
			String init = request.getParameter("reiniciar");
			
			//CREAMOS LAS SESIONES OPORTUNAS EN CASO DE QUE SEAN NULAS
			
			if(session.getAttribute("cont")==null){
				contador=3;
				session.setAttribute("cont", contador);
			}else{
				contador = (int) session.getAttribute("cont");
			}
		
			if(session.getAttribute("number")==null){
				numHidden = Numero.generateNumber(numMax);
				session.setAttribute("number", numHidden);
			}else{
				numHidden = (int) session.getAttribute("number");
			}
			
			if(session.getAttribute("message")==null){
				mensaje="";
				session.setAttribute("message", mensaje);
			}else{
				mensaje = (String) session.getAttribute("message");
			}
			
			String numTest = request.getParameter("numTest");
			
			
			//EVALUAMOS LOS POSIBLES CASOS QUE PUEDEN PASAR CUANDO EL USUARIO ENVIA UN NUMERO
			
			if(test!=null){
				
				if(Integer.valueOf(numTest)==numHidden){
					mensaje += "Si!!!!, acertaste el número, menudo geni@ se perdió el mundo\n";
					contador = 3;
					session.setAttribute("message", mensaje);
					session.setAttribute("cont", contador);
				}else if(Integer.valueOf(numTest) > numHidden){
					contador--;
					mensaje += "Vaya..., el número introducido es mayor que el mio intentalo otra vez..., le quedan: " + contador + "\n";
					session.setAttribute("cont", contador);
					session.setAttribute("message", mensaje);
				}else if(Integer.valueOf(numTest) < numHidden){
					contador--;
					mensaje += "Su número es más bajo que el mio, no pierda la fe y siga intentandolo, le quedan: " + contador + "\n";
					session.setAttribute("cont", contador);
					session.setAttribute("message", mensaje);
				}
				
				if(contador==0){
					mensaje += "Lo sentimos se le acabaron los intentos el numero era..." + numHidden;
					session.setAttribute("message", mensaje);
				}
				
			}
			
			//REINICIAMOS EL JUEGO CUANDO EL USUARIO PULSE REINICIAR
			
			if(init!=null ){
				numHidden = Numero.generateNumber(numMax);
				session.setAttribute("number", numHidden);
				
				contador = 3;
				session.setAttribute("cont", contador);
				
				mensaje="";
				session.setAttribute("message", mensaje);
			}
			
		}catch(Exception e){
			mensaje = "Error inesperado";
			session.setAttribute("message", mensaje);
		}
	
	%>


	
	<form method="post" action="Juego.jsp">
	
		<h2>BIENVENIDO A... ADIVINA MI NÚMERO!!!</h2>
	
		<textarea name="number" readonly="readonly" cols="60" rows="6" placeholder=""><%=mensaje %></textarea><br>
		
		<br>
		
		<input type="number" name="numTest" placeholder="Test a number"><br>
		
		<br>
		
		<button type="submit" name="prueba">Probar número</button>
		<button type="submit" name="reiniciar">Reiniciar juego</button>
		
	</form>

</body>
</html>