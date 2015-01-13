# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ = jQuery

$ ->
  map = L.map('map').setView([52.23, 21.03], 5)

  L.tileLayer("http://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png", {
      attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
      maxZoom: 18
  }).addTo(map)
  for cave in $(".cave")
    $cave = $(cave)
    lat = $cave.data("latitude")
    lon = $cave.data("longitude")
    name = $cave.data("name")
    marker = L.marker([lat, lon]).addTo(map)
    marker.bindPopup("<b>#{name}</b><br>Lat: #{lat}, Lon: #{lon}")
