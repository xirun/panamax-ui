describe('$.fn.confirmAndDelete', function() {
  var subject

  beforeEach(function() {
    fixture.load('confirm-and-delete.html');
    subject = new $.PMX.ConfirmAndDelete($('body'));
    subject.init();
  });

  describe('when clicked', function() {
    it('prevents default', function() {
      var click = new $.Event('click');
      $('.delete-action').trigger(click);
      expect(click.isDefaultPrevented).toBeTruthy();
    });

    it('prevents propagation', function() {
      var click = new $.Event('click');
      $('.delete-action').trigger(click);
      expect(click.isPropagationStopped).toBeTruthy();
    });

    it('call createConfirmation', function() {
      spyOn(subject, 'createConfirmation');
      var click = new $.Event('click');
      $('.delete-action').trigger(click);
      expect(subject.createConfirmation).toHaveBeenCalled();
    });
  });
});
