<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link rel="stylesheet" href="styles2.css">
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="javascript/global.js"></script>


<script type="text/javascript">
         
        </script>
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
</head>
<body>
	<%@include file="/header.jsp"%>

    <%@ include file="navigation.jsp" %> 
   
	<div class="content">
		<p id="pWarenkorbLeer">Ihr Warenkorb enthält noch keine Artikel.</p>
		<table id="tblWarenkorb"  border="1" cellpadding="3">
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
		<button onclick="leiheArtikelAus()">Ausleihen</button>
		<button onclick="leereWarenkorb()">Warenkorb leeren</button>
	</div>


	<%@include file="/footer.jsp"%>

</body>
</html>