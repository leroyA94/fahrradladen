

<%@page import="Model.Model"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        
        <title>JSP Page</title>
        <link rel="stylesheet" href="styles2.css">
        <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" src="javascript/global.js"></script>

		<script>

        
            $("document").ready(function()
            {
            	
            	window.addEventListener( "pageshow", function ( event ) {

            		if(benutzerIstAngemeldet()){
            			//alert("fdas");
            			window.location.href="login.jsp";
            		}
            		
            		updateWarenkorbGUI();
            		  
            	});
            	

            	
            	
            	
            });
        </script>

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="pricing.css" rel="stylesheet">
  </head>
  <body>
  
<%@ include file="navigation.jsp" %> 

<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
  <h1 class="display-4">Registrierung</h1>
  </div>

<div class="container">

	<%
			String error = request.getParameter("error");
			if(error == null){ //normaler Aufruf der Seite 
				//nichts
			}else if (Integer.parseInt(error) == 0) { //registrierung erfolgreich
				out.print("Die Registrierung war erfolgreich!. Willkommen! ");
				out.print("<a href=\"index.jsp\">Zurück zum Login.</a>");
			}else if (Integer.parseInt(error) == 1) { //fehler
				out.print("Ungültige E-Mail-Adresse!");
			}else if (Integer.parseInt(error) == 2) { //fehler
				out.print("Ungültiges Passwort! Das Passwort darf keine Leerzeichen enthalten und muss min. acht Zeichen lang sein und einen Buchstaben sowie eine Zahl enthalten.");
			}else if (Integer.parseInt(error) == 3) { //fehler
				out.print("Der Name muss zwischen 2 und 50 Zeichen enthalten.");
			}else if (Integer.parseInt(error) == 4) { //fehler
				out.print("Der Vorname muss zwischen 2 und 50 Zeichen enthalten.");
			}else if (Integer.parseInt(error) == 5) { //fehler
				out.print("Es ist bereits ein Benutzer mit dieser Mail-Adresse registriert.");
			}else if (Integer.parseInt(error) == 6) { //fehler
				out.print("Es ist ein unbekannter SQL-Fehler aufgetreten.");
			}else { //fehler
				out.print("Es ist ein unbekannter Fehler aufgetreten.");
			}
		%>
		
		<%
		String name = request.getParameter("name");
		String vorname = request.getParameter("vorname");
		String mail = request.getParameter("mail");
		if(name == null)
			name = "";
		if(vorname == null)
			vorname ="";
		if(mail==null)
			mail="";
			
			if(error == null || Integer.parseInt(error) > 0){ //normaler Aufruf der Seite oder Fehler
				out.print(
				  		"<form method=\"GET\" action=\"Registrierung\" class=\"content\">" +
			            "<fieldset>" +
			            "   <legend>Login</legend>" +
			            "    Name: <input name=\"name\" type=\"text\" size=\"20\" required=\"required\" value=\"" + name + "\"></input></br>" +
			            "    Vorname: <input name=\"vorname\" type=\"text\" size=\"20\" required=\"required\" value=\"" + vorname + "\"></input></br>" +
			            "    E-Mail-Adresse: <input name=\"mail\" type=\"text\" size=\"20\" required=\"required\" value=\"" + mail + "\"></input></br>" +
			            "    Passwort: <input name=\"pw\" type=\"password\" size=\"20\" required=\"required\"></input></br>" +
			            "</fieldset>" +
			            "<p >" +
			            "    <input type=\"submit\" value=\"Registrieren\"/>" +
			            "</p>" +
						"" +
			        	"</form>" 
						);
			}
			
		%>
	</div>

  <footer class="pt-4 my-md-5 pt-md-5 border-top">

  </footer>
</div>


  <!--  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>  -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>

