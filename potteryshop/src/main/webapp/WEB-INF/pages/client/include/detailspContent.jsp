<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<head>
<link rel="stylesheet" href="Frontend/css/detailsp.css">
</head>
	<script type="text/javascript">	  
	$(document).ready(function() { 
	  	var priceConvert = accounting.formatMoney(${sp.getDonGia()})+' VND';
		document.getElementById("priceConvert").innerHTML= priceConvert;
		  
	  });
	</script>
<body>
	<div class="container">
		<div class="card">
			<div class="container-fliud">
				<div class="wrapper row">
					<div class="preview col-md-6">
						
						<div class="preview-pic tab-content">
						  <div class="tab-pane active" id="pic-1"><img src="/potteryshop/img/${sp.getId()}.png" /></div>
						</div>		
					</div>
					<div class="details col-md-6">
						<p style="display:none" id="spid">${sp.getId()}</p>
						<h2 class="product-title">${sp.getTenSanPham()}</h2>
						<h4 class="price">Mô tả sản phẩm</h4>
						<c:if test = "${sp.getMauSac().length() > 0}">
							<p class="product-description">Chất men: ${sp.mauSac}</p>
						</c:if>
						<c:if test = "${sp.getKichThuoc().length() > 0}">
							<p class="product-description">Kích thước: ${sp.kichThuoc}</p>
						</c:if>
						<c:if test = "${sp.getThietKe().length() > 0}">
						
						<c:set var="string" value="${sp.danhMuc.tenDanhMuc}"/>					
						<p class="product-description">Hoa văn ${fn:toLowerCase(string)}: ${sp.getThietKe()}</p>
						</c:if>
						
						<p class="product-description">Hãng sản xuất: ${sp.hangSanXuat.tenHangSanXuat}</p>
						<p class="product-description"><span class="important">THÔNG TIN CHUNG:</span> ${sp.getThongTinChung()}</p>
						<p class="product-description"><span class="important">BẢO HÀNH:</span> ${sp.getThongTinBaoHanh()}</p>
						<h4 class="price" id ="blabla">Giá bán: <span id="priceConvert"></span></h4>
						<div class="action">
							<button style="background-color: #4d9d45;" class="add-to-cart btn btn-warning" type="button">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart-plus-fill" viewBox="0 0 16 16"> <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM9 5.5V7h1.5a.5.5 0 0 1 0 1H9v1.5a.5.5 0 0 1-1 0V8H6.5a.5.5 0 0 1 0-1H8V5.5a.5.5 0 0 1 1 0z"/> </svg> Giỏ hàng</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="<c:url value='/js/client/detailspAjax.js'/>" ></script>	 