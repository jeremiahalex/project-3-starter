$(document).on('turbolinks:load',

function () {
  $(".button-collapse").sideNav()
  $('.carousel.carousel-slider').carousel({fullWidth: true})
  $('.slider').slider()
  $('.materialboxed').materialbox();
  $('select').material_select()
  $('.collapsible').collapsible()
  $(".dropdown-button").dropdown()
  var userPoints = Number($('.userPoints').val())
  const $clothes = $('.clothes')
  const $bigCartNumber = $('.cart_item_count')
  const $cartNumber = $('#cart_item_count')
// Browse - add to cart btn
  $clothes.on('click', '.addBtn', function () {
    if (userPoints <= 0) {
      alert('You have insufficient points for this outfit.')
    }
    else if (userPoints > 0) {
    // Points display - AJAX
      var $pointsDisplay = $('.pointsDisplay')
      $pointsDisplay.empty()
      userPoints -= 10
      $pointsDisplay.append($('<span class="new badge" data-badge-caption="Points">' + userPoints + '</span>'))
      // $pointsDisplay.append($('<h5>' + userPoints + ' points</h5>'))
      var clothes_set_id = $(this).parent().parent().parent().find('.setId').val()
      var json = JSON.stringify({
        clothes_set_id
      })
      $.ajax({
        url: `/cart`,
        type: 'POST',
        data: {clothes_set_id: `${clothes_set_id}` },
        success: function (result) {
        }
      })
    // Cart add/remove button change - AJAX
      var $button = $(this).parent()
      $button.empty().append('<a class="removeBtn btn-floating halfway-fab waves-effect waves-light black"><i class="material-icons">clear</i></a>')
      Materialize.toast('Added to Cart', 2500, 'rounded')
    // Cart number change - AJAX
      var numberInCart = Number($cartNumber.html())
      numberInCart += 1
      $cartNumber.empty().append(numberInCart)
      $bigCartNumber.text(numberInCart)
    }
  })

// Browse - remove from cart btn
  $clothes.on('click', '.removeBtn', function () {
    userPoints += 10
  // Points display - AJAX
    var $pointsDisplay = $('.pointsDisplay')
    $pointsDisplay.empty()
    $pointsDisplay.append($('<span class="new badge" data-badge-caption="Points">' + userPoints + '</span>'))
    // $pointsDisplay.append($('<h5>' + userPoints + ' points</h5>'))
    var clothes_set_id = $(this).parent().parent().parent().find('.setId').val()
    // var id = this.id
    var json = JSON.stringify({
      clothes_set_id
    })
    $.ajax({
      url: `/clothes/${clothes_set_id}`,
      type: 'DELETE',
      success: function (result) {}
    })
  // Cart add/remove button change AJAX
    var $button = $(this).parent()
    $button.empty().append('<a class="addBtn btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">add</i></a>')
    Materialize.toast('Remove from Cart', 2500,  'rounded')
  // Cart number change - AJAX

    var numberInCart = Number($cartNumber.html())
    numberInCart -= 1
    $cartNumber.empty().append(numberInCart)
    $bigCartNumber.text(numberInCart)
  })

// Cart - remove from cart btn
  $('.cart').on('click', '.removeCartBtn', function () {
    var clothes_set_id = $(this).parent().parent().find('.setId').val()
    $.ajax({
      url: `/clothes/${clothes_set_id}`,
      type: 'DELETE',
      success: function (result) {}
    })
    var cartItemResult = $(this).parent().parent().parent()
    cartItemResult.remove()
    Materialize.toast('Remove from Cart', 2500, 'rounded')
  // Cart number change - AJAX
    var numberInCart = Number($cartNumber.html())
    numberInCart -= 1
    $cartNumber.empty().append(numberInCart)
  })
  Materialize.Toast.removeAll()
})
