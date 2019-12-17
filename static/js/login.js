$("#loginBtn").click(function(){
	event.preventDefault();
	$.ajax({
		type:"POST",
		url:"/user/login",
		data: {
			username:  $("#username").val(),
			password: $("#passowrd").val(),
		},
		success: function(response){
			jsonobj = response;
			if(jsonobj.resultCode=="10001")
			{
				//登录成功
				alert("登录成功")
	    		window.location.href = "/crawlPage";
			}
			else
			{
				//登录失败
				alert(jsonobj.resultDesc)
				console.log(jsonobj.resultDesc);
			}
		},
		error: function(jqXHR){
			console.log("您所请求的页面有异常");
		}
	});
});	