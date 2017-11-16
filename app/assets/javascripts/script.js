
$(document).on("turbolinks:load", function() {
  console.log('ready')

 console.log($('.navbar-toggle'))

 // $('.navbar-toggle').on('click', (event) => {
 //   event.stopPropagation()
 //   event.preventDefault()
 //   console.log('clicked')
 //   $('#navbar1').collapse('toggle')
 //  // console.log($('#navbar1'))
 // })

 /*
 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".nav-collapse" aria-expanded="true">
                 <span class="sr-only">Toggle navigation</span>
                 <span class="toggle-icon"></span>
             </button>

             <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".nav-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="toggle-icon"></span>
                        </button>
 */

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
