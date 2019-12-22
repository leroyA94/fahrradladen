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
        
        <title>Fahrradladen GmbH</title>
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
            	

            	versteckeWennNichtAdmin();
            	
            });
            

            function versteckeWennNichtAdmin(){
            	username = '<%=session.getAttribute("username")%>';

            	if (!(username=="admin")){
        
            		$(".versteckeWennNichtAdmin").hide();
            	}
            }
            
            
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
  <h1 class="display-4">Sie haben folgende Fahrräder ausgeliehen:</h1>
  </div>

<div class="container">
<div >
		<table class="table"  border="1" cellpadding="3">

			<tr>
				<td colspan="7"></td>
			</tr>

			<tr >
				<th>Marke</th>
				<th>Größe</th>
				<th >Preis</th>
				<th class="versteckeWennNichtAdmin">Benutzername</th>
				<th class="versteckeWennNichtAdmin">Vorname</th>
				<th class="versteckeWennNichtAdmin">Nachname</th>
			</tr>
			<%@ page import="java.sql.*" isThreadSafe="false" %>
				<%
				
				
				
				  String benutzername= session.getAttribute("username").toString();
				  boolean istAdmin = benutzername.equals("admin");
				
				  String user   = "webapp";
				  String pw = "test";
				  String table = "Fahrradladen.Fahrraeder";				
				  String statement = "SELECT fahrradId, benutzerId, Marke, Groesse, Preis, Benutzername, Vorname, Name FROM Fahrradladen.Verleihe" +
						  " INNER JOIN Fahrradladen.Fahrraeder " + 
						  " ON Fahrradladen.Fahrraeder.Id = Fahrradladen.Verleihe.fahrradId " + 
						  " INNER JOIN Fahrradladen.Benutzer " + 
						  " ON Fahrradladen.Benutzer.Id = Fahrradladen.Verleihe.benutzerId " ;
				  
				  if(!istAdmin){
					  statement = statement + " WHERE Benutzername = '" + benutzername + "' "; 
				  }
						  
						  
					statement = statement +	  " ; ";

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
				      int n = rsmd.getColumnCount();
				      if (!istAdmin)
				    	  n -= 3; //Benutzerdaten ausblenden, wenn nicht admin
				      while( rs.next() )
				      {
					    String fahrradid = rs.getString( 1 );
				    	String benutzerid = rs.getString( 2 );
				        out.println( "</tr><tr>" ); //id des Fahrrads im id-Attribut des tr-Elements speichern
				        for( int i=3; i<=n; i++ )  // Bei 2 beginnen, da ID nicht angezeigt werden soll
				          out.println( "<td>" + rs.getString( i ) + "</td>" );
				        
				        if(istAdmin){
					        out.println(
			                        "<td>" +
			                        "<button onclick=\"gebeZurueck(\'" + fahrradid + "\', \'" + benutzerid + "\')\">Wurde zurückgegeben</button>" +
			            	    	"</td>" );
				        }
				      }
				    } finally {
				      try { if( null != rs ) rs.close(); } catch( Exception ex ) {}
				      try { if( null != st ) st.close(); } catch( Exception ex ) {}
				      try { if( null != cn ) cn.close(); } catch( Exception ex ) {}
				    }
				 
				%>

		</table>
	</div>

  <footer class="pt-4 my-md-5 pt-md-5 border-top">

  </footer>
</div>


  <!--  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>  -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>
