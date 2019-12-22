<%@page import="Model.Model"%>
<%@page import="Model.FahrradBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        
        <title>JSP Page</title>
        <link rel="stylesheet" href="styles2.css">
       <!--  <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script> -->
        <script type="text/javascript" src="javascript/global.js"></script>
<script type="text/javascript">
         
     
        </script>
        <script >
            $("document").ready(function()
            {
            	
            	window.addEventListener( "pageshow", function ( event ) {
            		//var historyTraversal = event.persisted || 
            		  //                       ( typeof window.performance != "undefined" && 
            		   //                           window.performance.navigation.type === 2 );
            		  //if ( historyTraversal ) {
            		    // Handle page restore.
            		    updateWarenkorbGUI();
            		  //}
            		  
            		  //login checken
            		  pruefeLogin();
            		});

            	
            	
            	
            });
                      
        </script>
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
    </head>
 
  <body class="text-center">

<div class="container">
    <form class="form-signin" method="GET" action="Login" >
  <h1 class="h3 mb-3 font-weight-normal">Login</h1>
  <label for="username" class="sr-only">Email-Adresse</label>
  <input width="100" class="form-control" name="username" type="text" placeholder="Email-Adresse" required="required" required autofocus/>

  <label for="pw" class="sr-only">Password</label>
  <input name="pw" type="password" size="20"  class="form-control" placeholder="Passwort"  required="required"/>

  <input class="btn btn-lg btn-primary btn-block" type="submit" value="Einloggen"/>
</form>

        <p>
        Neu hier? Dann geht es <a href="registrierung.jsp" >hier zur Registrierung.</a>
        </p>

</div>
   <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    </body>
</html>