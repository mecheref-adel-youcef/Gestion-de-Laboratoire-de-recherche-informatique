<%@page import="test.PublicationControllerServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Article</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="Article/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="Article/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="Article/css/ionicons.min.css">



  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="Article/css/bootstrap-datepicker.min.css">




  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="Article/css/all.css">
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="Article/css/bootstrap-colorpicker.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="Article/css/select2.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="Article/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="Article/css/_all-skins.min.css">
 <link rel="stylesheet" href="Article/css/style.css">
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="container">
      <h1> Article </h1>


      <div class="box box-info" style="padding: 2%" >
<div class="container-fluid">
    <div class="row" >
      <div class="col-md-6"  style="border-right:solid 2px dodgerblue">
          <form action="PublicationControllerServlet" method="post" enctype="multipart/form-data">
          <input type="hidden" name="cmd" value="ADD" />
        
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label>Type d'Article :</label>
                  <div class="input-group ">
                  <div class="input-group-addon">
                      <img src="Article/img/glyphicons-151-edit.png" style="width: 18px">
                    </div>
                  <select class="form-control select2" name="type" style=" width: 100%;">
                    <option selected="selected" disabled="disabled">Type</option>
                    <option>Rapport de recherche</option>
                    <option>Revue</option>
                    <option>Book</option>
                    <option>Conference</option>
                    <option>These</option>
                  </select>
                </div>
                </div>   
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label>Titre d'Article :</label>
                  <div class="input-group ">
                  <div class="input-group-addon">
                      <img src="Article/img/glyphicons-104-text-underline.png" style="width: 16px">
                    </div>
                  <input class="form-control" type="text" name="titre" style="font-size: 18px" >
                </div> 
              </div>  
              </div>
            </div>
  
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label>Ensemble des Auteurs :</label>
                  <div class="input-group ">
                  <div class="input-group-addon">
                      <img src="Article/img/glyphicons-44-group.png" style="width: 18px">
                  </div>
                  <select name="Auteurs" class="form-control select2" multiple="multiple" data-placeholder="Entrer nom d'Auteur">
                    <c:forEach var ="temp" items="${Personne_list}">
                    <option>${temp.getNom()} ${temp.getPrenom()}</option>
                   
                   </c:forEach>
                  </select>
                </div>
                </div>
              </div>
                     <!-- Date -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>Date:</label>
                  <div class="input-group date">
                    <div class="input-group-addon">
                      <img src="Article/img/glyphicons-46-calendar.png" style="width: 18px">
                    </div>
                    <input type="text" name="date" class="form-control pull-right" id="datepicker">
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <label>Resumé :</label>
                   <div class="input-group-addon">
                      <img src="Article/img/glyphicons-606-text-color.png" style="width: 18px">
                    </div>
                  <textarea class="textarea"  name="Resume" 
                  style=" width: 100%; height: 200px; font-size: 20px ; line-height: 22px; border: 1px solid rgb(221, 221, 221); padding: 0px; display: ;" ></textarea>      
                </div>
            </div>
          </div>
   
  
        <div class="row">
          <div class="col-md-12">
            <div class="form-group"> 
            <label for="exampleInputFile" 
               style="border: 1px solid #ccc;
                      display: inline-block;
                      padding: 6px 12px;
                      cursor: pointer;">
  
                Attachement : 
                <br>
                <br>
                 <div class="input-group-addon" style="margin: 50%">
                  <img src="Article/img/glyphicons-202-upload.png" >
                  </div>
              <input type="file" name="Attachement"  class="form-control-file " multiple="multiple" id="exampleInputFile" 
                          style=" 
                                display: none;
                                " />
            </label>                
            
          </div>
        </div>
      </div>
  
        <div class="row">
          <div class="col-md-12">
          <button class="btn btn-info btn-lg btn-block active" type="submit"> Publie </button>
          </div>
        </div>
        </form>
      </div>

      <div  class="col-md-6">
        <table class="table" >
          <thead class="bg-dark text-white">
            <tr>
              <th>
                Id Article
              </th>
              <th>
                Type 
              </th>
              <th>
                Titre
              </th>
              <th>
                Date
              </th>
               <th>
                Type Fichier
              </th>
               <th>
                Publier Par
              </th>
            </tr>
          </thead>
          <tbody>
           
          
            <c:forEach var="temp" items="${List_Publication}">
              <c:url var="templink" value="PublicationControllerServlet" >
				<c:param name="cmd" value="DOWN" />
				<c:param name="IdPublication" value="${temp.getIdPublication()}" />
			  </c:url>
			 <c:url var="editlink" value="PublicationControllerServlet" >
				<c:param name="cmd" value="LOAD" />
				<c:param name="IdPublication" value="${temp.getIdPublication()}" />
			</c:url>
             <c:url var="deletelink" value="PublicationControllerServlet" >
				<c:param name="cmd" value="DELETE" />
				<c:param name="IdPublication" value="${temp.getIdPublication()}" />
			</c:url>
             <tr>
              <td>
                  ${temp.getIdPublication()}
              </td>
              <td>
                ${temp.getTypePublication()}
              </td>
              <td>
                ${temp.getTitre()}
              </td>
              <td>
                ${temp.getDatePublication()}
              </td>
              <td>
                ${temp.getFileType()}
              </td>
               <td>
                ${temp.getIdPersonne()}
              </td>
              <td>
              <!--  <button class="btn btn-info active" type = "submit"> Edit </button> -->  
                <a href="${editlink}"  >Edit</a>
              </td>
             
              <td>
                  <!-- <button class="btn btn-danger active" type="submit">  -->
                  	<a href="${templink}">download</a>
              </td>
              <td>
              <a href="${deletelink}" onclick="if (!(confirm('are you sure you want to delete this project'))) return false">delete</a>
              </td>
            </tr>
            </c:forEach>
            
           
            
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>










<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="Article/js/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="Article/js/bootstrap.min.js"></script>
<!-- Select2 -->
<script src="Article/js/select2.full.min.js"></script>
<!-- InputMask -->
<script src="Article/js/jquery.inputmask.js"></script>
<script src="Article/js/jquery.inputmask.date.extensions.js"></script>
<script src="Article/js/jquery.inputmask.extensions.js"></script>
<!-- bootstrap datepicker -->
<script src="Article/js/bootstrap-datepicker.min.js"></script>

<!-- date-range-picker -->
<script src="Article/js/moment.min.js"></script>
<script src="Article/js/daterangepicker.js"></script>

<!-- bootstrap color picker -->
<script src="Article/js/bootstrap-colorpicker.min.js"></script>
<!-- SlimScroll -->
<script src="Article/js/jquery.slimscroll.min.js"></script>
<!-- iCheck 1.0.1 -->
<script src="Article/js/icheck.min.js"></script>
<!-- FastClick -->
<script src="Article/js/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="Article/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="Article/js/demo.js"></script>
<!-- Page script -->




<script>
  $(function () {
    //Initialize Select2 Elements
    $('.select2').select2()

    //Datemask dd/mm/yyyy
    $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
    //Datemask2 mm/dd/yyyy
    $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
    //Money Euro
    $('[data-mask]').inputmask()

    //Date range picker
    $('#reservation').daterangepicker()
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({ timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A' })
    //Date range as a button
    $('#daterange-btn').daterangepicker(
      {
        ranges   : {
          'Today'       : [moment(), moment()],
          'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
          'This Month'  : [moment().startOf('month'), moment().endOf('month')],
          'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        },
        startDate: moment().subtract(29, 'days'),
        endDate  : moment()
      },
      function (start, end) {
        $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
      }
    )

    //Date picker
    $('#datepicker').datepicker({
      autoclose: true
    })

    //iCheck for checkbox and radio inputs
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass   : 'iradio_minimal-blue'
    })
    //Red color scheme for iCheck
    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
      checkboxClass: 'icheckbox_minimal-red',
      radioClass   : 'iradio_minimal-red'
    })
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-green',
      radioClass   : 'iradio_flat-green'
    })

    //Colorpicker
    $('.my-colorpicker1').colorpicker()
    //color picker with addon
    $('.my-colorpicker2').colorpicker()

    //Timepicker
    $('.timepicker').timepicker({
      showInputs: false
    })
  })
</script>
</body>
</html>
