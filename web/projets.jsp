<%@ page import="CRUD.Delete" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="CRUD.Select" %><%--
  Created by IntelliJ IDEA.
  User: labdi nafissa
  Date: 06/06/2018
  Time: 07:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projets</title>
        <link href="bootstrap.min.css" type="text/css" rel="stylesheet">
        <link href="bootstrap-them.min.css" type="text/css" rel="stylesheet">

        <link href="stl_2_9.css" type="text/css" rel="stylesheet">

        <link rel="apple-touch-icon" sizes="76x76" href="images/logo.png" />
        <link rel="icon" type="image/png" href="images/logo.png" />
        <style >
            body{
                background-image: url("images/info.jpg") ;
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
                <th>Nom du projet</th><th>photo</th><th>Description</th></tr></thead>
            <%
                String q = "select * from projet ";
                ResultSet resultSet;

                    resultSet = Select.query("select distinct nom,photo,description  from projet ;");

                    resultSet = Select.query(q);


                while (resultSet.next()){


            %>
            <tr><td style="color: #FFFFFF"><strong><%=resultSet.getString("nom")%></strong></td><td><img  class="img-thumbnail" src="<%=resultSet.getString("photo")%>"></td><td style="color: #FFFFFF"><%=resultSet.getString("description")%></td><td></td> </tr>
            <%

                }%>
        </table>
       </div>

</div>


</div></div>


<form id="for">
    <footer style="background-color:rgba(0,0,0,0.9);color:#f1f8e9" class="page-footer font-small stylish-color-dark pt-4 mt-4">

        <!-- Footer Links -->
        <div class="container text-center text-md-left">

            <!-- Grid row -->
            <div class="row">

                <!-- Grid column -->
                <div class="col-md-4 " >

                    <br><br>                <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong style="color: #FFFFFF">INFORMATIONS GÉNÉRALES</strong></h4>
                    <br>
                    <p style="color: #FFFFFF"><i class="material-icons">language</i><strong style="color: #33b5e5">&nbsp;&nbsp;Adresse :</strong> BP 73, Bureau de poste EL WIAM, 22016 Sidi Bel Abbés, Algérie</p><br>
                    <p style="color: #FFFFFF"><i class="material-icons">perm_phone_msg</i><strong style="color: #33b5e5">&nbsp;&nbsp;Tel :</strong> +213 48 74 94 52</p><br>
                    <p style="color: #FFFFFF"><i class="material-icons">phone</i><strong style="color: #33b5e5">&nbsp;&nbsp;Fax :</strong>  +213 48 74 94 50</p>

                    <p style="color: #FFFFFF">+L’ESI de Sidi Bel Abbes est abritée par le site de l’ex-Faculté des lettres et sciences humaines.<br>
                        Sidi Djilali, Sidi Bel Abbes, Algérie.
                        <br><br></p>
                </div>
                <!-- Grid column -->

                <hr class="clearfix w-100 d-md-none">

                <!-- Grid column -->
                <div class="col-md-2 mx-auto">

                    <!-- Links -->
                    <iframe src="http://www.ma-carte-geographique.com/my-google-maps.php?SID=1528320138-E0YfC" width="802" height="300" frameborder="0" hspace="0" vspace="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>

                </div>
                <!-- Grid column -->

                <hr class="clearfix w-100 d-md-none">

                <!-- Grid column -->
                <div class="col-md-2 mx-auto">

                    <!-- Links -->
                    <h5 class="font-weight-bold text-uppercase mt-3 mb-4"></h5>

                    <ul class="list-unstyled">

                    </ul>

                </div>
                <!-- Grid column -->

                <hr class="clearfix w-100 d-md-none">

                <!-- Grid column -->
                <div class="col-md-2 mx-auto">

                    <!-- Links -->
                    <h5 class="font-weight-bold text-uppercase mt-3 mb-4"></h5>

                    <ul class="list-unstyled">

                    </ul>

                </div>
                <!-- Grid column -->

            </div>
            <!-- Grid row -->

        </div>
        <!-- Footer Links -->

        <hr>

        <!-- Call to action -->
        <ul class="list-unstyled list-inline text-center py-2">
            <li class="list-inline-item">
                <h5 class="mb-1"></h5>
            </li>
            <li class="list-inline-item">
                <a href="seconnecter.jsp" class='btn btn-previous btn-fill btn-info btn-wd'> se connecter</a>
            </li>
        </ul>
        <!-- Call to action -->

        <hr>

        <!-- Social buttons -->
        <ul class="list-unstyled list-inline text-center">
            <li class="list-inline-item">
                <a style="color: #33b5e5"href="https://www.facebook.com/Page-Officiel-de-lEcole-Sup%C3%A9rieure-dInformatique-de-Sidi-Bel-Abb%C3%A8s-502013669901855/"class="btn-floating btn-fb mx-1">
                    <i class="fa fa-facebook"> </i>
                </a>
            </li>
            <li class="list-inline-item">
                <a style="color: #33b5e5" href="https://twitter.com/ESI_SBA"class="btn-floating btn-tw mx-1">
                    <i class="fa fa-twitter"></i>
                </a>
            </li>
            <li class="list-inline-item">
                <a style="color: #33b5e5" href="mailto:m.malki@esi-sba.dz" class="btn-floating btn-gplus mx-1">
                    <i class="fa fa-google-plus"> </i>
                </a>
            </li>

        </ul>
        <!-- Social buttons -->

        <!-- Copyright -->
        <div class="footer-copyright text-center py-3">© 2018 Copyright:
            <a style="color: #33b5e5" href="#"> GROUPE-04</a>
        </div>
        <!-- Copyright -->

    </footer>
    <!-- Footer -->
</form>




</body>
</html>
