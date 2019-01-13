<%@ page import="java.sql.ResultSet" %>
<%@ page import="CRUD.Select" %><%--
  Created by IntelliJ IDEA.
  User: Joseph_Youcef
  Date: 02/06/2018
  Time: 05:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Evenements</title>
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
        <div class="col-lg-11"><br><br></div>


        <div class="col-lg-11"><br><br></div>
        <div class="col-lg-10 col-lg-offset-1" style="background-color:rgba(0,0,0,0.9)"><br><br>
            <table class="table">
                <thead>
                <tr style="color: #00b0ff">
                    <th>Titre</th><th>photo</th><th>DateDebut</th><th>DateFin</th><th>Lieu</th><th>Description</th></tr></thead>
                <%
                    String q = "select * from evenement ";
                    ResultSet resultSet;

                    resultSet = Select.query("select distinct DateDebut,DateFin,Lieu,Titre,Photo,Description  from evenement ;");

                    resultSet = Select.query(q);


                    while (resultSet.next()){


                %>
                <tr><td style="color: #FFFFFF"><strong><%=resultSet.getString("Titre")%></strong></td><td><img  class="img-thumbnail" src="<%=resultSet.getString("photo")%>"></td><td style="color: #FFFFFF"><%=resultSet.getString("DateDebut")%></td><td style="color: #FFFFFF"><%=resultSet.getString("DateFin")%></td><td style="color: #FFFFFF"><%=resultSet.getString("Lieu")%></td><td style="color: #FFFFFF"><%=resultSet.getString("description")%></td><td></td> </tr>
                <%

                    }%>
            </table>
        </div>

    </div>


</div></div>



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
