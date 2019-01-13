<%@ page import="CRUD.Insert" %>
<%@ page import="CRUD.Update" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="CRUD.Select" %>
<%@ page import="javaBean.PasswordUtils" %><%--
  Created by IntelliJ IDEA.
  User: Joseph_Youcef
  Date: 01/06/2018
  Time: 19:44
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
    <link href="bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="bootstrap-them.min.css" type="text/css" rel="stylesheet">



    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />


    <!-- CSS Files -->
    <link href="stl_2_3.css" rel="stylesheet" />
    <link href="stl_2_4.css" rel="stylesheet" />

    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="demo_1.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>editer profil</title>
    <script type="text/javascript">
        function showStuff(id) {
            document.getElementById(id).style.display = 'block';
            document.getElementById(id).children[1].setAttribute("required", "required");

        }
    </script>
</head>
<body>
<center>
<% String nom,prenom,adresse,sexe,email,specialite,photo,enseignement;
    email = (String) session.getAttribute("email");
    String ins;
    String mdps ="";


%>
    <div class="banner">
        <div class="container">
            <div class="wizard-container" class="col-lg-10 col-md-offset-2">
                <div class="card wizard-card" data-color="blue" id="">
                    <div class="row" >
                        <div class="col-md-6 col-md-offset-3">


                            <div class="wizard-header">
                                <h3 class="wizard-title">
                                    editer vos information personnels
                                </h3>
                            </div>
                        </div>
                        <div class="col-md-4 col-lg-offset-4">
    <jsp:useBean id="bean" class="javaBean.comparePass"/>
<form action="">
     <a href="#"  class="btn btn-secondary btn-sm" onclick="showStuff('mdp'); return false;" >Changer le mot de passe </a>
    <div class="col-sm-8 col-sm-offset-2"  id="mdp" style="display: none">
    Creez un mot de passe <br>
         <input name="pass" type="password" class="form-control ">
    confirmez votre mot de passe
    <input name="pass1" type="password" class="form-control ">
    </div>
    <a href="#"  class="btn btn-secondary btn-sm" onclick="showStuff('nom'); return false;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Changer votre nom&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
   <div class="col-sm-8 col-sm-offset-2" id="nom" style="display: none"> Nom
       <input  name="nom" type="text" class="form-control ">
       <%
           if(request.getParameter("pass")!=null && request.getParameter("pass1")!= null){
           if(!bean.confirmation(request.getParameter("pass"),request.getParameter("pass1"))){
       %>

       <h4 style="color: red">la confirmation du mot de passe est incorrect !</h4>


       <%
       } else {
           nom = request.getParameter("nom");
           // bdd
           if (!(nom == null) && !(nom.equals(""))) {
               ins = "update personne set nom="+"'"+nom+"'"+" where email="+"'"+email+"';";

               Update.query(ins);
           }
       }
           }



       %>
       <br> <br>
   </div>
    <a href="#"  class="btn btn-secondary btn-sm" onclick="showStuff('prenom'); return false;" >&nbsp;Changer votre prenom &nbsp;</a>
    <div class="col-sm-8 col-sm-offset-2" id="prenom" style="display: none">
        Prenom <br>
        <input name="prenom" type="text" class="form-control " >
        <br> <br>
        <%
            if(request.getParameter("pass")!=null && request.getParameter("pass1")!= null){
            if(!bean.confirmation(request.getParameter("pass"),request.getParameter("pass1"))){
        %>

        <h4 style="color: red">la confirmation du mot de passe est incorrect !</h4>


        <%
        } else {


            prenom = request.getParameter("prenom");
            // bdd
            if (!(prenom == null) && !(prenom.equals(""))) {
                ins = "update personne set prenom=" + "'" + prenom + "'" + " where email=" + "'" + email + "';";

                Update.query(ins);
            }
        }
            }

        %>
    </div>
    <a href="#"  class="btn btn-secondary btn-sm" onclick="showStuff('sexe'); return false;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Changer votre sexe &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
    <div class="col-sm-8 col-sm-offset-2"  id="sexe" style="display: none">
        Sexe <br>
        <select   name="sexe" class="form-control">
            <option disabled="" selected=""></option>
            <option value="homme"> homme </option>
            <option value="femme">femme </option>
        </select>
        <%
            if(request.getParameter("pass")!=null && request.getParameter("pass1")!= null){
            if(!bean.confirmation(request.getParameter("pass"),request.getParameter("pass1"))){
        %>

        <h4 style="color: red">la confirmation du mot de passe est incorrect !</h4>


        <%
        } else {

            sexe = request.getParameter("sexe");
            // bdd
            if (!(sexe == null) && !(sexe.equals(""))) {
                ins = "update personne set sexe=" + "'" + sexe + "'" + " where email=" + "'" + email + "';";

                Update.query(ins);
            }
        }
            }

        %>
        <br> <br>
    </div>
    <a href="#"  class="btn btn-secondary btn-sm"  onclick="showStuff('photo'); return false;" >&nbsp;&nbsp;&nbsp;&nbsp;Changer votre photo&nbsp;&nbsp;&nbsp;&nbsp; </a>
    <div class="col-sm-8 col-sm-offset-2" id="photo" style="display: none">
        Choisir une photo :
        <input name="photo" type="file" class='btn btn-previous btn-fill btn-info btn-sm'>
        <br> <br>
        <%
            if(request.getParameter("pass")!=null && request.getParameter("pass1")!= null){
            if(!bean.confirmation(request.getParameter("pass"),request.getParameter("pass1"))){
        %>

        <h4 style="color: red">la confirmation du mot de passe est incorrect !</h4>


        <%
        } else {

            photo = request.getParameter("photo");
            // bdd
            if (!(photo == null) && !(photo.equals(""))) {
                ins = "update personne set photo=" + "'images/" + photo + "'" + " where email=" + "'" + email + "';";

                Update.query(ins);
            }
        }
            }

        %>
    </div>
    <a href="#"  class="btn btn-secondary btn-sm" onclick="showStuff('specialite'); return false;" >Changer votre specialité </a>
    <div class="col-sm-8 col-sm-offset-2" id="specialite" style="display: none">
        Specialité : <br>
        <input name="specialite" type="text"class="form-control " >
        <br> <br>
        <%
            if(request.getParameter("pass")!=null && request.getParameter("pass1")!= null){
            if(!bean.confirmation(request.getParameter("pass"),request.getParameter("pass1"))){
        %>

        <h4 style="color: red">la confirmation du mot de passe est incorrect !</h4>


        <%
        } else {

            specialite = request.getParameter("specialite");
            // bdd
            if (!(specialite == null) && !(specialite.equals(""))) {
                ins = "update personne set specialite=" + "'" + specialite + "'" + " where email=" + "'" + email + "';";

                Update.query(ins);
            }
        }
            }

        %>
    </div>
    <a href="#"  class="btn btn-secondary btn-sm" onclick="showStuff('adresse'); return false;" >&nbsp;&nbsp;&nbsp;Changer votre adresse&nbsp;&nbsp;&nbsp;</a>
    <div class="col-sm-8 col-sm-offset-2" id="adresse" style="display: none"> Adresse: <br>
        <input name="adresse" type="text" class="form-control ">
        <br> <br>
        <%
            if(request.getParameter("pass")!=null && request.getParameter("pass1")!= null){
            if(!bean.confirmation(request.getParameter("pass"),request.getParameter("pass1"))){
        %>

        <h4 style="color: red">la confirmation du mot de passe est incorrect !</h4>


        <%
        } else {

            adresse = request.getParameter("adresse");
            // bdd
            if (!(adresse == null) && !(adresse.equals(""))) {
                ins = "update personne set adresse=" + "'" + adresse + "'" + " where email=" + "'" + email + "';";

                Update.query(ins);
            }
        }
            }

        %>
    </div>
    <a href="#"  class="btn btn-secondary btn-sm" onclick="showStuff('enseignement'); return false;" >Ajouter un enseignement </a><br>
    <div class="col-sm-8 col-sm-offset-2" id="enseignement" style="display: none"> Enseignement :
        <textarea rows="2" cols="40" name="enseignement" placeholder="tapez votre text ici" class="form-control "></textarea>
        <br> <br>
        <%
            if(request.getParameter("pass")!=null && request.getParameter("pass1")!= null){
            if(!bean.confirmation(request.getParameter("pass"),request.getParameter("pass1"))){
        %>

        <h4 style="color: red">la confirmation du mot de passe est incorrect !</h4>


        <%
        } else {

            enseignement = request.getParameter("enseignement");
            // bdd
            String id;
            if (!(enseignement == null) && !(enseignement.equals(""))) {
                id = "select idpersonne from personne where email=" + "'" + email + "'";
                ResultSet resultSet = Select.query(id);
                resultSet.next();
                ins = "insert into Enseignement(IdPersonne,contenu) VALUES (" + "'" + resultSet.getString("idpersonne") + "'" + "," + "'" + enseignement + "'" + ");";

                Insert.query(ins);
            }
        }
            }

        %>
    </div>

<div class="pull-right">
    <input   name="save" value="Enregistrer" type="submit" class='btn btn-previous btn-fill btn-info btn-md'/>
</div></form>

<% if(request.getParameter("pass")!=null && request.getParameter("pass1")!= null){


    if(!bean.confirmation(request.getParameter("pass"),request.getParameter("pass1"))){
%>

<h4 style="color: red">la confirmation du mot de passe est incorrect !</h4>


<%
    } else {

        mdps = request.getParameter("pass");

      /*
        prenom = request.getParameter("prenom");
        adresse = request.getParameter("adresse");
        sexe = request.getParameter("sexe");*/


        // bdd
        if(!(mdps==null) && !(mdps.equals(""))){
            // Generate Salt. The generated value can be stored in DB.
            String salt = PasswordUtils.getSalt(30);

            // Protect user's password. The generated value can be stored in DB.
            String mySecurePassword = PasswordUtils.generateSecurePassword(mdps, salt);

            ins = "update personne set mot_de_passe="+"'"+mySecurePassword+"'"+" , salt="+"'"+salt+"'"+"  where email="+"'"+email+"';";

            Update.query(ins);
        }
        %><center><h4 style="color: green"> Enregistration avec succes !</h4></center>
                 <center><a href="testworkspace.jsp" >Mon espace de travail</a></center>   <%
    }
    }

%>
                        </div>
</div></div></div></div></div></div></center></body>
</html>














