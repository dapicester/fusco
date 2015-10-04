$(function() {
  $("form > button[type=submit]").click(function(e) {
    e.preventDefault();
    $.post('/', { string: $("#inputString").val() })
      .done(function(data) {
        console.debug(JSON.stringify(data));
        formGroup = $('form > .form-group');
        if (data.error) {
          formGroup.addClass('has-error');
          $("#outputString").text('');
        } else {
          formGroup.removeClass('has-error');
          $("#outputString").text(data.output);
        }
      });
  });
});
