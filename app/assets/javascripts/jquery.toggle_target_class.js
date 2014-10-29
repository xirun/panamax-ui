(function($) {
  $.fn.toggleTargetClass = function() {
    $(this).on('click', function(e) {
      e.preventDefault();
      var $el = $(e.currentTarget),
          target = $el.data('toggle-target');

      var cssClass = $el.data('toggle-class');
      if (target === 'this') {
        $(this).toggleClass(cssClass);
      } else {
        $(target).toggleClass(cssClass);
      }
    });
  };
})(jQuery);
