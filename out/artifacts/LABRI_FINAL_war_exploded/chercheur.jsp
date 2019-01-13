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
    <title>Title</title>
    <title>chercheur</title>
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

                    <div class="col-md-1 col-md-offset-4">


                        <div class="wizard-header">
                            <h1 class="wizard-title">
                                &nbsp;&nbsp;&nbsp;&nbsp;chercheur
                            </h1>

                        </div>
                    </div>

<!-- les fonctions de base  -->
 <%@include file="welcome.jsp"  %>
<%String email = (String) session.getAttribute("email");
%>

</body>
</html>
