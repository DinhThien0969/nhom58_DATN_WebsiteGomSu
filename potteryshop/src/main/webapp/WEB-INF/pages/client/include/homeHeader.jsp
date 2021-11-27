<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link href="Frontend/css/style.css" rel="stylesheet" type="text/css"
	media="all" />
<link
	href='//fonts.googleapis.com/css?family=Londrina+Solid|Coda+Caption:800|Open+Sans'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="Frontend/css/responsiveslides.css">
<link rel="stylesheet" href="Frontend/css/stylele.css">
<script src="Frontend/js/jquery.min.js"></script>
<script src="Frontend/js/responsiveslides.min.js"></script>
<script src="js/client/accounting.js"></script>

<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>



<script>
	$(function() {

		// Slideshow 1
		$("#slider1").responsiveSlides({
			maxwidth : 1600,
			speed : 600
		});
	});
	function Dong_ho() {
		var gio = document.getElementById("gio");
		var phut = document.getElementById("phut");
		var giay = document.getElementById("giay");
		var Gio_hien_tai = new Date().getHours();
		var Phut_hien_tai = new Date().getMinutes();
		var Giay_hien_tai = new Date().getSeconds();
		gio.innerHTML = Gio_hien_tai;
		phut.innerHTML = Phut_hien_tai;
		giay.innerHTML = Giay_hien_tai;
	}
	var Dem_gio = setInterval(Dong_ho, 1000);
</script>

</head>
<body>


	<div class="wrap">
		<!----start-Header---->
		<div class="header">
			<!----start-logo---->
			<div class="logo">
				<a href="<%=request.getContextPath()%>/"><img
					src="Frontend/img/logo6.png" title="logoshop" /></a>
			</div>
			<!----end-logo---->
			<div class="search-bar">
				<form action="/potteryshop/search">
					<input type="text" name="name"><input type="submit"
						value="Search" />
				</form>
			</div>
			<div class="clear"></div>

			<div class="header-top-nav ">
				<c:if test="${pageContext.request.userPrincipal.name != null}">

					<ul>
						<li></li>
						<li>Xin chào: ${loggedInUser.hoTen}</li>
                        <li >
						<sec:authorize access="hasRole('ADMIN')">
							<a href="<%=request.getContextPath()%>/admin" style="color: red;font-size: 15px" >Trang admin</a>
						</sec:authorize>
						<sec:authorize access="hasRole('EMPLOYEE')">
							<a href="<%=request.getContextPath()%>/employee" style="color: red;font-size: 15px" >Trang
								employee</a>
						</sec:authorize>
						</li>
						<li><a href="<%=request.getContextPath()%>/account">Tài
								khoản</a></li>
						<li><a href="<%=request.getContextPath()%>/cart"><span>Giỏ
									hàng&nbsp;&nbsp;: </span></a><span
							class="glyphicon glyphicon-shopping-cart"></span></li>
						<li><a href="<%=request.getContextPath()%>/logout"> Đăng
								xuất</a></li>
					</ul>
				</c:if>

				<c:if test="${pageContext.request.userPrincipal.name == null}">
					<ul>
						<li><a href="<%=request.getContextPath()%>/register">Đăng
								kí</a></li>
						<li><a href="<%=request.getContextPath()%>/login">Đăng
								nhập</a></li>
						<li><a href="<%=request.getContextPath()%>/cart"> <span>Giỏ
									hàng&nbsp;&nbsp;&nbsp;</span></a><span
							class="glyphicon glyphicon-shopping-cart"></span></li>

					</ul>
				</c:if>

			</div>
			<div class="clear"></div>
		</div>
	</div>
	<div class="clear"></div>
	<div class="top-header">
		<div class="wrap">

			<!----start-top-nav---->
			<div class="top-nav">
				<ul>
					<li><a href="<%=request.getContextPath()%>/">Trang chủ</a></li>

					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Cửa hàng <span class="caret"></span></a>
						<ul class="dropdown-menu" style="background: #286090"
							id="danhmuc2">
						</ul></li>
					<li><a href="<%=request.getContextPath()%>/shipping">Vận
							chuyển</a></li>
					<li><a href="<%=request.getContextPath()%>/guarantee">Chính
							sách đổi trả hàng</a></li>

					<li><a href="<%=request.getContextPath()%>/contact">Liên
							hệ</a></li>
					<li>
						<div id="dong_ho" style="margin-left: 400px">

							<div id="thoi_gian" 
								class="glyphicon glyphicon-bell">
								<div>
									<span>:</span><span id="gio">00 </span>
								</div>
								<div>
									<span>:</span><span id="phut">00</span>
								</div>
								<div>
									<span id="giay">00</span>
								</div>
							</div>
						</div>

					</li>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!----End-top-nav---->
	<!----End-Header---->

	<script src="<c:url value='/js/client/header.js'/>"></script>