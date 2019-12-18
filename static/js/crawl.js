$("#crawlBtn").click(function(){
	event.preventDefault();
	$.ajax({
		type:"POST",
		url:"/user/crawl",
		data: {
			keyword:  $("#keyword").val(),
			pageNum: $("#pageNum").val(),
		},
		success: function(response){

			jsonobj = response;
			if(jsonobj.resultCode=="10001")
			{
				//登录成功
				alert("爬取成功");
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