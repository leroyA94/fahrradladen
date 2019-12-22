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
       <!--  <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script> -->
        <script type="text/javascript" src="javascript/global.js"></script>

        <script type="text/javascript" >
        
        
        
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
  <h1 class="display-4">Unsere Fahrräder</h1>
  </div>

<div class="container">
  <div class="card-deck mb-3 text-center">

             <%@ page import="java.sql.*" isThreadSafe="false" %>
				<%
				
			      //String db_url = "jdbc:mysql://localhost/Fahrradladen";
				  //String treiber = "com.mysql.jdbc.Driver";
				
				  //String treiber = "org.hsqldb.jdbcDriver";
				  //String db_url = "jdbc:hsqldb:http://localhost/Fahrradladen";
				  //String db_url = "jdbc:hsqldb:hsql:http://localhost/Fahrradladen";
				  String user   = "webapp";
				  String pw = "test";
				  String table = "Fahrradladen.Fahrraeder";
				  //String statement = "SELECT Id, Marke, Groesse, Preis FROM " + table + 
					//	  " LEFT JOIN Fahrradladen.Verleihe " + 
					//	  " ON Fahrradladen.Fahrraeder.Id = Fahrradladen.Verleihe.fahrradId " + 
					//	  " WHERE Fahrradladen.Verleihe.benutzerId IS NULL ";
				String statement = "SELECT Id, Marke, Groesse, Preis, bild, bezeichnung FROM " + table;
				

				    Connection cn = null;
				    Statement  st = null;
				    ResultSet  rs = null;
				    try {
				    	
				      //Class.forName( treiber )
				      Class.forName("org.mariadb.jdbc.Driver");
				      
				      //org.hsqldb.jdbcDriver.driverInstance();
				      //cn = DriverManager.getConnection( db_url, user, pw );
				      cn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/Fahrradladen?user=" + user + "&password=" +  pw );
				      st = cn.createStatement();
				      rs = st.executeQuery( statement );
				      ResultSetMetaData rsmd = rs.getMetaData();
				      int n = rsmd.getColumnCount() -1 ;
				      while( rs.next() )
				      {
					    	String id = rs.getString( 1 );
					    	String bild = "images/bikes/" + rs.getString(5);
					    	String marke = rs.getString( 2 );
					    	String groesse = rs.getString( 3 );
					    	String preis = rs.getString( 4 );
					    	String bezeichnung = rs.getString( 6 );
					    	
				    	 out.println("    <div class=\"card mb-4 shadow-sm\">" + 
				        "  <div class=\"card-header\">" + 
				        "  <h4 class=\"my-0 font-weight-normal\">" +  bezeichnung +"</h4>" + 
				       " </div>" + 
				       " <div class=\"card-body\">" + 
				         " <h1 class=\"card-title pricing-card-title\">" +  preis + " € <small class=\"text-muted\">/ Monat</small></h1>" + 
				         " <ul class=\"list-unstyled mt-3 mb-4\">" + 
				           " <li><img height=100 src='" + bild + "' /></li>" + 
				           " <li>" + groesse +" Zoll</li>" + 
				           " <li>" + marke +"</li>" + 
				         " </ul>" + 
				         "<button type=\"button\" class=\"btn btn-lg btn-block btn-primary\" id=\"btn" + id + "\" onclick=\"packeInWarenkorb(\' " + id + " \')\">In den Warenkorb</button>" +
				           " </div>" + 
				      "</div>");
				    	  

				    	//String bild = "images/bikes/e.jpeg";
				    	/*
				    	if (Model.getInstance().pruefeFahrradAufLager(Integer.parseInt(id)) > 0){
					        out.println( "</tr><tr id=\"" + id + "\">" ); //id des Fahrrads im id-Attribut des tr-Elements speichern
					        out.println("<td><img height=100 src='" + bild + "' /></td>" ); // Bild
					        for( int i=2; i<=n; i++ )  // Bei 2 beginnen, da ID nicht angezeigt werden soll
					          out.println( "<td>" + rs.getString( i ) + "</td>" );
					        out.println(
	                        "<td>" +
	                        "<button id=\"btn" + id + "\" onclick=\"packeInWarenkorb(\' " + id + " \')\">In den Warenkorb</button>" +
	            	    	"</td>" );
				    	}*/
				      }
				    } finally {
				      try { if( null != rs ) rs.close(); } catch( Exception ex ) {}
				      try { if( null != st ) st.close(); } catch( Exception ex ) {}
				      try { if( null != cn ) cn.close(); } catch( Exception ex ) {}
				    }
				 
				%>
	
    
  </div>

  <footer class="pt-4 my-md-5 pt-md-5 border-top">

  </footer>
</div>


   <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>
