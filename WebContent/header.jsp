<header class="top"> 
    Benutzer: <a href="account.jsp" class="navLink">${sessionScope.username}</a>
	<form method="GET" action="Logout">	 
	        <button type="submit" value="logout">Ausloggen </button>	
	</form>  
	Artikel im Warenkorb: <a href="warenkorb.jsp" id="link_warenkorb"></a>
</header>