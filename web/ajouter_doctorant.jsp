<%@ page import="CRUD.Insert" %>
<%@ page import="javaBean.PasswordUtils" %><%--
  Created by IntelliJ IDEA.
  User: Joseph_Youcef
  Date: 06/06/2018
  Time: 07:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Ajouter doctorant</title>
</head>
<body>
<jsp:useBean id="bean" class="javaBean.comparePass"/>
<%@include file="gestion_doctorant.jsp"  %>
<%
    q1 = "select * from personne";

    ResultSet resultSet2 = Select.query(q1);
    boolean email_exist = false;
    if(request.getParameter("email_d")!=null){
        String mdp = request.getParameter("mdp_d");
        String mdp1 = request.getParameter("mdp1_d");

        if(!bean.confirmation(mdp,mdp1)){
%><div class="col-md-3"><div class="alert alert-danger" role="alert" ><h4 style="color: red"><strong>la confirmation du mot de passe est incorrect !</strong></h4></div></div><%
} else {
    while (resultSet2.next()){

        if(resultSet2.getString("email").equals(request.getParameter("email_d"))){
            email_exist = true;
            break;
        }

    }
    // si l'email exist
    if(email_exist){
%><div class="col-md-3"><div class="alert alert-success" role="alert" ><h4 style="color: red"><strong> Email existe déja </strong></h4></div></div><%
}

else {
    String q2 = "select * from equipe";
    String idequipe ="";

    ResultSet resultSet3 = Select.query(q2);
    boolean equipe_exist = false;

    while (resultSet3.next()){

        if(resultSet3.getString("nom").equals(request.getParameter("equipe_en_d"))){
            equipe_exist = true;
            idequipe=resultSet3.getString("idequipe");
            break;
        }

    }
    // si l'equipe n'exist pas
    if(!equipe_exist){
%><div class="col-md-3"><div class="alert alert-danger" role="alert" ><h4 style="color: red"><strong> Equipe n'existe pas </strong> </h4></div></div><%
                }
                else { //insertion
         /*   out.print(request.getParameter("email_m"));
            out.print(request.getParameter("mdp_m"));
            out.print(request.getParameter("grade_m"));
            out.print(request.getParameter("profession_m"));
            out.print(idequipe);*/
                    // Generate Salt. The generated value can be stored in DB.
                    String salt = PasswordUtils.getSalt(30);

                    // Protect user's password. The generated value can be stored in DB.
                    String mySecurePassword = PasswordUtils.generateSecurePassword(request.getParameter("mdp_d"), salt);
                    Insert.query("insert into personne(email,mot_de_passe,salt,specialite,relation)values ("+"'"+request.getParameter("email_d")+"'"+","+"'"+mySecurePassword+"'"+","+"'"+salt+"'"+","+"'"+request.getParameter("specialite_d")+"'"+","+"'"+idequipe+"');");
                    response.sendRedirect("gestion_doctorant.jsp?as=ok");

                }



            }

        }
    }

%>


</body>
</html>
