<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Article</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="article/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="article/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="article/css/ionicons.min.css">



  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="article/css/bootstrap-datepicker.min.css">




  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="article/css/all.css">
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="article/css/bootstrap-colorpicker.min.css">
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


        <link rel="stylesheet" href="article/webfonts/fontawesome-free-5.0.13/web-fonts-with-css/css/fontawesome-all.css">

        
        <script src="http://js.nicedit.com/nicEdit-latest.js" type="text/javascript"></script>
        <script type="text/javascript">bkLib.onDomLoaded(nicEditors.allTextAreas);</script>
  </head>
<body class="container">
    
        

      <h1 > Article </h1>
    
        
      <div class="box box-info" style="padding: 2%" >
        <div class="row">
            <div class="col-md-6"> </div>
            <form action="">
                      <div class="col-md-6">
                          <div class="form-group">
                            <div class="input-group ">
                                
                          <input class="form-control " placeholder="Rechercher" type="text" name="recherche" style="font-size: 18px ;width: 120%;height: 50%; " required >
                          <button  type="submit" class="btn" style="margin-top: 2% ;margin-left: 85%" ><i class="fa fa-search"></i>Recherche</button>

                          </div> 
                        </div>  
                        </div>
                      </form>
                    </div>
<div class="container-fluid">
    <div class="row" >
      <div class="col-md-12"  >
            <div class="row">
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
            </tr>
          </thead>
          <tbody>
            <form action="">
            <tr>
              <td>
                  1
              </td>
              <td>
                Revue
              </td>
              <td>
                  <a href="details.html">Inteligence Artificiel</a>
              </td>
              <td>
                01/04/2012
              </td>
              <td><button class="btn btn-info active"><i class="fa fa-edit"></i> Edit </button></td>
              <td><button class="btn btn-danger active"><i class="fa fa-trash-alt"></i> Delete</button></td>
            </tr>
            </form>
            <form action="">
            <tr >
              <td> 2
  <!--              <input type="text" id="fee" />

                <script type="text/javascript">
                document.getElementById('fee').value = '2';
                </script>
  -->
              </td>
              <td>
                book
              </td>
              <td>
                    <a href="details.html">reseau neuron </a>
              </td>
              <td>
                05/09/2015
              </td>
              <td><button class="btn btn-info active"><i class="fa fa-edit"></i> Edit </button></td>
              <td><button class="btn btn-danger active"><i class="fa fa-trash-alt"></i> Delete</button></td>
            </tr>
            </form>
            <form action="">
            <tr >
              <td>
                3
              </td>
              <td>
                Thèse
              </td>
              <td>
                    <a href="details.html">Embeded System </a>
              </td>
              <td>
                03/12/2017
              </td>
              <td><button class="btn btn-info active"><i class="fa fa-edit"></i> Edit </button></td>
              <td><button class="btn btn-danger active"><i class="fa fa-trash-alt"></i> Delete</button></td>
            </tr>
            
        </form>
          </tbody>
        </table>
      </div>
    </div>

    </div>
    <div class="row">
    <div class="col-md-12">
        <form action="AjouterEvenement.jsp">
                  <button class="btn btn-info btn-lg btn-block active" type="submit" style="background-color:#00acc1 ; margin-bottom: 0px" ><i class="fas fa-pencil-alt"></i> Ajouter Evenement </button>

              </form>
            </div>
          </div>
</div>
</div>







<!-- ./wrapper -->

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

<!-- date-range-picker -->
<script src="article/js/moment.min.js"></script>
<script src="article/js/daterangepicker.js"></script>

<!-- bootstrap color picker -->
<script src="article/js/bootstrap-colorpicker.min.js"></script>
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
