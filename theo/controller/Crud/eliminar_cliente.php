<?php 
 if (!empty($_GET["id"])){
    $id=$_GET["id"];
    $sql=$connect->query("delete from cliente where idCliente=$id");
    if ($sql==1) {
     echo '<div class="alert alert-success" role="alert">
     Perfil Eliminado
   </div>';
    }else{
        echo '<div class="alert alert-danger" role="alert">
        Error al eliminar Perfil
      </div>';

    }
 }
?>