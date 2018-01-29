$(document).on("turbolinks:load", function() {
  // slider at home page
  $(".slider").slider();

  $('select').material_select();
  $('ul.tabs').tabs();

  // disabling bookmark button after clicking
  $(".bookmark").on("click", function() {
    $(".bookmark").addClass("disabled");
  });

  $(".notice, .alert").delay(3000).fadeOut(2000);

});
