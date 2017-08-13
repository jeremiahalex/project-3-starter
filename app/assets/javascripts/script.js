$(document).on('turbolinks:load', function () {
  $('.dropdown-button').dropdown()

  $('.static.home').ready(function () {
    $('.parallax').parallax()
  })
})
