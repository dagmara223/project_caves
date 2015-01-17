var MAP = {
	map : {},
	markers : {},
	createMap : function() {
		map = L.map('map').setView([52.23, 21.03], 5);
		  L.tileLayer("http://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png", {
		    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>',
		    maxZoom: 15
		  }).addTo(map);
	},
	addMarkers : function() {
		var $cave, cave, lat, lat2, lon, lon2, marker, name, _i, _len, _ref, _results;

		  markers = new L.MarkerClusterGroup();
		  _ref = $(".cave");
		  _results = [];
		  for (_i = 0, _len = _ref.length; _i < _len; _i++) {
		    cave = _ref[_i];
		    $cave = $(cave);
		    lat = $cave.data("latitude");
		    lat2 = parseFloat(lat.replace(",", "."));
		    lon = $cave.data("longitude");
		    lon2 = parseFloat(lon.replace(",", "."));
		    name = $cave.data("name");
		    marker = L.marker([lat2, lon2]);
		    marker.bindPopup("<b>" + name + "</b><br>Lat: " + lat + ", Lon: " + lon);
		    markers.addLayer(marker);
		    _results.push(map.addLayer(markers));
		}
	},
	removeLayers : function() {
		map.removeLayer(markers);
	}

};
$(document).ready(function() {
	MAP.createMap();
	MAP.addMarkers();
});