<%-- 
    Document   : newjsp
    Created on : 25.06.2015, 23:50:15
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>

        <title>Fahrrad-Kauf GmbH</title>

        <link rel="stylesheet" type="text/css" href="styles2.css">

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
            			window.location.href="index.jsp";
            		}
            		  
            	});

            	
            	
            	
            });
                      
        </script>

    </head>
    <body class="bg">

		<h1> Wilkommen bei Fahrradladen GmbH</h1>
  		<form method="GET" action="Login" >
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


<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.6">
    <title>Login</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/sign-in/">

    <!-- Bootstrap core CSS -->
<link href="/docs/4.4/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/4.4/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/4.4/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/4.4/assets/img/favicons/safari-pinned-tab.svg" color="#563d7c">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon.ico">
<meta name="msapplication-config" content="/docs/4.4/assets/img/favicons/browserconfig.xml">
<meta name="theme-color" content="#563d7c">


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
    <link href="signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
    		<form method="GET" action="Login" >
            <fieldset>
                <legend>Login</legend>
                E-Mail-Adresse: <input name="username" type="text" size="20" required="required"/></br>
                Passwort: <input name="pw" type="password" size="20" required="required"/></br>
            </fieldset>
            <p id="pFormButtons">
                <input type="submit" value="Einloggen"/>
            </p>

        </form> 
    <form class="form-signin">
  <img class="mb-4" src="/docs/4.4/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
  <h1 class="h3 mb-3 font-weight-normal">Login</h1>
  <label for="username" class="sr-only">Email-Adresse</label>
  <input type="email"  class="form-control" name="username" type="text" placeholder="Email-Adresse" required="required" required autofocus/>

  <label for="pw" class="sr-only">Password</label>
  <input name="pw" type="password" size="20"  class="form-control" placeholder="Passwort"  required="required"/>
  <div class="checkbox mb-3">
    <label>
      <input type="checkbox" value="remember-me"> Remember me
    </label>
  </div>
  <input class="btn btn-lg btn-primary btn-block" type="submit" value="Einloggen"/>
  <p class="mt-5 mb-3 text-muted">&copy; 2017-2019</p>
</form>
</body>
</html>
