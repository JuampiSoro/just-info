<?php
session_start();
require "conexion.php";

header('Access-Control-Allow-Origin: *'); 
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");

$id = $_GET["id"];


$consulta_noticia = "SELECT * FROM `noticias` INNER JOIN `usuarios` on noticias.id_usuario = usuarios.id_usuario INNER JOIN `detalle_rubros` on noticias.id_trabajo = detalle_rubros.id_trabajo INNER JOIN `rubros` on detalle_rubros.id_rubro = rubros.id_rubro INNER JOIN `comentarios` on noticias.id_trabajo = comentarios.id_trabajo INNER JOIN `imagenes` on noticias.id_trabajo = imagenes.id_trabajo  WHERE noticias.id_trabajo = $id LIMIT 1";

//echo $consulta_noticia;

$run_noticia = mysqli_query($cnx, $consulta_noticia);

 $array_noticia = mysqli_fetch_assoc( $run_noticia );

// if($array_noticia == false){
//     //falta error

//     //$datos = "email: ". $email. " clave: ". $clave;
    
    
// }else{
    
// }
$fecha_maestro = $array_noticia['fecha_trabajo'];
                
$fecha_maestro_nueva = explode("-", $fecha_maestro);
    
$fecha_maestro = $fecha_maestro_nueva[2] . "-" . $fecha_maestro_nueva[1] . "-" . $fecha_maestro_nueva[0]; 


    
$array_noticia['fecha_trabajo'] = $fecha_maestro;

$array_noticia['mes'] = $fecha_maestro_nueva[1];

$array_noticia['dia'] = $fecha_maestro_nueva[2];

$array_noticia['anio'] = $fecha_maestro_nueva[0];

switch ($array_noticia['mes']) {
    case '01':
    $array_noticia['mes'] = "Enero";
      break;
    case '02':
        $array_noticia['mes'] = "Febrero";
      break;
    case '03':
        $array_noticia['mes'] = "Marzo";
      break;
    case '04':
        $array_noticia['mes'] = "Abril";
      break;
    case '05':
        $array_noticia['mes'] = "Mayo";
      break;
      case '06':
        $array_noticia['mes'] = "Junio";
      break;
      case '07':
        $array_noticia['mes'] = "Julio";
      break;
      case '08':
        $array_noticia['mes'] = "Agosto";
      break;
      case '09':
        $array_noticia['mes'] = "Septiembre";
      break;
      case '10':
        $array_noticia['mes'] = "Octubre";
      break;
      case '11':
        $array_noticia['mes'] = "Noviembre";
      break;
      case '12':
        $array_noticia['mes'] = "Diciembre";
      break;
  }

$json = json_encode($array_noticia);

mysqli_close($cnx);
echo $json;

?>