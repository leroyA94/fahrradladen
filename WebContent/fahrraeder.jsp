<%@page import="Model.FahrradBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="/WebApplication1/styles.css">
        <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" src="javascript/warenkorb.js"></script>
         <script type="text/javascript">
         
         function getWarenkorb(){
        	str_warenkorb = localStorage.getItem("warenkorb");
        	
        	
        	if(str_warenkorb == null || str_warenkorb == "")
        		arr_warenkorb = [];
        	else
        	{
        		arr_warenkorb = str_warenkorb.split(",")
        	}
        	
        	return arr_warenkorb;
         }
         
         
         function leereWarenkorb(){
         	localStorage.setItem("warenkorb", "");
         	updateWarenkorbGUI();
         }
         
        function packeInWarenkorb(id){
        	
        	str_warenkorb = localStorage.getItem("warenkorb");
        	
        	if(str_warenkorb == null || str_warenkorb == "")
        		str_warenkorb = id;
        	else
        	{
        		arr_warenkorb = str_warenkorb.split(",")
        		
        		if(!arr_warenkorb.includes(id))
        			str_warenkorb = str_warenkorb + "," + id;
        	}

        	localStorage.setItem("warenkorb", str_warenkorb)
        	
        	updateWarenkorbGUI();
        }


        
        function updateWarenkorbHeader(){
          
        	warenkorb = getWarenkorb();
        	
        	$("#link_warenkorb").html(warenkorb.length)
        	
        	
        }
        function test(){
            link = document.getElementById("link_warenkorb");

        	
        	if(link.innerHTML=="TEST1")
        		link.innerHTML = "TEST3";
        	else
        		link.innerHTML = "TEST1";
        }

        function updateWarenkorbGUI(){

        	//warenkorb.jsp
        	warenkorb = getWarenkorb();

        	//tblWarenkorb = document.getElementById("tblWarenkorb").innerHTML = "";
        	//tblWarenkorb;
        	
        	if(warenkorb.length == 0){
        		//nichts im Warenkorb
        		$("#pWarenkorbLeer").show()
        		$("#tblWarenkorb").hide()
        	}
        	else
        	{
        		//Artikel im Warenkorb vorhanden       		
        		$("#tblWarenkorb").show()
        		$("#pWarenkorbLeer").hide()       		
        		
        	}
        	
        	//Tabelle
        	aktualisiereWarenkorbTabelle();
        	
        	//header
        	updateWarenkorbHeader();
        	
        	
        	//Buttons 
        	aktualisiereButtons();

        }
        
    	//deaktiviert/aktiviert Buttons anhand des Warenkorbs
    	function aktualisiereButtons(){
    		
    		$("button").attr("disabled", false);
    		
    		warenkorb = getWarenkorb();
    		
    		warenkorb.forEach(function(item, index){
    			id = "#btn" + $.trim(item)
    			$(id).attr("disabled", true);
    		})        	
    	} 
    	
    	//deaktiviert/aktiviert Buttons anhand des Warenkorbs
    	function aktualisiereWarenkorbTabelle(){
    		
    		$(".trWarenkorb").hide();
    		
    		warenkorb = getWarenkorb();
    		
    		warenkorb.forEach(function(item, index){
    			id = "#tr" + $.trim(item)
    			$(id).show();
    		})      	
    	}
   
    	
    	//login prüfen
    	
    	function benutzerIstAngemeldet(){
    		username = '<%=session.getAttribute("username")%>'
        		
       		return !(username == null || username == "")
    	}
    	
    	function pruefeLogin(){

    		if(!benutzerIstAngemeldet()){
    			//alert("fdas");
    			window.location.href="index.jsp";
    		}
    	}
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

        <div class="content" id="div_background">
	        <table class="content" border="1" cellpadding="3" cellspacing=0>
	            <tr id="header1">
	                <th  colspan="3">Unsere Fahrräder</th>
	            </tr>
	            <tr>
	                <th></th>
	                <th>Marke</th>
	                <th>Größe</th>
	                <th>Preis</th>
	                <th></th>
	                <th></th>
	            </tr>
	            <!--  
	            <% //for(int i = 0; i < Model.Model.getInstance().getFahrraeder().size(); i++)
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
	            %> -->
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