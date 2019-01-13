<%@ page import="CRUD.Update" %>
<%@ page import="javaBean.PasswordUtils" %><%--
  Created by IntelliJ IDEA.
  User: Joseph_Youcef
  Date: 06/06/2018
  Time: 07:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>modifier doctorant</title>
</head>
<body>
<jsp:useBean id="bean" class="javaBean.comparePass"/>
<%@include file="gestion_doctorant.jsp"  %>
<%
    String id =(String) session.getAttribute("id_pd");
    boolean modifier_succes = false;
    boolean contraint = false;
    //****** Email ******
    if(request.getParameter("email")!=null && !(request.getParameter("email").equals(""))){
       String q = "select * from personne";
        //out.print(request.getParameter("email"));

        ResultSet resultSet2 = Select.query(q);
        boolean email_exist = false;
        while (resultSet2.next()){

            if(resultSet2.getString("email").equals(request.getParameter("email"))){
                email_exist = true;
                break;
            }

        }
        // si l'email exist
        if(email_exist){
            contraint = true;
%><div class="col-md-3"><div class="alert alert-success" role="alert" ><h4 style="color: red"><strong> Email existe déja</strong> </h4></div></div><%
        } else {
            // faire update  ********* contraint checked **************
            //out.print("ana li drtha true email"+request.getParameter("email"));
            Update.query("update personne set email=" + "'" + request.getParameter("email") + "'" + " where idpersonne=" + "'" + id + "';");
            modifier_succes = true;
        }
    }
    //****** mot de passe ******
    if(request.getParameter("pass")!=null  && !(request.getParameter("pass").equals(""))){
        String mdp = request.getParameter("pass");
        String mdp1 = request.getParameter("pass1");

        if(!bean.confirmation(mdp,mdp1)){ //contraint
            contraint = true;
%><div class="col-md-3"><div class="alert alert-danger" role="alert" ><h4 style="color: red"><strong>la confirmation du mot de passe est incorrect !</strong></h4></div></div><%
        } else {
            // faire update  ********* contraint checked **************
            //out.print("ana li drtha true pass"+request.getParameter("pass"));
            //out.print("ana li drtha true pass"+request.getParameter("pass"));
            // Generate Salt. The generated value can be stored in DB.
            String salt = PasswordUtils.getSalt(30);

            // Protect user's password. The generated value can be stored in DB.
            String mySecurePassword = PasswordUtils.generateSecurePassword(request.getParameter("pass"), salt);
            Update.query("update personne set mot_de_passe=" + "'" + mySecurePassword + "'" + " , salt="+"'"+salt+"'"+"  where idpersonne=" + "'" + id + "';");
            modifier_succes = true;

        }
    }
    //****** equipe ******
    if(request.getParameter("equipe")!=null  && !(request.getParameter("equipe").equals(""))){
        String q2 = "select * from equipe";
        String idequipe ="";

        ResultSet resultSet3 = Select.query(q2);
        boolean equipe_exist = false;

        while (resultSet3.next()){

            if(resultSet3.getString("nom").equals(request.getParameter("equipe"))){
                equipe_exist = true;
                idequipe=resultSet3.getString("idequipe");
                break;
            }

        }
        // si l'equipe n'exist pas
        if(!equipe_exist){
            contraint = true;
%><div class="col-md-3"><div class="alert alert-danger" role="alert" ><h4 style="color: red"><strong> Equipe n'existe pas </strong> </h4></div></div><%
        } else {
            // faire update  ********* contraint checked **************
            // out.print("ana li drtha true equipe"+request.getParameter("equipe"));
            Update.query("update personne set relation=" + "'" + idequipe + "'" + " where idpersonne=" + "'" + id + "';");
            modifier_succes = true;
        }
    }

    //****** specialite ******
    if(request.getParameter("specialite")!=null && !(request.getParameter("specialite").equals("")) ) {
        // faire update  ********* contraint checked **************
        //out.print("ana li drtha true grade"+request.getParameter("grade"));
        Update.query("update personne set specialite=" + "'" + request.getParameter("specialite") + "'" + " where idpersonne=" + "'" + id + "';");
        modifier_succes = true;

    }


    //out.print(modifier_succes);
    if(modifier_succes && !contraint){
        //modifier succes
        response.sendRedirect("gestion_doctorant.jsp?ms=ok");
    }


    //********************************************************

%>


</body>
</html>
