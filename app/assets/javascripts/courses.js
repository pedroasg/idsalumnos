(function ($) {

    function statusColor() {
      ($("#status").text("Inscripciones abiertas").css("color", "green"));
    }

  $(document).ready(function() {
    statusColor();
  });

})(jQuery);
