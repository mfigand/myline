// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

window.onload = function() {
  getAllStories();
  localStorage.removeItem("tagSelected");
  localStorage.setItem("next", 0);
};

function getAllStories() {
  var url = window.location.pathname;
  var user_id = url.substring(url.lastIndexOf('/') + 1);

  return $.ajax({
    type: "GET",
    url: '/users/' + user_id + '/json_stories',
    contentType: 'application/x-www-form-urlencoded',
    headers: {"X-HTTP-Method-Override": "GET"},
    cacheControl: true,
    success: function (response, textStatus, errorThrown) {
      localStorage.setItem('allStories', JSON.stringify(response));
    },
    error: function (response, textStatus, errorThrown) {
        console.log('Ocurrió el siguiente error:' + errorThrown);
    }
  });
  }