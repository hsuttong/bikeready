$(document).ready(function(){

  getStatusOfBike();


})



var getStatusOfBike = function(){

  getStatusOnce();

  //timeout
  //loop

}


var getStatusOnce = function(){

  var request = $.ajax({
    url: "/tasks/status_update",
    type: "get",
    dataType: 'json',
  });

  request.done(function(response){
    console.log(response);
  debugger
  });

  request.fail(function(response){
    console.log("fail")
  });

}
