// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .

//= require jquery
//= require jquery_ujs
//= require materialize

$(document).on('turbolinks:load', function() {
  // $('.parallax').parallax();
  $('ul.tabs').tabs();
  $('select').material_select();
  $(".button-collapse").sideNav();
  $(".dropdown-button").dropdown();
  $('.slider').slider();

  $('.activate-side').sideNav({
    menuWidth: 300, // Default is 300
    edge: 'right', // Choose the horizontal origin
    closeOnClick: true, // Closes side-nav on <a> clicks, useful for Angular/Meteor
    draggable: true, // Choose whether you can drag to open on touch screens,
  });

  $('.datepicker').pickadate({
    min: true,
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15, // Creates a dropdown of 15 years to control year,
    today: 'Today',
    clear: 'Clear',
    close: 'Ok',
    closeOnSelect: true, // Close upon selecting a date,
    onSet: function(date) {
      selected_date = new Date(date.select);
      console.log(selected_date);
      // $('.time_dropdown').prop( "disabled", false );

    }
  });

  $('.time_selector').dropdown({
    // Forces drop-up menu, remove if not required
    belowOrigin: true
  }
);

$('.time_selector').change(function() {
  parsedData = {time : $('#booking_time').val(), date : selected_date}

  $.ajax({
    url: '/bookings/filter',
    type: 'post',
    data: parsedData,
    success: function(data) { // data is @matched_booking (time = selected time, date = selected date)
      console.log(data);
      $('.service_checkbox').prop( "disabled", false );

      var date_time_matched = JSON.parse(data); // date_time_matched is array of objects where (date = selected date && time = selected time)
      $(date_time_matched).each(function(index) {
        var checkbox_id = "checkbox" + (this.service_id).toString();
        $('#' + checkbox_id).prop( "disabled", true );
      });
    },
    error: function(data) {
      console.log(data);
    }
  });
});


// ########## OTHER FUNCTIONS ########## //
//
// var handler = StripeCheckout.configure({
//   key: 'pk_test_tohAIYduSlgS1QsGa1ANeIPA',
//   image: 'https://stripe.com/img/documentation/checkout/marketplace.png',
//   locale: 'auto',
//   token: function(token) {
//     // You can access the token ID with `token.id`.
//     // Get the token ID to your server-side code for use.
//   }
// });
//
// window.addEventListener('popstate', function() {
//   handler.close();
// });
//


}); // end document on load
