<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    <title>Se connecter</title>
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
<div class="banner">
    <div class="container">
        <div class="wizard-container" class="col-md-4 col-md-offset-2">
            <div class="card wizard-card" data-color="blue" id="wizard">
                <div class="row" >

                    <div class="col-md-4 col-md-offset-4">


                        <div class="wizard-header">
                           <a href="presentation.jsp"> <img src="images/labri.png" width="130px" height="80px" >
                           </a> <h3 class="wizard-title">
                                se connecter
                            </h3>
                            <h5>a LabRI</h5>
                        </div>


<form method="post" action="login.jsp">

    <div class="input-group">
        <span class="input-group-addon">
            <i class="material-icons">email</i>
        </span>
        <div class="form-group label-floating">
            <label class="control-label">Adresse mail</label>
            <input type="text" name="email" class="form-control"/></div></div>

    <div class="input-group">
													<span class="input-group-addon">
														<i class="material-icons">lock_outline</i>
													</span>
        <div class="form-group label-floating">
            <label class="control-label"> mot de passe </label>
            <input type="password" name="password" class="form-control"/></div></div>
    <div class="pull-right">
       <input type="submit" value="se connecter" class='btn btn-previous btn-fill btn-info btn-wd'/>
    </div>
</form>

</body>
</html>