 $(document).ready(function() {
         principal();      
        });

        function principal() {
        $("#elvalor1").keydown(function(event) {
   if(event.shiftKey)
   {
        event.preventDefault();
   }
 
   if (event.keyCode == 46 || event.keyCode == 8)    {
   }
   else {
        if (event.keyCode < 95) {
          if (event.keyCode < 48 || event.keyCode > 57) {
                event.preventDefault();
          }
        }
        else {
              if (event.keyCode < 96 || event.keyCode > 105) {
                  event.preventDefault();
              }
        }
      }

   });
        /*  $("#onaficha_inscripcionbundle_personastype_cedula").keydown(function(event) {
          if(event.shiftKey)
          {
          event.preventDefault();
          }
          
          if (event.keyCode == 46 || event.keyCode == 8)    {
          }
          else {
          if (event.keyCode < 95) {
          if (event.keyCode < 48 || event.keyCode > 57) {
          event.preventDefault();
          }
          }
          else {
          if (event.keyCode < 96 || event.keyCode > 105) {
          event.preventDefault();
          }
          }
          }
          
          });*/
    }