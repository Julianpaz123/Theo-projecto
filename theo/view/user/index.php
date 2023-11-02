
<?php
include("../../config/conect.php");

$sql = "SELECT * FROM  Rol ;";


$resultArray = array();

if (!$connect->multi_query($sql)) {
  echo "Falló la multiconsulta: (" . $connect->errno . ") " . $connect->error;
} else {
  do {
    if ($result = $connect->store_result()) {
      $resultQuery = $result->fetch_all(MYSQLI_NUM);
      array_push($resultArray, $resultQuery);
      $result->free();
    }
  } while ($connect->more_results() && $connect->next_result());
  $Role_id = $resultArray[0];
 

  $connect->close();


}
?>


<!doctype html>
<html lang="en">

<head>
      <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Theo</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <?php
 include('../../assets/element/nav.php');  ?>
 
</head>

<body>
  
   
  <div class="container">
    <div class="row">
      <div class="col-15 mx-auto">
      <link rel="stylesheet" href="../../assets/css/style1.css">

        <form action="../../controller/user/user.php"class="form_main" method="POST">
       
          <input type="hidden" class="inputField" id="User_id" name="User_id" value="null" placeholder="" Required> 
          

        
            <div class="card-body">
            <p class="heading">Bienvenido a THEO Registrate</p>
            
              <div class="mb-3 ">
                <label for="User_email" class="form-label">Email</label>
                <input type="email" class="inputField" id="User_email" name="User_email" 
                  Required>
              </div>
              <div class="mb-3">
                <label for="User_password" class="form-label">Contraseña </label>
                <input type="password" class="inputField" id="User_password" name="User_password" Required>
              </div>
              <div class="mb-3">
                <label for="User_password_repeat" class="form-label">Confirmar Contraseña </label>
                <input type="password" class="inputField" id="User_password_repeat" name="User_password_repeat"
                  placeholder="" Required>
              </div>
              <div class="mb-3">
              <select class="form-select" id="Rol" name="Rol" aria-label="Default select example" Required>
                <option selected>Selecciona</option>
                <option value="1">Cliente</option>
                <option value="2">Empleado</option>
              
              </select>
              </div>
             
      
              <a class="forgotLink" href="../../view/login/index.php">¿Ya tienes una cuenta? Inicia Sesion</a>
              
            <button type="submit" class="button">Continuar</button>
              </div>
            </div>
          </div>
        </form>

        


  
      </div>

    </div>
  </div>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>


</body>

</html>