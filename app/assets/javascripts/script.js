$(document).on('turbolinks:load',
function(){
  $(".button-collapse").sideNav();
  $('.carousel.carousel-slider').carousel({fullWidth: true});
  $('.slider').slider();
  $('select').material_select();






  // $removeBtn = $('.removeBtn')
  // $addBtn = $('.addBtn')
  // $oneclothes = $('.oneclothes')
  //
  // $oneclothes.on('click', '.removeBtn', function () {
  //   var id = $(this).parent().find('h5').text()
  //   // var id = this.id
  //   var json = JSON.stringify({
  //     id
  //   })
  //
  //   console.log($(this), this.id)
  //   fetch(`/cart/${id}`, {
  //     credentials: 'include',
  //     method: 'POST',
  //     body: json,
  //     headers: {
  //       'Content-Type': 'application/json'
  //     }
  //   })
  //   var $button = $('.removeBtn')
  //   $button.empty()
  //   $button.attr('class', 'addBtn')
  //   $button.html('Add to Cart')
  //   //
  //   //   $(this).css({'border':"2px solid red"})
  //   //   // $removeBtn.text('')
  //   //   // $removeBtn.removeClass().addClass('addBtn')
  //   //
  // })




  // $oneclothes.on('click', '.addBtn', function() {
  //   var clothes_set_id = this.id
  //   var json = JSON.stringify({
  //     clothes_set_id
  //   })
  //
  //   console.log($(this), this.id)
  //   fetch(`/cart`, {
  //     credentials: 'include',
  //     method: 'POST',
  //     body: json,
  //     headers: {
  //       'Content-Type': 'application/json'
  //     }
  //   })
  //   var $button = $('.addBtn')
  //   $button.empty()
  //   $button.attr('class', 'removeBtn')
  //   $button.html('Remove from Cart')
  //   //
  //   //   $(this).css({'border':"2px solid red"})
  //   //   // $removeBtn.text('')
  //   //   // $removeBtn.removeClass().addClass('addBtn')
  //   //
  //
  //
  // })





})
