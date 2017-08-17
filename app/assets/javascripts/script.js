$(document).on('turbolinks:load', function () {
  $('.dropdown-button').dropdown({
    hover: true,
    belowOrigin: true
  })

  $('.static.home').ready(function () {
    $('.parallax').parallax()
  })

  $('.events.new, .events.edit').ready(function () {
    $('.datepicker').pickadate({
      selectMonths: true, // Creates a dropdown to control month
      selectYears: 15, // Creates a dropdown of 15 years to control year,
      today: 'Today',
      clear: 'Clear',
      close: 'Ok',
      closeOnSelect: false // Close upon selecting a date,
    })
    $('.timepicker').pickatime({
      default: 'now', // Set default time: 'now', '1:30AM', '16:30'
      fromnow: 0,       // set default time to * milliseconds from now (using with default = 'now')
      twelvehour: false, // Use AM/PM or 24-hour format
      donetext: 'OK', // text for done-button
      cleartext: 'Clear', // text for clear-button
      canceltext: 'Cancel', // Text for cancel-button
      autoclose: false, // automatic close timepicker
      ampmclickable: true, // make AM PM clickable
      aftershow: function () {} // Function for after opening timepicker
    })
  })

  $('.events.show').ready(function () {

    var $eventBudget = parseFloat($('#eventBudget').text())

    var $itemName = $('.itemName')

    var $itemPrice = $('.itemPrice')

    var $budgetLeft = $('#budgetLeft')

    var totalPrice = 0

    var nameArr = []
    $itemName.each(function (index) {
      nameArr.push($(this).text())
    })
    var priceArr = []
    $itemPrice.each(function (index) {
      priceArr.push(parseFloat($(this).text()))
    })
    for (var i = 0; i < priceArr.length; i++) {
      totalPrice = totalPrice + priceArr[i]
    }
    var itemArr = []
    for (var j = 0; j < $itemName.length; j++) {
      itemArr.push([nameArr[j], priceArr[j]])
    }

    google.charts.load('current', {'packages': ['corechart']})

    // Set a callback to run when the Google Visualization API is loaded.
    google.charts.setOnLoadCallback(drawChart)

    // Callback that creates and populates a data table,
    // instantiates the pie chart, passes in the data and
    // draws it.
    function drawChart () {
      // Create the data table.
      var data = new google.visualization.DataTable()
      data.addColumn('string', 'Item')
      data.addColumn('number', 'Cost')
      data.addRows(itemArr)

      // Set chart options
      var options = {'title': 'Total Expenditure = $' + totalPrice.toFixed(2),
        'width': 500,
        'height': 300}

      var budgetLeft = ($eventBudget - totalPrice).toFixed(2)
      $budgetLeft.text(budgetLeft)

      // Instantiate and draw our chart, passing in some options.
      var chart = new google.visualization.PieChart(document.getElementById('chart_show'))
      chart.draw(data, options)
    }
  })
})
