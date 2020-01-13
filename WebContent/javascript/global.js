 
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
		
		$("#pWarenkorbLeer").removeClass('d-none');// .show()
		$("#tblWarenkorb").addClass('d-none');//.hide()

		$("#btnWKleeren").addClass('d-none');
		$("#btnAusleihen").addClass('d-none');
		
	}
	else
	{
		//Artikel im Warenkorb vorhanden       		
		$("#tblWarenkorb").removeClass('d-none');// .show()
		$("#pWarenkorbLeer").addClass('d-none');//.hide()   	
		

		$("#btnWKleeren").removeClass('d-none');//.hide()   
		$("#btnAusleihen").removeClass('d-none');//.hide()  
		
	}
	
	//Tabelle
	aktualisiereWarenkorbTabelle();
	
	//header
	updateWarenkorbHeader();
	
	
	//Buttons 
	aktualisiereButtons();
	
	//Show/hide wenn aus- oder eingeloggt
	showOrHideIfLoggedIn();
	
	//Gesamtpreis
	$("#td_warenkorb_gesamt").html("Gesamtpreis: " + getWarenkorbPreis());

}

// Show/hide wenn aus- oder eingeloggt
function showOrHideIfLoggedIn() {
	
	if(benutzerIstAngemeldet()){
		$(".showWhenLoggedIn").removeClass('d-none');
		$(".showWhenLoggedOut").addClass('d-none');
	}else {
		
		$(".showWhenLoggedIn").addClass('d-none');
		$(".showWhenLoggedOut").removeClass('d-none');
	}
}

//deaktiviert/aktiviert Buttons anhand des Warenkorbs
function aktualisiereButtons(){
	
	$("button").attr("disabled", false);
	
	warenkorb = getWarenkorb();
	
	
	warenkorb.forEach(function(item, index){
		id = "#btn" + $.trim(item)
		$(id).attr("disabled", true);
		//$(id).hide();
		//$(id).addClass('d-none');//.hide()
	})
	
	// schon ausgeliehene Fahrräder ausblenden
    // AJAX kurz auf synchron stellen, sonst ist der Wert für i falsch
	$.ajaxSetup({
      async: false
	});
	
	user = getUserId();
	for(var i = 1; i <= 3; i++){
	     $.getJSON("Verleih?fahrrad=" + i + "&benutzer=" + user + "&aktion=pruefen",
	                function(obj)
	                {	
	    	 			if(obj == 1){
	    	 				id = "#btn" + (i);
	    	 				$(id).attr("disabled", true);
	    	 			}

	                           
	                      
	                })
	}
	
    // AJAX kurz auf synchron stellen, sonst ist der Wert für i falsch
	$.ajaxSetup({
      async: true
	});
	
} 

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
	
	username = getUsername();
	if(username == null || username.length == 0){

		window.location.assign("login.jsp");
	}else{
		
	
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
   
}
    	
    	
function getUsername(){
	return username = $("#link_username").html();
}

function getUserId(){
	return username = $("#link_userid").html();
}


//login prüfen
function benutzerIstAngemeldet(){
	//username = '<% out.print(session.getAttribute("username"))%>'
	//username = '<%= session.getAttribute("username") %>'
	//var username = '<%= Session["username"] %>';
	username = getUsername();

	return !(username == null || username == "")
}

function pruefeLogin(){

	if(!benutzerIstAngemeldet()){
		//alert("fdas");
		window.location.href="login.jsp";
	}
}

function gebeZurueck(fahrrad, benutzer){
	// AJAX temporär auf synchron stellen
	$.ajaxSetup({
	    async: false
	});
	
    $.get("Verleih?fahrrad=" + fahrrad + "&benutzer=" + benutzer + "&aktion=entfernen",
            function(obj)
            {}
    );
    
	// AJAX temporär auf synchron stellen
	$.ajaxSetup({
	    async: true
	});
	
    location.reload(); 
}