<%@ page import="CRUD.Select" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Joseph_Youcef
  Date: 04/06/2018
  Time: 19:12
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
    <title>gestion ds equipes</title>
    <script type="text/javascript">
        function showStuff(id) {
            document.getElementById(id).style.display = 'block';
            document.getElementById(id).children[1].setAttribute("required", "required");

        }
    </script>
</head>
<body>
<div class="banner">
    <div class="container">
        <div class="wizard-container" class="col-md-8 col-md-offset-2">
            <div class="card wizard-card" data-color="blue" id="wizard">
                <div class="row" >

                    <div class="col-md-6 col-md-offset-3">


                        <div class="wizard-header">
                            <h3 class="wizard-title">
                                gestion des equipes
                            </h3>
                            <h5>de LabRI</h5>
                        </div>
<%
    String email = (String) session.getAttribute("email");
    if(request.getParameter("ch")!=null){
        ResultSet resultSet= Select.query("select e.idequipe from equipe e,personne p where e.idequipe=p.idequipe and p.email="+"'"+email+"';");
        resultSet.next();
        session.setAttribute("id_e_ch",resultSet.getString("idequipe"));
%>
<center>
    <form action="modifier_equipech.jsp">
        <a href="#" class='btn btn-previous btn-fill btn-secondary btn-md' onclick="showStuff('nom'); return false;" >&nbsp;&nbsp;&nbsp;&nbsp;Changer l'abreviation d'equipe&nbsp;&nbsp; </a> <br><br>
        <div  class="col-md-6 col-sm-offset-3" id="nom" style="display: none"> Nom <br>
            <input  name="nom_e" type="text" class="form-control">
        </div>
        <a href="#" class='btn btn-previous btn-fill btn-secondary btn-md' onclick="showStuff('fullname'); return false;" >Changer le nom complet d'equipe </a> <br><br>
        <div class="col-md-6 col-sm-offset-3"id="fullname" style="display: none"> Nom complet <br>
            <input  name="fullname" type="text" class="form-control" >
        </div>
        <a href="#" class='btn btn-previous btn-fill btn-secondary btn-md' onclick="showStuff('description'); return false;" >Changer la description de l'equipe </a> <br><br>
        <div class="col-md-6 col-sm-offset-3"id="description" style="display: none"> Description <br>
            <textarea rows="6" cols="100" name="description" placeholder="tapez votre text ici" class="form-control" ></textarea>
        </div>
<div class="pull-right" class="col-lg-offset-8">
        <input type="submit" value="valider"class='btn btn-previous btn-fill btn-info btn-sm'/>
</div>
    </form>
</center>
<%

    }

    if(request.getParameter("msch")!=null){
%> <div class="col-md-6"><div class="alert alert-success" role="alert" ><h4 style="color: green;">Modification avec succes !</h4></div></div><%
    }else if(request.getParameter("edch")!=null){
                    %><div class="col-md-6"><div class="alert alert-danger" role="alert" > <h4 style="color: red;">Equipe existe déja</h4></div></div><%
    }


%>
</div></div></div>  </div></div></div>
</body>
</html>
