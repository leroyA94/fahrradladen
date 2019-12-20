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

</head>
<body>
	<%@include file="/header.jsp"%>

    <%@ include file="navigation.jsp" %> 
   
	<div class="content">
		<table  border="1" cellpadding="3">
			<tr>
				<th colspan="2">Ihre Benutzerdaten:</th>
			</tr>
			<tr>
				<td colspan="2"></td>
			</tr>

			<%@ page import="java.sql.*" isThreadSafe="false" %>
				<%
					String benutzerid= session.getAttribute("benutzerid").toString();
					String [] data = Model.getInstance().getDBResult("Benutzer", "Benutzername,Vorname,Name", 
																	"Id = " + benutzerid)[0];
				    	
				    out.println();
				    out.println("<tr>");
				    out.println("<td>E-Mail-Adresse</td>" );  
				    out.println("<td>" + data[0] + "</td>");
				    out.println("</tr>");
				    out.println("<tr>");
				    out.println("<td>Vorname</td>" );  
				    out.println("<td>" + data[1] + "</td>");
				    out.println("</tr>");
				    out.println("<tr>");
				    out.println("<td>Nachname</td>" );  
				    out.println("<td>" + data[2] + "</td>");
				    out.println("</tr>");
					
				 
				%>

		</table>
	</div>


	<%@include file="/footer.jsp"%>

</body>
</html>