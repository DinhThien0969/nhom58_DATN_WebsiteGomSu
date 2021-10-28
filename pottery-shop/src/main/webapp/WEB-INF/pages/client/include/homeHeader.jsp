<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="Frontend/css/style.css" rel="stylesheet" type="text/css"
	media="all"/>
<link rel="stylesheet" href="Frontend/css/responsiveslides.css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="wrap">
		<!----start-Header---->
		<div class="header">
			<div class="clear"></div>
			<div class="header-top-nav">
					<ul>
						<li>Xin chào:</li>
						<!-- 	<li><a href="">/checkout"">Thanh toán</a></li> -->
						<li><a href="#">/account">Tài
								khoản</a></li>
						<li><a href=""><span>Giỏ
									hàng&nbsp;&nbsp;: </span></a><span
							class="glyphicon glyphicon-shopping-cart"></span></li>
						<li><a href=""> Đăng xuất</a></li>
					</ul>
				<c:if test="">
					<ul>
						<li><a href="">Đăng
								kí</a></li>
						<li><a href="">Đăng
								nhập</a></li>
						<li><a href=""> <span>Giỏ hàng&nbsp;&nbsp;&nbsp;</span></a><span
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
			<!----start-logo---->
			<div class="logo">
				<a href=""><img
					src="Frontend/img/logo6.png" title="logo" /></a>
			</div>
			<!----end-logo---->
			<!----start-top-nav---->
			<div class="top-nav">
				<ul>
					<li><a href="">Trang chủ</a></li>

					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="">Cửa hàng <span class="caret"></span></a>
						<ul class="dropdown-menu" style="background: #94cb32" id="danhmuc2">
						</ul></li>
					<li><a href="#">/shipping">Miễn
							phí vận chuyển</a></li>
					<li><a href="">Bảo
							hành tận nơi</a></li>

					<li><a href="#">Liên hệ</a></li>
					<li>
					<div class="search-bar">
				<form action="#">
					<input type="text" name="name"><input type="submit"
						value="Search" />
				</form>
			</div></li>					
				</ul>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!----End-top-nav---->
	<!----End-Header---->