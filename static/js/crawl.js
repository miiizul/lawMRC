$("#crawlBtn").click(function(){
	$.ajax({
		type:"POST",
		url:"/user/login",
		data: {
			keyword:  $("#keyword").val(),
			pageNum: $("#pageNum").val(),
		},
		success: function(response){

			jsonobj = response;
			if(jsonobj.resultCode=="10001")
			{
				//登录成功
	    		window.location.href = "/queryPage";
			}
			else
			{
				//登录失败
				console.log(jsonobj.resultDesc);
			}
		},
		error: function(jqXHR){
			console.log("您所请求的页面有异常");
		}
	});
});