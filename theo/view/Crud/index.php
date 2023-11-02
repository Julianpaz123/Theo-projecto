<?php 
  include('../../assets/element/nav3.php');
  ?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Theo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/0cd0c55496.js" crossorigin="anonymous"></script>

  </head>
<body>
  <script>
      function eliminar(){
        var respuesta=confirm("Estas seguro de Eliminar este perfil");
        return respuesta
      }
      </script>
    <h1 class="text-center p-3">Configurar Perfiles</h1>
    <?php
     include ( "../../config/conect.php");
     include ( "../../controller/crud/eliminar_cliente.php");
    ?>
    <div class="container-fluid row">
    
<table class="table">
  <thead class="background-info">
    <tr>
      <th scope="col">ID</th>
      <th scope="col">NOMBRE</th>
      <th scope="col">APELLIDO</th>
      <th scope="col">TIPO DE DOCUMENTO</th>
      <th scope="col">NÚM. DE DOCUMENTO</th>
      <th scope="col">CELULAR</th>
      <th scope="col"></th>


    </tr>
  </thead>
  <tbody>
    <?php 
    $sql =$connect->query("select * from cliente");
    while ($datos =$sql->fetch_object()) {?>
     <tr>
     <td><?=$datos->idCliente ?></td>
      <td><?=$datos->Name_Cliente ?></td>
      <td><?=$datos->Lastname_Cliente ?></td>
      <td><?=$datos->Tipo_Doc ?></td>
      <td><?=$datos->Doc_Cliente ?></td>
      <td><?=$datos->Celular_Cliente ?></td>
      <td>
      <a href="modificar_cliente.php?id=<?=$datos->idCliente ?>" class="btn btn-small btn-warning"><i class="fa-solid fa-pen-to-square"></i></a>
         <a  onclick="return eliminar()" href="index.php?id=<?=$datos->idCliente ?>"class="btn btn-small btn-danger"><i class="fa-solid fa-trash"></i></a>
      </td>
    </tr>
    <?php }
    ?>
   
    
  </tbody>
</table>
    </div>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>