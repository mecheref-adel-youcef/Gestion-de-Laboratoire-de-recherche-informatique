<%@ page import="java.sql.ResultSet" %>
<%@ page import="CRUD.Select" %>
<%@ page import="sun.awt.SunHints" %>
<%@ page import="jdk.internal.org.objectweb.asm.tree.analysis.Value" %><%--
  Created by IntelliJ IDEA.
  User: Joseph_Youcef
  Date: 02/06/2018
  Time: 05:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>les equipes de recherches</title>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="bootstrap.min.css" type="text/css" rel="stylesheet">
        <link href="bootstrap-them.min.css" type="text/css" rel="stylesheet">

        <link href="stl_2.css" type="text/css" rel="stylesheet">

        <link rel="apple-touch-icon" sizes="76x76" href="images/logo.png" />
        <link rel="icon" type="image/png" href="images/logo.png" />
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


<br><br>
        <div class="col-sm-2 col-md-offset-1" style="background-color: rgba(0,0,0,0.5)">


 <br><br>
<ul>
<%
    String q="select * from equipe ";  // aficher tous les equipes sous forme d'une liste
    ResultSet resultSet =Select.query(q);

    while (resultSet.next()){
%><li><strong> <h4><a style="color: #FFFFFF" href="equipeinfo.jsp?id=<%=resultSet.getString("idequipe")%>" ><%=resultSet.getString("nom")%></a></h4></strong></li><%
    }


%>
</ul>
  <br><br>          </div>
        <div class="col-sm-1">&nbsp;&nbsp;</div>
    <div class="col-md-6 col-sm-2"  style="background-color: rgba(0,0,0,0.7)">
        <br><br>
       <h4> <strong style="color: #FFFFFF">La diversité et la dynamicité des données, des services, des dispositifs d'interaction et des contextes d'usage imposent l'évolution des systémes et des logiciels pour en garantir des propriétés essentielles telles que leur fiabilité, performance, autonomie et adaptabilité. Relever ces défis trouve une résonance dans les équipes de recherche explorés au LabRI
       </strong></h4>
    <br><br></div> </div></div>
</body>
</html>
