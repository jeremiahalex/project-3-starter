$(document).on('turbolinks:load',
function(){
  $(".button-collapse").sideNav();
  $('.carousel.carousel-slider').carousel({fullWidth: true});
  $('.slider').slider();
  $('select').material_select();
  $('.collapsible').collapsible();
})
