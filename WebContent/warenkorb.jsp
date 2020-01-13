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
  <h1 class="display-4">Warenkorb</h1>
  </div>

<div class="container">
<div >
		<p id="pWarenkorbLeer">Ihr Warenkorb enthält noch keine Artikel.</p>
		<table class="table" id="tblWarenkorb"  border="1" cellpadding="3">
			<tr>
				<th colspan="5">Folgende Artikel befinden sich in Ihrem
					Warenkorb:</th>
			</tr>
			<tr>
				<td id="td_warenkorb" colspan="4"></td>
			</tr>

			<tr id="warenkorb_header">
				<th>Marke</th>
				<th>Größe</th>
				<th>Preis</th>
				<th></th>
			</tr>
			<!--  
	            %@ page import="java.sql.*" isThreadSafe="false" %>
				%
			      //String db_url = "jdbc:mysql://localhost/Fahrradladen";
				  //String treiber = "com.mysql.jdbc.Driver";
				
				  //String treiber = "org.hsqldb.jdbcDriver";
				  //String db_url = "jdbc:hsqldb:http://localhost/Fahrradladen";
				  //String db_url = "jdbc:hsqldb:hsql:http://localhost/Fahrradladen";
				  String user   = "webapp";
				  String pw = "test";
				  String table = "Fahrradladen.Fahrraeder";
				  String statement = "SELECT Id, Marke, Groesse, Preis FROM " + table + ";";
				
				

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
				      while( rs.next() )
				      {
				    	String id = rs.getString( 1 );
				        out.println( "</tr><tr class=\"trWarenkorb\" id=\"tr" + id + "\">" ); //id des Fahrrads im id-Attribut des tr-Elements speichern
				        for( int i=2; i<=n; i++ )  // Bei 2 beginnen, da ID nicht angezeigt werden soll
				          out.println( "<td>" + rs.getString( i ) + "</td>" );
				        
				        out.println(
		                        "<td>" +
		                        "<button id=\"btnRemove" + id + "\" onclick=\"entferneAusWarenkorb(\' " + id + " \')\">Aus Warenkorb entfernen</button>" +
		            	    	"</td>" );
				      }
				    } finally {
				      try { if( null != rs ) rs.close(); } catch( Exception ex ) {}
				      try { if( null != st ) st.close(); } catch( Exception ex ) {}
				      try { if( null != cn ) cn.close(); } catch( Exception ex ) {}
				    }
				 
				%>-->

			<tr id="tr_warenkorb_gesamt">
				<td id="td_warenkorb_gesamt" colspan=5 />
			</tr>
		</table>
		<button id="btnAusleihen" onclick="leiheArtikelAus()" class="btn btn-primary">Ausleihen</button>
		<button id="btnWKleeren" onclick="leereWarenkorb()" class="btn btn-primary">Warenkorb leeren</button>
	</div>

  <footer class="pt-4 my-md-5 pt-md-5 border-top">

  </footer>
</div>


  <!--  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>  -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>
