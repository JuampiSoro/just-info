<?php
session_start();
require "conexion.php";

header('Access-Control-Allow-Origin: *'); 
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");


// Cambiamos el POST CON GET
$email = $_GET['email'];
$clave = $_GET['password'];



$consulta_usuario = "SELECT * FROM usuarios WHERE email = '$email' AND clave = '$clave'";

$run_usuario = mysqli_query($cnx, $consulta_usuario);

$array_usuario = mysqli_fetch_assoc( $run_usuario );

if($array_usuario == false){
    //falta error

    //$datos = "email: ". $email. " clave: ". $clave;
    
    
}else{

    $_SESSION['id_usuario'] = $array_usuario['id_usuario'];
    $_SESSION['email'] = $array_usuario['email'];
    $_SESSION['primer_nombre'] = $array_usuario['primer_nombre'];
    $_SESSION['primer_apellido'] = $array_usuario['primer_apellido'];
    $_SESSION['id_nivel'] = $array_usuario['id_nivel'];  
}


mysqli_close($cnx);
echo json_encode($array_usuario);


?>