
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

		<title>Participants</title>
		<link type="text/css" rel="stylesheet" href="css/style.css">

</head>

<body>



<div id="wrapper">
	<div id="header">
		<h2>List Des Participants au ${Titre}</h2>
	</div>
	<div id="container">
	<h3></h3>
		<div id="content">
		
		<!-- add project button -->
		
		<c:url var="list" value="EvenementControllerServlet">
		
		<c:param name="cmd" value="LIST" />
				
		</c:url>
		<a href="${list}" class="add-project-button">retour a la list</a>
		
		
		
			<table>
			<tr>
				<th>IdParticipant</th>
				<th>Nom</th>
				<th>Prenom</th>
				<th>Email</th>
				
			</tr>	
			<c:forEach var="temp" items="${Participants}">
			
				 <tr>
					<td> ${temp.getIdPersonne()} </td>
					<td> ${temp.getNom()} </td>
					<td> ${temp.getPrenom()} </td>
					<td> ${temp.getEmail()}</td>
					
					
				</tr>
			
			</c:forEach>		
			</table>
		
		</div>
	</div>

</div>	

</body>
</html>

