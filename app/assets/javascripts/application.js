// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$( document ).ready(function(){
	
	// $('select').searchable();

	// $("#empty-combo").sexyCombo({
	// 	emptyText: "Choose a state..."
	// });
    $( "#datepicker" ).datepicker({
      changeMonth: true,//this option for allowing user to select month
      minDate: 0,
      maxDate: 60,
      changeYear: true //this option for allowing user to select from year range
    });

	$(function() {
		var $table = $('table').tablesorter({
		    theme: 'blue',
		    widgets: ["zebra", "filter"],
		    widgetOptions : {
		      // filter_anyMatch replaced! Instead use the filter_external option
		      // Set to use a jQuery selector (or jQuery object) pointing to the
		      // external filter (column specific or any match)
		      filter_external : '.search',
		      // add a default type search to the first name column
		      filter_defaultFilter: { 1 : '~{query}' },
		      // include column filters
		      filter_columnFilters: true,
		      filter_placeholder: { search : 'Search...' },
		      filter_saveFilters : true,
		      filter_reset: '.reset'
		    }
		  });
	  });

});
