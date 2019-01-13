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
    <title>gestion des doctorants</title>
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
        <div class="wizard-container" class="col-lg-11 col-md-offset-2">
            <div class="card wizard-card" data-color="blue" id="wizard">
                <div class="row" >
                    <br><br>
                    <div class="col-md-6 col-md-offset-3">


                        <div class="wizard-header">
                            <h3 class="wizard-title">
                                gestion doctorant
                                <div class="col-md-4 col-sm-offset-4">
                                    <form action="">
                                        <input type="text" class="form-control" name="recherche" > <input type="submit" class="btn btn-info btn-sm" value="rechercher" ></form>
                                </div>
                            </h3>

                        </div>
                    </div>
                    <br><br><br><br><br><br>
<!-- doctorant le mem code que gestion membre sauf qlq truc  -->

<div class="col-lg-6 col-lg-offset-3">
    <table class="table">
        <thead>
        <tr style="color: #00b0ff"><th>Email</th><th>Specialité</th><th>Fontion</th></tr></thead>
        <%
            String q1 = "select * from personne where idequipe is  null";
            ResultSet resultSet1;
            if(request.getParameter("recherche")!= null ){
                //  resultSet1 = Select.query("select distinct p.idpersonne,p.email,p.specialite from  personne p where  p.relation is not null and ( p.nom like \"%"+request.getParameter("recherche")+"%\" or p.prenom like \"%"+request.getParameter("recherche")+"%\" or p.email like \"%"+request.getParameter("recherche")+"%\" or p.specialite like \"%"+request.getParameter("recherche")+"%\" );");
                resultSet1 = Select.query("select distinct p.idpersonne,p.email,p.specialite from equipe e, personne p where e.idequipe = p.relation and p.relation is not null and (e.nom like \"%"+request.getParameter("recherche")+"%\" or e.fullname like \"%"+request.getParameter("recherche")+"%\" or e.description like \"%"+request.getParameter("recherche")+"%\" or p.nom like \"%"+request.getParameter("recherche")+"%\" or p.prenom like \"%"+request.getParameter("recherche")+"%\" or p.email like \"%"+request.getParameter("recherche")+"%\" or p.specialite like \"%"+request.getParameter("recherche")+"%\" or p.profession like \"%"+request.getParameter("recherche")+"%\");");

            }else
            {
                resultSet1 = Select.query(q1);
            }
            while (resultSet1.next()){


        %>
        <tr><td><%=resultSet1.getString("email")%></td><td><%=resultSet1.getString("specialite")%></td><td><a class="btn btn-sm btn-secondary" href="gestion_doctorant.jsp?idd=<%=resultSet1.getString("idpersonne")%>&fd=md">modifier</a> <a class="btn btn-sm btn-secondary"href="gestion_doctorant.jsp?idd=<%=resultSet1.getString("idpersonne")%>&fd=sd">supprimer</a></td> </tr>
        <%

            }%>
    </table></div>
                    &nbsp;&nbsp;&nbsp;
    <a class="btn btn-sm btn-info" href="gestion_doctorant.jsp?fd=ad">&nbsp;&nbsp;&nbsp;&nbsp;Ajouter un doctorant&nbsp;&nbsp;&nbsp;&nbsp;</a>

    <%
        if(request.getParameter("fd")!=null){

            switch (request.getParameter("fd")){
                case "ad":
    %>

    <form style="color: #00b0ff" action="ajouter_doctorant.jsp">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <div class="col-md-2">+Email:
        <input type="email" name="email_d" required="required" class="form-control"/>
        +Mot de passe:
        <input type="password" name="mdp_d" required="required" class="form-control"/>
        +Confirmez le mot de passe:
        <input type="password" name="mdp1_d" required="required" class="form-control"/>
        +Specialité:
        <input type="text" name="specialite_d" required="required" class="form-control"/>
        +Encadré par l'equipe:
        <input type="text" name="equipe_en_d" required="required" class="form-control"/>
           <div class="pull-right">
        <input type="submit" value="valider" class="btn btn-sm btn-secondary"/>
           </div></div>
    </form>
    <%



            break;
        case "md": //out.print("modifier : "+request.getParameter("id"));
            session.setAttribute("id_pd",request.getParameter("idd"));
    %>
                    <div class="col-md-2" style="color: #00b0ff">
    <form action="modifier_doctorant.jsp">
        <a href="#" class="btn btn-sm btn-info">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;modifier doctorant&nbsp;&nbsp;&nbsp;</a>
        <a href="#"   class="btn btn-sm btn-secondary"onclick="showStuff('email'); return false;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+Changer l'email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </a>
        <div id="email" style="display: none">-Email
            <input  name="email"class="form-control" type="email" >
        </div>
        <a href="#"  class="btn btn-sm btn-secondary" onclick="showStuff('mdp'); return false;" >+Changer le mot de passe </a>
        <div id="mdp" style="display: none">
            -Creez un mot de passe
            <input name="pass" class="form-control" type="password" >
            -Confirmez votre mot de passe
            <input name="pass1"class="form-control" type="password" >
        </div>
        <a href="#"   class="btn btn-sm btn-secondary"onclick="showStuff('specialite'); return false;" >&nbsp;&nbsp;+Changer la specialité&nbsp;&nbsp;&nbsp;</a>
        <div id="specialite" style="display: none">-Specialité
            <input  name="specialite"class="form-control" type="text" >
        </div>
        <a href="#"  class="btn btn-sm btn-secondary" onclick="showStuff('equipe'); return false;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+Changer l'equipe&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </a>
        <div id="equipe" style="display: none">-Equipe
            <input  nclass="form-control"ame="equipe" type="text" class="form-control" >
        </div>
        <div class="pull-right">
        <input type="submit"  class="btn btn-sm btn-info"value="valider"/>
        </div>
    </form>
                    </div>


    <%
                    break;
                case "sd":
                    Delete.query("delete from personne where idpersonne="+request.getParameter("idd"));
                    response.sendRedirect("gestion_doctorant.jsp");

                    break;
                default:

            }
        }
        if(request.getParameter("as")!=null){
    %> <div class="col-md-3"><div class="alert alert-success" role="alert" ><h4 style="color: green;"><strong>Doctorant est ajouté avec succes !</strong></h4></div></div><%
    } else if(request.getParameter("ms")!=null){
%> <div class="col-md-3"><div class="alert alert-success" role="alert" ><h4 style="color: green;"><strong>Modification avec succes !</strong></h4></div></div><%
    }
%>





</body>
</html>
