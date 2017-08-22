$(document).on('turbolinks:load', function() {
  var markers = []
  $(".static.profile").ready(function () {
    // $(".dropdown-button").dropdown()
    $('#sidemenu').html('')
    $('#map').addClass('mapNarrowed')
    $('#sidemenu').addClass('visible')
    $('#sidemenu').append($('<p>').text('Joined Groups').css({
      "font-size": '30px',
      width: '90%',
      margin: '10px auto 10px auto'
    }))
    var $groups = $('<table>').css({
      width: '90%',
      margin: '0 auto 10px auto'
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
        var $showLocationBtn = $('<a>').text('Location').css({
          margin: '1% 0'
        }).addClass('waves-effect waves-light btn')
        //
        $showLocationBtn.on('click', function () {
            map.panTo({
              lat: parseFloat(group.restaurant.latitude),
              lng: parseFloat(group.restaurant.longitude)
            })
            map.setZoom(18)
        })
        var $showGroupLink = $('<a>').attr('href', '/groups/' + group.id).addClass('waves-effect waves-light btn').text('Details')
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

  function getRestaurants (query) {
    $.get('/restaurants', query).done(function (data) {
      markers.forEach(function(marker) {
        marker.setMap(null)
      })
      for (var i = 0; i < data.restaurants.length; i++) {
        data.restaurants[i].deals = data.deals[i]
        placeMarker({
          lat: parseFloat(data.restaurants[i].latitude),
          lng: parseFloat(data.restaurants[i].longitude)
        }, data.restaurants[i])
      }
    })
  }
  $(".restaurants.main").ready(function () {
    getRestaurants()
    $('#searchForm').on('submit', function (e) {
      e.preventDefault()
      var query = $(this).serializeArray()[1].value
      getRestaurants({search: query})
    })
  })
  var singapore = {
    lat: 1.352083,
    lng: 103.819836
  }
  if (document.getElementById('map')){
    var map = new google.maps.Map(document.getElementById('map'), {
      center: singapore,
      zoom: 11
    })

    map.addListener('click', function(e) {
      console.log(e.latLng.lat(), e.latLng.lng())
    })
  }


  function placeMarker(location, restaurantInfo) {
    var marker = new google.maps.Marker({
      position: location,
      map: map
    })
    markers.push(marker)
    marker.restaurantInfo = restaurantInfo
    console.log(marker.position.lat(), marker.position.lng())
    marker.addListener('click', function () {
      $('#map').addClass('mapNarrowed')
      $('#sidemenu').addClass('visible')
      $('#sidemenu').html('')
      var $restName = $('<p>').css({
        "font-size": '30px',
        width: '90%',
        margin: '0 auto 10px auto'
      })
      $restName.text(marker.restaurantInfo.name)
      $('#sidemenu').append($restName)
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
        }).addClass('waves-effect waves-light btn')
        // $viewMoreLink.html($('<button>').text('View Deal')).css({
        //   float: 'right'
        // }).addClass('waves-effect waves-light btn')
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
