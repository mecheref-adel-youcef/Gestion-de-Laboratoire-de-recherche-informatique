<%@ page import="CRUD.Update" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="CRUD.Select" %><%--
  Created by IntelliJ IDEA.
  User: Joseph_Youcef
  Date: 04/06/2018
  Time: 18:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />


    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <link rel="apple-touch-icon" sizes="76x76" href="images/logo.png" />
    <link rel="icon" type="image/png" href="images/logo.png" />

    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />


    <!-- CSS Files -->
    <link href="stl_2_3.css" rel="stylesheet" />
    <link href="stl_2_4.css" rel="stylesheet" />

    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="demo_1.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>modifier equipe pour un chef d'equipe</title>
</head>
<body>
<%
    String id =(String) session.getAttribute("id_e_ch");
    String nom = request.getParameter("nom_e");
    String fullname = request.getParameter("fullname");
    String description = request.getParameter("description");
    boolean exist = false;
    // bdd
    if (!(nom == null) && !(nom.equals("")&& !exist)) {
        ResultSet resultSet6 = Select.query("select distinct nom from equipe;");

        while (resultSet6.next()){
            if(resultSet6.getString("nom").equals(nom)){
                //exist deja
                exist =true;
                response.sendRedirect("gestion_equipech.jsp?edch=ok");
                break;
            }
        }
        if(!exist) {
            String ins = "update equipe set nom=" + "'" + nom + "'" + " where idequipe=" + "'" + id + "';";

            Update.query(ins);
        }

    }
    if(!exist) {

        if (!(fullname == null) && !(fullname.equals(""))) {
            String ins = "update equipe set fullname=" + "'" + fullname + "'" + " where idequipe=" + "'" + id + "';";

            Update.query(ins);

        }

        if (!(description == null) && !(description.equals(""))) {
            String ins = "update equipe set description=" + "'" + description + "'" + " where idequipe=" + "'" + id + "';";

            Update.query(ins);

        }

        response.sendRedirect("gestion_equipech.jsp?msch=ok");
    }

%>

</body>
</html>
