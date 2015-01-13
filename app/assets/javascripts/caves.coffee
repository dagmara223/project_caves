# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ = jQuery

$ ->
  map = L.map('map').setView([52.23, 21.03], 5)

  L.tileLayer("http://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png", {
      attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>',
      maxZoom: 18
  }).addTo(map)

  markers = new L.MarkerClusterGroup()

  for cave in $(".cave")
    $cave = $(cave)

    lat = $cave.data("latitude")
    lat2 = parseFloat(lat.replace(",", "."))
    lon = $cave.data("longitude")
    lon2 = parseFloat(lon.replace(",", "."))
    name = $cave.data("name")
    marker = L.marker([lat2, lon2])
    marker.bindPopup("<b>#{name}</b><br>Lat: #{lat}, Lon: #{lon}")
    markers.addLayer( marker )
    map.addLayer(markers)
