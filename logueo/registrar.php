<div class="modal fade" id="registro" tabindex="-1" role="dialog" aria-labelledby="titulo_registro" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title" id="titulo_registro">
                    Registrarse
                </h2>
            </div>
            <div class="modal-body row justify-content-center">

                <?php
               if(isset($_GET['e']) && $_GET['e'] == 3){
               ?>
                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                    <h3 class="alert-heading">¡Cuidado!</h3>
                    <p>El email ingresado ya se encuentra registrado en nuestro sitio. Por favor ingresá un nuevo email.</p>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Cerrar"><span aria-hidden="true">&times;</span></button>
                </div>
                <?php   
               }
               ?>

                <form action="logueo/info_registro.php" method="post" class="col-10">

                    <div class="row">
                        <div class="form-group col">
                            <label for="pn">Primer Nombre: </label>
                            <input type="text" name="primer_nombre" id="pn" class="form-control" required>
                        </div>
                        <div class="form-group col">
                            <label for="sn">Segundo Nombre: </label>
                            <input type="text" name="segundo_nombre" id="sn" class="form-control">
                        </div>
                    </div>


                    <div>
                        <div class="row">
                            <div class="form-group col">
                                <label for="pa">Primer Apellido: </label>
                                <input type="text" name="primer_apellido" id="pa" class="form-control" required>
                            </div>
                            <div class="form-group col">
                                <label for="sa">Segundo Apellido: </label>
                                <input type="text" name="segundo_apellido" id="sa" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="dc">Descripción: </label>
                        <textarea name="descripcion_usuario" cols="30" rows="3" class="form-control form-control-sm" id="dc"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="ps">País: </label>
                        <select name="id_pais" id="ps" class="form-control">

                            <?php
                            
                            $consulta_pais = "SELECT * FROM paises";
                            $run_pais = mysqli_query($cnx, $consulta_pais);
                            
                            while($array_pais = mysqli_fetch_assoc($run_pais)){
                            ?>


                            <option value="<?php echo $array_pais["id_pais"]?>"><?php echo $array_pais['pais']; ?></option>

                            <?php
                           }
                           ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="em">Email: </label>
                        <input type="email" name="email" id="em" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="cl">Clave: </label>
                        <input type="password" name="clave" id="cl" class="form-control" required>
                    </div>
                    <div class="text-right">
                        <a href="index.php" class="mr-3 my-2 text-dark">Cancelar</a>
                        <input type="submit" value="Enviar" class="btn btn-info">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>




<script>
    $('#registro').modal('toggle');
    $('#registro').on('hidden.bs.modal', function(e) {
        window.location = "index.php"
    });

</script>
