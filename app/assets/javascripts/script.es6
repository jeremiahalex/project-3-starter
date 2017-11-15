$(document).on('turbolinks:load',

function () {
  $(".button-collapse").sideNav()
  $('.carousel.carousel-slider').carousel({fullWidth: true})
  $('.slider').slider()
  $('select').material_select()
  $('.collapsible').collapsible()
  $(".dropdown-button").dropdown()
  var userPoints = Number($('.userPoints').val())
  const $clothes = $('.clothes')

  $clothes.on('click', '.addBtn', function () {
  // Points display AJAX
    var $pointsDisplay = $('.pointsDisplay')
    if (userPoints <= 0){
      alert('You have exceed the number of clothes you can select, Please remove before adding')
    }
    else if(userPoints > 0) {
      $pointsDisplay.empty()
      userPoints -= 10
      $pointsDisplay.append($('<h5>' + userPoints + ' points</h5>'))
      var clothes_set_id = $(this).parent().parent().find('.setId').val()
      var json = JSON.stringify({
        clothes_set_id
      })
      // console.log(json)
      // console.log($(this), clothes_set_id)
      $.ajax({
        url: `/cart`,
        type: 'POST',
        data: {clothes_set_id: `${clothes_set_id}` },
        success: function(result) {
        }
      })
    // Cart add/remove button change AJAX
      var $button = $(this).parent()
      $button.empty()
      $button.append('<a class="removeBtn btn-floating halfway-fab waves-effect waves-light black"><i class="material-icons">clear</i></a>')
    }
  })

  $clothes.on('click', '.removeBtn', function () {
  // Points display AJAX
    var $pointsDisplay = $('.pointsDisplay')
    $pointsDisplay.empty()
    userPoints += 10
    $pointsDisplay.append($('<h5>' + userPoints + ' points</h5>'))

    var clothes_set_id = $(this).parent().parent().find('.setId').val()
    // var id = this.id
    var json = JSON.stringify({
      clothes_set_id
    })
    // console.log($(this), clothes_set_id )
    $.ajax({
      url: `/clothes/${clothes_set_id}`,
      type: 'DELETE',
      success: function(result) {}
    })
  // Cart add/remove button change AJAX
    var $button = $(this).parent()
    $button.empty()
    $button.append('<a class="addBtn btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">add</i></a>')
  })

  $('.cart').on('click', '.removeCartBtn', function () {
    // userPoints += 10
    var clothes_set_id = $(this).parent().find('.setId').val()
    // console.log($(this), clothes_set_id )
    $.ajax({
      url: `/clothes/${clothes_set_id}`,
      type: 'DELETE',
      success: function(result) {}
    })
    var cartItemResult = $(this).parent()
    cartItemResult.remove()
  })

})
