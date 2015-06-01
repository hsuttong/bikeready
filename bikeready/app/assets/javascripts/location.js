// var watchID = null;

$(document).ready(function(){
	if( navigator.geolocation ){
		console.log("hello")
		var optn = {
			enableHighAccuracy: true,
			timeout  		  : Infinity,
			maximumAge        :0,
		}
		var watchID = navigator.geolocation.watchPosition(success, fail, optn);

		$("button").on("click",function(){
		if(watchID)
			navigator.geolocation.clearWatch(watchID);

		watchID = null;
		console.log("hello")
		return false;

		});
	}else{
		$("p").html("HTML5 not supported")
	}
});


function addMarker(map, googleLatLng, title, content){
	var markerOptn = {
		position: googleLatLng,
		map     : map, 
		title   : title,
		animation : google.maps.Animation.DROP
	}

	var marker = new google.maps.Marker(markerOptn);

	var infoWindow = new google.maps.InfoWindow({content: content,
					position: googleLatLng});

	google.maps.event.addListener(marker, "click", function(){

		infoWindow.open(map)
	})
}
function fail(error){
	var errorType = {
		0: "Unknown<br>",
		1: "Permission denied by the user<br>",
		2: "Position of the user not available<br>",
		3: "Request timed out<br>",
	}

	var errMsg = errorType[error.code];

	if( error.code == 0 || error.code == 2){
		errMsg = errMsg+ " " + error.message;
	}

	$(".location").html(errMsg)
};

function success(position){
	var googleLatLng = new google.maps.LatLng(
							position.coords.latitude,
							position.coords.longitude
												)
	var mapOpt = {
		zoom  :10,
		center: googleLatLng,
		mapTypeId: google.maps.MapTypeId.HYBRID,
	}

	var Pmap = document.getElementById("map");

	var map = new google.maps.Map(Pmap, mapOpt);

	addMarker(map , googleLatLng, "Your location", "Hello<br>this is where you are located");
	$(".location").html("Latitude: "  +position.coords.latitude+ "<br>Longitude: " +position.coords.longitude+ "<br>Accuracy: " +position.coords.accuracy )
	// debugger
}