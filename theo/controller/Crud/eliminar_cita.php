<?php 
 if (!empty($_GET["id"])){
    $id=$_GET["id"];
    $sql=$connect->query("delete from cita where id_Cita=$id");
    if ($sql==1) {
     echo '<div class="alert alert-success" role="alert">
     Cita Eliminada
   </div>';
    }else{
        echo '<div class="alert alert-danger" role="alert">
  Error al eliminar Cita
</div>';

    }
 }
?>