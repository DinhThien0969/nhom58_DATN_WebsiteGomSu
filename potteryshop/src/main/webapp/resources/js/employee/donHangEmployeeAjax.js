$(document).ready(function() {

	// load first when coming page
		 	console.log(parseInt(document.getElementById("intro").innerHTML));
	if(parseInt(document.getElementById("intro").innerHTML)==0){ajaxGet(1,"http://localhost:8080/potteryshop/api/employee/don-hang/listConfirmGuest" + '?page=1' );}
	
	 
	function ajaxGet(page,url){		
		var data = { trangThai : $('#trangThai').val(), tuNgay: $('#fromDate').val(), denNgay: $('#toDate').val(), idEmployee: $('#idEmployee').val()  } 
		$.ajax({
			type: "GET",		
			data: data,
			contentType : "application/json",
			url: url,
			success: function(result){
				$.each(result.content, function(i, donHang){
					// tính giá trị đơn hàng
					var sum = 0;
					if(donHang.trangThaiDonHang == "Hoàn thành" || donHang.trangThaiDonHang == "Chờ duyệt" ){
						$.each(donHang.danhSachChiTiet, function(i, chiTiet){
							sum += chiTiet.sanPham.donGia * chiTiet.soLuongNhanHang;
						});
					} else {
						$.each(donHang.danhSachChiTiet, function(i, chiTiet){
							sum += chiTiet.sanPham.donGia * chiTiet.soLuongDat;
						});
					}
					var donHangRow = '<tr>' +
					                  '<td>' + donHang.id+ '</td>' +
					                  '<td>' + donHang.hoTenNguoiNhan + '</td>' +
					                  '<td>' + donHang.trangThaiDonHang + '</td>' +
					                  '<td>' + sum + '</td>' +
					                  '<td>' + donHang.ngayDatHang + '</td>' +
					                  '<td>' + donHang.ngayGiaoHang + '</td>' +
					                  '<td>' + donHang.ngayNhanHang + '</td>' +
					                  '<td width="0%">'+'<input type="hidden" class="donHangId" value=' + donHang.id + '>'+ '</td>'+
					                  '<td><button class="btn btn-primary btnChiTiet" >Chi Tiết</button>';
					     if(donHang.trangThaiDonHang == "Đang giao"){
					    	 donHangRow += ' &nbsp;<button class="btn btn-warning btnCapNhat" >Khách nhận hàng chưa ??</button> </td>';
					     }
					     if(donHang.trangThaiDonHang == "Đang chờ xác nhận khách mua"){
					    	 donHangRow += ' &nbsp;<button class="btn btn-warning btnXacNhanKhachMua" >Xác nhận khách mua</button> </td>';
					     }
					$('.donHangTable tbody').append(donHangRow);					
					$('td').each( function(i){
						if ($(this).html() == 'null'){
							$(this).html('');
						}
					});
				});
								
				if(result.totalPages > 1 ){
					for(var numberPage = 1; numberPage <= result.totalPages; numberPage++) {
						var li = '<li class="page-item "><a class="pageNumber">'+numberPage+'</a></li>';
					    $('.pagination').append(li);
					};				
					
					// active page pagination
			    	$(".pageNumber").each(function(index){	
			    		if($(this).text() == page){
			    			$(this).parent().removeClass().addClass("page-item active");
			    		}
			    	});
				};
			},
			error : function(e){
				alert("Error: ",e);
				console.log("Error" , e );
			}
		});
	};
		
	$(document).on('click', '#btnDuyetDonHang', function (event) {
		event.preventDefault();
		resetData();
	});	
	
    
    // event khi click vào phân trang Đơn hàng
	$(document).on('click', '.pageNumber', function (event){
//		event.preventDefault();
		var page = $(this).text();	
    	$('.donHangTable tbody tr').remove();
    	$('.pagination li').remove();
    	ajaxGet(page,"http://localhost:8080/potteryshop/api/employee/don-hang/all" + '?page=' + page);	
	});
	
    // event khi click vào nhấn phím vào ô tìm kiếm đơn hàng theo id
	$(document).on('keyup', '#searchById', function (event){
		event.preventDefault();
		var donHangId = $('#searchById').val();
		console.log(donHangId);
		if(donHangId != ''){
    	  $('.donHangTable tbody tr').remove();
    	  $('.pagination li').remove();
		  var href = "http://localhost:8080/potteryshop/api/employee/don-hang/"+donHangId;
		  $.get(href, function(donHang) {
				// tính giá trị đơn hàng
			 var sum = 0;
				$.each(donHang.danhSachChiTiet, function(i, chiTiet){
					sum += chiTiet.sanPham.donGia * chiTiet.soLuong;
			 });
							  
			 var donHangRow = '<tr>' +
             '<td>' + donHang.id+ '</td>' +
             '<td>' + donHang.hoTenNguoiNhan + '</td>' +
             '<td>' + donHang.trangThaiDonHang + '</td>' +
             '<td>' + sum + '</td>' +
             '<td>' + donHang.ngayDatHang + '</td>' +
             '<td>' + donHang.ngayGiaoHang + '</td>' +
             '<td>' + donHang.ngayNhanHang + '</td>' +
             '<td width="0%">'+'<input type="hidden" id="donHangId" value=' + donHang.id + '>'+ '</td>'+
             '<td><button class="btn btn-primary btnChiTiet" >Chi Tiết</button>';
			
		     if(donHang.trangThaiDonHang == "Đang giao"){
		    	 donHangRow += ' &nbsp;<button class="btn btn-warning btnCapNhat" >Cập Nhật</button> </td>';
		     }
            
             $('.donHangTable tbody').append(donHangRow);
			 $('td').each( function(i){
				if ($(this).html() == 'null'){
					$(this).html('');
				}
			 });             
		  });
		} else {
			resetData();
		}
	});
	
    // event khi click vào button Chi tiết đơn
	$(document).on('click', '.btnChiTiet', function (event){
		//event.preventDefault();
		
		var donHangId = $(this).parent().prev().children().val();	
//		console.log(donHangId);
		var href = "http://localhost:8080/potteryshop/api/employee/don-hang/"+donHangId;
		$.get(href, function(donHang) {
			$('#maDonHang').text("Mã đơn hàng: "+ donHang.id);
			$('#hoTenNguoiNhan').text("Người nhận: "+ donHang.hoTenNguoiNhan);
			$('#sdtNhanHang').text("SĐT: "+ donHang.sdtNhanHang);
			$('#diaChiNhan').text("Địa chỉ: "+ donHang.diaChiNhan);
			$('#trangThaiDonHang').text("Trạng thái đơn: "+ donHang.trangThaiDonHang);
			$("#ngayDatHang").text("Ngày đặt: "+ donHang.ngayDatHang);
			
			if(donHang.ngayGiaoHang != null){
				$("#ngayShipHang").text("Ngày giao: "+ donHang.ngayGiaoHang);
			}
			
			if(donHang.ngayNhanHang != null){
				$("#ngayNhanHang").text("Ngày nhận: "+ donHang.ngayNhanHang);
			}
			
			if(donHang.ghiChu != null){
				$("#ghiChu").text("Ghi chú: "+ donHang.ghiChu);
			}
			
			if(donHang.nguoiDat != null){
				$("#nguoiDat").text("Người đặt: "+ donHang.nguoiDat.hoTen);
			}
			
			if(donHang.employee != null){
				$("#employee").text("Employee: "+ donHang.employee.hoTen);
			}
			
			var check = donHang.trangThaiDonHang == "Hoàn thành" || donHang.trangThaiDonHang == "Chờ duyệt" ;
			if(check){
				$('.chiTietTable').find('thead tr').append('<th id="soLuongNhanTag" class="border-0 text-uppercase small font-weight-bold"> SỐ LƯỢNG NHẬN </th>');
			}
			// thêm bảng:
			var sum = 0;
			var stt = 1;
			
			
			$.each(donHang.danhSachChiTiet, function(i, chiTiet){
				console.log(chiTiet.soLuongDat);
				var chiTietRow = '<tr>' +
				'<td>' + stt + '</td>' +
                '<td>' + chiTiet.sanPham.tenSanPham + '</td>' +
                '<td>' + chiTiet.sanPham.donGia + '</td>'+
                '<td>' + chiTiet.soLuongDat+ '</td>';
				
                if(check){
				    chiTietRow += '<td>' + chiTiet.soLuongNhanHang + '</td>';
				    sum += chiTiet.sanPham.donGia * chiTiet.soLuongNhanHang;
			    } else {
                    sum += chiTiet.sanPham.donGia * chiTiet.soLuongDat;
			    }
				
				 $('.chiTietTable tbody').append(chiTietRow);
                stt++;
	    	  });		
			$("#tongTienCapNhat").text("Tổng : "+ sum);
		});
		$("#chiTietModal").modal();
	});
		
	// event khi ẩn modal chi tiết
	$('#chiTietModal, #capNhatTrangThaiModal').on('hidden.bs.modal', function(e) {
		e.preventDefault();
		$("#chiTietForm p").text(""); // reset text thẻ p
		$("#capNhatTrangThaiForm h4").text(""); // reset text thẻ p
		
		$('.chiTietTable tbody tr').remove();
    	$('.chiTietTable #soLuongNhanTag').remove();	
		$('.chiTietCapNhatTable tbody tr').remove();
	});
	
   $('#chiTietModal,#xacNhanKhachMuaModal').on('hidden.bs.modal', function(e) {
		e.preventDefault();
		$("#chiTietForm p").text(""); // reset text thẻ p		
		$("#xacNhanKhachMuaForm h4").text(""); // reset text thẻ p
		$('.chiTietTable tbody tr').remove();
    	$('.chiTietTable #soLuongNhanTag').remove();	
		$('.chiTietCapNhatTable tbody tr').remove();
	});
	
	//
	$(document).on('change', '.soLuongNhan', function (event) {
		  var table = $(".chiTietCapNhatTable tbody");
		  sum  = 0;
     	  table.find('tr').each(function (i) {
		      donGia = $(this).find("td:eq(2)").text();
              soLuongCapNhat = $(this).find("td:eq(4) input[type='number']").val();
		      sum += donGia * soLuongCapNhat;
		    });
          $("#tongTienCapNhat").text("Tổng : "+ sum);

	});	
	
    $(document).on('click', '#btnXacNhan', function (event) {
    	event.preventDefault();
    	ajaxPostCapNhatTrangThaiDon();
		resetData();
    });
     // event khi click vào button cập nhật đơn
	$(document).on('click', '.btnCapNhat', function (event){
		event.preventDefault();
		var donHangId = $(this).parent().prev().children().val();	
		$("#donHangId").val(donHangId);
		var href = "http://localhost:8080/potteryshop/api/employee/don-hang/"+donHangId;
		$.get(href, function(donHang) {
			// thêm bảng:
			var stt = 1;
			$.each(donHang.danhSachChiTiet, function(i, chiTiet){
				var chiTietRow = '<tr>' +
				'<td>' + stt + '</td>' +
                '<td>' + chiTiet.sanPham.tenSanPham + '</td>' +
                '<td>' + chiTiet.sanPham.donGia + '</td>'+
                '<td>' + chiTiet.soLuongDat + '</td>'+
                '<td><input type="number" class="soLuongNhan" style="width: 40px; text-align: center;" value ="'+chiTiet.soLuongDat+'" min="0" max="'+chiTiet.soLuongDat+'" ></td>'+
                '<td><input type="hidden" value="'+chiTiet.id+'" ></td>'
				 $('.chiTietCapNhatTable tbody').append(chiTietRow);
                stt++;
	    	  });		
			var sum = 0;
			$.each(donHang.danhSachChiTiet, function(i, chiTiet){
				sum += chiTiet.sanPham.donGia * chiTiet.soLuongDat;
			});
			$("#tongTienCapNhat").text("Tổng : "+ sum);
		});
		$("#capNhatTrangThaiModal").modal();
	});
	// post request cập nhật trạng thái đơn employee
	function ajaxPostCapNhatTrangThaiDon() { 
   	  
   	     var listChiTietCapNhat = [] ;
		 var table = $(".chiTietCapNhatTable tbody");
     	 table.find('tr').each(function (i) {
		      var chiTietCapNhat = { idChiTiet : $(this).find("td:eq(5) input[type='hidden']").val(),
		    		                  soLuongNhanHang: $(this).find("td:eq(4) input[type='number']").val() };
		      listChiTietCapNhat.push(chiTietCapNhat);
		 });

    	 
    	 var data = { idDonHang : $("#donHangId").val(),
    			      ghiChuEmployee: $("#ghiChuEmployee").val(), 
    			      danhSachCapNhatChiTietDon: listChiTietCapNhat } ;
//    	 console.log(data);
    	 $.ajax({
     		async:false,
 			type : "POST",
 			contentType : "application/json",
 			url : "http://localhost:8080/potteryshop/api/employee/don-hang/update",
 			enctype: 'multipart/form-data',
 	        
			data : JSON.stringify(data),
            // dataType : 'json',
			success : function(response) {
				$("#capNhatTrangThaiModal").modal('hide');
				alert("Cập nhật giao đơn hàng thành công");
			},
			error : function(e) {
				alert("Error!")
				console.log("ERROR: ", e);
			}
		}); 
    }	
	
	
	
	
	
	
	
	
	
	
	
	
	 $(document).on('click', '#btnXacNhanKhachMua', function (event) {
    	event.preventDefault();
    	ajaxPostXacNhanKhach();
		resetData();
    });
     // event khi click vào xác nhận khách
	$(document).on('click', '.btnXacNhanKhachMua', function (event){
		event.preventDefault();
		var donHangId = $(this).parent().prev().children().val();	
		$("#donHangId").val(donHangId);
		var href = "http://localhost:8080/potteryshop/api/employee/don-hang/"+donHangId;
		$.get(href, function(donHang) {
			// thêm bảng:
			var stt = 1;
			$.each(donHang.danhSachChiTiet, function(i, chiTiet){
				var chiTietRow = '<tr>' +
				'<td>' + stt + '</td>' +
                '<td>' + chiTiet.sanPham.tenSanPham + '</td>' +
                '<td>' + chiTiet.sanPham.donGia + '</td>'+
                '<td>' + chiTiet.soLuongDat + '</td>'+
                '<td><input type="number" class="soLuongNhan" style="width: 40px; text-align: center;" value ="'+chiTiet.soLuongDat+'" min="0" max="'+chiTiet.soLuongDat+'" ></td>'+
                '<td><input type="hidden" value="'+chiTiet.id+'" ></td>'
				 $('.chiTietCapNhatTable tbody').append(chiTietRow);
                stt++;
	    	  });		
			var sum = 0;
			$.each(donHang.danhSachChiTiet, function(i, chiTiet){
				sum += chiTiet.sanPham.donGia * chiTiet.soLuongDat;
			});
			$("#tongTienCapNhat").text("Tổng : "+ sum);
		});
		$("#xacNhanKhachMuaModal").modal();
	});
	// post request cập nhật trạng thái đơn employee
	function ajaxPostXacNhanKhach() { 
   	  
   	     var listChiTietCapNhat = [] ;
		 var table = $(".chiTietCapNhatTable tbody");
     	 table.find('tr').each(function (i) {
		      var chiTietCapNhat = { idChiTiet : $(this).find("td:eq(5) input[type='hidden']").val(),
		    		                  soLuongNhanHang: $(this).find("td:eq(4) input[type='number']").val() };
		      listChiTietCapNhat.push(chiTietCapNhat);
		 });

    	 
    	 var data = { idDonHang : $("#donHangId").val(),
    			      ghiChuEmployee: $("#ghiChuEmployee").val(), 
    			      danhSachCapNhatChiTietDon: listChiTietCapNhat } ;
//    	 console.log(data);
    	 $.ajax({
     		async:false,
 			type : "POST",
 			contentType : "application/json",
 			url : "http://localhost:8080/potteryshop/api/employee/don-hang/confirmGuest",
 			enctype: 'multipart/form-data',
 	        
			data : JSON.stringify(data),
            // dataType : 'json',
			success : function(response) {
				$("#xacNhanKhachMuaModal").modal('hide');
				alert("Xác nhận khách mua thành công");
			},
			error : function(e) {
				alert("Error!")
				console.log("ERROR: ", e);
			}
		}); 
    }	
	
	
	
	
	
	
	
	
	
    // reset table after post, put, filter
    function resetData(){   	
    	var page = $('li.active').children().text();
    	$('.donHangTable tbody tr').remove();
    	$('.pagination li').remove();
  
        if((document.getElementById("trangThai").options[document.getElementById("trangThai").selectedIndex].text=="Đang chờ xác nhận khách mua")  && (parseInt(document.getElementById("intro").innerHTML)==0))
        {ajaxGet(1,"http://localhost:8080/potteryshop/api/employee/don-hang/listConfirmGuest" + '?page=1' );}else{ajaxGet(page,"http://localhost:8080/potteryshop/api/employee/don-hang/all" + '?page=' + page);
        }    };
});