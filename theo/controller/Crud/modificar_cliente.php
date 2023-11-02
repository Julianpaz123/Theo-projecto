<?php
 
if (!empty($_POST["btnregistrar"])) {
    (!empty($_POST["Doc_Cliente"]) and !empty($_POST["Tipo_Doc"]) and !empty($_POST["Name_Cliente"]) and !empty($_POST["Lastname_Cliente"]) and !empty($_POST["Celular_Cliente"])) ;

        $id=$_POST["id"];
        $Doc_Cliente=$_POST["Doc_Cliente"];
        $Tipo_Doc=$_POST["Tipo_Doc"];
        $Name_Cliente=$_POST["Name_Cliente"];
        $Lastname_Cliente=$_POST["Lastname_Cliente"];
        $Celular_Cliente=$_POST["Celular_Cliente"];
        $sql=$connect->query("update cliente set Doc_Cliente=$Doc_Cliente,Tipo_Doc='$Tipo_Doc',Name_Cliente='$Name_Cliente',Lastname_Cliente='$Lastname_Cliente',Celular_Cliente=$Celular_Cliente where idCliente=$id ");
         if ($sql==1) {
          header("location:../../view/Crud/index.php");
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