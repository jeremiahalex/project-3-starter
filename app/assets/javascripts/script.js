
$(document).on("turbolinks:load", function() {
  console.log('ready')
  // function rotateCard(btn){
  //   var $card = $(btn).closest('.card-container')
  //   console.log($card)
  //   if($card.hasClass('hover')){
  //     $card.removeClass('hover')
  //   } else {
  //     $card.addClass('hover')
  //   }
  // }

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

//for datetime picker

var datepicker = $('#date').pickadate({
        container: '#outlet',
        onSet: function(item) {
            if ( 'select' in item ) setTimeout( timepicker.open, 0 )
        }
    }).pickadate('picker')

var timepicker = $('#time').pickatime({
        container: '#outlet',
        onRender: function() {
            $('<button>back to date</button>').
                on('click', function() {
                    timepicker.close()
                    datepicker.open()
                }).prependTo( this.$root.find('.picker__box') )
        },
        onSet: function(item) {
            if ( 'select' in item ) setTimeout( function() {
                $datetime.
                    off('focus').
                    val( datepicker.get() + ' @ ' + timepicker.get() ).
                    focus().
                    on('focus', datepicker.open)
            }, 0 )
        }
    }).pickatime('picker')

var $datetime = $('#datetime').
    on('focus', datepicker.open).
    on('click', function(event) { event.stopPropagation(); datepicker.open() })

})
