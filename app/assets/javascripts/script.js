$(document).on('turbolinks:load',
function(){
  $(".button-collapse").sideNav();
  $('.carousel.carousel-slider').carousel({fullWidth: true});
  $('.slider').slider();
  $('select').material_select();

  var userPoints = Number($('.userPoints').val())





  $clothes = $('.clothes')

  $clothes.on('click', '.addBtn', function () {

    console.log(userPoints)
    if (userPoints <= 0){
      alert('You have exceed the number of clothes you can select, Please remove before adding')
    }
    else if(userPoints > 0) {
      userPoints -= 10
      var clothes_set_id = $(this).parent().find('.setId').val()
      var json = JSON.stringify({
        clothes_set_id
      })
      console.log(json)

      console.log($(this), clothes_set_id)
      $.ajax({
        url: `/cart`,
        type: 'POST',
        data: {clothes_set_id: `${clothes_set_id}` },
        success: function(result) {
        }
      })
      var $button = $(this)
      $button.empty()
      $button.attr('class', 'removeBtn')
      $button.html('Remove from Cart')

    }
  })

  $clothes.on('click', '.removeBtn', function () {

    userPoints += 10
    var clothes_set_id = $(this).parent().find('.setId').val()
    // var id = this.id
    var json = JSON.stringify({
      clothes_set_id
    })

    console.log($(this), clothes_set_id )

    $.ajax({
      url: `/clothes/${clothes_set_id}`,
      type: 'DELETE',
      success: function(result) {
      }
    })
    var $button = $(this)
    $button.empty()
    $button.attr('class', 'addBtn')
    $button.html('Add to Cart')

  })

  $('.cart').on('click', '.removeCartBtn', function () {

    // userPoints += 10
    var clothes_set_id = $(this).parent().find('.setId').val()


    // console.log($(this), clothes_set_id )
    //
    $.ajax({
      url: `/clothes/${clothes_set_id}`,
      type: 'DELETE',
      success: function(result) {
      }
    })
    var cartItemResult = $(this).parent()
    cartItemResult.remove()
  })





})
