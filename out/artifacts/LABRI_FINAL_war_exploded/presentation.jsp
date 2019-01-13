<%@ page import="java.sql.ResultSet" %>
<%@ page import="CRUD.Select" %><%--
  Created by IntelliJ IDEA.
  User: Joseph_Youcef
  Date: 02/06/2018
  Time: 05:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Présentation</title>
        <link href="bootstrap.min.css" type="text/css" rel="stylesheet">
        <link href="bootstrap-them.min.css" type="text/css" rel="stylesheet">

        <link href="stl_2.css" type="text/css" rel="stylesheet">

        <link rel="apple-touch-icon" sizes="90x90" href="images/labri.png" />
        <link rel="icon" type="image/png" href="images/labri.png" />
        <style>
            body{
                margin: 0;
                padding: 0;
                background-color: #f7f7f7;

            }
        </style>
    </head>
<body>
<div class="banner">

    <header>
        <div class="hat">
            <h2 style="color: #FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <img src="images/logo1.png" height="70px" width="150px"/></h2>
        </div>
        <div class="search">
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &MediumSpace;&MediumSpace;&MediumSpace;



            &MediumSpace;



        </div>&nbsp;&nbsp;&nbsp;
        <div class="clearfix"></div>
    </header>
    <nav class="navbar-inverse nav-right">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">


                    <li><a href="presentation.jsp">Presentation</a></li>
                    <li><a href="equipe_rech.jsp">Equipes de recherche</a></li>
                    <li><a href="membres.jsp">Membres</a></li>
                    <li><a href="evenements.jsp">Evenements</a></li>
                    <li><a href="publications.jsp">Publications</a></li>
                    <li><a href="projets.jsp">Projets</a></li>

                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <br>

                </ul>
            </div>  </div>
    </nav>


    <div class="row" >

        <div class="col-lg-12"><br><br></div>
        <div class="col-md-10 col-md-offset-1" style="background-color: rgba(0,0,0,0.4)">
            <div class="col-lg-10"><br><br></div>
            <div  class="col-md-4 col-md-offset-1 " style="color: #FFFFFF;">
                <h3 style="color: #FFFFFF"><strong> Le Laboratoire de Recherche en Informatique de Sidi Bel-Abbes</strong> </h3>
            </div>
            <div class="col-lg-10"><br><br></div>

            <div  class="col-lg-5 col-md-offset-1 " style="color: #FFFFFF">
                <h4 style="color: #FFFFFF"><strong>(LabRI-SBA) a été créé au sein de l’École Supérieure en Informatique de
                    Sidi Bel-Abbes par l’arrêté ministériel n° 1218 du 02 Décembre 2015.</strong></h4><br>
                <h5 style="color: #FFFFFF">  L’ESI de Sidi Bel-Abbes a l’ambition par la création de ce nouveau laboratoire de recherche en informatique de renforcer son statut de
                    pôle d’excellence pour les études pré-doctorales et doctorales, conjuguant recherche et formation d’excellence.</h5>
                <br><br><br></div>
        </div>
    </div>
    <div class="col-lg-12"><br><br></div><div class="col-lg-12"><br><br></div><div class="col-lg-12"><br><br></div>
</div>
<div class="row">
<div class="col-lg-12"><br><br></div>
<div class="col-md-6 col-sm-offset-4" ><h3 style="color: #000000"> <strong>Sous la direction du Pr.</strong><i style="color:#00acc1"> Malki Mimoun</i>,</h3></div>
<div class="col-sm-offset-1 col-sm-11"> <h4 style="color: #000000"><strong>le laboratoire s'articule autour des équipes thématiques alliant recherche fondamentale, recherche
    appliquée et transfert technologique :</strong></h4><br></div>
<br><br>
    <div class="col-lg-10 col-lg-offset-1" style="background-color: rgba(0,0,0,0.1)">
<div class="col-lg-10" ><br></div>
        <div class="col-lg-10">
<%
    String q = "select * from equipe";
    String q2;
    ResultSet resultSet = Select.query(q);
    ResultSet resultSet1;
    int i=0;
    while (resultSet.next()){
        i++;
        q2="select p.nom,p.prenom from personne p ,equipe e where p.idEquipe="+resultSet.getString("idequipe")+" and profession="+"\""+"Chef d'equipe"+"\""+ "and p.idequipe=e.idequipe;";
        resultSet1 = Select.query(q2);

        if(resultSet1.next()){

%>

<div class="col-lg-9 col-lg-offset-3" style="background-color:#080808;color: #FFFFFF">
    <br>
    <strong style="color:#00acc1">Equipe <%=i%> :</strong>
    <br>
    <span >&nbsp; <%=resultSet.getString("fullname")%> (<strong style="color:#00acc1"><%=resultSet.getString("nom")%></strong>), </span>
    <span >dirigée</span>
    <span > par le Pr. <em><%=resultSet1.getString("nom")%> <%=resultSet1.getString("prenom")%></em></span><br>
    <br></div>
            <div class="col-lg-10"><br><br></div>
<% }
else{
%>
            <div class="col-lg-9 col-lg-offset-3" style="background-color:#080808;color: #FFFFFF">
                <br>
                <strong style="color:#00acc1">Equipe:<%=i%> </strong>
                <br>
                <span >&nbsp; <%=resultSet.getString("fullname")%> (<strong style="color:#00acc1"><%=resultSet.getString("nom")%></strong>),Pas de responsable </span>
                <br>
                <br></div>
            <div class="col-lg-10"><br><br></div>
<%
        }}


%></div>
</div>
</div>
</div>
</div>
</div></div>
</div>
</div></div>
</div>
</div>
<%@include file="footer.jsp"  %>


</body>
</html>