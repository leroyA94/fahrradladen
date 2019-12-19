

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <title>Fahrrad-Kauf GmbH</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
        <script language="javascript" type="text/javascript" src="javascript/shoutbox.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js">             
        </script>
        <script >
		   	function benutzerIstAngemeldet(){
		   		username = '<%=session.getAttribute("username")%>'
		       		
		      		return !(username == null || username == "")
		   	}
        
            $("document").ready(function()
            {
            	
            	window.addEventListener( "pageshow", function ( event ) {

            		if(benutzerIstAngemeldet()){
            			//alert("fdas");
            			window.location.href="fahrraeder.jsp";
            		}
            		  
            	});

            	
            	
            	
            });
                      
        </script>
    </head>
    <body>

		<h1> Registrierung</h1>
		
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
  

        <%@ include file="footer.jsp" %> 

    </body>
</html>  
<!--
<!DOCTYPE html>

<html>




<title>Fahrrad-Kauf GmbH</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js">             
</script>
<style>
body,h1 {font-family: "Raleway", sans-serif}
body, html {height: 100%}
.bgimg {
  background-image: url('/images/forestbridge.jpg');
  min-height: 100%;
  background-position: center;
  background-size: cover;
}

</style>
<body>

<div class="bgimg w3-display-container w3-animate-opacity w3-text-white">
  <div class="w3-display-topleft w3-padding-large w3-xlarge">
    Logo
  </div>
  <div class="w3-display-middle">
    <h1 class="w3-jumbo w3-animate-top">Wilkommen bei Fahrradladen GmbH</h1>
    <hr class="w3-border-grey" style="margin:auto;width:40%">
      		<form method="GET" action="Login" class="content">
            <fieldset>
                <legend>Login</legend>
                Name: <input name="username" type="text" size="20" required="required"/></br>
                Passwort: <input name="pw" type="text" size="20" required="required"/></br>
            </fieldset>
            <p id="pFormButtons">
                <input type="submit" value="Einloggen"/>
            </p>

        </form>  
  </div>
  <div class="w3-display-bottomleft w3-padding-large">
  </div>
</div>

</body>
</html>
-->