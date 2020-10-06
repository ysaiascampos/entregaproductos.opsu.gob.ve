$(document).ready(function() {
         main();
        });

        function main() {
            
            $('#onaficha_inscripcionbundle_personastype_idEstado').val('');
            $('#onaficha_inscripcionbundle_personastype_idMunicipio').after('<div id="municipio_id"></div>');
            $('#onaficha_inscripcionbundle_personastype_idMunicipio').hide();
            $('#onaficha_inscripcionbundle_personastype_idParroquia').hide();
            $("#onaficha_inscripcionbundle_personastype_idEstado").change(function() {
                municipio($(this).val());
            })
        }

        function municipio(municipio_elegido) { //recibe el valor=numero del estado seleccionado
             $.ajax({
                url: "../ona/mu",
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
            $('#onaficha_inscripcionbundle_personastype_idMunicipio').remove();
            $('#municipio_id').html(data['html']);
            $('#municipio_id').after($('#municipio_id').html());
            $('#municipio_id').remove();
            $('#onaficha_inscripcionbundle_personastype_idMunicipio').after('<div id="municipio_id" class="span3"></div>');
            parroquia();
        }

        function parroquia() {
            //alert("llego");
            $('#onaficha_inscripcionbundle_personastype_idParroquia').after('<div id="parroquia_id"></div>');
            $('#onaficha_inscripcionbundle_personastype_idParroquia').hide();
            $("#onaficha_inscripcionbundle_personastype_idMunicipio").change(function() {
            $.ajax({
                url: "../ona/pa",
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
             $('#onaficha_inscripcionbundle_personastype_idParroquia').remove();
             $('#parroquia_id').html(data['html']);
             $('#parroquia_id').after($('#parroquia_id').html());
             $('#parroquia_id').remove();
             $('#onaficha_inscripcionbundle_personastype_idParroquia').after('<div id="parroquia_id"></div>');
        }
