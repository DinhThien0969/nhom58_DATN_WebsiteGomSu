<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Pottery shop - Đăng nhập</title>
<link rel="stylesheet" href="Frontend/css/login.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body >
	
	<form action="logout" align="center" >
    <h1 >Tài Khoản của bạn đã bị khóa</h1>
    <input id="userId" type="hidden" value="${loggedInUser.id}">
	<button class="btn btn-primary" type="submit">Quay lại với tư cách là khách</button>		
    <script type="text/javascript">	  
	$(document).ready(function() { 
		Swal.fire({
			  icon: 'error',
			  title: 'TÀI KHOẢN BẠN ĐÃ BỊ KHÓA',
			  text: 'NHẤN OK ĐỂ HỦY',
			  background: 'url(https://nhaxinhplaza.com/Images/giay-dan-tuong-phong-ngu-ma-8258-1.jpg)',
			  footer: '<a href="http://localhost:8080/potteryshop/login">QUAY LẠI ĐĂNG NHẬP</a>'
			})
	  });
	</script> 
	
</form>
	

	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="<c:url value='/js/client/header.js'/>"></script>
</body>
</html>