// JUST-INFO

// POPUP FUENTES

$('#div-fira-sans').on('tap', function () {



    if (!$('#div-fira-sans').hasClass('seleccionado-font')) {




        $('#div-fira-sans').addClass('seleccionado-font');

        $('#div-hind').removeClass('seleccionado-font');

        $('#div-roboto-slab').removeClass('seleccionado-font');

        $('.cambiame-intro').removeClass('roboto-slab-intro');

        $('.cambiame-desarrollo').removeClass('roboto-slab-desarrollo');

        $('.cambiame-intro').removeClass('hind-intro');

        $('.cambiame-desarrollo').removeClass('hind-desarrollo');

        $('.cambiame-intro').addClass('fira-sans-intro');

        $('.cambiame-desarrollo').addClass('fira-sans-desarrollo');

        guardarFuentes();



    }
});

$('#div-hind').on('tap', function () {



    if (!$('#div-hind').hasClass('seleccionado-font')) {




        $('#div-hind').addClass('seleccionado-font');

        $('#div-fira-sans').removeClass('seleccionado-font');

        $('#div-roboto-slab').removeClass('seleccionado-font');

        $('.cambiame-intro').removeClass('roboto-slab-intro');

        $('.cambiame-desarrollo').removeClass('roboto-slab-desarrollo');

        $('.cambiame-intro').removeClass('fira-sans-intro');

        $('.cambiame-desarrollo').removeClass('fira-sans-desarrollo');

        $('.cambiame-intro').addClass('hind-intro');

        $('.cambiame-desarrollo').addClass('hind-desarrollo');

        guardarFuentes();


    }
});

$('#div-roboto-slab').on('tap', function () {



    if (!$('#div-roboto-slab').hasClass('seleccionado-font')) {

        $('#div-roboto-slab').addClass('seleccionado-font');

        $('#div-hind').removeClass('seleccionado-font');

        $('#div-fira-sans').removeClass('seleccionado-font');

        $('.cambiame-intro').removeClass('hind-intro');

        $('.cambiame-desarrollo').removeClass('hind-desarrollo');

        $('.cambiame-intro').removeClass('fira-sans-intro');

        $('.cambiame-desarrollo').removeClass('fira-sans-desarrollo');

        $('.cambiame-intro').addClass('roboto-slab-intro');

        $('.cambiame-desarrollo').addClass('roboto-slab-desarrollo');

        guardarFuentes();


    }
});


// LOCAL STORAGE FUENTES

function guardarFuentes() {
    var ultimasFuentes = new Array();

    var cambiameIntro = $('.introduccion').attr('class');

    cambiameIntro = cambiameIntro.replace('introduccion ', '');

    cambiameIntro = cambiameIntro.replace('cambiame-intro ', '');

    var cambiameDesarrollo = $('.desarrollo').attr('class');

    cambiameDesarrollo = cambiameDesarrollo.replace('desarrollo ', '');

    cambiameDesarrollo = cambiameDesarrollo.replace('cambiame-desarrollo ', '');



    ultimasFuentes.push(cambiameIntro);

    ultimasFuentes.push(cambiameDesarrollo);


    var ultimasFuentes_json = JSON.stringify(ultimasFuentes);

    localStorage.setItem("fuentes", ultimasFuentes_json);
}



$(document).on("ready", function () {

    var fuentesRecuperadas_json = localStorage.getItem("fuentes");

    if (fuentesRecuperadas_json != null && fuentesRecuperadas_json != undefined && fuentesRecuperadas_json != "") {

        var fuentesRecuperadas_json = JSON.parse(fuentesRecuperadas_json);

        var intro = fuentesRecuperadas_json[0];
        

         $('.cambiame-intro').addClass(fuentesRecuperadas_json[0]);

        $('.cambiame-desarrollo').addClass(fuentesRecuperadas_json[1]);


        $('.cambiame-intro').removeClass('fira-sans-intro');


        intro = intro.replace("-intro", "");


        $(".fonts").each(function() {
            var fuente = $(this).attr("id");

            fuente = fuente.replace("div-", "");

            if (intro == fuente) {
                $(this).addClass("seleccionado-font");
            } else {
                $(this).removeClass("seleccionado-font");
            }
        });

    }

});


// CERRAR SESION

$(document).on('click', ".cerrar-sesion", function () {

    localStorage.removeItem('usuario');


    var header = $('.div-header');

    header.remove();

    $('.btn-login').css("display", "block");



});


// LIKE

$(document).on('click', ".ui-icon-like-vacio", function () {


    $(this).removeClass('ui-icon-like-vacio');

    $(this).addClass('ui-icon-like-lleno');


    var obtenerUsuario_json = localStorage.getItem('usuario');

    if(obtenerUsuario_json != null && obtenerUsuario_json != "" && obtenerUsuario_json != undefined){

        var obtenerUsuarioArray = JSON.parse(obtenerUsuario_json);
        

        var idNoticia = $(this).attr('id');

        idNoticia = idNoticia.replace('noticia-like-','');

        var idUsuario = obtenerUsuarioArray[0].replace('id: ', '');

        var likes_json = localStorage.getItem('likes');

        if(likes_json != null && likes_json != undefined && likes_json != ""){
            var arrayLikes = JSON.parse(likes_json);
        }
        else{
            var arrayLikes = new Array();
        }

        if(arrayLikes.length > 0 ){

            var elUsuarioTieneLaNoticia = false;
            for(var i in arrayLikes){
                if(arrayLikes[i].idUsuario == idUsuario){

                    for(var j in idNoticia){
                        if(arrayLikes[i].idNoticia[j] == idNoticia){

                            elUsuarioTieneLaNoticia = true;
    
                            
                        } else {
                            elUsuarioTieneLaNoticia = true;
                            console.log(arrayLikes);

                            if(!arrayLikes[i].idNoticia.includes(idNoticia)){
                                arrayLikes[i].idNoticia.push(idNoticia);
    
                                var json = JSON.stringify(arrayLikes);
    
                                localStorage.setItem('likes', json);
                            }
    
                            
                            
                        }
                    }
                    
                    
                } else {
                    arrayLikes = new Array();
                    var obj = {
                        idNoticia: [idNoticia],
                        idUsuario: idUsuario
                    };
                arrayLikes.push(obj); 
    
    
                var arraylikesJson = JSON.stringify(arrayLikes);
    
                localStorage.setItem('likes', arraylikesJson);
                }
            }
            if(elUsuarioTieneLaNoticia){

            }

           
            else{

                var obj = {
                    idNoticia: [idNoticia],
                    idUsuario: idUsuario
                };

                arrayLikes.push(obj); 

                var arraylikesJson = JSON.stringify(arrayLikes);

                localStorage.setItem('likes', arraylikesJson);
            }
        } else{
           
                var obj = {
                    idNoticia: [idNoticia],
                    idUsuario: idUsuario
                };
            arrayLikes.push(obj); 


            var arraylikesJson = JSON.stringify(arrayLikes);

            localStorage.setItem('likes', arraylikesJson);
        }

        
        // if(obtenerUsuarioArray[5] != null && obtenerUsuarioArray[5] != undefined){

        //     if(!obtenerUsuarioArray[5].includes('idNoticia: '+idNoticia+'')){
        //         obtenerUsuarioArray[5].push('idNoticia: '+idNoticia+'');

        //         var likes_json = JSON.stringify(obtenerUsuarioArray);

        //         localStorage.setItem('usuario', likes_json);
        //     }            
        // }
        // else{
        //     arrayLikes.push('idNoticia: '+idNoticia+'');


        //     obtenerUsuarioArray.push(arrayLikes);
    
    
    
        //     var likes_json = JSON.stringify(obtenerUsuarioArray);
    
        //     localStorage.setItem('usuario', likes_json);
        // }

        
    }



});

$(document).on('click', ".ui-icon-like-lleno", function () {


    $(this).removeClass('ui-icon-like-lleno');

    $(this).addClass('ui-icon-like-vacio');
});