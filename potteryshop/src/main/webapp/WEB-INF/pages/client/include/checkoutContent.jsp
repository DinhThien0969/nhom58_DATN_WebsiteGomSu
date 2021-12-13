<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Thanh toán</title>
</head>

<script type="text/javascript">
function muaHo() {
	
	 document.getElementById("hoTenNguoiNhanHang").value = "";
	 document.getElementById("soDienThoaiNguoiNhanHang").value = "";
	 document.getElementById("diaChiNguoiNhanHang").value = "";

	  };
	  	  
	$(document).ready(function() {
		$(".mytable .donGia .check").each(function() {
			var value = accounting.formatMoney($(this).text()) + ' VND';
			$(this).html(value);
		});

		$(".mytable .total").each(function() {
			var value = accounting.formatMoney($(this).text()) + ' VND ';
			$(this).html(value);
		});
	});
	
	
	function choToi() {
		
		document.getElementById("hoTenNguoiNhanHang").value = document.getElementById("hotenAcc").value;
		 document.getElementById("soDienThoaiNguoiNhanHang").value = document.getElementById("soDienThoaiAcc").value;
		 document.getElementById("diaChiNguoiNhanHang").value = document.getElementById("diaChiAcc").value;
		  };
</script>

<body>

	<div class="container" style="width: 1300px">
		<form method="POST" action="<%=request.getContextPath()%>/thankyou">
			<div class="row">
				<br>
				<br>
				<c:if test="${pageContext.request.userPrincipal.name != null}">
					<div class="col-md-3" style="width: 23%">
						<br>
						<p class="border-p" style="line-height: 1.5;">
							<b>Thông tin khách hàng</b>
						</p>

						<p style="line-height: 2;">Họ tên Quý khách</p>
						<input class="form-control" style="font-size: medium;" id="hotenAcc" size="27" value="${user.hoTen}" disabled>

						<p style="line-height: 2;">Địa chỉ Email</p>
						<input class="form-control"  style="font-size: medium;"size="27" value="${user.email}" disabled>

						<p style="line-height: 2;">Số điện thoại</p>
						<input class="form-control"  style="font-size: medium;"id="soDienThoaiAcc" size="27" value="${user.soDienThoai}" disabled>

						<p style="line-height: 2;">Địa chỉ(số nhà, đường, tỉnh thành)
						</p>
						<textarea class="form-control"  style="font-size: medium;"id="diaChiAcc" rows="5" cols="29" disabled>${user.diaChi}</textarea>
						<br>
						<br>
					</div>

					<div class="col-md-3" style="width: 23%">
						<br>	
						<p class="border-p" style="line-height: 1.5;">
							<b>Bạn mua đơn hàng này cho ai ?</b>
							<p class="border-p" style="line-height: 1.5;">
							<span onclick="choToi();"><input checked type="radio" value="Cho tôi" name="buy"></span>Cho tôi
                            <span onclick="muaHo();"><input type="radio" value="Mua hộ" name="buy"></span>Mua hộ
							<br>
							<form id="myForm">
							
							<b>Thông tin nhận hàng</b>

						</p>

<p style="line-height: 2;">Họ tên người nhận hàng *</p>
						
						<input class="form-control"  style="font-size: medium;" id="hoTenNguoiNhanHang" size="27" value="${user.hoTen}" name="hoTenNguoiNhan" required >

						<p style="line-height: 2;">Số điện thoại *</p>
<input class="form-control"  style="font-size: medium;" id="soDienThoaiNguoiNhanHang" size="27" value="${user.soDienThoai}" name="sdtNhanHang" required>


						<p style="line-height: 2;">Địa chỉ(số nhà, đường, tỉnh thành)
							*</p>
						<textarea class="form-control"  style="font-size: medium;" id="diaChiNguoiNhanHang" rows="5" cols="29" name="diaChiNhan" required>${user.diaChi}</textarea>
                     </form>

						<br>
						<br> <input  type="hidden" id="tongGiaTri" name="tongGiaTri">
					</div>

					<div class="col-md-6" style="width: 54%">
						<br>
						<p class="border-p" style="line-height: 1.5;">
							<b>Giỏ hàng</b>
						</p>
						<br>

						<table class="table-cart-checkout mytable">
							<tr>
								<th>Ảnh</th>
								<th>Tên sản phẩm</th>
								<th>Đơn giá</th>
								<th>Tổng</th>
							</tr>
							<c:forEach items="${cart}" var="sanpham">

								<tr style="text-align: center;">
									<td><img src="/potteryshop/img/${sanpham.id}.png"
										alt="not found img" class="img-reponsive fix-size-img">
									</td>
									<td style="color: green">${sanpham.tenSanPham}</td>

									<td class="donGia">
										<div class="check " style="display: inline-block;">${sanpham.donGia}</div>
										<div style="display: inline-block;">x
											${quanity[sanpham.id]}</div>
									</td>

									<td>

										<div class="total">${sanpham.donGia*quanity[sanpham.id]}</div>
									</td>
								</tr>
							</c:forEach>
							<c:forEach items="${cartNew}" var="sanpham">

								<tr style="text-align: center;">
									<td><img src="/potteryshop/img/${sanpham.id}.png"
										alt="not found img" class="img-reponsive fix-size-img">
									</td>
									<td style="color: green">${sanpham.tenSanPham}</td>

									<td class="donGia">
										<div class="check " style="display: inline-block;">${sanpham.donGia}</div>
										<div style="display: inline-block;">x
											${quanityNew[sanpham.id]}</div>
									</td>

									<td>
										<div class="total">${sanpham.donGia*quanityNew[sanpham.id]}</div>
									</td>
								</tr>
							</c:forEach>
						</table>


						<br>
						<p>
							Tổng giá trị đơn hàng: <b id="ordertotal"> </b>
						</p>
						<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a
							href="<%=request.getContextPath()%>/cart" class="btn btn-primary">Quay
							lại giỏ hàng</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp;

						<button class="btn btn-danger pull-center" type="submit"
							id="submit">Gửi đơn hàng</button>

						<br>
						<br>

					</div>
				</c:if>
<c:if test="${pageContext.request.userPrincipal.name == null}">
	<h1 style="font-size: 40px; color: red; text-align: center;font-family:cursive;">Vui lòng đăng nhập để thanh toán</h1>
	<img alt="" src="http://quanggom.vn/wp-content/uploads/2018/04/banner2a.jpg">
	 <script type="text/javascript"  >	  
	$(document).ready(function() { 
		Swal.fire({
			  icon: 'warning',
title: 'VUI LÒNG ĐĂNG NHẬP VÀ QUAY LẠI GIỎ HÀNG',
background: 'url(https://nhaxinhplaza.com/Images/giay-dan-tuong-phong-ngu-ma-8258-1.jpg)',
			  text: 'NHẤN OK ĐỂ HỦY',
			  footer: '<a href="http://localhost:8080/potteryshop/login" style="color: #32CD32; font-size: 20px"><b>ĐĂNG NHẬP</b></a>'
			})
	  });
	</script> 
	</c:if>
	</div>
	</form>
</div>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="<c:url value='/js/client/checkoutAjax.js'/>" ></script>	
</body>
</html>