$(document).on("turbolinks:load", function() {
  // slider at home page
  $(".slider").slider();

  $(".dropdown-button").dropdown({
    hover: true
  });

  $('select').material_select();
  $('ul.tabs').tabs();

  // disabling bookmark button after clicking
  $(".bookmark").on("click", function() {
    $(".bookmark").addClass("disabled");
  });

  // flash messages
  $(".notice, .alert").delay(3000).fadeOut(2000);

  // results filtering
  $(".filter a").on("click", function() {
    var anchorId = $(this).attr("id");
    var searchString = window.location.search;
    var newSearch1 = searchString.replace(/space=[^&]+/, 'space=' + anchorId);
    var newSearch2 = newSearch1.replace(/space_page=[^&]+/, 'space_page=1');
    // console.log(newSearch2);
    window.location.href = window.location.origin + window.location.pathname + newSearch2;
    // console.log(anchorId);
    // $(".pages-show").css("display", "none");
    // $("." + anchorId).css("display", "block");
    // console.log(window.location);

    // $.ajax({
    //   url: window.location.href + "-" + anchorId[anchorId.length - 1],
    //   type: 'get',
    //   success: function(data) {
    //     console.log(data);
    //   },
    //   error: function(data) {
    //     console.log(data);
    //   }
    // });
  });


});
