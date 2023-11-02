
<?php
include("../../config/conect.php");

?>

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
 include('../../assets/element/nav.php');  ?>
 
</head>

<body>
  <!--Container start-->
   
  <div class="container">
    <div class="row">
      <div class="col-15 mx-auto">
      <link rel="stylesheet" href="../../assets/css/style1.css">

        <form action="../../controller/user/cliente.php"class="form_main" method="POST">
          <!--Form start-->
          <input type="hidden" class="inputField" id="id_Cliente" name="id_Cliente" value="null" placeholder="" Required> 
          

        
            <div class="card-body">
            <p class="heading">Crear perfil</p>
            <div class="mb-3 ">
                <label for="Doc_Cliente" class="form-label">Número de Documento</label>
                <input type="number" class="inputField" id="Doc_Cliente" name="Doc_Cliente" 
                  Required>
              </div>
              <div class="mb-3 ">
                <label for="Tipo_Doc" class="form-label">Tipo Documento</label>
                <input type="text" class="inputField" id="Tipo_Doc" name="Tipo_Doc" 
                  Required>
              </div>
              
            <div class="mb-3 ">
                <label for="Name_Cliente" class="form-label">Nombre </label>
                <input type="text" class="inputField" id="Name_Cliente" name="Name_Cliente" 
                  Required>
              </div>
              <div class="mb-3 ">
                <label for="Lastname_Cliente" class="form-label">Apellido</label>
                <input type="text" class="inputField" id="Lastname_Cliente" name="Lastname_Cliente" 
                  Required>
              </div>
              <div class="mb-3 ">
                <label for="Celular_Cliente" class="form-label">Número de Celular</label>
                <input type="number" class="inputField" id="Celular_Cliente" name="Celular_Cliente" 
                  Required>
              </div>
              
              
              <button type="submit" class="button">Registrar</button>
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
