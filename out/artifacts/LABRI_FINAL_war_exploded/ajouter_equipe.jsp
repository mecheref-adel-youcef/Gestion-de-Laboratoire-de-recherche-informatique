<%@ page import="java.sql.ResultSet" %>
<%@ page import="CRUD.Select" %>
<%@ page import="CRUD.Insert" %><%--
  Created by IntelliJ IDEA.
  User: Joseph_Youcef
  Date: 04/06/2018
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ajouter equipe</title>
</head>
<body>
<%@include file="gestion_equipe.jsp"  %>
<%
     q = "select * from equipe";

    ResultSet resultSet2 = Select.query(q);
    boolean equipe_exist = false;
    if(request.getParameter("nom")!=null){
        while (resultSet2.next()){

            if(resultSet2.getString("nom").equals(request.getParameter("nom"))){
                equipe_exist = true;
                break;
            }

        }
        // si l'equipe exist
        if(equipe_exist){
%><div class="col-md-3"><div class="alert alert-danger" role="alert" ><h4 style="color: red"><strong> Equipe existe déja </strong> </h4></div></div><%
}
else{
    Insert.query("insert into equipe(Nom,fullname)values("+"'"+request.getParameter("nom")+"'"+","+"'"+request.getParameter("fullname")+"');");
            response.sendRedirect("gestion_equipe.jsp");
        }
    }

%>
</body>
</html>
