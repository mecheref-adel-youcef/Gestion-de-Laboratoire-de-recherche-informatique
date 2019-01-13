<%@ page import="java.sql.ResultSet" %>
<%@ page import="CRUD.*" %><%--
  Created by IntelliJ IDEA.
  User: Joseph_Youcef
  Date: 04/06/2018
  Time: 09:16
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
    <title>gestion des equipes</title>
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
                            <br><br>
                            <div class="col-md-4 col-sm-offset-4">
                            <form action="">
                                <input type="text" class="form-control" name="recherche" > <input type="submit" class="btn btn-info btn-sm" value="rechercher" ></form>
                            </div>
                        </div>

<table class="table">
    <thead>
    <tr><th scope="col">Equipe</th><th scope="col">Responsable d'equipe</th><th scope="col">Fontion</th></tr></thead>
<%
    String q = "select * from equipe";
    String q2;
    ResultSet resultSet;
    if(request.getParameter("recherche")!= null ){
        resultSet = Select.query("select distinct e.idequipe,e.nom from equipe e where  (e.nom like \"%"+request.getParameter("recherche")+"%\" or e.fullname like \"%"+request.getParameter("recherche")+"%\" or e.description like \"%"+request.getParameter("recherche")+"%\" );");
    }else
    {
        resultSet = Select.query(q);
    }

    ResultSet resultSet1;
    int i=0;
    while (resultSet.next()){
        i++;
        q2="select p.nom,p.prenom from personne p ,equipe e where p.idEquipe="+resultSet.getString("idequipe")+" and profession="+"\""+"Chef d'equipe"+"\""+" and p.idequipe=e.idequipe;";

        resultSet1 = Select.query(q2);


        if(resultSet1.next()){

%>
<tr><td><%=resultSet.getString("nom")%></td><td><%=resultSet1.getString("nom")%> <%=resultSet1.getString("prenom")%></td><td><a class="btn btn-sm btn-secondary" href="gestion_equipe.jsp?id=<%=resultSet.getString("idequipe")%>&f=m">modifier</a><a class="btn btn-sm btn-secondary" href="gestion_equipe.jsp?id=<%=resultSet.getString("idequipe")%>&f=s">supprimer</a></td> </tr>
<% }
    else{
%>
    <tr><td><%=resultSet.getString("nom")%></td><td>Pas de responsable</td><td><a class="btn btn-sm btn-secondary" href="gestion_equipe.jsp?id=<%=resultSet.getString("idequipe")%>&f=m">modifier</a><a class="btn btn-sm btn-secondary" href="gestion_equipe.jsp?id=<%=resultSet.getString("idequipe")%>&f=s">supprimer</a></td> </tr>
    <%
    }

    }%>
</table>
<div class="col-md-offset-8">
    <a href="gestion_equipe.jsp?f=a" class="btn btn-info">Ajouter une equipe</a>
</div>


<%
    if(request.getParameter("f")!=null){
switch (request.getParameter("f")){
    case "a":
        %>
                        <div class="col-lg-6 col-lg-offset-3">
            <hr>
            <form action="ajouter_equipe.jsp">
            Nom complet : <br>
            <input type="text" name="fullname" required="required" class="form-control"/><br><br>
            Abréviation : <br>
            <input type="text" name="nom" required="required" class="form-control"/><br><br>
                <div class="pull-right">   <input type="submit" value="valider"class='btn btn-previous btn-fill btn-info btn-sm'/>
                </div> </form></div>
            <%



        break;
    case "m": //out.print("modifier : "+request.getParameter("id"));
                session.setAttribute("id_e",request.getParameter("id"));
            %>
                        <div class="col-lg-6 col-lg-offset-3">
    <form action="modifier_equipe.jsp">
        <a href="#" class='btn btn-previous btn-fill btn-secondary btn-sm' onclick="showStuff('nom'); return false;" >&nbsp;&nbsp;&nbsp;Changer l'abreviation d'equipe &nbsp;&nbsp;&nbsp;&nbsp;</a> <br><br>
        <div id="nom" style="display: none"> Nom <br>
            <input  name="nom_e" type="text" class="form-control">
        </div>
        <a href="#" class='btn btn-previous btn-fill btn-secondary btn-sm' onclick="showStuff('fullname'); return false;" >Changer le nom complet d'equipe&nbsp; </a> <br><br>
        <div id="fullname" style="display: none"> Nom complet <br>
            <input  name="fullname" type="text" class="form-control" >
        </div>
        <a href="#" class='btn btn-previous btn-fill btn-secondary btn-sm' onclick="showStuff('description'); return false;" >Changer la description de l'equipe </a> <br><br>
        <div id="description" style="display: none"> Description <br>
            <textarea rows="6" cols="100" name="description" placeholder="tapez votre text ici" class="form-control" ></textarea>
        </div>
<div class="pull-right">
        <input type="submit" value="valider" class='btn btn-previous btn-fill btn-info btn-sm'/>
</div>
    </form>
                        </div>

    <%
        break;
    case "s":     ResultSet resultSet8 = Select.query("select e.idequipe from equipe e, personne p where p.idequipe=e.idequipe and email ="+"'"+session.getAttribute("email")+"';");
        resultSet8.next();

        if(resultSet8.getString("idequipe").equals(request.getParameter("id"))){
    %><div class="col-md-8"><div class="alert alert-danger" role="alert" ><h4 style="color: red">impossible de supprimer votre équipe !</h4></div></div><%
            }else {

                Delete.query("delete from equipe where idequipe=" + request.getParameter("id"));
                Delete.query("delete from personne where relation=" + request.getParameter("id"));
                response.sendRedirect("gestion_equipe.jsp");
            }

        break;
        default:

}
    }

        if(request.getParameter("ms")!=null){
                    %> <div class="col-md-6"><div class="alert alert-success" role="alert" ><h4 style="color: green;">Modification avec succes !</h4></div></div><%
    }
    else if(request.getParameter("ed")!=null){
%> <div class="col-md-6"><div class="alert alert-danger" role="alert" ><h4 style="color: red"><strong> Equipe existe déja </strong> </h4></div></div><%
    }

%>






</div></div></div></div></div>
</div></body>
</html>
