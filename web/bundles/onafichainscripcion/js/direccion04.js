        $(document).ready(function() {
         main();
        });

        function main() {
            
            $('#onaficha_inscripcionbundle_instrumento04type_idEstado').val('');
            $('#onaficha_inscripcionbundle_instrumento04type_idMunicipio').after('<div id="municipio_id"></div>');
            $('#onaficha_inscripcionbundle_instrumento04type_idMunicipio').hide();
            $('#onaficha_inscripcionbundle_instrumento04type_idParroquia').hide();
            $("#onaficha_inscripcionbundle_instrumento04type_idEstado").change(function() {
                municipio($(this).val());
            })
        }

        function municipio(municipio_elegido) { //recibe el valor=numero del estado seleccionado
            $.ajax({
                url: "../instrumento04/municipiojs",
                type: 'POST',
                dataType: 'json',
                data: {municipio_id: municipio_elegido}, //esto es un 2 el numero del estado que regresa cuando lo seleccionas
                success: function(data, textStatus, jqXHR) {
                    //alert(municipio_id);
                    ajaxMunicipio(data);
                }
            });
        }

        function ajaxMunicipio(data) {
            //alert(data);
            $('#onaficha_inscripcionbundle_instrumento04type_idMunicipio').remove();
            $('#municipio_id').html(data['html']);
            $('#municipio_id').after($('#municipio_id').html());
            $('#municipio_id').remove();
            $('#onaficha_inscripcionbundle_instrumento04type_idMunicipio').after('<div id="municipio_id"></div>');
            parroquia();
        }

        function parroquia() {
            //alert("llego");
            $('#onaficha_inscripcionbundle_instrumento04type_idParroquia').after('<div id="parroquia_id"></div>');
            $('#onaficha_inscripcionbundle_instrumento04type_idParroquia').hide();
            $("#onaficha_inscripcionbundle_instrumento04type_idMunicipio").change(function() {
            $.ajax({
                url: "../instrumento04/parroquiajs",
                type: 'POST',
                dataType: 'json',
                data: {parroquia_id: $(this).val()},
                success: function(data, textStatus, jqXHR) {
                    ajaxParroquia(data);
                }
            });
            });
        }
        
        function ajaxParroquia(data){
             $('#onaficha_inscripcionbundle_instrumento04type_idParroquia').remove();
             $('#parroquia_id').html(data['html']);
             $('#parroquia_id').after($('#parroquia_id').html());
             $('#parroquia_id').remove();
             $('#onaficha_inscripcionbundle_instrumento04type_idParroquia').after('<div id="parroquia_id"></div>');
        }
