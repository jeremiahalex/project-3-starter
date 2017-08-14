$(document).on('turbolinks:load', function() {
  $(".static.profile").ready(function () {
    $('#map').addClass('mapNarrowed')
    $('#sidemenu').addClass('visible')
    $('#sidemenu').append($('<p>').text('Joined Groups'))
    var $groups = $('<table>').css({
      width: '90%',
      margin: '0 auto'
    })
    $('#sidemenu').append($groups)
    $.get('/profile/groups').done(function(data) {
      data.forEach (function (group) {
        var $groupsName = $('<tr>')
        $groupsName.append($('<td>').text(`Group # ${group.id}`).css('width', '40%'))
        var $viewMore = $('<td>').css('width', '60%')
        var $viewMoreDiv = $('<div>').css('width', '100%')
        $viewMore.append($viewMoreDiv)
        var $showLocationBtn = $('<button>').text('Show Location').css({
          width: '48%',
          margin: '1%'
        })
        $viewMoreDiv.append($showLocationBtn)
        $viewMoreDiv.append($('<button>').text('View Group').css({
          width: '50%'
        }))
        $groupsName.append($viewMore)
        $groups.append($groupsName)
      })
    })
  })
  $(".restaurants.main").ready(function () {
    $.get('/restaurants').done(function (data) {
      data.restaurants.forEach(function (rest) {
        console.log(rest)
      })
      data.deals.forEach(function (deals) {
        console.log(deals)
      })
      for (var i = 0; i < data.restaurants.length; i++) {
        data.restaurants[i].deals = data.deals[i]
        placeMarker({
          lat: data.restaurants[i].latitude,
          lng: data.restaurants[i].longitude
        }, data.restaurants[i])
      }
    })
  })
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
    marker.addListener('click', function() {
      $('#map').addClass('mapNarrowed')
      $('#sidemenu').addClass('visible')
      $('#sidemenu').html('')
      var $restName = $('<p>')
      $restName.text(marker.restaurantInfo.name)
      $('#sidemenu').append($restName)
      $('#sidemenu').append($('<p>').text('Deals'))
      var $deals = $('<table>').css({
        width: '90%',
        margin: '0 auto'
      })
      marker.restaurantInfo.deals.forEach(function(deal) {
        var $dealsName = $('<tr>')
        $dealsName.append($('<td>').text(deal.name).css('width', '50%'))
        var $viewMore = $('<td>')
        $viewMore.append($('<button>').text('View Deal')).css({
          width: '50%',
          float: 'right'
        })
        $dealsName.append($viewMore)
        $deals.append($dealsName)
      })
      $('#sidemenu').append($deals)
      $('#sidemenu').append($('<button>').attr('id', 'collapseSide').css('display', 'none').text('>'))
      $('#sidemenu').hover(function() {
        $('#collapseSide').css('display', 'initial')
      }, function() {
        $('#collapseSide').css('display', 'none')
      })
      $('#collapseSide').on('click', function() {
        $('#sidemenu').removeClass('visible')
        $('#map').removeClass('mapNarrowed')
      })
    })
  }
  var long = 103.723456
  var lat = 1.322083
  var rests = [{
    name: 'KFC',
    deals: '1 for 1'
  }, {
    name: 'Starbucks',
    deals: '2 for 2'
  }, {
    name: 'Mcdonalds',
    deals: '50% off for 4'
  }, {
    name: 'Burger King',
    deals: '3 for 3'
  }]
  // for (var i = 0; i<4; i++) {
  //   placeMarker({
  //     lat: lat,
  //     lng: long
  //   }, rests[i])
  //   long += Math.random() * 0.05
  //   lat += Math.random() * 0.05
  // }

})
