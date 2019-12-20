<%@page import="Model.Model"%>
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
            	

            	versteckeWennNichtAdmin();
            	
            });
            

            function versteckeWennNichtAdmin(){
            	username = '<%=session.getAttribute("username")%>';

            	if (!(username=="admin")){
        
            		$(".versteckeWennNichtAdmin").hide();
            	}
            }
            
            
        </script>
</head>
<body>
	<%@include file="/header.jsp"%>

    <%@ include file="navigation.jsp" %> 
   
	<div class="content">
		<table  border="1" cellpadding="3">
			<tr>
				<th colspan="7">Sie haben folgende Fahrräder ausgeliehen:</th>
			</tr>
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


	<%@include file="/footer.jsp"%>

</body>
</html>