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
//= require jquery
//= require toastr
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
$(document).ready(function() {
  toastr.options = {
      "closeButton": false,
      "debug": false,
      "positionClass": "toast-top-right",
      "onclick": null,
      "showDuration": "300",
      "hideDuration": "1000",
      "timeOut": "5000",
      "extendedTimeOut": "1000",
      "showEasing": "swing",
      "hideEasing": "linear",
      "showMethod": "fadeIn",
      "hideMethod": "fadeOut"
  }
});
window.onload = function(){
  let leftNav = document.getElementById("left-menu");
  let rightNav = document.getElementById("right-menu");
  let navBarToggle = document.getElementById("js-navbar-toggle");
  navBarToggle.addEventListener("click", function () {
    if (leftNav) {
  leftNav.classList.toggle("active-nav");
    }
  rightNav.classList.toggle("active-nav");
  });
};

