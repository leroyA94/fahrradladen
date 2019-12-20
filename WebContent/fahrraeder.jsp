<%@page import="Model.FahrradBean"%>
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
    </head>
    <body>
        <%@include file="/header.jsp" %>

        <%@ include file="navigation.jsp" %> 
        
        <div class="content" id="div_background">
	        <table border="1" cellpadding="3" cellspacing=0>
	            <tr id="header1">
	                <th  colspan="5">Unsere Fahrräder</th>
	            </tr>
	            <tr>
					<td colspan="5"></td>
				</tr>
	            <tr>
	                <th></th>
	                <th>Marke</th>
	                <th>Größe</th>
	                <th>Preis</th>
	                <th></th>
	            </tr>
	            <!--  
	            % //for(int i = 0; i < Model.Model.getInstance().getFahrraeder().size(); i++)
	            for(java.util.Map.Entry<Integer, FahrradBean> entry:Model.Model.getInstance().getFahrraeder().entrySet())
	            {
	                Model.FahrradBean b = entry.getValue();
	                out.print("<tr>" +
	                         "<td>BILD</td>" + 
	                         "<td>" + b.getMarke() + "</td>" + 
	                        "<td>" + b.getGroesse()+ "</td>" +
	                        "<td>" + b.getPreis() + "</td>" +
	                        "<td>" +
	                        "<button value=\"" + b.getId() + "\" onclick=\"packeInWarenkorb(\' " + b.getId() + " \')\">In den Warenkorb</button>" +
	            	    	"</td>" +
	                        "<td> <a href=\"/WebApplication1/Kontakt?index=" + b.getId() + "\">" + "</a></td>" +
	                        "</tr>");
	            }
	            % -->
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
				  String statement = "SELECT Id, Marke, Groesse, Preis FROM " + table + 
						  " LEFT JOIN Fahrradladen.Verleihe " + 
						  " ON Fahrradladen.Fahrraeder.Id = Fahrradladen.Verleihe.fahrradId " + 
						  " WHERE Fahrradladen.Verleihe.benutzerId IS NULL ";
				
				

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
				        out.println( "</tr><tr id=\"" + id + "\"><td></td>" ); //id des Fahrrads im id-Attribut des tr-Elements speichern
				        for( int i=2; i<=n; i++ )  // Bei 2 beginnen, da ID nicht angezeigt werden soll
				          out.println( "<td>" + rs.getString( i ) + "</td>" );
				        out.println(
                        "<td>" +
                        "<button id=\"btn" + id + "\" onclick=\"packeInWarenkorb(\' " + id + " \')\">In den Warenkorb</button>" +
            	    	"</td>" );
				      }
				    } finally {
				      try { if( null != rs ) rs.close(); } catch( Exception ex ) {}
				      try { if( null != st ) st.close(); } catch( Exception ex ) {}
				      try { if( null != cn ) cn.close(); } catch( Exception ex ) {}
				    }
				 
				%>
	
	        </table>
        </div>

        <%@include file="/footer.jsp" %>

    </body>
</html>