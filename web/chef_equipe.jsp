<%--
  Created by IntelliJ IDEA.
  User: Joseph_Youcef
  Date: 01/06/2018
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>chef d'equipe</title>
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

                    <div class="col-md-4 col-md-offset-4">


                        <div class="wizard-header">
                            <h2 class="wizard-title"> Chef d'equipe
                            </h2>

                        </div>
                    </div>

<!-- contient les fonctions du chercheur  -->
<%@include file="welcome.jsp"  %>
<%
 String email = (String) session.getAttribute("email");
    ResultSet resultSet9 = Select.query("select e.idequipe from equipe e,personne p where e.idequipe=p.idequipe and p.email="+"'"+email+"';");
    resultSet9.next();

%>
<div class="col-lg-9 col-lg-offset-2">
<a href="gestion_equipech.jsp?ch=ok"><input type="submit" value="&nbsp;&nbsp;&nbsp;&nbsp;Modifier mon equipe&nbsp;&nbsp;&nbsp;" class='btn btn-previous btn-fill btn-info btn-lg' /></a>
    <a href="equipeinfo.jsp?id=<%=resultSet9.getString("idequipe")%>"><input type="submit" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mon equipe&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" class='btn btn-previous btn-fill btn-info btn-lg' /></a> <br>
</div>

                </div> </div></div></div></div></div></div>
</body>
</html>
