<%@page import="Model.Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link rel="stylesheet" href="styles2.css">
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="javascript/warenkorb.js"></script>
<script type="text/javascript">
         
         Array.prototype.remove = function() {
        	 //Funktion zum entfernen von Elementen aus Arrays, https://stackoverflow.com/questions/3954438/how-to-remove-item-from-array-by-value/3955096#3955096
        	 
        	    var what, a = arguments, L = a.length, ax;
        	    while (L && this.length) {
        	        what = a[--L];
        	        while ((ax = this.indexOf(what)) !== -1) {
        	            this.splice(ax, 1);
        	        }
        	    }
        	    return this;
        	};
        	
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
        	id = id.trim();
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

        function entferneAusWarenkorb(id){
        	
        	warenkorb = getWarenkorb();
        	warenkorb.remove(id);
        	
        	str_warenkorb = "";
        	
        	if(warenkorb.length > 0){
	        	warenkorb.forEach(function(item, index){
	        		str_warenkorb = str_warenkorb  + item + ",";
	    		});
        	
        		//letztes Komma entfernen    	
        		str_warenkorb = str_warenkorb.substring(0, str_warenkorb.length-1);
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
        	
        	//Gesamtpreis
        	$("#td_warenkorb_gesamt").html("Gesamtpreis: " + getWarenkorbPreis());

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

    		
    		// AJAX kurz auf synchron stellen, kann sonst zu Problemen beim füllen der Tabelle führen
        	$.ajaxSetup({
              async: false
        	});

    		warenkorb = getWarenkorb(); //hole warenkorb
        	$("#warenkorb_header").parent().children(".trWarenkorb").remove(); //leere Warenkorb-Tabelle
    		//$("#tblWarenkorb").append //bei dieser Variante funktioniert der Code nicht zuverlässig
        	
        	//alert("anzahl "+ warenkorb.length);
    		//iteriere durch den Warenkorb
    		$.each(warenkorb, function(index, item) {
    			//hole für jedes Item die Daten
                $.getJSON("Fahrrad?id=" + item,
                        function(obj)
                        {	
                			//HTML für ein Fahrrad zusammensetzen
                	
                			id = obj.id;
                			fahrrad_html = ( "<tr class=\"trWarenkorb\" id=\"tr" + id + "\">" ); //id des Fahrrads im id-Attribut des tr-Elements speichern

                			//Attribute
                			fahrrad_html = fahrrad_html + "<td>" + obj.marke + "</td>" ;
                			fahrrad_html = fahrrad_html + "<td>" + obj.groesse + "</td>" ;
                			fahrrad_html = fahrrad_html + "<td>" + obj.preis + "</td>" ;

                			//Button
		                	fahrrad_html = fahrrad_html +  "<td>" +
		                        "<button id=\"btnRemove" + id + "\" onclick=\"entferneAusWarenkorb(\'" + id + "\')\">Aus Warenkorb entfernen</button>" +
		            	    	"</td></tr>" ;
	                		
				        	$("#tr_warenkorb_gesamt").before(fahrrad_html);

		                           
		                      
                        }
                );
    		});
    		
    		// AJAX kurz auf synchron stellen, kann sonst zu Problemen beim füllen der Tabelle führen
    		$.ajaxSetup({
    		    async: true
    		});   		
    		
    		

    	}
    	
    	function getWarenkorbPreis(){
    		// AJAX temporär auf synchron stellen
        	$.ajaxSetup({
        	    async: false
        	});

    		warenkorb = getWarenkorb(); //hole warenkorb
  			warenkorb_preis = 0.0;
    		
    		//iteriere durch den Warenkorb
    		$.each(warenkorb, function(index, item) {
    			//hole für jedes Item die Daten
                $.getJSON("Fahrrad?id=" + item + "&attribut=preis",
                        function(obj)
                        {	
                	warenkorb_preis = warenkorb_preis + parseFloat(obj);

		                           
		                      
                        }
                );
    		});
    		
    		// AJAX temporär auf synchron stellen
    		$.ajaxSetup({
    		    async: true
    		});
    		
    		return warenkorb_preis;

    	}
    	

    	function leiheArtikelAus(){
    		// leiht alle Artikel im Warenkorb aus
    		//todo Fall, in dem zwischenzeiltich ein anderer User ausgeliehen hat
    		//todo Fehlgeschlagener Verleih
    		
    		warenkorb = getWarenkorb(); //hole warenkorb
    		
    		
    		//iteriere durch den Warenkorb
    		$.each(warenkorb, function(index, item) {
    			//hole für jedes Item die Daten
                $.getJSON("Verleih?fahrrad=" + item + "&aktion=ausleihen",
                        function(obj)
                        {}
                );
    		});
    		
    		leereWarenkorb();
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
            
            function gebeZurueck(fahrrad, benutzer){
                $.get("Verleih?fahrrad=" + fahrrad + "&benutzer=" + benutzer + "&aktion=entfernen",
                        function(obj)
                        {}
                );
                location.reload(); 
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
				<th>Preis</th>
				<th>Benutzername</th>
				<th>Vorname</th>
				<th>Nachname</th>
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