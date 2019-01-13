<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Evenement</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="article/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="article/css/font-awesome.min.css">
  <link rel="stylesheet" href="article/css/font-awesome.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="article/css/ionicons.min.css">
  <!-- daterange picker -->
  <link rel="stylesheet" href="article/css/daterangepicker.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="article/css/bootstrap-datepicker.min.css">

  <link rel="stylesheet" href="article/css/bootstrap-dp.min.css">

<!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="article/css/all.css">
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="article/css/bootstrap-colorpicker.min.css">
    <!-- Bootstrap time Picker -->
    <link rel="stylesheet" href="article/css/bootstrap-timepicker.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="article/css/select2.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="article/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="article/css/_all-skins.min.css">
 <link rel="stylesheet" href="article/css/style.css">
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

        <script src="http://js.nicedit.com/nicEdit-latest.js" type="text/javascript"></script>
        <script type="text/javascript">bkLib.onDomLoaded(nicEditors.allTextAreas);</script>

    </head>
<body class="container">
      <h1> ${Event.getTitre()}</h1>


      <div class="box box-info" style="padding: 2%" >
        <div class="container-fluid">
          <div class="row" >
            <div class="col-md-12"  >
              
        		<div>
        		
        		${Event.getDescription()}
        		
        		</div>
                 
                 
				
            <div class="row">
               
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Lieu :</label>
                        <input type="text" name="laltitude" id="latitude" value="${Event.getLatitude()}" placeholder="latitude" hidden required>
                        <input type="text" name="longitude" id="longitude" value="${Event.getLongitude()}" placeholder="longitude" hidden required>
                        <div id="map" style="width:100%; height:255px"></div>
						<br>
						<br>
						<center>
						${Event.getLatitude()}
						${Event.getLongitude()}
							${Event.getLieu()}
						</center>
                    </div>
                </div> 
              </div>		
             
               
              

           </div>
    </div>
  </div>

</div>

<!-- jQuery 3 -->
<script src="article/js/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="article/js/bootstrap.min.js"></script>
<!-- Select2 -->
<script src="article/js/select2.full.min.js"></script>
<!-- InputMask -->
<script src="article/js/jquery.inputmask.js"></script>
<script src="article/js/jquery.inputmask.date.extensions.js"></script>
<script src="article/js/jquery.inputmask.extensions.js"></script>


<!-- bootstrap datepicker -->
<script src="article/js/bootstrap-datepicker.min.js"></script>
<script src="article/js/bootstrap-dp.min.js"></script>
<!-- date-range-picker -->
<script src="article/js/moment.min.js"></script>
<script src="article/js/daterangepicker.js"></script>
<script src="article/js/drangep.js"></script>
<!-- bootstrap color picker -->
<script src="article/js/bootstrap-colorpicker.min.js"></script>
<!-- bootstrap time picker -->
<script src="article/js/bootstrap-timepicker.min.js"></script>
<!-- SlimScroll -->
<script src="article/js/jquery.slimscroll.min.js"></script>
<!-- iCheck 1.0.1 -->
<script src="article/js/icheck.min.js"></script>
<!-- FastClick -->
<script src="article/js/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="article/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="article/js/demo.js"></script>
<!-- Page script -->



<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
  <script>
	function initialize() {
		var $latitude = document.getElementById('latitude');
		var $longitude = document.getElementById('longitude');
		var latitude = 35.20891517251204
		var longitude = -0.6333446502685547;
		var zoom = 15;
		
		var LatLng = new google.maps.LatLng(latitude, longitude);
		
		var mapOptions = {
			zoom: zoom,
			center: LatLng,
			panControl: false,
			zoomControl: false,
			scaleControl: true,
			mapTypeId: google.maps.MapTypeId.ROADMAP
		}	
		
		var map = new google.maps.Map(document.getElementById('map'),mapOptions);
      
		
		var marker = new google.maps.Marker({
			position: LatLng,
			map: map,
			title: 'Drag Me!',
			draggable: true
		});
		
		google.maps.event.addListener(marker, 'dragend', function(marker){
			var latLng = marker.latLng;
			$latitude.value = latLng.lat();
			$longitude.value = latLng.lng();
		});
		
		
	}
	initialize();
	</script>



<script>
        $(function () {
          //Initialize Select2 Elements
          $('.select2').select2()
      
          //Datemask dd/mm/yyyy
          $('#datemask').inputmask('yyyy-mm-dd', { 'placeholder': 'yyyy-mm-dd' })
          //Datemask2 mm/dd/yyyy
          $('#datemask2').inputmask('yyyy-mm-dd', { 'placeholder': 'yyyy-mm-dd' })
          //Money Euro
          $('[data-mask]').inputmask()
      
          //Date range picker
          $('#reservation').daterangepicker()
          //Date range picker with time picker
          $('#reservationtime').daterangepicker({ timePicker: true, timePickerIncrement: 30, format: 'yyyy/mm/dd h:mm A' })
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
              $('#daterange-btn span').html(start.format('YYYY,MMMM D') + ' - ' + end.format('YYYY,MMMM D'))
            }
          )
      
          //Date picker
          $('#datepicker').datepicker({
            autoclose: true
          })

          $('#dp').dp({
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
    