(function ($) {

    function navToggler() {
      $('body').on('click', '#mobile-toggle', function(e) {
        e.preventDefault();
        var $this = $(this);
        console.log($this.parents('.mobile-nav'))
        $this.parents('body').find('.mobile-nav').toggleClass('is-open');
      })
    }


  $(document).ready(function() {
    navToggler();
  });

})(jQuery);
