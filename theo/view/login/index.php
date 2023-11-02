<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Theo</title>
    <link rel="stylesheet" href="../../assets/css/style2.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <?php
 include('../../assets/element/nav.php');  ?>
   
  </head>
  <body>

    <form class="form_main" action="../../controller/login/login.php" method="POST">

      <div class="inputContainer">
        <div class="container">
          <div class="row">
            <div class="col-6 mx-auto">
              <div>
                <div class="mb-3">
                <p class="heading"> Logueate</p>
                  <input type="email" class="inputField" id="User_email" name="User_email" placeholder="Email">
                  </div>
                  <input type="password" class="inputField" id="User_password" name="User_password" placeholder="Contraseña">
                </div>   
              </div>
          </div>
          <a class="forgotLink" href="../../view/user/index.php">¿No tienes una cuenta? Registrate</a>
        <div class="mb-3">
  
        <button type="submit" class="button">Entrar</button>
        
      </div>
    </form>  

    <?php
      $errores = array(
        'incorrect' => 'El usuario o contraseña es incorrecta',
        'undefined' => 'El usuario ingresado no esta registrado',
        'empty' => 'No ingreso datos'
      );
      
      $errorCollect = (empty($_GET['error'])) ? null : $_GET['error'];
      if(array_key_exists($errorCollect,$errores)):
    ?>
      <div class="alert alert-danger d-flex align-items-center position-absolute" style="top:0"style="rigth:0" id=alert  role="alert">
      <div>
        <?= $errores[$errorCollect]; ?>
      </div>
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <?php
      endif;
    ?>
  </body>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

</html>