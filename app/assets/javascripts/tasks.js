$(document).ready(function(){

	// var status = "storage"
	// var statusArea = $(".bike-current-status").html("storage")
	
	// var getStatusLoop = setInterval(function(){
	// 		var status = getStatus();
	// 		if (status !== 'storage' || status !== 'delivered') {
	// 			debugger
	// 			console.log(status);	
	// 		}
			
	// 	}

	// , 3000);
// $(".bike-current-status").html() != "delivered"

		// while($(".bike-current-status").html() != "delivered"){
			
			


		// }
		var loop = setInterval(getStatus, 2000)



	$(".get_update").on("click",function(event){
		event.preventDefault();
		console.log(getStatus());
	});



});
	var getStatus = function(){
		// var status = "hello"
		
			if($(".bike-current-status").html() != "delivered"){
				var request = $.ajax({
					url: "/tasks/status_update",
					type: "get",
					dataType: 'json',
				});
			
			request.done(function(response){
				console.log(response.status);
				// var status = response.status
				// console.log(status);

				var status = response.status;
				if ($(".bike-current-status").html() != "with_user"){
					$(".bike-current-status").html(response.status)
				}
				

			});

			request.fail(function(response){
				console.log("we fucked up");
				// console.log(response.status);
			});
		
		}
		

	};
	// if( status === "delivered"){
	// 	clearInterval(getStatusLoop);
	// 	console.log("done")
	// }

	// $(".get_update").on("click", function(event){
	// 	event.preventDefault();

	// 	var request = $.ajax({
	// 		//url: "http://localhost:3000/tasks/status_update",
	// 		url: "/tasks/status_update",
	// 		type: "get",
	// 		dataType: 'json',
	// 	});

	// 	request.done(function(response){
	// 		console.log("ajaxing");
	// 		console.log(response.status);
	// 	});

	// 	request.fail(function(response){
	// 		console.log("we fucked up");
	// 		console.log(response);
	// 	});

	// });





// var getStatus = (function(){
// 		var status = "not complete"
// 		var request = $.ajax({
// 				//url: "http://localhost:3000/tasks/status_update",
// 				url: "/tasks/status_update",
// 				type: "get",
// 				dataType: 'json',
// 			});

// 			request.done(function(response){
// 				console.log(response.status);
// 				if(response.status === "delivered"){
// 					status = "delivered"
// 				}
// 			});

// 			request.fail(function(response){
// 				console.log("we fucked up");
// 				console.log(response);
// 			});

// 			return {
// 			    status: status,
// 			  }


// 	})();


