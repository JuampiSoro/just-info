<?php
session_start();
require "conexion.php";

header('Access-Control-Allow-Origin: *'); 
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");


$consulta_noticia = "SELECT * FROM `noticias` INNER JOIN `usuarios` on noticias.id_usuario = usuarios.id_usuario INNER JOIN `detalle_rubros` on noticias.id_trabajo = detalle_rubros.id_trabajo INNER JOIN `rubros` on detalle_rubros.id_rubro = rubros.id_rubro INNER JOIN `imagenes` on noticias.id_trabajo = imagenes.id_trabajo;";

//echo $consulta_noticia;

$run_noticia = mysqli_query($cnx, $consulta_noticia);

 $array_noticia = mysqli_fetch_array( $run_noticia );

// if($array_noticia == false){
//     //falta error

//     //$datos = "email: ". $email. " clave: ". $clave;
    
    
// }else{
    
// }





$json = [];

while ($row = mysqli_fetch_array( $run_noticia )) {

    $fecha_maestro = $row['fecha_trabajo'];
                
    $fecha_maestro_nueva = explode("-", $fecha_maestro);
    
    $fecha_maestro = $fecha_maestro_nueva[2] . "-" . $fecha_maestro_nueva[1] . "-" . $fecha_maestro_nueva[0]; 

    $array_noticia['fecha_trabajo'] = $fecha_maestro;

$row['mes'] = $fecha_maestro_nueva[1];

$row['dia'] = $fecha_maestro_nueva[2];

$row['anio'] = $fecha_maestro_nueva[0];

switch ($row['mes']) {
    case '01':
    $row['mes'] = "Enero";
      break;
    case '02':
        $row['mes'] = "Febrero";
      break;
    case '03':
        $row['mes'] = "Marzo";
      break;
    case '04':
        $row['mes'] = "Abril";
      break;
    case '05':
        $row['mes'] = "Mayo";
      break;
      case '06':
        $row['mes'] = "Junio";
      break;
      case '07':
        $row['mes'] = "Julio";
      break;
      case '08':
        $row['mes'] = "Agosto";
      break;
      case '09':
        $row['mes'] = "Septiembre";
      break;
      case '10':
        $row['mes'] = "Octubre";
      break;
      case '11':
        $row['mes'] = "Noviembre";
      break;
      case '12':
        $row['mes'] = "Diciembre";
      break;
  }
    
    $row['fecha_trabajo'] = $fecha_maestro;

    $json[] = $row;

}
mysqli_close($cnx);
echo json_encode($json);



?>