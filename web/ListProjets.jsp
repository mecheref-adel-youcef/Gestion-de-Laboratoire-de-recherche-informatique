
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

		<title>List des Projets</title>
		<link type="text/css" rel="stylesheet" href="css/style.css">

</head>

<body>



<div id="wrapper">
	<div id="header">
		<h2>Gestion des projets</h2>
	</div>
	<div id="container">
	<h3>List des Projets</h3>
		<div id="content">
		
		<!-- add project button -->
		
		<c:url var="AddLink" value="ProjetControllerServlet">
		
		<c:param name="command" value="ListEquipe" />
				
		</c:url>
		<a href="${AddLink}" class="add-project-button">Ajouter Projet</a>
		
		
		
			<table>
			<tr>
				<th>IdProjet</th>
				<th>Theme</th>
				<th>Description</th>
				<th>Equipe</th>
				<th>Action</th>
			</tr>	
			<c:forEach var="temp" items="${Projet_list}">
			
			<c:url var="templink" value="ProjetControllerServlet">
				<c:param name="command" value="LOAD" />
				<c:param name="projetid" value="${temp.getIdProjet()}" />
			</c:url>
			
			<c:url var="deletelink" value="ProjetControllerServlet">
				<c:param name="command" value="DELETE" />
				<c:param name="projetid" value="${temp.getIdProjet()}" />
			</c:url>
			
			
				 <tr>
					<td> ${temp.getIdProjet()} </td>
					<td> ${temp.getTheme()} </td>
					<td> ${temp.getDescription()} </td>
					<td> ${temp.getNomEquipe()}</td>
					
					<td> 
						<a href="${templink}">update</a> | <a href="${deletelink}" onclick="if (!(confirm('are you sure you want to delete this project'))) return false">delete</a>
					</td>
				</tr>
			
			</c:forEach>		
			</table>
		
		</div>
	</div>

</div>	

</body>
</html>

