$(document).ready(function(){
	ajaxGet2();
	function ajaxGet2(){
		$.ajax({
			type: "GET",		
			url: "http://localhost:8080/potteryshop/api/danh-muc/allForReal",
			success: function(result){
				$.each(result, function(i, danhmuc){
					var content = '<li><a style="text-decoration: none" href="/potteryshop/store?brand='+danhmuc.tenDanhMuc+'"><img alt="" src="Frontend/img/pottery.png" style="color: red"> <span style=" font-size: 16px; font-weight: 900; ">'+danhmuc.tenDanhMuc+'</span></a></li>';
					var content2 ='<li><a  style="padding-right: 100px" href="/potteryshop/store?brand='+danhmuc.tenDanhMuc+'">'+danhmuc.tenDanhMuc+'</a></li>'
					$('#danhmuc').append(content);		
					$('#danhmuc2').append(content2);	
				})					
			}	
		});
			
	}
})
