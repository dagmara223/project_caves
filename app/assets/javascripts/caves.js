var MAP = {
	map : {},
	markers : {},
	createMap : function() {
	//	map = L.map('map').setView([52.23, 21.03], 5);
		var baseLayer1 = L.tileLayer("http://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png", {
		    attribution: '&copy; <a href="http://openstreetmap.org">OpenStreetMap</a> | ProjectCaves',
		    maxZoom: 15
		});
		var baseLayer2 = L.tileLayer("http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
		    attribution: '&copy; <a href="http://openstreetmap.org">OpenStreetMap</a> | ProjectCaves',
		    maxZoom: 15
		});
		var baseLayer3 = L.tileLayer("http://server.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}", {
		    attribution: '&copy; Esri | ProjectCaves',
		    maxZoom: 15
		});
		var baseLayer4 = L.tileLayer("http://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}", {
		    attribution: '&copy; Esri | ProjectCaves',
		    maxZoom: 15
		});
		var geologicalMap = L.esri.dynamicMapLayer('http://giscbdg.pgi.gov.pl/arcgis/rest/services/mgp_500k/MapServer/', {
		    opacity: 0.6
		  });

		map = L.map('map', {
		    center: [52.23, 21.03],
		    zoom: 5,
		    layers: baseLayer1
		});			
		var baseMaps = {
		    "Gray": baseLayer1,
		    "OpenStreetMap": baseLayer2,
		    "Esri Topo": baseLayer3,
		    "Esri Imagery": baseLayer4
		}; 
		var overlayMaps = {
		    "Geological Map": geologicalMap
		};
		L.control.layers(baseMaps, overlayMaps).addTo(map);

		var searchControl = new L.esri.Controls.Geosearch().addTo(map);

  		var results = new L.LayerGroup().addTo(map);
  		var res_marker;

  		searchControl.on('results', function(data){
    		results.clearLayers();
    		for (var i = data.results.length - 1; i >= 0; i--) {
    		//	if (data.results[i].country == "POL") { //jak ogrniczyć wyniki wyszukiwania tylko do polski?
    			res_marker = L.marker(data.results[i].latlng);
      			results.addLayer(res_marker);
      			res_marker.bindPopup("<b>" + data.results[i].address + "</b>");
      			console.log(data.results[i].bounds);
      		//	}
    		}
  		});
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
		    lon = $cave.data("longitude");
		//    lat2 = parseFloat(lat.replace(",", "."));
		//    lon2 = parseFloat(lon.replace(",", "."));
		    name = $cave.data("name");
		    marker = L.marker([lat, lon]);
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