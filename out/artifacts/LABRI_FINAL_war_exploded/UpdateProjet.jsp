<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>

<title>Update Projet Formulaire</title>

<link type="text/css" rel="stylesheet" href="css/style.css">
<link type="text/css" rel="stylesheet" href="css/addprojetstyle.css">

</head>
<body>

<div id="wrapper">
	<div id="header">
		<h2>Gestion des Projets</h2>
	</div>
	
</div>
<div id="container">
	<h3>Update Projet</h3>
	
	<form action="ProjetControllerServlet" method="GET">
	
		<input type="hidden" name="command" value="UPDATE" /> 
		<input type="hidden" name="projetid" value="${PROJET.getIdProjet()}" /> 
		
		<table>
			<tbody>
				<tr>
					<td><label>Theme : </label></td>
					<td><input type="text" name="Theme" VALUE="${PROJET.getTheme()}"/></td>
				</tr>	
				
				<tr>
					<td><label>Description: </label></td>
					<td><input type="text" name="Description" VALUE="${PROJET.getDescription()}" /></td>
				</tr>	
				
				<tr>
					<td><label>Equipe :</label></td>
					<td><select name="Equipe" >
										
						<c:forEach var="temp" items="${Equipe_list}">
						<c:choose>
							<c:when test="${PROJET.getNomEquipe().equals(temp)}"><option selected>${temp}</option></c:when>
							<c:otherwise><option>${temp}</option></c:otherwise>
						</c:choose>

						</c:forEach>
					
					</select></td>
				</tr>	
				
					<tr>
					<td><label></label></td>
					<td><input type="submit" value="save" class="save" /></td>
				</tr>
				
			</tbody>
		</table>
	
	</form>
	
	<p>
		<a href="ProjetControllerServlet"> retour a la list
		+</a>
	
	</p>
</div>

</body>

</html>