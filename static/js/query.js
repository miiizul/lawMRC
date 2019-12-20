$("#mrcBtn").click(function(){
	event.preventDefault();
	$.ajax({
		type:"POST",
		url:"/user/mrc",
		data: {
			questions:  $("#questions").val(),
		},
		success: function(response){

			jsonobj = response;
			if(jsonobj.resultCode=="10001")
			{
				//登录成功
				alert("阅读理解成功");
				alert(jsonobj.data);
	    		window.location.href = "/chartsPage";
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