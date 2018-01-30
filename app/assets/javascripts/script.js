$(document).on("turbolinks:load", function() {
  // slider at home page
  $(".slider").slider();

  $(".dropdown-button").dropdown({
    hover: true
  });

  $('select').material_select();
  $('ul.tabs').tabs();

  // disabling bookmark button after clicking
  $(".bookmark").on("click", function() {
    $(".bookmark").addClass("disabled");
  });

  // flash messages
  $(".notice, .alert").delay(3000).fadeOut(2000);

  // results filtering
  $(".filter a").on("click", function() {
    var anchorClass = $(this).attr("id");
    $(".pages-show").css("display", "none");
    $("." + anchorClass).css("display", "block");
  });

});
