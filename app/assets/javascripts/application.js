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
//= require twitter/bootstrap
//= require turbolinks
//= require ckeditor/init
//= require_tree ./plugins
//= require ./sb-admin-2
//= require ./fileinput/fileinput.min.js
//= require ./fileinput/themes/fa/fa.js

// makes dropdown and metisMenu work with turbolinks
$(document).on('page:change', function () {
	$('.dropdown-toggle').dropdown();
	$('#side-menu').metisMenu();
});