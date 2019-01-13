<%@ page import="java.sql.ResultSet" %>
<%@ page import="CRUD.Select" %>
<%@ page import="CRUD.Insert" %><%--
  Created by IntelliJ IDEA.
  User: Joseph_Youcef
  Date: 02/06/2018
  Time: 09:05
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
    <title>profil</title>
    <style>
        body{
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            background-size: cover;
            height: 100vh;
        }
    </style>

</head>
<body>

<%
    String nom="";
    String prenom="";
    String specialite="";
    String nomEquipe="";
    String fullEquipe="";
    String profession="";
    String photo="";
    String relation="";
    String adresse="";
    String email ;
    String idpersonne;

    if(session.getAttribute("email")!=null)
        //intranet
    email=(String) session.getAttribute("email");
    else{
        //pour n'import quelle membre ******** site *******
       idpersonne  = request.getParameter("id");
       ResultSet resultSet = Select.query("select email from personne where idpersonne="+Integer.parseInt(idpersonne));
       resultSet.next();
       email = resultSet.getString("email");
    }




    String q = "select p.nom,p.prenom,p.specialite,e.nom as nomequipe,e.fullname,p.profession,p.photo,p.relation,p.adresse from Personne p , equipe e where p.IdEquipe=e.IdEquipe and email="+"'"+email+"';";
    ResultSet resultSet = Select.query(q);
    while (resultSet.next()){
        nom = resultSet.getString("nom");
        prenom = resultSet.getString("prenom");
        specialite = resultSet.getString("specialite");
        nomEquipe = resultSet.getString("nomequipe");
        fullEquipe = resultSet.getString("fullname");
        profession = resultSet.getString("profession");
        photo = resultSet.getString("photo");
        relation =resultSet.getString("relation");
        adresse = resultSet.getString("adresse");


    }

    if(relation==null){  // il faut faire le design des 2 partie if(pour les membres d'equipes) et else (les doctorants)



%>
<div class="banner">
    <div class="container">
        <div class="wizard-container" class="col-md-8 col-md-offset-2">
            <div class="card wizard-card" data-color="blue" id="">
                <div class="row" >

                    <div class="col-md-4 col-md-offset-4">


                        <div class="wizard-header">
                            <h2 class="wizard-title">
                                <%=nom%> <%=prenom%>
                            </h2>
                        </div>
                    </div>
<div class="col-lg-8 col-lg-offset-5">
    <img src="<%=photo%>" height="150px" width="150px" alt="<%=profession%>" class="img-circle" border="3px" > </div><br>
                    <div class="col-lg-11"></div>
                    <div class="col-lg-8 col-lg-offset-2">



                                <h4><strong style="color:#33b5e5 ">+E-mail:</strong>&nbsp;<strong><a style="color: #0f0f0f" href="mailto:<%=email%>"><%=email%></a></strong></h4>


                            <h4><strong style="color:#33b5e5 ">+Grade: </strong>&nbsp;<%=specialite%></h4>

                            <h4><strong style="color:#33b5e5 ">+Domaine: </strong>Informatique</h4>
                        <h4><strong style="color:#33b5e5 ">+Equipe de Recherche: </strong><%=nomEquipe%></h4>

                            <h4><strong style="color:#33b5e5 ">+Adresse: </strong><%=adresse%></h4>

                                <h4><strong style="color:#33b5e5 ">+Structure de ratachement:</strong> ESI SBA - Ecole Supèrieur en Informatique de Sidi Bel Abbès</h4>
                                <h4><strong style="color:#33b5e5 ">+Equipe de Recherche: </strong><%=profession%> , <%=fullEquipe%></h4>
</div>
                    <div class="col-lg-8 col-lg-offset-2"><h4><strong style="color:#33b5e5 ">+Enseignements: </strong></h4>
                    <ul><%
            String ens="select * from enseignement e ,personne p where p.idpersonne=e.idpersonne and p.email="+"'"+email+"';";
            ResultSet resultSet1 = Select.query(ens);
            while (resultSet1.next()){
                %><li><%=resultSet1.getString("contenu")%></li><%
                 }
                    %></ul>

        <%}else {
         //doctorant
            String q1 = "select * from personne where  email="+"'"+email+"';";
            ResultSet resultSet1 = Select.query(q1);
            while (resultSet1.next()){
                nom = resultSet1.getString("nom");
                prenom = resultSet1.getString("prenom");
                specialite = resultSet1.getString("specialite");
                profession = resultSet1.getString("profession");
                photo = resultSet1.getString("photo");
                adresse=resultSet1.getString("adresse");
                relation =resultSet1.getString("relation");


            }
            String q2 ="select nom from equipe where idequipe="+relation;
            ResultSet resultSet2 = Select.query(q2);
            resultSet2.next();
            String findequipe = resultSet2.getString("nom");

        %><!--<div class="col-sm-8 col-md-offset-3"><ul class="list-unstyled list-inline text-center">
                            <li style="color: #FFFFFF" class="btn-floating btn-tw mx-1"class="list-inline-item"><a class="btn btn-previous btn-fill btn-info btn-wd" href="https://www.facebook.com/Page-Officiel-de-lEcole-Sup%C3%A9rieure-dInformatique-de-Sidi-Bel-Abb%C3%A8s-502013669901855/"> <i class="fa fa-facebook"> </i></a></li>
                            <li style="color: #FFFFFF" class="btn-floating btn-tw mx-1"class="list-inline-item"><a class="btn btn-previous btn-fill btn-info btn-wd" href="https://twitter.com/ESI_SBA"> <i class="fa fa-twitter"></i></a></li>
                            <li style="color: #FFFFFF" class="btn-floating btn-tw mx-1" class="list-inline-item"><a class="btn btn-previous btn-fill btn-info btn-wd" href="mailto:<%=email%>"><i class="fa fa-google-plus"> </i></a></li>
                        </ul>
                        </div>-->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
                        <div class="banner">
                            <div class="container">
                            <div class="wizard-container" class="col-md-8 col-md-offset-2">
                                <div class="card wizard-card" data-color="blue" id="#">
                                    <div class="row" >
                    <div class="col-md-8 col-md-offset-4">




                                        <div class="col-lg-8 col-lg-offset-1">
<br>
                                                <h2 class="wizard-title">
                                                    <%=nom%> <%=prenom%>
                                                </h2>
                                            <br><br>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <img src="<%=photo%>" height="150px" width="150px" alt="<%=profession%>" class="img-circle" border="3px"></div>
                                        <div class="col-lg-11"></div>
                                        <div class="col-lg-8 "> <h4><strong style="color:#33b5e5 ">+E-mail: </strong><%=email%></h4>
                    <h4><strong style="color:#33b5e5 ">+Specialité: </strong><%=specialite%></h4>
                    <h4><strong style="color:#33b5e5 ">+Domaine: </strong>Informatique</h4>

                    <h4><strong style="color:#33b5e5 ">+Adresse: </strong><%=adresse%></h4>

                    <h4><strong style="color:#33b5e5 ">+Doctorant :</strong> encadré par l'equipe <strong><%=findequipe%></strong></h4>
                                            <h4><strong style="color:#33b5e5 ">+Enseignements:  </strong></h4></div></div>
                    <div class="col-lg-8 col-lg-offset-2"><ul><%
    String ens="select * from enseignement e ,personne p where p.idpersonne=e.idpersonne and p.email="+"'"+email+"';";
    ResultSet resultSet3 = Select.query(ens);
    while (resultSet3.next()){
%><li><%=resultSet3.getString("contenu")%></li><%
    }
%></ul>

<%

    }%></div><div class="col-sm-8 col-md-offset-2">
                        <ul class="list-unstyled list-inline text-center">
                            <li class="list-inline-item"><a style="color: #FFFFFF" class="btn btn-previous btn-fill btn-info btn-wd" href="https://www.facebook.com/Page-Officiel-de-lEcole-Sup%C3%A9rieure-dInformatique-de-Sidi-Bel-Abb%C3%A8s-502013669901855/"><i class="fa fa-facebook"> </i></a></li>
                            <li class="list-inline-item"><a style="color: #FFFFFF" class="btn btn-previous btn-fill btn-info btn-wd" href="https://twitter.com/ESI_SBA"><i class="fa fa-twitter"></i></a></li>
                            <li class="list-inline-item"><a style="color: #FFFFFF" class="btn btn-previous btn-fill btn-info btn-wd" href="mailto:<%=email%>"><i class="fa fa-google-plus"> </i></a></li>
                        </ul>
                    </div>
                    </div></div></div></div></div></div></div></div>
</body>
</html>
