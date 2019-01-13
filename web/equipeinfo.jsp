<%@ page import="java.sql.ResultSet" %>
<%@ page import="CRUD.Select" %><%--
  Created by IntelliJ IDEA.
  User: Joseph_Youcef
  Date: 03/06/2018
  Time: 21:47
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
    <title>les equipes</title>
</head>
<body>

<%
  String idequipe = request.getParameter("id");

  String q = "select * from equipe where idequipe ="+idequipe;
        ResultSet resultSet = Select.query(q);
        resultSet.next();
    String q2="select p.nom,p.prenom from personne p ,equipe e where p.idEquipe="+idequipe+" and profession="+"\""+"Chef d'equipe"+"\""+" and p.idequipe=e.idequipe;";


    ResultSet resultSet1 = Select.query(q2);
    //resultSet1.next();
%>
<div class="banner">
    <div class="container">
        <div class="wizard-container" class="col-md-8 col-md-offset-2">
            <div class="card wizard-card" data-color="blue" id="wizard">
                <div class="row" >

                    <div class="col-md-6 col-md-offset-3">


                        <div class="wizard-header">
                            <h3 class="wizard-title">
                                <%=resultSet.getString("Nom")%>
                            </h3>

                        </div>

<br><br>
<%
    if(resultSet1.next()!=false){
        %><strong style="color: #00b0ff"><%=resultSet.getString("fullname")%></strong>
                        ,dirigée par le Pr .<em><%=resultSet1.getString("nom")%> <%=resultSet1.getString("prenom")%></em></center><%
    } else
        %><strong><%=resultSet.getString("fullname")%></strong></center><%
%>

<br>
                        <br>
<strong style="color: #00b0ff">Fondements Scientifiques :</strong><br><br>
   <% if(resultSet.getString("Description")!=null) {
       %><p><%=resultSet.getString("Description")%></p><%
} else {%><p>Pas encore</p><%}%><br><br>
<%
        String q3="select p.nom,p.prenom,p.specialite,p.email from personne p  where  p.idEquipe="+idequipe+" ;";
        ResultSet resultSet2 = Select.query(q3);
%>
<strong style="color: #00b0ff">Membres de l'équipe:</strong><br>

                        <table class="table">
    <tr><th>Nom</th><th>Prénom</th><th>Grade</th><th>E-mail</th></tr>
    <%while (resultSet2.next()){
        %><tr><td><%=resultSet2.getString("nom")%></td><td><%=resultSet2.getString("prenom")%></td><td><%=resultSet2.getString("specialite")%></td><td><%=resultSet2.getString("email")%></td></tr><%
    }%>
</table>

<br><br>
<%
    String q4="select p.nom,p.prenom,p.specialite,p.email from personne p where   relation="+idequipe+";";
    ResultSet resultSet3 = Select.query(q4);
%>
<strong style="color: #00b0ff">Doctorants :</strong><br>

                        <table class="table">
    <tr><th>Nom</th><th>Prénom</th><th>Specialité</th><th>E-mail</th></tr>
    <%while (resultSet3.next()){
    %><tr><td><%=resultSet3.getString("nom")%></td><td><%=resultSet3.getString("prenom")%></td><td><%=resultSet3.getString("specialite")%></td><td><%=resultSet3.getString("email")%></td></tr><%
    }%>
</table>

                    </div></div></div></div></div></div></div></div>
</body>
</html>
