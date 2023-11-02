<?php

$server ="localhost";
$user ="root";
$pass = "";
$database = "project_2";

$connect = new mysqli($server, $user, $pass, $database);

if($connect->connect_errno){
echo "Failed to connect to mysql:".$connect->connect_errno;
}
?>