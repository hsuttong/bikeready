$(document).ready(function(){

	setInterval(getStatus, 5000);

	$(".get_update").on("click",function(event){
		event.preventDefault();
		console.log(getStatus());
	});

	if($(".bike-current-status").html() === "delivered"){
		$(".bike-current-status").html("storage")
	}

});

var getStatus = function(){
	if($(".bike-current-status").html() != "delivered" && $(".bike-current-status").html() !== "storage" ){
		var request = $.ajax({
			url: "/tasks/status_update",
			type: "get",
			dataType: 'json',
		});

		request.done(function(response){
			// console.log(response.status);
			
			var status = response.status;
			if ($(".bike-current-status").html() != "storage"){
				$(".bike-current-status").html(response.status)
			}
		});

		request.fail(function(response){
			console.log("Fail, ARRRRspec!");
		});
	}
};