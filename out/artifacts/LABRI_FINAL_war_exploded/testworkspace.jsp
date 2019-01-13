<%--
  Created by IntelliJ IDEA.
  User: Joseph_Youcef
  Date: 01/06/2018
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>workspace</title>
</head>
<body>

<%
    switch ((String) session.getAttribute("profession")){
        case "Admin" : response.sendRedirect("admin.jsp");
            break;
        case "Chercheur" : response.sendRedirect("chercheur.jsp");
            break;
        case "Chef d'equipe" : response.sendRedirect("chef_equipe.jsp");
            break;

    }

%>

</body>
</html>
