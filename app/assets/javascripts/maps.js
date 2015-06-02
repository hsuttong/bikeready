
    function initialize() {
        var myLatlng = new google.maps.LatLng(37.773736, -122.504739);
        var mapOptions = {
          center: { lat: 37.77, lng: -122.419},
          zoom: 13, 
          styles: [{"featureType":"landscape","stylers":[{"saturation":-100},{"lightness":65},{"visibility":"on"}]},{"featureType":"poi","stylers":[{"saturation":-100},{"lightness":51},{"visibility":"simplified"}]},{"featureType":"road.highway","stylers":[{"saturation":-100},{"visibility":"simplified"}]},{"featureType":"road.arterial","stylers":[{"saturation":-100},{"lightness":30},{"visibility":"on"}]},{"featureType":"road.local","stylers":[{"saturation":-100},{"lightness":40},{"visibility":"on"}]},{"featureType":"transit","stylers":[{"saturation":-100},{"visibility":"simplified"}]},{"featureType":"administrative.province","stylers":[{"visibility":"off"}]},{"featureType":"water","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":-25},{"saturation":-100}]},{"featureType":"water","elementType":"geometry","stylers":[{"hue":"#ffff00"},{"lightness":-25},{"saturation":-97}]}],
        };
        var map = new google.maps.Map(document.getElementById('map-canvas'),
            mapOptions);

        var marker = new google.maps.Marker({
          position: myLatlng,
          map: map,
          icon: "http://www.wmata.com/img/icon-bike.gif",
        });

        getDirections(map);

      }

      function moveMarker(map, marker, latlng) {
        marker.setPosition(latlng);
        map.panTo(latlng);
      }

      function autoRefresh(map, pathCoords) {
        var i, route, marker;

        route = new google.maps.Polyline({
        path: [],
        geodesic : true,
        strokeColor: '#FF0000',
        strokeOpacity: 1.0,
        strokeWeight: 2,
        editable: false,
        map:map
        });

        marker = new google.maps.Marker({map:map, icon:"http://www.wmata.com/img/icon-bike.gif"});

        for (i = 0; i < pathCoords.length; i++) {
          setTimeout(function(coords) {
            route.getPath().push(coords);
            moveMarker(map, marker, coords);
            }, 500 * i, pathCoords[i]);
        }
      }



      function getDirections(map) {
        var directionsService = new google.maps.DirectionsService();

        var request = {

        origin: new google.maps.LatLng(37.773736, -122.504739),
        //destination: new google.maps.LatLng(37.773736, -122.403665),
        destination: new google.maps.LatLng($('#lat').html(), $('#lng').html() ),
        travelMode: google.maps.TravelMode.WALKING
        };
        directionsService.route(request, function(result, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            autoRefresh(map, result.routes[0].overview_path);
          }
        });
      }
      google.maps.event.addDomListener(window, 'load', initialize);


