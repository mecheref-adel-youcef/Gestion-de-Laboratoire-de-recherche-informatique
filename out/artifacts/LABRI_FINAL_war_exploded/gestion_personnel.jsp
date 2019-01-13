<%@ page import="java.sql.ResultSet" %>
<%@ page import="CRUD.Select" %>
<%@ page import="CRUD.Delete" %><%--
  Created by IntelliJ IDEA.
  User: Joseph_Youcef
  Date: 04/06/2018
  Time: 09:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />


    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <link rel="apple-touch-icon" sizes="76x76" href="logo.png" />
    <link rel="icon" type="image/png" href="logo.png" />

    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
    <link rel="stylesheet" href="stl_2_2" />

    <!-- CSS Files -->
    <link href="stl_2_3.css" rel="stylesheet" />
    <link href="stl_2_4.css" rel="stylesheet" />

    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="demo_1.css" rel="stylesheet" />
    <title> gestion du personnel</title>

</head>
<body>

<center><div class="container">
    <div class="row">
        <div class="col-sm-8 col-sm-offset-2">
            <!--      Wizard container        -->
            <div class="wizard-container">
                <div class="card wizard-card" data-color="blue" id="wizard">
    <form action="">
        <br><br>
        <div class="tab-pane" id="groupe">
        <h4 class="info-text">editer.!</h4>
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <br><br>
                <div class="col-sm-4">
                    <h6>Doctorant</h6>
                    <label class="btn btn-secondary active">
                        <input type="radio"  id="doctorant_r" name="groupe" value="doctorant">
                        <i class="material-icons">perm_identity</i>

                    </label>


                </div>
                <div class="col-sm-4">

                </div>
                <div class="col-sm-4">
                    <h6>Membre</h6>
                    <label class="btn btn-secondary active">
                        <input type="radio" id="membre_r" name="groupe" value="membre" >

                            <i class="material-icons">how_to_reg</i>
                    </label>


                </div>
            </div>
        </div>
    </div>



            <input type="submit" name="suivant" value="suivant"class="btn btn-previous btn-fill btn-info btn-wd" >
    </form></div></div></div></div></div>
</center>

<%
    String choix = request.getParameter("groupe");
       // out.print(choix);
    if(choix!=null){
        if(choix.equals("membre")){
            response.sendRedirect("gestion_membre.jsp");
        }
        else if (choix.equals("doctorant")){
            response.sendRedirect("gestion_doctorant.jsp");
        }
        else {

        }

    }


%>

    </body>
</html>
