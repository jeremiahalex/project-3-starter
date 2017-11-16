
$(document).on("turbolinks:load", function() {
  console.log('ready')

 console.log($('.navbar-toggle'))

  $('.flipping').on('click', function() {
    
    var $card = $(this).closest('.card-container')
    console.log($card)
    if($card.hasClass('hover')){
      $card.removeClass('hover')
    } else {
      $card.addClass('hover')
    }
  })


  var $checkbox = $('#test_id')
  var $isTutor_div = $('.is_tutor')

  $checkbox.on('change', function() {
    if(this.checked) {
      $isTutor_div.css('display', 'block')
    } else {
      $isTutor_div.css('display', 'none')
    }
  })

  $(document).on('click', '.nav-pills li', function() {
    $(".nav-pills li").removeClass("active");
    $(this).addClass("active");
});

})
