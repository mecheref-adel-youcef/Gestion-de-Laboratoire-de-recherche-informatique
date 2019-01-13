<%--
  Created by IntelliJ IDEA.
  User: Joseph_Youcef
  Date: 03/06/2018
  Time: 03:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<html>
<head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>contact</title>
        <link href="bootstrap.min.css" type="text/css" rel="stylesheet">
        <link href="bootstrap-them.min.css" type="text/css" rel="stylesheet">

        <link href="stl_2.css" type="text/css" rel="stylesheet">

        <link rel="apple-touch-icon" sizes="76x76" href="images/logo.png" />
        <link rel="icon" type="image/png" href="images/logo.png" />
        <style>

            .login-box{
                width: 500px;
                height: 530px;
                background: rgba(255, 255, 255, 0.96);
                color: #fff;
                border: #f9f9f9;
                border-bottom-left-radius: inherit;


            }
        </style>
    </head>
<body>
<div class="banner">

    <header>
        <div class="hat">
            <h2 style="color: #FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <img src="images/logo.png" height="30px" width="30px"/>&nbsp; LabRI</h2>
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
                    <li><a href="contact.jsp">Contact</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <br>
                    <a href="seconnecter.jsp">Se connecter</a>
                </ul>
            </div>  </div>
    </nav>

<!-- google map de nafissa -->
<!-- google map de nafissa -->
<!-- google map de nafissa -->
    <div class="col-lg-11"><br></div>
    <div class="row">
        <div class="col-lg-11">
    <div class="col-md-5 col-md-offset-1">

        <div class="login-box">

                <br><br><br>
        <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong style="color: #000000">INFORMATIONS GÉNÉRALES</strong></h4>
<br>
        <strong style="color: #000000">&nbsp;&nbsp;Adresse :</strong> <p style="color: #0f0f0f">BP 73, Bureau de poste EL WIAM, 22016 Sidi Bel Abbés, Algérie</p><br>
        <strong style="color: #000000">&nbsp;&nbsp;Tel :</strong>  <p style="color: #0f0f0f"> +213 48 74 94 52</p><br>
        <strong style="color: #000000">&nbsp;&nbsp;Fax :</strong> <p style="color: #0f0f0f"> +213 48 74 94 50</p>

        <p style="color: #0f0f0f">L’ESI de Sidi Bel Abbes est abritée par le site de l’ex-Faculté des lettres et sciences humaines.<br>
            Sidi Djilali, Sidi Bel Abbes, Algérie.
            <br><br></p></div></div>


<div class="col-sm-6 ">
    <iframe src="http://www.ma-carte-geographique.com/my-google-maps.php?SID=1528260077-XEul0" width="602" height="530" frameborder="0" hspace="0" vspace="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>

</div></div></div>

<%@include file="footer.jsp"  %>
</div>
</body>
</html>
