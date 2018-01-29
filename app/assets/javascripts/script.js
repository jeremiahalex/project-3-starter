$(document).on('turbolinks:load',function() {
  $('.button-collapse').sideNav();
  $('.parallax').parallax();
  $('select').material_select();
});

$(document).ready(function() {
  if (!$('label').val()) {
    $('label').addClass('active');
  }
})
