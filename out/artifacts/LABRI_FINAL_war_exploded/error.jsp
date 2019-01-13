<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Login Error</title>
</head>
<body>
<center><br><br><br><p style="color:red"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Désolé, nous ne reconnaissons pas ce compte.</strong></p></center>
<%
    request.getServletContext().getRequestDispatcher("/seconnecter.jsp").include(request, response);
%>
</body>
</html>