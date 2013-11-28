(function() {
  $(function() {
    return $('#bSubmit').submit(function() {
      $('#epic-buttons .content button:first').click();
      return false;
    });
  });

}).call(this);
