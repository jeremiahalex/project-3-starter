$(document).on('turbolinks:load', function() {
  var singapore = {
    lat: 1.352083,
    lng: 103.819836
  }
  // var markers = []

  var map = new google.maps.Map(document.getElementById('map'), {
    center: singapore,
    zoom: 11
  })


  function placeMarker(location, restaurantInfo) {
    var marker = new google.maps.Marker({
      position: location,
      map: map
    })
    marker.restaurantInfo = restaurantInfo
    console.log(marker.position.lat(), marker.position.lng())
    marker.addListener('click', function () {
      $('#map').addClass('mapNarrowed')
      $('#sidemenu').addClass('visible')
      $('#sidemenu').html('')
      var $restName = $('<p>')
      $restName.text(marker.restaurantInfo.name)
      $('#sidemenu').append($restName)
      $('#sidemenu').append($('<p>').text('Deals'))
      $('#sidemenu').append($('<p>').text(marker.restaurantInfo.deals))
      $('#sidemenu').append($('<p>').text('Groups'))
      var $groups = $('<ul>')
      var $groupsName = $('<li>')
      $groupsName.text('Dominic\'s Party')
      $groups.append($groupsName)
      var $viewMore = $('<button>')
      $viewMore.text('View Group').css('float', 'right')
      $groupsName.append($viewMore)
      $('#sidemenu').append($groups)
      $('#sidemenu').append($('<button>').attr('id', 'collapseSide').css('display', 'none').text('>'))
      $('#sidemenu').hover(function() {
        $('#collapseSide').css('display', 'initial')
      }, function () {
        $('#collapseSide').css('display', 'none')
      })
      $('#collapseSide').on('click', function () {
        $('#sidemenu').removeClass('visible')
        $('#map').removeClass('mapNarrowed')
      })
    })
  }
  var long = 103.723456
  var lat = 1.322083
  var rests = [{name:'KFC', deals: '1 for 1'},{name:'Starbucks', deals: '2 for 2'},{name:'Mcdonalds', deals: '50% off for 4'},{name:'Burger King', deals: '3 for 3'}]
  for (var i = 0; i<4; i++) {
    placeMarker({
      lat: lat,
      lng: long
    }, rests[i])
    long += Math.random() * 0.05
    lat += Math.random() * 0.05
  }

})
