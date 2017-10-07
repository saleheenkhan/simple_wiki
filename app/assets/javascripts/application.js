// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require simplemde
//= require tether
//= require turbolinks
//= require bootstrap-sprockets
//= require selectize
//= require jquery.easy-autocomplete
//= require_tree .

$(document).ready(function() {
  showFlash();

  function showFlash() {
    withTimeout(function() {
      var element = $('.alert-fade')
      element.fadeIn("slow").trigger('appeared')
    });
  }

  $('.alert-fade').on('appeared', function(event) {
    withTimeout(function() {
      var element = $(event.target)
      element.fadeOut("slow");
    });
  });

  function withTimeout(func) {
    setTimeout(func, 2700);
  }

});
