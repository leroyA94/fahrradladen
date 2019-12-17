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
        	
        	updateWarenkorbHeader();
        }

        function leereWarenkorb(){
        	localStorage.setItem("warenkorb", "");
        	updateWarenkorbGUI();
        }
        
        function updateWarenkorbHeader(){
            link = document.getElementById("link_warenkorb");
        	str_warenkorb = localStorage.getItem("warenkorb");
        	
        	if(str_warenkorb == null || str_warenkorb == "")
        		link.innerHTML = "0";
        	else
        	{
        		arr_warenkorb = str_warenkorb.split(",")
        		
        		link.innerHTML = arr_warenkorb.length
        	}
        	
        	
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
        	str_warenkorb = localStorage.getItem("warenkorb");	

        	//tblWarenkorb = document.getElementById("tblWarenkorb").innerHTML = "";
        	//tblWarenkorb;
        	
        	if(str_warenkorb == null || str_warenkorb == ""){
        		//nichts im Warenkorb
        		$("#pWarenkorbLeer").show()
        		$("#tblWarenkorb").hide()
        	}
        	else
        	{
        		//Artikel im Warenkorb vorhanden       		
        		$("#tblWarenkorb").show()
        		$("#pWarenkorbLeer").hide()
        		
        		// Array mit Artikel-Indizes
        		arr_warenkorb = str_warenkorb.split(",");
        		
        	}
        	
        	//header
        	updateWarenkorbHeader();
        	
        }