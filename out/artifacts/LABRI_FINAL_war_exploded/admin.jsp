<%--
  Created by IntelliJ IDEA.
  User: Joseph_Youcef
  Date: 01/06/2018
  Time: 19:27
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
    <title>Admin</title>
    <script type="text/javascript">
        history.pushState(null, null, location.href);
        window.onpopstate = function () {
            history.go(1);
        };
    </script>
</head>
<body>
<div class="banner">
    <div class="container">
        <div class="wizard-container" class="col-md-8 col-md-offset-2">
            <div class="card wizard-card" data-color="blue" id="wizard">
                <div class="row" >

                    <div class="col-md-1 col-md-offset-5">


                        <div class="wizard-header">
                            <h1 class="wizard-title">
                                Admin
                            </h1>

                        </div>
                    </div>

<!-- contient les fonctions du chef d'equipe  -->
<%@include file="welcome.jsp"  %>
                    <div class="col-lg-9 col-lg-offset-2">
<a href="gestion_personnel.jsp"><input type="submit" value="gestion du personnels" class='btn btn-previous btn-fill btn-info btn-lg' /></a>
<a href="gestion_equipe.jsp"><input type="submit" value="&nbsp;&nbsp;&nbsp;&nbsp;gestion des equipes&nbsp;&nbsp;&nbsp;" class='btn btn-previous btn-fill btn-info btn-lg' /></a>
<%
    String email = (String) session.getAttribute("email");
    ResultSet resultSet7= Select.query("select e.idequipe from equipe e,personne p where e.idequipe=p.idequipe and p.email="+"'"+email+"';");
    resultSet7.next();

%>
<a href="equipeinfo.jsp?id=<%=resultSet7.getString("idequipe")%>"><input type="submit" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mon equipe&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" class='btn btn-previous btn-fill btn-info btn-lg' /></a> <br>
                    </div> </div></div></div></div></div></div>

</body>

</html>
