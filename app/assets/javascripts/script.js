$(document).on('turbolinks:load', function() {
  $(".static.profile").ready(function () {
    // $(".dropdown-button").dropdown()
    $('#sidemenu').html('')
    $('#map').addClass('mapNarrowed')
    $('#sidemenu').addClass('visible')
    $('#sidemenu').append($('<p>').text('Joined Groups').addClass('title'))
    var $groups = $('<table>').css({
      width: '90%',
      margin: '0 auto'
    })
    $('#sidemenu').append($groups)
    $.get('/profile/groups').done(function(data) {
      console.log(data);
      for(var i = 0; i < data.groups.length; i++) {
        data.groups[i].restaurant = data.restaurants[i]
        data.groups[i].deal = data.deals[i]
      }
      data.groups.forEach (function (group) {
        var marker = new google.maps.Marker({
          position: {
            lat: parseFloat(group.restaurant.latitude),
            lng: parseFloat(group.restaurant.longitude)
          },
          map: map
        })
        var $groupsName = $('<tr>')
        $groupsName.append($('<td>').html('Group # ' + group.id + '<br>' + group.date + '<br>' +group.time).css('width', '40%'))
        var $viewMore = $('<td>').css('width', '60%')
        var $viewMoreDiv = $('<div>').css('width', '100%')
        $viewMore.append($viewMoreDiv)
        var $showLocationBtn = $('<a>').text('Show Location').css({
          width: '48%',
          margin: '0 1%'
        }).addClass('button is-primary')
        //
        $showLocationBtn.on('click', function () {
            map.panTo({
              lat: parseFloat(group.restaurant.latitude),
              lng: parseFloat(group.restaurant.longitude)
            })
            map.setZoom(18)
        })
        var $showGroupLink = $('<a>').attr('href', '/groups/' + group.id).addClass('button is-primary').text('View Group')
        $viewMoreDiv.append($showLocationBtn)
        $viewMoreDiv.append($showGroupLink)
        $groupsName.append($viewMore)
        $groups.append($groupsName)
        marker.addListener('mouseover', function () {
          $groupsName.css('background-color', 'yellow')
          marker.addListener('mouseout', function () {
            $groupsName.css('background-color', 'white')
          })
        })
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
          lat: parseFloat(data.restaurants[i].latitude),
          lng: parseFloat(data.restaurants[i].longitude)
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

  map.addListener('click', function(e) {
    console.log(e.latLng.lat(), e.latLng.lng())
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
      var $restName = $('<p>').addClass('title')
      $restName.text(marker.restaurantInfo.name)
      $('#sidemenu').append($restName)
      $('#sidemenu').append($('<p>').text('Deals').css({
        "font-size": '20px',
        width: '90%',
        margin: '0 auto 10px auto',
      }))
      var $deals = $('<table>').css({
        width: '90%',
        margin: '0 auto'
      })
      marker.restaurantInfo.deals.forEach(function(deal) {
        var $dealsName = $('<tr>')
        $dealsName.append($('<td>').text(deal.name).css('width', '50%'))
        var $viewMore = $('<td>')
        var $viewMoreLink = $('<a>').attr('href', '/deals/' + deal.id).text('View Deal').css({
          float: 'right'
        }).addClass('button is-primary')
        // $viewMoreLink.html($('<button>').text('View Deal')).css({
        //   float: 'right'
        // }).addClass('button is-primary')
        $viewMore.append($viewMoreLink)
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
      map.panTo({
        lat: marker.position.lat(),
        lng: marker.position.lng()
      })
      map.setZoom(15)
    })
  }
})
