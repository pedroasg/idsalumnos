(function ($) {

  function statusColor() {
    var course = $(this).find("course"),
        status = $(".course").find("#status");

    status.each(function(_, elm){
    console.log($(elm).text() == "Inscripciones abiertas")
      if ($(elm).text() == "Inscripciones abiertas") {
        $(elm).css("color", "green");
      } else {
        $(elm).css("color", "red");
      }
    })
  }

  $(document).ready(function() {
    statusColor();
  });

})(jQuery);
