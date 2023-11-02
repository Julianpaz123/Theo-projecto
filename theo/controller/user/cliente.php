
<?php

include('../../config/conect.php');

$routeResult= "Location: ../../view/user/index.php";

if ($_SERVER['REQUEST_METHOD']== "POST") {

    $idCliente=$_REQUEST['id_Cliente'];
    $DocCliente=$_REQUEST['Doc_Cliente'];
    $TipoDoc=$_REQUEST['Tipo_Doc'];
    $NameCliente=$_REQUEST['Name_Cliente'];
    $LastnameCliente=$_REQUEST['Lastname_Cliente'];
    $CelularCliente=$_REQUEST['Celular_Cliente'];

    $stmt = $connect->prepare("INSERT INTO cliente (Doc_Cliente,Tipo_Doc,Name_Cliente,Lastname_Cliente,Celular_Cliente)VALUES(?,?,?,?,?)");
  $stmt->bind_param("isssi",$DocCliente,$TipoDoc,$NameCliente,$LastnameCliente,$CelularCliente);
  $stmt->execute();

  echo ("New records created successfully");
  $stmt->close();
  $connect->close();

  header($routeResult);
  exit;

}
?>