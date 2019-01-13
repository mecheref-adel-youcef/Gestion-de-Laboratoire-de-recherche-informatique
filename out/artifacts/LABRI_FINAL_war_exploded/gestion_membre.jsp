<%@ page import="CRUD.Delete" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="CRUD.Select" %><%--
  Created by IntelliJ IDEA.
  User: Joseph_Youcef
  Date: 06/06/2018
  Time: 07:00
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
    <title>gestion des membres</title>
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
        <div class="wizard-container" class="col-lg-12 col-md-offset-2">
            <div class="card wizard-card" data-color="blue" id="wizard">
                <div class="row" >
                    <br>
                    <div class="col-lg-7 col-md-offset-2">


                        <div class="wizard-header">
                            <h3 class="wizard-title">
                                gestion membre
                            </h3></div>
                            <br>
                            <div class="col-lg-4 col-sm-offset-4">
                                <form action="">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="text" class="form-control" name="recherche" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" class="btn btn-info btn-sm" value="rechercher" ></form>

                                </div>


                    </div>

                    <br><br><br><br><br><br>
                    <!-- doctorant le mem code que gestion membre sauf qlq truc  -->


                    <div class="col-lg-8 col-lg-offset-1">
                        <div class="col-md-2 col-md-offset-12
"><div class="col-sm-1"> &nbsp;&nbsp;&nbsp;</div><a class="btn btn-sm btn-info" href="gestion_membre.jsp?fm=am">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ajouter un membre&nbsp;&nbsp;&nbsp;&nbsp;</a><br> </div>


                        <table class="table">
                            <thead>
                            <tr style="color: #00b0ff">
                            <th>Email</th><th>Grade</th><th>Profession</th><th>Fonction</th></tr></thead>
        <%
            String q = "select * from personne where idequipe is not null";
            ResultSet resultSet;
            if(request.getParameter("recherche")!= null ){
                resultSet = Select.query("select distinct p.idpersonne,p.email,p.specialite,p.profession from equipe e, personne p where e.idequipe = p.idequipe and e.idequipe is not null and (e.nom like \"%"+request.getParameter("recherche")+"%\" or e.fullname like \"%"+request.getParameter("recherche")+"%\" or e.description like \"%"+request.getParameter("recherche")+"%\" or p.nom like \"%"+request.getParameter("recherche")+"%\" or p.prenom like \"%"+request.getParameter("recherche")+"%\" or p.email like \"%"+request.getParameter("recherche")+"%\" or p.specialite like \"%"+request.getParameter("recherche")+"%\" or p.profession like \"%"+request.getParameter("recherche")+"%\");");
            }else
            {
                resultSet = Select.query(q);
            }

            while (resultSet.next()){


        %>
        <tr><td><%=resultSet.getString("email")%></td><td><%=resultSet.getString("specialite")%></td><td><%=resultSet.getString("profession")%></td><td><a class="btn btn-sm btn-secondary" href="gestion_membre.jsp?idm=<%=resultSet.getString("idpersonne")%>&fm=mm">modifier</a><a class="btn btn-sm btn-secondary" href="gestion_membre.jsp?idm=<%=resultSet.getString("idpersonne")%>&fm=sm">supprimer</a></td> </tr>
        <%

            }%>
                        </table> </div>


    <%
        if(request.getParameter("fm")!=null){
            switch (request.getParameter("fm")){
                case "am":
    %>
                    <form style="color: #00b0ff" action="ajouter_membre.jsp">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


                        <div class="col-md-2">
                            <br><br><br><br><br>

                            +Email:
                            <input type="email" name="email_m" required="required" class="form-control"/>
                            +Mot de passe:
                            <input type="password" name="mdp_m" required="required" class="form-control"/>
                            +Confirmez le mot de passe:
                            <input type="password" name="mdp1_m" required="required" class="form-control"/>
                            +Grade:
                            <input type="text" name="grade_m" required="required" class="form-control"/>
                            +Profession : <br>
                            <select   name="profession_m" class="form-control">
                                <option disabled="" selected=""></option>
                                <option value="Chercheur"> Chercheur </option>
                                <option value="Chef d\'equipe">Chef d'equipe </option>
                                <option value="admin"> Admin </option>
                            </select>
                            +Joindre par l'equipe:
                            <input type="text" name="equipe_m" required="required" class="form-control"/>
                            <div class="pull-right">
                                <input type="submit" value="valider" class="btn btn-sm btn-secondary"/>
                            </div></div>
                    </form>

    <%



            break;
        case "mm": //out.print("modifier : "+request.getParameter("id"));
            session.setAttribute("id_p",request.getParameter("idm"));
    %>

                    <div class="col-md-2" style="color: #00b0ff">

    <form action="modifier_membre.jsp">



        <a href="#" class="btn btn-sm btn-info">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;modifier membre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
        <a href="#"   class="btn btn-sm btn-secondary"onclick="showStuff('email'); return false;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+Changer l'email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </a>

        <div id="email" style="display: none">
            -Email
            <input  name="email"class="form-control" type="email" >
        </div>
        <a href="#"  class="btn btn-sm btn-secondary" onclick="showStuff('mdp'); return false;" >+Changer le mot de passe </a>
        <div id="mdp" style="display: none">
            -Creez un mot de passe
            <input name="pass" class="form-control" type="password" >
            -Confirmez votre mot de passe
            <input name="pass1"class="form-control" type="password" >
        </div>
        <a href="#"   class="btn btn-sm btn-secondary"onclick="showStuff('grade'); return false;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+Changer le grade &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
        <div id="grade" style="display: none">-Grade
            <input  name="grade"class="form-control" type="text" >
        </div>

        <a href="#"   class="btn btn-sm btn-secondary" onclick="showStuff('profession'); return false;" >&nbsp;&nbsp;&nbsp;&nbsp;+Changer la profession </a>
        <div id="profession" style="display: none">-Profession
            <select   name="profession" class="form-control">
                <option disabled="" selected=""></option>
                <option value="Chercheur"> Chercheur </option>
                <option value="Chef d\'equipe">Chef d'equipe</option>
                <option value="Admin"> Admin </option>
            </select>
        </div>
        <a href="#"   class="btn btn-sm btn-secondary" onclick="showStuff('equipe'); return false;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+Changer l'equipe &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
        <div id="equipe" style="display: none" >-Equipe
            <input  name="equipe" type="text" class="form-control" >
        </div>
        <div class="pull-right">
        <input class="btn btn-sm btn-info" type="submit" value="valider"/>
        </div>
    </form></div>


    <%
                    break;
                case "sm":
                    ResultSet resultSet1 = Select.query("select idpersonne from personne where email ="+"'"+session.getAttribute("email")+"';");
                    resultSet1.next();
                   // out.print("idpersonne "+resultSet1.getString("idpersonne"));
                   // out.print("mon email "+session.getAttribute("email"));
                    if(resultSet1.getString("idpersonne").equals(request.getParameter("idm"))){
                            %><br><br><br><br><br><br><div class="col-md-3"><div class="alert alert-danger" role="alert" ><h4 style="color: red"><strong>impossible de supprimer votre compte !</strong></h4></div></div><%
                    }else{
                        Delete.query("delete from personne where idpersonne="+request.getParameter("idm"));
                        response.sendRedirect("gestion_membre.jsp");
                    }


                    break;
                default:

            }
        }
        if(request.getParameter("as")!=null){
    %> <br><br><br><br><br><br><div class="col-md-3"><div class="alert alert-success" role="alert" ><h4 style="color: green;">Membre est ajouté avec succes !</h4></div></div><%
    }
   else if(request.getParameter("ms")!=null){
                %><br><br><br><br><br><br><div class="col-md-3"><div class="alert alert-success" role="alert" > <h4 style="color: green;">Modification avec succes !</h4></div></div><%
    }
    %>





</body>
</html>
