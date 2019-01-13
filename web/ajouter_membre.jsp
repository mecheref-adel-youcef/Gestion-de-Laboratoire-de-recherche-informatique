<%@ page import="CRUD.Insert" %>
<%@ page import="javaBean.PasswordUtils" %>
<%--
  Created by IntelliJ IDEA.
  User: Joseph_Youcef
  Date: 06/06/2018
  Time: 07:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ajouter membre</title>
</head>
<body>
<jsp:useBean id="bean" class="javaBean.comparePass"/>
<%@include file="gestion_membre.jsp"  %>
<%


    q = "select * from personne";

    ResultSet resultSet2 = Select.query(q);
    boolean email_exist = false;
    if(request.getParameter("email_m")!=null){
        String mdp = request.getParameter("mdp_m");
        String mdp1 = request.getParameter("mdp1_m");

        if(!bean.confirmation(mdp,mdp1)){
            %><div class="col-md-3"><div class="alert alert-danger" role="alert" ><h4 style="color: red"><strong>la confirmation du mot de passe est incorrect !</strong></h4></div></div><%
        } else {
        while (resultSet2.next()){

            if(resultSet2.getString("email").equals(request.getParameter("email_m"))){
                email_exist = true;
                break;
            }

        }
        // si l'email exist
        if(email_exist){
%><div class="col-md-3"><div class="alert alert-success" role="alert" ><h4 style="color: red"><strong> Email existe déja</strong> </h4></div></div><%
        }

        else {
           String q1 = "select * from equipe";
           String idequipe ="";

            ResultSet resultSet3 = Select.query(q1);
            boolean equipe_exist = false;

                while (resultSet3.next()){

                    if(resultSet3.getString("nom").equals(request.getParameter("equipe_m"))){
                        equipe_exist = true;
                        idequipe=resultSet3.getString("idequipe");
                        break;
                    }

                }
                // si l'equipe n'exist pas
                if(!equipe_exist){
%><div class="col-md-3"><div class="alert alert-danger" role="alert" ><h4 style="color: red"><strong> Equipe n'existe pas </strong> </h4></div></div><%
        }
        else {
                    if(request.getParameter("profession_m")!=null){
                        //out.print(request.getParameter("profession_m"));
                    if(request.getParameter("profession_m").equals("Chef d"+"\\"+"'equipe")){
                        //out.print("tosawii chef equipe");
                        ResultSet resultSet1 = Select.query("select * from personne where profession="+"\""+"Chef d'equipe"+"\""+" and idequipe="+idequipe);

                        if( resultSet1.next()){

%><div class="col-md-3"><div class="alert alert-danger" role="alert" ><h4><%=resultSet1.getString("nom")%> <%=resultSet1.getString("prenom")%> </h4><h4 style="color: red"><strong>est déja un chef d'equipe dans</strong> </h4> <h4><%=request.getParameter("equipe_m")%> </h4></div></div><%
                        }
                        else{
                            // Generate Salt. The generated value can be stored in DB.
                            String salt = PasswordUtils.getSalt(30);

                            // Protect user's password. The generated value can be stored in DB.
                            String mySecurePassword = PasswordUtils.generateSecurePassword(request.getParameter("mdp_m"), salt);
                            Insert.query("insert into personne(email,mot_de_passe,salt,specialite,profession,idequipe)values ("+"'"+request.getParameter("email_m")+"'"+","+"'"+mySecurePassword+"'"+","+"'"+salt+"'"+","+"'"+request.getParameter("grade_m")+"'"+","+"'"+request.getParameter("profession_m")+"'"+","+"'"+idequipe+"');");
                            response.sendRedirect("gestion_membre.jsp?as=ok");

                        }

                    }else{
                            //insertion
         /*   out.print(request.getParameter("email_m"));
            out.print(request.getParameter("mdp_m"));
            out.print(request.getParameter("grade_m"));
            out.print(request.getParameter("profession_m"));
            out.print(idequipe);*/
                            // Generate Salt. The generated value can be stored in DB.
                            String salt = PasswordUtils.getSalt(30);

                            // Protect user's password. The generated value can be stored in DB.
                            String mySecurePassword = PasswordUtils.generateSecurePassword(request.getParameter("mdp_m"), salt);
                            Insert.query("insert into personne(email,mot_de_passe,salt,specialite,profession,idequipe)values ("+"'"+request.getParameter("email_m")+"'"+","+"'"+mySecurePassword+"'"+","+"'"+salt+"'"+","+"'"+request.getParameter("grade_m")+"'"+","+"'"+request.getParameter("profession_m")+"'"+","+"'"+idequipe+"');");
                            response.sendRedirect("gestion_membre.jsp?as=ok");
                        }

                    }




        }



        }

        }
    }

%>

</body>
</html>
