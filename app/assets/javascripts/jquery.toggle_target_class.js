(function($) {
  $.fn.toggleTargetClass = function() {

    var targetSelector = '[data-toggle-target]';

    $(this).on('click', targetSelector, function(e) {
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
