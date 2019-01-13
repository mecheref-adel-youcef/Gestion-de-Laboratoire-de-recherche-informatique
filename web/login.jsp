<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="CRUD.Select" %>
<%@ page import="javaBean.PasswordUtils" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Login</title>
</head>
<body>
<% String userdbEmail;
    String userdbName;
    String securePassword ;
    String userdbPname;
    String dbUserProfession;
    boolean checked =false;

%>
<%

   /* Connection con= null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String driverName = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/projet";
    String user = "root";
    String dbpsw = "nassahALAAf1";

    String sql = "select * from Personne where email=? and mot_de_passe=? ";*/

    String email = request.getParameter("email");
    String providedPassword = request.getParameter("password");
   // String profession = request.getParameter("profession");



    if((!(email.equals(null) || email.equals("")) && !(providedPassword.equals(null) || providedPassword.equals(""))) )
    {
        try{
          /*  Class.forName(driverName);
            con = DriverManager.getConnection(url, user, dbpsw);
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, providedPassword);
            rs = ps.executeQuery();*/
          ResultSet resultSet = Select.query("select * from personne");
            while(resultSet.next())
            {
                   // out.print("provided : "+providedPassword);
                    //out.print(resultSet.getString("email")+" :");
                   // out.println(PasswordUtils.verifyUserPassword(providedPassword, resultSet.getString("mot_de_passe"), resultSet.getString("salt")));
                if(email.equals(resultSet.getString("email")) && PasswordUtils.verifyUserPassword(providedPassword, resultSet.getString("mot_de_passe"), resultSet.getString("salt")) )
                {
                    //out.print("ghadi nrodh true ana "+resultSet.getString("email"));
                    checked = true;

                 /*  if(userdbName.equals("null") || userdbName.equals("") || userdbPname.equals("null") || userdbPname.equals("")){
                        userdbName = "Nouvel";
                       userdbPname="utilisateur";
                       session.setAttribute("nom",userdbName);
                       session.setAttribute("prenom",userdbPname);
                    }
                    else {*/
                    userdbEmail = resultSet.getString("email");
                    securePassword = resultSet.getString("mot_de_passe");
                    dbUserProfession = resultSet.getString("profession");
                    userdbName = resultSet.getString("nom");
                    userdbPname = resultSet.getString("prenom");

                       session.setAttribute("nom",userdbName);
                       session.setAttribute("prenom",userdbPname);
                  // }

                    session.setAttribute("email",userdbEmail);
                    session.setAttribute("profession", dbUserProfession);
                    response.sendRedirect("testworkspace.jsp");
                    break;
                }
            }
                    out.print(checked);
                if(!checked){
                    response.sendRedirect("error.jsp");
                }


        }
        catch(SQLException sqe)
        {
            out.println(sqe);
        }
    }
    else
    {
%>
<center><br><br><br><p style="color:red"><strong>Error In Login</strong></p></center>
<%
        request.getServletContext().getRequestDispatcher("/seconnecter.jsp").include(request, response);
    }
%>
</body>
</html>