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

  // Map
    var directionsDisplay,
        directionsService,
        map;
    function initialize() {
      var directionsService = new google.maps.DirectionsService();
      directionsDisplay = new google.maps.DirectionsRenderer();
      var chicago = new google.maps.LatLng(41.850033, -87.6500523);
      var mapOptions = { zoom:7, mapTypeId: google.maps.MapTypeId.ROADMAP, center: chicago }
      map = new google.maps.Map(document.getElementById("map"), mapOptions);
      directionsDisplay.setMap(map);
    }
    // $('#map').gmap().bind('init', function(ev, map) {});
    // $('#map').gmap({ 'center': new google.maps.LatLng(42.345573,-71.098326), 'callback': function() {
    //   $('#map_canvas_1').gmap('displayDirections', { 'origin': new google.maps.LatLng(42.345573,-71.098326), 'destination': new google.maps.LatLng(42.345573,-72.098326), 'travelMode': google.maps.DirectionsTravelMode.DRIVING }, { 'panel': document.getElementById('directions')}, function(success, result) {
    //     if ( success )
    //       alert('Results found!');
    //   });
    // }});

  // autocomplete for Train in train fare page
    if($(".train_inp").length>0){
      var trains;
      $.ajax({
        url: "/trains",
        dataType: "json",
        success: function(data) {
          trains = data;
            function custom_source(request, response) {
                var matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i");
                response($.grep(trains, function(value) {
                    return matcher.test(value.name)
                        || matcher.test(value.train_no);
                }));
            }
          $(".train_inp").autocomplete({
              source: custom_source,
            select: function (event, ui) {
              $('.train_number_inp').val(ui.item.train_no);
              $('.train_inp').val(ui.item.label);
              return false;
            },
            change: function( event, ui ) {
              $('.train_number_inp').val(ui.item.train_no);
              $( ".train_inp" ).val( ui.item? ui.item.label : 0 );
            } 
            });
        }
      });
    }


  
  // autocomplete for station in train fare page
    if($(".from_stations_inp, .to_stations_inp").length>0){
      var stations;
      $.ajax({
        url: "/stations",
        dataType: "json",
        success: function(data) {
          stations = data;
            function custom_source(request, response) {
                var matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i");
                response($.grep(stations, function(value) {
                    return matcher.test(value.name)
                        || matcher.test(value.code);
                }));
            }
          $(".from_stations_inp, .to_stations_inp").autocomplete({
              source: custom_source,
            select: function (event, ui) {
              if($(this).hasClass("from_stations_inp")){
                $('.from_station').val(ui.item.code);
                $('.from_stations_inp').val(ui.item.label);
                $( ".from_station_code" ).val( ui.item? ui.item.label : 0 );
              }else{
                $('.to_station').val(ui.item.code);
                $('.to_stations_inp').val(ui.item.label);
                $( ".to_station_code" ).val( ui.item? ui.item.label : 0 );
              }
              // $('.from_station_code').val(ui.item.value);
              return false;
            },
            change: function( event, ui ) {
              if($(this).hasClass("from_stations_inp")){
                $('.from_station').val(ui.item.code);
                $( ".from_station_code" ).val( ui.item? ui.item.label : 0 );
              }else{
                $('.to_station').val(ui.item.code);
                $( ".to_station_code" ).val( ui.item? ui.item.label : 0 );
              }
            } 
            });
        }
      });
    }

  // $("#empty-combo").sexyCombo({
  //  emptyText: "Choose a state..."
  // });
    $( "#datepicker" ).datepicker({
      changeMonth: true,//this option for allowing user to select month
      minDate: 0,
      maxDate: 60,
      changeYear: true //this option for allowing user to select from year range
    });

  $(function() {
    var $table = $('.tablesorter').tablesorter({
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
    var $table = $('.tablesorter2').tablesorter({
        theme: 'blue',
        widgets: ["zebra"],
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
