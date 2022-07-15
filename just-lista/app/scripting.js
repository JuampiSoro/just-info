/////////////////////////////////////////////////////////// Cambio de boton suma a tilde - Input de value - 


$('#boton-agregar').on('tap', function () {

    if ($('#boton-agregar').hasClass('ui-icon-agregar')) {


        $(this).removeClass('ui-icon-agregar');

        $(this).addClass('ui-icon-tilde');

        $('#action-bar').after('<div class="input-list"><input type="text" id="item" class="item-nuevo"></div>');


        $( "#boton-agregar" ).click(function() {
			$( "#item" ).focus();
		});







    } else if ($('#boton-agregar').hasClass('ui-icon-tilde')) {

        $(this).removeClass('ui-icon-tilde');

        $(this).addClass('ui-icon-agregar');

        var itemIngresado = $('#item').val();

        if (itemIngresado != null && itemIngresado != undefined && itemIngresado != "") {

            var nuevoItem = '<div><p class="ui-btn ui-corner-all ui-icon-casilla_vacia ui-btn-icon-left">' + itemIngresado + '</p></div>';

            $('#justLista').prepend(nuevoItem);

            guardarItems();
            $('#justLista').controlgroup('refresh');

            $('#item').remove();

        } else {

            $('#item').remove();
        }
    }
});







/////////////////////////////////////////////////////////// Borrar items seleccionados

$('#boton-borrar').on('tap', function () {

    $('#justLista > div > p').remove('.seleccionado-vacio');
    guardarItems();
    $('#justLista > div > p').remove('.seleccionado-lleno');
    guardarItems();

    $('#boton-destacar').css("display", "none");

    $('#boton-pregunta-borrar').css("display", "none");


});




/////////////////////////////////////////////////////////// DESTACAR ITEMS


$('#boton-destacar').on('tap', function () {

    if ($('#justLista div .seleccionado-vacio, .seleccionado-lleno').hasClass('destacar-texto')) {

        if ($('#justLista .seleccionado-vacio').is('.ui-icon-casilla_vacia_destacada')) {

            $('#justLista .seleccionado-vacio, .seleccionado-lleno').removeClass('ui-icon-casilla_vacia_destacada');

            $('#justLista .seleccionado-vacio, .seleccionado-lleno').addClass('ui-icon-casilla_vacia');

            $('#justLista .seleccionado-vacio, .seleccionado-lleno').removeClass('destacar-texto');

            $('#justLista .seleccionado-vacio, .seleccionado-lleno').removeClass('seleccionado-vacio');

            guardarItems();

        };

        if ($('#justLista > div > p').hasClass('seleccionado-lleno')) {

            $('#justLista .seleccionado-vacio, .seleccionado-lleno').removeClass('ui-icon-casilla_llena_destacada');

            $('#justLista .seleccionado-vacio, .seleccionado-lleno').removeClass('ui-icon-casilla_vacia');

            $('#justLista .seleccionado-vacio, .seleccionado-lleno').removeClass('destacar-texto');

            $('#justLista .seleccionado-vacio, .seleccionado-lleno').addClass('ui-icon-casilla_llena');

            $('#justLista .seleccionado-vacio, .seleccionado-lleno').removeClass('seleccionado-lleno');

            guardarItems();


        };



    } else if (!$('#justLista .seleccionado-vacio, .seleccionado-lleno').hasClass('destacar-texto')) {


        if ($('#justLista > div > p').is('.seleccionado-vacio, .seleccionado-lleno')) {

            $('#justLista .seleccionado-vacio, .seleccionado-lleno').removeClass('ui-icon-casilla_vacia');

            $('#justLista .seleccionado-vacio, .seleccionado-lleno').removeClass('ui-icon-casilla_llena');

            $('#justLista .seleccionado-vacio, .seleccionado-lleno').addClass('ui-icon-casilla_vacia_destacada');

            $('#justLista .seleccionado-vacio, .seleccionado-lleno').addClass('destacar-texto');

            $('#justLista .seleccionado-vacio, .seleccionado-lleno').css("opacity", "100%");

            $('#justLista .seleccionado-vacio, .seleccionado-lleno').removeClass('seleccionado-vacio');

            $('#justLista .seleccionado-vacio, .seleccionado-lleno').removeClass('seleccionado-lleno');

            $('#boton-destacar').css("display", "none");

            $('#boton-pregunta-borrar').css("display", "none");

            guardarItems();


        }

    }


});


/////////////////////////////////////////////////////////// TILDE Y SIN TILDE EN ITEMS


$('#justLista').on('tap', 'p', function () {

    if ($(this).hasClass('ui-icon-casilla_vacia')) {

        $(this).removeClass('ui-icon-casilla_vacia');

        $(this).addClass('ui-icon-casilla_llena');

        $(this).css("opacity", "50%");

        $('#justLista .seleccionado-vacio, .seleccionado-lleno').removeClass('seleccionado-vacio');

        $('#justLista .seleccionado-vacio, .seleccionado-lleno').removeClass('seleccionado-lleno');

        $('#boton-destacar').css("display", "none");

        $('#boton-pregunta-borrar').css("display", "none");

        guardarItems();




    } else if ($(this).hasClass('ui-icon-casilla_llena')) {

        $(this).removeClass('ui-icon-casilla_llena');

        $(this).addClass('ui-icon-casilla_vacia');

        $(this).css("opacity", "100%");

        $('#justLista .seleccionado-vacio, .seleccionado-lleno').removeClass('seleccionado-vacio');

        $('#justLista .seleccionado-vacio, .seleccionado-lleno').removeClass('seleccionado-lleno');

        $('#boton-destacar').css("display", "none");

        $('#boton-pregunta-borrar').css("display", "none");

        guardarItems();



    } else if ($(this).hasClass('ui-icon-casilla_vacia_destacada')) {

        $(this).removeClass('ui-icon-casilla_vacia_destacada');

        $(this).addClass('ui-icon-casilla_llena_destacada');

        $(this).css("opacity", "50%");

        $('#justLista .seleccionado-vacio, .seleccionado-lleno').removeClass('seleccionado-vacio');

        $('#justLista .seleccionado-vacio, .seleccionado-lleno').removeClass('seleccionado-lleno');

        $('#boton-destacar').css("display", "none");

        $('#boton-pregunta-borrar').css("display", "none");

        guardarItems();



    } else if ($(this).hasClass('ui-icon-casilla_llena_destacada')) {

        $(this).removeClass('ui-icon-casilla_llena_destacada');

        $(this).addClass('ui-icon-casilla_vacia_destacada');

        $(this).css("opacity", "100%");

        $('#justLista .seleccionado-vacio, .seleccionado-lleno').removeClass('seleccionado-vacio');

        $('#justLista .seleccionado-vacio, .seleccionado-lleno').removeClass('seleccionado-lleno');

        $('#boton-destacar').css("display", "none");

        $('#boton-pregunta-borrar').css("display", "none");

        guardarItems();



    };

});

///////////////////////////////////////////////////////////  SELECCION DE ITEMS



$('#justLista').on('taphold', 'p', function () {


    if ($(this).hasClass('seleccionado-lleno') || $(this).hasClass('seleccionado-vacio')) {

        $(this).removeClass('seleccionado-vacio');
        $(this).removeClass('seleccionado-lleno');

        if (!$('#justLista > p').is('.seleccionado-vacio, .seleccionado-lleno')) {

            $('#boton-destacar').css("display", "none");

            $('#boton-pregunta-borrar').css("display", "none");
        }





    } else {

        if ($(this).hasClass('ui-icon-casilla_vacia') || $(this).hasClass('ui-icon-casilla_vacia_destacada')) {

            $(this).addClass('seleccionado-vacio');



        } else if ($(this).hasClass('ui-icon-casilla_llena') || $(this).hasClass('ui-icon-casilla_llena_destacada')) {

            $(this).addClass('seleccionado-lleno');

        }

        $('#boton-destacar').css("display", "block");

        $('#boton-pregunta-borrar').css("display", "block");




    }

});




///////////////////////////////////////////// BORRAR TODO 


$('#eliminar-todos').on('tap', function () {

    $('#justLista > div > p').remove();

    $('#boton-destacar').css("display", "none");

    $('#boton-pregunta-borrar').css("display", "none");

    localStorage.clear();




});

//////////////////////////////////////////// GUARDADO DE ITEMS - ARRAYS

function guardarItems() {
    var itemsActuales = new Array();

    $('#justLista div').each(function () {

        
        if ($(this).html() != "" && $(this).html() != null && $(this).html() != undefined) {
            itemsActuales.push($(this).html());
        }



    });


    var itemsActuales_json = JSON.stringify(itemsActuales);

    localStorage.setItem("items", itemsActuales_json);

}



$(document).on("ready", function () {

    var itemsRecuperados_json = localStorage.getItem("items");

    if (itemsRecuperados_json != null && itemsRecuperados_json != undefined && itemsRecuperados_json != "") {

        var itemsRecuperados_array = JSON.parse(itemsRecuperados_json);


        for (let i = 0; i < itemsRecuperados_array.length; i++) {
            var nuevoItem = '<div>' + itemsRecuperados_array[i] + '</div>';
            $('#justLista').append(nuevoItem);
        }



    }



});