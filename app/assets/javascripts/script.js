$(document).on('turbolinks:load',function() {
  $('.button-collapse').sideNav();
  $('.parallax').parallax();
});

$(document).ready(function() {
  if (!$('label').val()) {
    $('label').addClass('active');
  }
})
