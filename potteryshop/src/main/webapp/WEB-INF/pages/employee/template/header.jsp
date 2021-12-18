<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!DOCTYPE html>
<html lang="en">

<head>

<link rel='stylesheet'
	href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
<link rel='stylesheet'
	href='http://cdnjs.cloudflare.com/ajax/libs/animate.css/3.2.3/animate.min.css'>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="<c:url value='/css/admin.css' />" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top"
		style="background-color: #25383C; border-color: rgb(0 0 0/ 25%)">
		<div class="container">
			<div class="navbar-header">
				<button class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<c:url value='/'/>"><span
					class="glyphicon glyphicon-home">&nbsp;</span> Trang chủ</a> <a
					class="navbar-brand" href="<c:url value='/employee'/>"><span
					class="glyphicon glyphicon-lock">&nbsp;</span>Pottery Shop - Trang
					Employee</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
				<script type="text/javascript">
setInterval(function (){
	 $("#here").load(window.location.href + " #here" );
	 console.log("list ", parseInt(document.getElementById("list").innerHTML));
	 console.log("listCurrent ", parseInt(document.getElementById("listCurrent").innerHTML));
	 if(parseInt(document.getElementById("list").innerHTML)<parseInt(document.getElementById("listCurrent").innerHTML))
	 {
		 Swal.fire(
     			  'Bạn có đơn hàng mới!!',
     			  'Nhấn "ok" để hủy',
     			  'warning'
     			)
		 $("#here1").load(window.location.href + " #here1" );	 
	 }
	 
	}, 5000);
</script>
<li id="here1">
<p hidden id="list">${donHangMoi}</p>
</li>
        <li>
            <a id="here" style="color:#FFD700;" href="<c:url value='/employee'/>"><span  class="glyphicon glyphicon-bell"> 
            <c:if test ="${donHangMoi>0}">
             <p hidden id="listCurrent">${donHangMoi}</p>
             (${donHangMoi})
             
             </c:if>
               </span> Đơn hàng mới 
               </a>
          </li>

					<li><a href="<c:url value='/employee/profile' />"> <span
							class="glyphicon glyphicon-user">&nbsp;</span>Xin chào:
							${loggedInUser.hoTen }
					</a></li>
					<li><a href="<c:url value='/logout' />"><span
							class="glyphicon glyphicon-log-out"></span> Đăng xuất</a></li>
				</ul>
			</div>
		</div>
	</nav>