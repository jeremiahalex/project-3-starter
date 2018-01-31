$(document).on('turbolinks:load',function() {

  $('.button-collapse').sideNav();

  $('.parallax').parallax();

  $('select').material_select();

  if (!$('label').val()) {
    $('label').addClass('active');
  }

  // $('#warranty_user_registration').hide();

});
