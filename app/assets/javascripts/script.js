$(document).on("turbolinks:load", function() {
  $(".slider").slider();

  $(".view-more").on("click", function() {
    $(".view-more").css("display", "none");
    $(".hidden").css("display", "block");
  });
});
