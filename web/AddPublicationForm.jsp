<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>





<form action="ProjetControllerServlet" method="GET">
	
		<input type="hidden" name="command" value="ADD" /> 
		<table>
			<tbody>
				<tr>
					<td><label>Theme : </label></td>
					<td><input type="text" name="Titre" /></td>
				</tr>	
				
				<tr>
					<td><label>Description: </label></td>
					<td><input type="text" name="Description" /></td>
				</tr>	
				<tr>
					<td><label>TypePublicatipn </label></td>
					<td><input type="button" name="Description" /></td>
				</tr>	
				<tr>
					<td><label></label></td>
					<td><input type="submit" value="save" class="save" /></td>
				</tr>	
				
				
			</tbody>
		</table>
	
	</form>
	
	<p>
		<a href="PublicationControllerServlet"> retour a la list
		+</a>
	
	</p>








</body>
</html>