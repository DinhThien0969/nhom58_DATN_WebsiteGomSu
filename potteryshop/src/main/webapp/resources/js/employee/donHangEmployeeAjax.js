$(document).ready(function() {
	var idDonhang;
	// load first when coming page
	console.log(parseInt(document.getElementById("intro").innerHTML));
	if (parseInt(document.getElementById("intro").innerHTML) == 0) { ajaxGet(1, "http://localhost:8080/potteryshop/api/employee/don-hang/listConfirmGuest" + '?page=1'); }


	function ajaxGet(page, url) {
		var data = { trangThai: $('#trangThai').val(), tuNgay: $('#fromDate').val(), denNgay: $('#toDate').val(), idEmployee: $('#idEmployee').val() }
		$.ajax({
			type: "GET",
			data: data,
			contentType: "application/json",
			url: url,
			success: function(result) {
				$.each(result.content, function(i, donHang) {
					// tính giá trị đơn hàng
					var sum = 0;
					if (donHang.trangThaiDonHang == "Hoàn thành" || donHang.trangThaiDonHang == "Chờ duyệt") {
						$.each(donHang.danhSachChiTiet, function(i, chiTiet) {
							sum += chiTiet.sanPham.donGia * chiTiet.soLuongNhanHang;
						});
					} else {
						$.each(donHang.danhSachChiTiet, function(i, chiTiet) {
							sum += chiTiet.sanPham.donGia * chiTiet.soLuongDat;
						});
					}
					var donHangRow = '<tr>' +
						'<td>' + donHang.id + '</td>' +
						'<td>' + donHang.hoTenNguoiNhan + '</td>' +
						'<td>' + donHang.trangThaiDonHang + '</td>' +
						'<td>' + sum + '</td>' +
						'<td>' + donHang.ngayDatHang + '</td>' +
						'<td>' + donHang.ngayGiaoHang + '</td>' +
						'<td>' + donHang.ngayNhanHang + '</td>' +
						'<td width="0%">' + '<input type="hidden" class="idNguoiDat" value=' + donHang.nguoiDat.id + '>' + '</td>' +
						'<td width="0%">' + '<input type="hidden" class="donHangId" value=' + donHang.id + '>' + '</td>' +
						'<td><button class="btn btn-primary btnChiTiet" >Chi Tiết</button>';
						if (donHang.trangThaiDonHang == "Đang chờ xác nhận khách mua") {
                                  $('#date1').html("Ngày đặt");
					              $( "#date2" ).html("");
					              $( "#date3" ).html("");

					}else if((donHang.trangThaiDonHang == "Đang giao")){
					              $('#date1').html("Ngày đặt");
					              $( "#date2" ).html("Ngày được phân công");
					              $( "#date3" ).html("Ngày xác nhận đơn hàng");
					}else{
					              $('#date1').html("Ngày đặt");
					              $( "#date2" ).html("Ngày được phân công");
					              $( "#date3" ).html("Ngày giao hàng");
					}
						
					if (donHang.trangThaiDonHang == "Đang giao") {
						donHangRow += ' &nbsp;<button class="btn btn-warning btnCapNhat" >Xác nhận khách nhận hàng</button> </td>';
					}
					if (donHang.trangThaiDonHang == "Đang chờ xác nhận khách mua") {
						donHangRow += ' &nbsp;<button class="btn btn-warning btnXacNhanKhachMua" >Xác nhận khách mua</button> </td>';
					}
					$('.donHangTable tbody').append(donHangRow);
					$('td').each(function(i) {
						if ($(this).html() == 'null') {
							$(this).html('');
						}
					});
				});

				if (result.totalPages > 1) {
					for (var numberPage = 1; numberPage <= result.totalPages; numberPage++) {
						var li = '<li class="page-item "><a class="pageNumber">' + numberPage + '</a></li>';
						$('.pagination').append(li);
					};

					// active page pagination
					$(".pageNumber").each(function(index) {
						if ($(this).text() == page) {
							$(this).parent().removeClass().addClass("page-item active");
						}
					});
				};
			},
			error: function(e) {
				alert("Error: ", e);
				console.log("Error", e);
			}
		});
	};
	$(document).on('click', '#btnDuyetDonHang', function(event) {
		event.preventDefault();
		resetData();
	});
	// event khi click vào phân trang Đơn hàng
	$(document).on('click', '.pageNumber', function(event) {
		//		event.preventDefault();
		var page = $(this).text();
		$('.donHangTable tbody tr').remove();
		$('.pagination li').remove();
		if (document.getElementById("trangThai").options[document.getElementById("trangThai").selectedIndex].text == "Đang chờ xác nhận khách mua") { ajaxGet(page, "http://localhost:8080/potteryshop/api/employee/don-hang/listConfirmGuest" + '?page=' + page); }
		else { ajaxGet(page, "http://localhost:8080/potteryshop/api/employee/don-hang/all" + '?page=' + page); }
		;

	});

	// event khi click vào nhấn phím vào ô tìm kiếm đơn hàng theo id
	$(document).on('keyup', '#searchById', function(event) {
		event.preventDefault();
		var donHangId = $('#searchById').val();
		console.log(donHangId);
		if (donHangId != '') {
			$('.donHangTable tbody tr').remove();
			$('.pagination li').remove();
			var href = "http://localhost:8080/potteryshop/api/employee/don-hang/" + donHangId;
			$.get(href, function(donHang) {
				// tính giá trị đơn hàng
				var sum = 0;
				$.each(donHang.danhSachChiTiet, function(i, chiTiet) {
					sum += chiTiet.sanPham.donGia * chiTiet.soLuong;
				});

				var donHangRow = '<tr>' +
					'<td>' + donHang.id + '</td>' +
					'<td>' + donHang.hoTenNguoiNhan + '</td>' +
					'<td>' + donHang.trangThaiDonHang + '</td>' +
					'<td>' + sum + '</td>' +
					'<td>' + donHang.ngayDatHang + '</td>' +
					'<td>' + donHang.ngayGiaoHang + '</td>' +
					'<td>' + donHang.ngayNhanHang + '</td>' +
					'<td width="0%">' + '<input type="hidden" id="donHangId" value=' + donHang.id + '>' + '</td>' +
					'<td><button class="btn btn-primary btnChiTiet" >Chi Tiết</button>';

				if (donHang.trangThaiDonHang == "Đang giao") {
					donHangRow += ' &nbsp;<button class="btn btn-warning btnCapNhat" >Cập Nhật</button> </td>';
				}

				$('.donHangTable tbody').append(donHangRow);
				$('td').each(function(i) {
					if ($(this).html() == 'null') {
						$(this).html('');
					}
				});
			});
		} else {
			resetData();
		}
	});

	// event khi click vào button Chi tiết đơn
	$(document).on('click', '.btnChiTiet', function(event) {
		event.preventDefault();

		var donHangId = $(this).parent().prev().children().val();
		//		console.log(donHangId);
		var href = "http://localhost:8080/potteryshop/api/employee/don-hang/" + donHangId;
		$.get(href, function(donHang) {
			$('#maDonHang').text("Mã đơn hàng: " + donHang.id);
			$('#hoTenNguoiNhan').text("Người nhận: " + donHang.hoTenNguoiNhan);
			$('#sdtNhanHang').text("SĐT: " + donHang.sdtNhanHang);
			$('#diaChiNhan').text("Địa chỉ: " + donHang.diaChiNhan);
			$('#trangThaiDonHang').text("Trạng thái đơn: " + donHang.trangThaiDonHang);
			$("#ngayDatHang").text("Ngày đặt: " + donHang.ngayDatHang);

			$('#maDonHangHoaDon').text("Mã đơn hàng: " + donHang.id);
			$('#hoTenNguoiNhanHoaDon').text("Người nhận: " + donHang.hoTenNguoiNhan);

			$('#sdtNhanHangHoaDon').text("SĐT: " + donHang.sdtNhanHang);
			$('#diaChiNhanHoaDon').text("Địa chỉ: " + donHang.diaChiNhan);

			if (donHang.ngayGiaoHang != null) {
				$("#ngayShipHang").text("Ngày giao: " + donHang.ngayGiaoHang);
			}

			if (donHang.ngayNhanHang != null) {
				$("#ngayNhanHang").text("Ngày nhận: " + donHang.ngayNhanHang);
			}

			if (donHang.ghiChu != null) {
				$("#ghiChu").text("Ghi chú: " + donHang.ghiChu);
			}

			if (donHang.nguoiDat != null) {
				$("#nguoiDat").text("Người đặt: " + donHang.nguoiDat.hoTen);
			}

			if (donHang.employee != null) {
				$("#employee").text("Employee Xác Nhận: " + donHang.employee.hoTen);
			}

			var check = donHang.trangThaiDonHang == "Hoàn thành";
			if (check) {
				$('.chiTietTable').find('thead tr').append('<th id="soLuongNhanTag" class="border-0 text-uppercase small font-weight-bold"> SỐ LƯỢNG NHẬN </th>');
			}
			// thêm bảng:
			var sum = 0;
			var stt = 1;
			$.each(donHang.danhSachChiTiet, function(i, chiTiet) {
				console.log(chiTiet.soLuongDat);
				var chiTietRow = '<tr>' +
					'<td>' + stt + '</td>' +
					'<td>' + chiTiet.sanPham.tenSanPham + '</td>' +
					'<td>' + formatDollar(chiTiet.donGia) + '</td>' +
					'<td>' + chiTiet.soLuongDat + '</td>' +
					'<td>' + formatDollar(chiTiet.donGia * chiTiet.soLuongDat) + '</td>';

				if (check) {
					chiTietRow += '<td>' + chiTiet.soLuongNhanHang + '</td>';
					sum += chiTiet.donGia * chiTiet.soLuongNhanHang;
				} else {
					sum += chiTiet.donGia * chiTiet.soLuongDat;
				}

				$('.chiTietTable tbody').append(chiTietRow);
				stt++;
			});
			$("#tongTienCapNhat").text("Tổng : " + formatDollar(sum));
			$("#tongTienHoaDon").text("Tổng : " + formatDollar(sum));
		});
		$("#chiTietModal").modal();
	});
	function formatDollar(num) {
		var p = num.toFixed(2).split(".");
		return p[0].split("").reverse().reduce(function(acc, num, i, orig) {
			return num + (num != "-" && i && !(i % 3) ? "," : "") + acc;
		}, "") + "." + p[1];
	}
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
		$("#chiTietFormxacNhanKhach p").text(""); // reset text thẻ p
		$("#xacNhanKhachMuaForm h4").text(""); // reset text thẻ p
		$('.chiTietTablexacNhanKhach tbody tr').remove();
		$('.chiTietTablexacNhanKhach #soLuongNhanTag').remove();
		$('.chiTietCapNhatTablexacNhanKhach tbody tr').remove();
	});

	//
	$(document).on('change', '.soLuongNhan', function(event) {
		var table = $(".chiTietCapNhatTable tbody");
		sum = 0;
		table.find('tr').each(function(i) {
			donGia = $(this).find("td:eq(2)").text();
			soLuongCapNhat = $(this).find("td:eq(4) input[type='number']").val();
			sum += donGia * soLuongCapNhat;
		});
		$("#tongTienCapNhat").text("Tổng : " + sum);

	});
	$(document).on('change', '.soLuongNhanYeuCau', function(event) {
		var table = $(".chiTietCapNhatTable tbody");
		sum = 0;
		table.find('tr').each(function(i) {
			donGia = $(this).find("td:eq(2)").text();
			soLuongCapNhat = $(this).find("td:eq(4) input[type='number']").val();
			sum += donGia * soLuongCapNhat;
		});
		$("#tongTienCapNhat").text("Tổng : " + sum);

	});
	$(document).on('click', '#btnXacNhan', function(event) {
		event.preventDefault();
		ajaxPostCapNhatTrangThaiDon();
		resetData();
	});
	// event khi click vào button cập nhật đơn
	$(document).on('click', '.btnCapNhat', function(event) {
		event.preventDefault();
		var donHangId = $(this).parent().prev().children().val();
		$("#donHangId").val(donHangId);
		var href = "http://localhost:8080/potteryshop/api/employee/don-hang/" + donHangId;
		$.get(href, function(donHang) {
			// thêm bảng:
			var stt = 1;
			$.each(donHang.danhSachChiTiet, function(i, chiTiet) {
				var chiTietRow = '<tr>' +
					'<td>' + stt + '</td>' +
					'<td>' + chiTiet.sanPham.tenSanPham + '</td>' +
					'<td>' + chiTiet.donGia + '</td>' +
					'<td>' + chiTiet.soLuongDat + '</td>' +
					'<td><input type="number" class="soLuongNhan" style="width: 40px; text-align: center;" value ="' + chiTiet.soLuongDat + '" min="0" max="' + chiTiet.soLuongDat + '" ></td>' +
					'<td><input type="hidden" value="' + chiTiet.id + '" ></td>'
				$('.chiTietCapNhatTable tbody').append(chiTietRow);
				stt++;
			});
			var sum = 0;
			$.each(donHang.danhSachChiTiet, function(i, chiTiet) {
				sum += chiTiet.donGia * chiTiet.soLuongDat;
			});
			$("#tongTienCapNhat").text("Tổng : " + sum);
		});
		$("#capNhatTrangThaiModal").modal();
	});

	// post request cập nhật đã giao cho khách
	function ajaxPostCapNhatTrangThaiDon() {

		var listChiTietCapNhat = [];
		var table = $(".chiTietCapNhatTable tbody");
		table.find('tr').each(function(i) {
			var chiTietCapNhat = {
				idChiTiet: $(this).find("td:eq(5) input[type='hidden']").val(),
				soLuongNhanHang: $(this).find("td:eq(4) input[type='number']").val()
			};
			listChiTietCapNhat.push(chiTietCapNhat);
		});
		var data = {
			idDonHang: $("#donHangId").val(),
			ghiChuEmployee: $("#ghiChuEmployee").val(),
			danhSachCapNhatChiTietDon: listChiTietCapNhat
		};
		//    	 console.log(data);
		$.ajax({
			async: false,
			type: "POST",
			contentType: "application/json",
			url: "http://localhost:8080/potteryshop/api/employee/don-hang/update",
			enctype: 'multipart/form-data',

			data: JSON.stringify(data),
			// dataType : 'json',
			success: function(response) {
				console.log(data);
				$("#capNhatTrangThaiModal").modal('hide');
				alert("Cập nhật giao đơn hàng thành công");
			},
			error: function(e) {
				alert("Error!")
				console.log("ERROR: ", e);
			}
		});
	}








	var idNguoiDat;

	var date;

	var spamCountMax = 3;
	var arr;

	var clickCount;
	var boo;

	$(document).on('click', '#btnXacNhanTrangThai', function(event) {

		event.preventDefault();
		/*ajaxPostChoGiaoHang();*/
		var status = [];
		$.each($("input[name='status']:checked"), function() {
			status.push($(this).val());
		});
		console.log(status);
		if (status == "Chờ giao hàng") {
			ajaxPostChoGiaoHang();

		}
		else {

			
			arr = JSON.parse(localStorage.getItem(idNguoiDat));
			if (arr == null) {
				arr = [];
				clickCount = 0;
				console.log("arr " + arr + " " + clickCount);
			}
			else {
				arr = JSON.parse(localStorage.getItem(idNguoiDat));
				clickCount = arr.length;
				console.log(arr + " " + clickCount);
			}
			if (clickCount < spamCountMax) {
				clickCount++;
				date = new Date().toDateString();
				var obj = { "date": date, "clickCount": clickCount };
				arr.push(obj);
				localStorage.setItem(idNguoiDat, JSON.stringify(arr));
			} else if (clickCount >= spamCountMax) {
				var item = JSON.parse(localStorage.getItem(idNguoiDat));
				localStorage.setItem(idNguoiDat, null);
				boo = false;
				if (item[0].date == item[1].date && item[2].date == item[1].date) {
					boo = true;
					console.log(boo);
					ajaxPUTLock(idNguoiDat);
				}
			};
			
			ajaxPostHuyDon();
		}
		resetData();
	});




	// event khi click vào xác nhận khách mua
	$(document).on('click', '.btnXacNhanKhachMua', function(event) {
		event.preventDefault();
		var donHangId = $(this).parent().prev().children().val();
		idNguoiDat = $(this).parent().prev().prev().children().val();
		idDonhang = $(this).parent().prev().children().val()
		$("#donHangId").val(donHangId);
		var href = "http://localhost:8080/potteryshop/api/employee/don-hang/" + donHangId;
		console.log(donHangId);
		$.get(href, function(donHang) {
			// thêm bảng:
			var stt = 1;
			$.each(donHang.danhSachChiTiet, function(i, chiTiet) {
				var chiTietRow = '<tr>' +
					'<td>' + stt + '</td>' +
					'<td>' + chiTiet.sanPham.tenSanPham + '</td>' +
					'<td>' + chiTiet.sanPham.donGia + '</td>' +
					'<td>' + chiTiet.soLuongDat + '</td>' +
              /*  '<td><input type="number" class="soLuongNhanYeuCau" style="width: 40px; text-align: center;" value ="'+chiTiet.soLuongDat+'" min="0" max="'+chiTiet.soLuongDat+'" ></td>'+
              */ '<td><input type="hidden" value="' + chiTiet.id + '" ></td>'
				$('.chiTietCapNhatTablexacNhanKhach tbody').append(chiTietRow);
				stt++;
			});
			var sum = 0;
			$.each(donHang.danhSachChiTiet, function(i, chiTiet) {
				sum += chiTiet.sanPham.donGia * chiTiet.soLuongDat;
			});
			$("#tongTienCapNhat1").text("Tổng : " + sum);
		});
		$("#xacNhanKhachMuaModal").modal();
	});
	// post request cập nhật trạng thái giao hàng
	function ajaxPostChoGiaoHang() {
		var listChiTietCapNhat = [];
		var table = $(".chiTietCapNhatTablexacNhanKhach tbody");
		table.find('tr').each(function(i) {
			var chiTietCapNhat = {
				idChiTiet: $(this).find("td:eq(5) input[type='hidden']").val(),
				soLuongNhanHang: $(this).find("td:eq(4) input[type='number']").val()
			};
			listChiTietCapNhat.push(chiTietCapNhat);
		});

		var data = {
			idDonHang: $("#donHangId").val(),
			ghiChuEmployee: $("#ghiChuEmployeeXacNhan").val(),
			danhSachCapNhatChiTietDon: listChiTietCapNhat
		};
		//    	 console.log(data);
		$.ajax({
			async: false,
			type: "POST",
			contentType: "application/json",
			url: "http://localhost:8080/potteryshop/api/employee/don-hang/confirmGuest",
			enctype: 'multipart/form-data',

			data: JSON.stringify(data),
			// dataType : 'json',
			success: function(response) {
				$("#xacNhanKhachMuaModal").modal('hide');
				alert("Xác nhận khách mua thành công");
			},
			error: function(e) {
				alert("Error!")
				console.log("ERROR: ", e);
			}
		});
	}


	// post request xác nhận hủy đơn hàng
	function ajaxPostHuyDon() {
		var listChiTietCapNhat = [];
		var table = $(".chiTietCapNhatTablexacNhanKhach tbody");
		table.find('tr').each(function(i) {
			var chiTietCapNhat = {
				idChiTiet: $(this).find("td:eq(5) input[type='hidden']").val(),
				soLuongNhanHang: $(this).find("td:eq(4) input[type='number']").val()
			};
			listChiTietCapNhat.push(chiTietCapNhat);
		});

		var data = {
			idDonHang: $("#donHangId").val(),
			ghiChuEmployee: $("#ghiChuEmployeeXacNhan").val(),
			danhSachCapNhatChiTietDon: listChiTietCapNhat
		};
		//    	 console.log(data);
		$.ajax({
			async: false,
			type: "POST",
			contentType: "application/json",
			url: "http://localhost:8080/potteryshop/api/employee/don-hang/cancelConfirm",
			enctype: 'multipart/form-data',

			data: JSON.stringify(data),
			// dataType : 'json',
			success: function(response) {
				$("#xacNhanKhachMuaModal").modal('hide');
				alert("Hủy đơn hàng thành công");
			},
			error: function(e) {
				alert("Error!")
				console.log("ERROR: ", e);
			}
		});
	}

	$(document).on('click', '#exportPDFbyId', function() {

		const element = document.getElementById("modalId");

		// clone the element
		var clonedElement = element.cloneNode(true);

		// change display of cloned element 
		$(clonedElement).css("display", "block");

		// Choose the clonedElement and save the PDF for our user.
		html2pdf(clonedElement, {
			margin: 10,
			filename: 'Poterryshop Hóa Đơn -' + document.getElementById("maDonHang").textContent + '.pdf',
			image: { type: 'jpeg', quality: 0.98 },
			html2canvas: { scale: 2, logging: true, dpi: 192, letterRendering: true },
			jsPDF: { unit: 'mm', format: 'a4', orientation: 'portrait' }
		});

		// remove cloned element
		clonedElement.remove();

	})


	// reset table after post, put, filter
	function resetData() {
		var page = $('li.active').children().text();
		$('.donHangTable tbody tr').remove();
		$('.pagination li').remove();
		if ((document.getElementById("trangThai").options[document.getElementById("trangThai").selectedIndex].text == "Đang chờ xác nhận khách mua") && (parseInt(document.getElementById("intro").innerHTML) == 0)) { ajaxGet(1, "http://localhost:8080/potteryshop/api/employee/don-hang/listConfirmGuest" + '?page=1'); } else { ajaxGet(page, "http://localhost:8080/potteryshop/api/employee/don-hang/all" + '?page=' + page); }
	};



	// 

	function ajaxPUTLock(id) {
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
});
