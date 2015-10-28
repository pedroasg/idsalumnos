(function ($) {

    function emptyValidator() {
      if($(".course")[0]){
          $(".no-course").hide();
      }
    }

    function statusColor() {
      ($("#status").text("Inscripciones abiertas").css("color", "green"));
    }

  $(document).ready(function() {
    emptyValidator();
    statusColor();
  });

})(jQuery);
