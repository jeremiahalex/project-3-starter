$(document).on("turbolinks:load", function() {
  // slider at home page
  $(".slider").slider();

  $(".view-more").on("click", function() {
    // view more button at home page
    $(".view-more").css("display", "none");
    $(".hidden").css("display", "block");

    $('ul.tabs').tabs();
    $('select').material_select();

  });

  // disabling bookmark button after clicking
  $(".bookmark").on("click", function() {
    $(".bookmark").addClass("disabled");
  });

  $(".notice, .alert").delay(3000).fadeOut(2000);

});
