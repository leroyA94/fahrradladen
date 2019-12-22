

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
  <h1 class="display-4">Anfahrt</h1>
  </div>

<div class="container">

Fahrradladen GmbH</b>
<br>Coblitzalle 9<br>
68163 Mannheim<br>
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2592.573199302558!2d8.532094815765442!3d49.4736785793526!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4797cf23839f450f%3A0x817dadb8293c65ee!2sCoblitzallee%209%2C%2068163%20Mannheim!5e0!3m2!1sde!2sde!4v1577037523360!5m2!1sde!2sde" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>



	</div>

  <footer class="pt-4 my-md-5 pt-md-5 border-top">

  </footer>
</div>


  <!--  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>  -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>

