<?php

include("../../config/conect.php");

$routeResult= "Location: ../../view/user/cliente.php";

if ($_SERVER['REQUEST_METHOD']== "POST") {

    $Userid =$_REQUEST['User_id'];
    $Userpassword= password_hash($_REQUEST['User_password'],PASSWORD_DEFAULT);
    $Useremail=$_REQUEST['User_email'];

    /**Variables de referencia*/
   
    $Rol=$_REQUEST['Rol'];


  $stmt = $connect->prepare("INSERT INTO user (User_email,User_password,Rol)VALUES(?,?,?)");
  $stmt->bind_param("sss",$Useremail,$Userpassword,$Rol);
  $stmt->execute();

  echo ("New records created successfully");
  $stmt->close();
  $connect->close();

  header($routeResult);
  exit;

}
    


?>