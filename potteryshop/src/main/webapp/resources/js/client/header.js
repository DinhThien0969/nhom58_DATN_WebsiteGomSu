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
	
	// kiểm tra nếu người dùng click quá 3 lần
	var id = $("#userId").val();
	console.log(id);
	var date;

	var spamCountMax = 3;
	var arr = JSON.parse(localStorage.getItem(id));
	var clickCount;
	var boo;

	if (arr == null) {
		arr = [];
		console.log(arr);
		clickCount = 0;
		console.log(clickCount);
	} else {
		arr = JSON.parse(localStorage.getItem(id));
		clickCount = arr.length;
		console.log(arr);
		console.log(clickCount);
	}

	$(document).on('click', '#btnClickMe', function() {
		if (clickCount == 2) {
			Swal.fire(
				'Cảnh báo!',
				'Bạn đang spam , tài khoản sẽ bị khóa trong lần vi phạm tiếp theo!',
				'warning'
			)
		}
		if (clickCount < spamCountMax) {
			clickCount++;
			date = new Date().toDateString();
			var obj = { "date": date, "clickCount": clickCount };
			arr.push(obj);
			localStorage.setItem(id, JSON.stringify(arr));
		} else if (clickCount >= spamCountMax) {
			var item = JSON.parse(localStorage.getItem(id));
			localStorage.setItem(id, null);
			boo = false;
			if (item[0].date == item[1].date && item[2].date == item[1].date) {
				boo = true;
				console.log(boo);
			}
		};
		if (boo) {
			ajaxPUTLock();

			window.setTimeout(function() {
				window.location.reload();
			}, 1000);
		}
	})
	ajaxPUTUnLock();
	function ajaxPUTUnLock() {
		$.ajax({
			type: "PUT",
			url: "http://localhost:8080/potteryshop/api/tai-khoan/unblockAccountFor1Minute/" + id,
			success: function(result) {
				console.log(result);
			},
			error: function(result) {
				console.log(result);
			}
		});
	}

	function ajaxPUTLock() {
		$.ajax({
			type: "PUT",
			url: "http://localhost:8080/potteryshop/api/tai-khoan/setBlockToDate/" + id,
			success: function(result) {
				console.log(result);
			},
			error: function(result) {
				console.log(result)
			}
		});
	}
})
