<?php 

require "conexion.php";

$primer_nombre = mysqli_real_escape_string($cnx, $_POST['primer_nombre']);
$segundo_nombre = mysqli_real_escape_string($cnx, $_POST['segundo_nombre']);
$primer_apellido = mysqli_real_escape_string($cnx, $_POST['primer_apellido']);
$segundo_apellido = mysqli_real_escape_string($cnx, $_POST['segundo_apellido']);
$descripcion_usuario = mysqli_real_escape_string($cnx, $_POST['descripcion_usuario']);
$id_pais = mysqli_real_escape_string($cnx, $_POST['id_pais']);
$email = mysqli_real_escape_string($cnx, $_POST['email']);
$clave = mysqli_real_escape_string($cnx, $_POST['clave']);
$id_nivel = 2;

$consulta_email = "SELECT * FROM usuarios WHERE email = '$email'";

$run_email = mysqli_query($cnx, $consulta_email);

$array_email = mysqli_fetch_assoc($run_email);



if($array_email != false){
    header("Location: ../index.php?e=3");
    exit;
}

$consulta_registro = "INSERT INTO usuarios (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, email, clave, descripcion_usuario, id_nivel, id_pais) VALUES ('$primer_nombre', '$segundo_nombre', '$primer_apellido', '$segundo_apellido', '$email', '$clave', '$descripcion_usuario', $id_nivel, $id_pais)";

mysqli_query($cnx, $consulta_registro);
?>


<?php

header("Location: ../index.php?e=4");

mysqli_close($cnx);

?>