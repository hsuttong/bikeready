$(document).ready(function(){

  $("")


  var getStatusOfBike = function(){

  getStatusOnce();
  //timeout
  //loop
  }

  var getStatusOnce = function(){

    var request = $.ajax({
      url: "/tasks/status_update",
      method: "get",
      dataType: 'json',
    });



    request.done(function(response){
      // console.log(response);
    });

    request.fail(function(response){
      console.log(response)
      console.log("fail")
    });

  }
  
  getStatusOfBike();


})







