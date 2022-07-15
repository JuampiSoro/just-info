<?php
session_start();
require "logueo/conexion.php";
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Doros Agencia</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/just-info-theme.css">
    <link rel="stylesheet" href="css/estilos.css">
</head>

<body>


    <header class="bg-dark">
        <div class="container-fluid bg-dark col-12">
            <div class="container">
                <div class="row py-3 mb-3">
                   
                    <div class="col-4">
                       <a href="index.php"><img src="imagenes/doros-logo.svg" class="img-fluid" alt="Doros logo" width="200" height="150"></a>
                   </div>
                   <div class="col-8 mt-3 pr-4">
                        <?php
                        if( isset($_SESSION['email']) ){
                        ?>
                        <div class="text-right text-light pt-3 pb-1 mr-4">
                            <p class="d-inline-block ml-2">Hola, <span class="font-weight-bolder"><?php echo $_SESSION['primer_nombre'] . " " . $_SESSION['primer_apellido']; ?> </span>/<a href="logueo/cerrar.php" class="ml-2 text-info">Cerrar Sesión</a></p>
                        </div>
                        <?php
                            
                        }else{
                            
                        ?>
                         
                            <form action="logueo/login.php" method="post" enctype="application/x-www-form-urlencoded" class="form-inline mx-auto d-flex justify-content-end w-60">
                                <input class="form-control mr-sm-2" type="text" placeholder="Email" aria-label="Email" name="email">
                                <input class="form-control mr-sm-2" type="password" placeholder="Clave" aria-label="Clave" name="clave">
                                <input type="submit" value="Ingresar" class="btn btn-info my-2 my-sm-0">
                                <a href="index.php?e=2" class="ml-3 my-2 text-info">Registrate</a>
                            </form>
                            
                        
                        <?php
                        } 
                        ?>

                    </div>
                </div>
            </div>
        </div>


            
            



        
    </header>

    <main class="container bg-white">

        <?php        
        if( !isset($_GET['t']) ) {
        ?>


        <section class="row">
            <h1 class="col-12 py-4 text-dark text-left font-weight-bold display-4">Nuestros Trabajos</h1>

            <aside class="col-md-12">
                <form action="index.php" class="mr-5 form-inline py-4 d-flex justify-content-end">
                    <input type="text" name="busqueda" placeholder="Buscar un trabajo" class="form-control form-control-sm mr-2">
                    <input type="submit" value="Buscar" class="btn btn-dark btn-sm">
                </form>

            </aside>

            <?php
            
            if( isset($_GET['busqueda']) && $_GET['busqueda'] != ""){
                $busqueda = $_GET['busqueda'];
                echo "<h3 class='text-info display-5 col-12 pb-5'>Resultados de '$busqueda'</h3>";
                
                $consulta_maestro = "SELECT trabajos.titulo, trabajos.introduccion, trabajos.desarrollo, trabajos.fecha_trabajo, trabajos.id_trabajo, imagenes.nombre_imagen FROM trabajos INNER JOIN imagenes ON trabajos.id_trabajo = imagenes.id_trabajo WHERE titulo LIKE '%$busqueda%' OR introduccion LIKE '%$busqueda%' OR desarrollo LIKE '%$busqueda%'";
                
                $run_filtro = mysqli_query($cnx, $consulta_maestro);
                
                $nums_filtro = mysqli_num_rows($run_filtro);
                
                $consulta_maestro;
                
                if($nums_filtro == 0){
                    echo "<p class='lead'>No podemos encontrar <span class='mark'>$busqueda</span>, ¿Querés intentarlo de nuevo?</p>";
                }
            }else{
                $consulta_maestro = "SELECT trabajos.id_trabajo, trabajos.titulo, trabajos.fecha_trabajo, imagenes.nombre_imagen, imagenes.descripcion_imagen FROM trabajos INNER JOIN imagenes  ON trabajos.id_trabajo=imagenes.id_trabajo";
                
            }
            
            
            $run_maestro = mysqli_query($cnx, $consulta_maestro);        
            
            
            while( $array_maestro = mysqli_fetch_assoc($run_maestro) ){ 
            
            $fecha_maestro = $array_maestro['fecha_trabajo'];
                
            $fecha_maestro_nueva = explode("-", $fecha_maestro);
            
            $fecha_maestro = $fecha_maestro_nueva[2] . "/" . $fecha_maestro_nueva[1] . "/" . $fecha_maestro_nueva[0]; 
                
            ?>

            <div class="col-lg-4 text-center my-2">
                <div class="card mb-3" style="width: 20rem;">
                    <img class="card-img-top" style="height: 20rem" src="imagenes/<?php echo $array_maestro['nombre_imagen']; ?>" alt="<?php echo $array_maestro['descripcion_imagen']; ?>">
                    <div class="card-body">
                        <h5 class="card-title"><?php echo $array_maestro['titulo']; ?></h5>
                        <p class="card-text font-weight-bold"><?php echo $fecha_maestro; ?></p>
                        <a href="index.php?t=<?php echo $array_maestro['id_trabajo']; ?>" class="btn btn-info">Ver Trabajo</a>
                    </div>
                </div>
            </div>


            <?php
            }
            ?>
        </section>


        <?php
        }else{
        ?>


        <section class="row pb-5 justify-content-md-center">

            <?php
                    $t = $_GET['t'];

                    $consulta_detalle = "SELECT trabajos.id_trabajo, trabajos.titulo, trabajos.introduccion, trabajos.desarrollo, trabajos.fecha_trabajo, 
                    trabajos.id_usuario, imagenes.id_imagen, imagenes.nombre_imagen, imagenes.descripcion_imagen, videos.id_video, videos.nombre, videos.descripcion, 
                    usuarios.id_usuario, usuarios.primer_nombre, usuarios.segundo_nombre, usuarios.primer_apellido, usuarios.segundo_apellido, usuarios.email, usuarios.descripcion_usuario   
                    FROM trabajos INNER JOIN imagenes ON trabajos.id_trabajo = imagenes.id_trabajo INNER JOIN videos ON imagenes.id_trabajo = videos.id_trabajo 
                    INNER JOIN usuarios ON trabajos.id_usuario = usuarios.id_usuario WHERE trabajos.id_trabajo = $t";

                    $run_detalle = mysqli_query($cnx, $consulta_detalle);

                    $array_detalle = mysqli_fetch_assoc($run_detalle);
            
                    $fecha_detalle = $array_detalle['fecha_trabajo'];
                
                    $fecha_detalle_nuevo = explode("-", $fecha_detalle);
            
                    $fecha_detalle = $fecha_detalle_nuevo[2] . "/" . $fecha_detalle_nuevo[1] . "/" . $fecha_detalle_nuevo[0];
                    

                    if($array_detalle == false){
                        header("Location: index.php");
                        exit;
                    }
                    ?>

            <div>
                <div class="row">
                    <div class="col-7">
                        <h2 class="col-12 display-4 my-5 font-weight-bold text-dark"><?php echo $array_detalle['titulo']; ?></h2>
                    </div>
                    <div class="col-5">
                        <h5 class="col-12 display-6 my-5 font-weight-bold text-info text-right">Diseñador: <?php echo $array_detalle['primer_nombre'] . " " . $array_detalle['primer_apellido'] . " - " . $fecha_detalle ; ?></h5>

                    </div>
                </div>
                <div class="row">
                    <div class="col-7 mt-5 pt-5 px-4">
                        <p class="h3"><?php echo $array_detalle['introduccion']; ?></p>
                    </div>
                    <div class="col-5 mt-5">
                        <img src="imagenes/<?php echo $array_detalle['nombre_imagen']; ?>" alt="<?php echo $array_detalle['imagenes.descripcion']; ?>" class="img-fluid">
                    </div>
                </div>
                <div class="row">
                    <div class="col mt-5 pt-5">
                        <p class="h4"><?php echo $array_detalle['desarrollo']; ?></p>
                    </div>
                </div>
                <div class="row">
                    <div class="col mt-5 pt-5" style="text-align:center;">
                        <video src="videos/<?php echo $array_detalle['nombre']; ?>" controls width="75%" class="center "></video>
                    </div>
                </div>
                <div class="row">
                    <div class="col mt-5 py-5">
                        <a href="index.php" class="btn btn-dark">Volver</a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8 mt-3">
                       
                       <h2 class="pb-4">Comentarios</h2>
                        <?php
                                $consulta_comentario = "SELECT * FROM comentarios INNER JOIN trabajos ON comentarios.id_trabajo = trabajos.id_trabajo INNER JOIN usuarios ON comentarios.id_usuario = usuarios.id_usuario WHERE trabajos.id_trabajo = $t ORDER BY comentarios.fecha DESC";
                                    
                                $run_comentario = mysqli_query($cnx, $consulta_comentario);
            
                                while($array_comentario = mysqli_fetch_assoc($run_comentario)){
                                
                            $fecha_comentario = $array_comentario['fecha'];
                
                                $fecha_comentario_nuevo = explode("-", $fecha_comentario);
            
                                $fecha_comentario = $fecha_comentario_nuevo[2] . "/" . $fecha_comentario_nuevo[1] . "/" . $fecha_comentario_nuevo[0];
                            
                            ?>






                        <h5 class="text-info font-weight-bold"><?php echo $array_comentario['primer_nombre'] . " " . $array_comentario['primer_apellido'] . " - " . $fecha_comentario ?></h5>
                        <p><?php echo $array_comentario ['comentario'] ?></p>
                        <?php        
                                }
                                ?>
                    </div>
                    <?php 
                    if(isset($_SESSION['email'])){
                        
                    
                    ?>
                    
                    <aside class="col-md-8 mt-3">
                       <h3 class="py-3">Dejá tu comentario:</h3>
                        <form action="comentarios/recibe_comentario.php" method="post">
                            <div class="form-group">
                                <textarea name="comentario" cols="30" rows="5" class="form-control form-control-sm"></textarea>
                            </div>
                            <input type="hidden" name="trabajo" value="<?php echo $t; ?>">
                            <input type="submit" value="Enviar" class="btn btn-info float-right my-sm-0">
                        </form>
                    </aside>
                    <?php 
                    }
                    ?>
                </div>
            </div>
        </section>

        <?php
        }
        
        
        ?>

    </main>

    <footer class="bg-dark">
        <div class="container p-5">
            <p class="text-light text-center m-0"><span class="font-weight-bolder">Doros</span> - Estudio de Diseño Multimedial</p>
            <p class="text-info text-center m-0">©2020</p>
        </div>
    </footer>

    <div class="modal fade" id="error_logueo" tabindex="-1" role="dialog" aria-labelledby="error_login_titulo" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="error_login_titulo">Error en el Ingreso</h2>
                </div>
                <div class="modal-body">
                    <p>Usuario o clave incorrecto.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade " id="registro_exitoso" tabindex="-1" role="dialog" aria-labelledby="registro_exitoso_titulo" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title text-success" id="registro_exitoso_titulo">¡Felicidades!</h2>

                </div>
                <div class="modal-body">
                    <p class=" text-dark">El registro fue exitoso. Ya podés ingresar con tu email y tu clave.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <script src="js/jquery-3.4.1.js"></script>
    <script src="js/bootstrap.bundle.js"></script>


    <?php    
    if( isset($_GET["e"]) && $_GET["e"] == 1 ){
    ?>

    <script>
        $('#error_logueo').modal('toggle');
        $('#error_logueo').on('hidden.bs.modal', function(e) {
            window.location = "index.php";
        });

    </script>

    <?php
        
    }else if( isset($_GET["e"]) && $_GET["e"] == 2 ){
        include "logueo/registrar.php";
    
    
    }else if( isset($_GET["e"]) && $_GET["e"] == 3 ){
        include "logueo/registrar.php";
    
    
    }else if( isset($_GET["e"]) && $_GET["e"] == 4 ){
     ?>
    <script>
        $('#registro_exitoso').modal('toggle');
        $('#registro_exitoso').on('hidden.bs.modal', function(e) {
            window.location = "index.php";
        })

    </script>


    <?php    
     } 
    ?>

    <?php
    mysqli_close($cnx);
    ?>
</body>

</html>
