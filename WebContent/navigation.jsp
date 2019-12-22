<%-- 
    Document   : navigation
    Created on : 17.06.2015, 11:24:26
    Author     : fb4wb13062
--%>
<!-- 
<nav id="navigation">
<p class="navContent">
    <a href="fahrraeder.jsp" class="navLink">Unsere Fahrräder</a><br/>
    <a href="warenkorb.jsp" class="navLink">Warenkorb</a><br/>
    <a href="verleihe.jsp" class="navLink">Ausgeliehenen</a><br/>
    <a href="account.jsp" class="navLink">Account</a> <br/>
    <a href="anfahrt.jsp" class="navLink">Anfahrt</a> <br/>
    <a href="aboutus.jsp" class="navLink">About Us</a><br/>
</p>
</nav> -->
    <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
  <h5 class="my-0 mr-md-auto font-weight-normal"><a href="start.jsp">Fahrradladen GmbH</a></h5>
  <nav class="my-2 my-md-0 mr-md-3">
    
        <a class="p-2 text-dark" href="fahrraeder.jsp" >Unsere Fahrräder</a>
    <a class="p-2 text-dark" href="warenkorb.jsp" >Warenkorb</a> <a href="warenkorb.jsp" id="link_warenkorb"></a>
    <a  class="p-2 text-dark" href="verleihe.jsp" >Ausgeliehenen</a>
    <a class="p-2 text-dark" href="account.jsp" >Account</a> 
    <a class="p-2 text-dark" href="anfahrt.jsp" >Anfahrt</a> 
    <a class="p-2 text-dark" href="aboutus.jsp" >About Us</a>
  </nav>
  
    <a href="account.jsp" class="navLink"> ${sessionScope.username}    </a>
    
	<form method="GET" action="Logout">	 
	<label  >  </label>
	        <button type="submit" value="logout" class="btn btn-outline-primary">Ausloggen </button>	
	</form>  
  
</div>