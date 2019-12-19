<%-- 
    Document   : newjsp
    Created on : 25.06.2015, 23:50:15
--%>

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

		<h1> Wilkommen bei Fahrradladen GmbH</h1>
  		<form method="GET" action="Login" class="content">
            <fieldset>
                <legend>Login</legend>
                E-Mail-Adresse: <input name="username" type="text" size="20" required="required"/></br>
                Passwort: <input name="pw" type="password" size="20" required="required"/></br>
            </fieldset>
            <p id="pFormButtons">
                <input type="submit" value="Einloggen"/>
            </p>

        </form>  
        <p>
        Neu hier? Dann geht es <a href="registrierung.jsp" >hier zur Registrierung.</a>
        </p>

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