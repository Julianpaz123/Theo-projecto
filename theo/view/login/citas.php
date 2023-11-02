


<!doctype html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Theo</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <?php
 include('../../assets/element/nav3.php');  ?>

</head>

<body>
  <!--Container start-->
   
  <div class="container">
    <div class="row">
      <div class="col-15 mx-auto">
      <link rel="stylesheet" href="../../assets/css/style1.css">

        <form action="../../controller/user/cita.php"class="form_main" method="POST">
          <!--Form start-->

          <input type="hidden" class="inputField" id="idcita" name="idcita" value="null" placeholder="" Required> 
          
        
            <div class="card-body">
            <p class="heading">Crear Cita</p>
              <div class="mb-3 ">
                <label for="fechaCita" class="form-label">Fecha</label>
                <input type="date" class="inputField" id="fechaCita" name="fechaCita" 
                  Required>
              </div>
              <div class="mb-3">
                <label for="horaCita" class="form-label">Hora </label>
                <input type="time" class="inputField" id="horaCita" name="horaCita" >
              </div>
              <div class="mb-3">
                <label for="estadoCita" class="form-label">Estado </label>
                <input type="txt" class="inputField" id="estadoCita" name="estadoCita" >
              </div>
              <div class="mb-3">
                <label for="tipoCita" class="form-label">Tipo de Cita </label>
                <select  class="inputField" id="tipoCita" name="tipoCita" >
                <option value="">-- Seleccione un tipo de cita --</option>
        <option >Baño y peluqueria</option>
        <option >Consultoria Canina</option>
        <option >Medicina Canina</option>
    </select>
              </div>
              
            <button type="submit" class="button" >Crear Cita</button>
              </div>
            </div>
          </div>
        
        </form>

        


        <!--Form end-->
      </div>

    </div>
  </div>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>

  <!-- Option 2: Separate Popper and Bootstrap JS -->
  <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
</body>

</html>
