<?php

include("../../config/conect.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {


  $Useremail = $_REQUEST['User_email'];
  $Userpassword = $_REQUEST['User_password'];

  if(!empty($Useremail) && !empty($Userpassword) ) {
    $sql = "CALL sp_select_user_email('" . $Useremail . "'); ";
  $routeResult="Location: ../../view/home/home.php";
  
  if ($result = $connect->query($sql)) {
    $resultQuery = $result->fetch_all(MYSQLI_NUM);

    if (count($resultQuery)>0) {
      // echo( $Userpassword);
      var_dump($resultQuery[0]);
      if ($Userpassword == $resultQuery[0][2]) {
        session_start();
        $_SESSION["newsession"]= $resultQuery[0][0];
        echo ("</br>Ok: Login succeeds");
        $routeResult="Location: ../../view/home/homeadmin.php";
        
      } else {
        echo ("</br>Error: Password and User");
        $routeResult="Location: ../../view/login/index.php?error=incorrect";
      }

    } else {
      echo ("</br>Error: User name does not exist");
      $routeResult="Location: ../../view/login/index.php?error=undefined";
    }

  }
  } else {
    $routeResult = "Location: ../../view/login/index.php?error=empty";
  }

  header($routeResult);
  $connect->close();
}
?>