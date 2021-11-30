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


<style>/* ==========================================
    FOR DEMO PURPOSE
  ========================================== */
.holder {
	background: #f0efe9;
	min-height: 100vh;
}

.rounded {
	border-radius: 1rem !important;
}

.text-gray {
	color: #aaa;
}

input:checked+label {
	text-decoration: line-through;
	color: #adb5bd;
}

label {
	cursor: pointer;
}

a {
	text-decoration: none;
}
</style>


</head>
<body>
<img alt="" src="https://www.xuonggombattrang.vn/landing-page/about/images/bg_line.png">
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
							<a href="<%=request.getContextPath()%>/admin" style="color: #ff7272;font-size: 15px" >Trang admin</a>
						</sec:authorize>
						<sec:authorize access="hasRole('EMPLOYEE')">
							<a href="<%=request.getContextPath()%>/employee" style="color: #ff7272;font-size: 15px" >Trang
								employee</a>
						</sec:authorize>
						</li>
						<li><a href="<%=request.getContextPath()%>/account">Tài
								khoản</a></li>
						<li id="here" style="color: #4d9d45"><a href="<%=request.getContextPath()%>/cart"> <span>Giỏ
									hàng: </span><span class="glyphicon glyphicon-shopping-cart"></span></a>
									<span  style="font-size: 15px;font-weight: bold;color: red;"><c:if  test = "${checkEmpty >0}" >(${checkEmpty})</c:if>
									</span></li>
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
						<li id="here" style="color: #4d9d45"><a href="<%=request.getContextPath()%>/cart"> <span>Giỏ
									hàng: </span><span class="glyphicon glyphicon-shopping-cart"></span></a>
									<span  style="font-size: 15px;font-weight: bold;color: red"><c:if  test = "${checkEmpty >0}" >(${checkEmpty})</c:if>
									</span>
									</li>

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
			
				<ul >
					<li><a style="text-decoration: none"  href="<%=request.getContextPath()%>/">Trang chủ</a></li>

					<li class="dropdown"><a style="text-decoration: none" class="dropdown-toggle"
						data-toggle="dropdown" href="#">Cửa hàng <span class="caret"></span></a>
						<ul class="dropdown-menu" style="background: #286090"
							id="danhmuc2">
						</ul></li>
					<li><a style="text-decoration: none" href="<%=request.getContextPath()%>/shipping">Vận
							chuyển</a></li>
					<li><a style="text-decoration: none" href="<%=request.getContextPath()%>/guarantee">Chính
							sách đổi trả hàng</a></li>

					<li><a style="text-decoration: none" href="<%=request.getContextPath()%>/contact">Liên
							hệ</a></li>
					<li>
						<div class=" animated bounce" style="width: 350%; color: #fff;font-family:sans-serif;" >
							<script language="javascript">
								function getDateTime() {
									var now = new Date();
									var year = now.getFullYear();
									var month = now.getMonth() + 1;
									var day = now.getDate();
									var hour = now.getHours();
									var minute = now.getMinutes();
									var second = now.getSeconds();
									if (month.toString().length == 1) {
										month = '0' + month;
									}
									if (day.toString().length == 1) {
										day = '0' + day;
									}
									if (hour.toString().length == 1) {
										hour = '0' + hour;
									}
									if (minute.toString().length == 1) {
										minute = '0' + minute;
									}
									if (second.toString().length == 1) {
										second = '0' + second;
									}
									var dateTime = year + '/' + month + '/'
											+ day + ' ' + hour + ':' + minute
											+ ':' + second;
									return dateTime;
								}

								setInterval(
										function() {
											currentTime = getDateTime();
											document
													.getElementById("digital-clock").innerHTML = currentTime;
										}, 1000);

								var date = new Date();

								var current_day = date.getDay();

								var day_name = '';

								switch (current_day) {
								case 0:
									day_name = "Chủ nhật";
									break;
								case 1:
									day_name = "Thứ hai";
									break;
								case 2:
									day_name = "Thứ ba";
									break;
								case 3:
									day_name = "Thứ tư";
									break;
								case 4:
									day_name = "Thứ năm";
									break;
								case 5:
									day_name = "Thứ sáu";
									break;
								case 6:
									day_name = "Thứ bảy";
								}
							</script>
							<div class="d-flex align-items-center mb-4 pb-4 border-bottom">
								<div class="ms-3">
								<ul>
								<li style="color: #fff"><span class="glyphicon glyphicon-time">&nbsp;</span></li>
								<!-- class="glyphicon glyphicon-bell" -->
								<li><p><div id="digital-clock" ></div></p></li>
								</ul>
									
									
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