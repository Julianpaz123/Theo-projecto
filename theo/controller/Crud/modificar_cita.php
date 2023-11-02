<?php
if (!empty($_POST["btnregistrar"])) {
    (!empty($_POST["fecha_Cita"]) and !empty($_POST["hora_Cita"]) and !empty($_POST["estado_Cita"] )and !empty($_POST["tipo_Cita"])) ;

        $id=$_POST["id"];
        $fechaCita=$_POST["fechaCita"];
        $horaCita=$_POST["horaCita"];
        $estadoCita=$_POST["estadoCita"];
        $tipoCita=$_POST["tipoCita"];

    
        $sql=$connect->query("update cita set fecha_Cita='$fechaCita',hora_Cita='$horaCita',estado_Cita='$estadoCita',tipo_Cita='$tipoCita' where id_Cita=$id ");
         if ($sql==1) {
          header("location:../../view/Crud/cita.php");
          echo'<div class="alert alert-success" role="alert">
          Modificada Correctamente
        </div>';

         } else{
            echo'<div class="alert alert-danger" role="alert">
            Error al modificar
          </div>';
         }   
   
    }



?>