<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="col-md-9 animated bounce">
	<h1 class="page-header">Danh sách công việc</h1>
	<c:if test = "${listCongViec.soDonHangMoi > 0}">
         <p style="font-size: 30px">Bạn có: <a href='<c:url value="/admin/don-hang" />' style="color: red"> ${listCongViec.soDonHangMoi} đơn hàng mới</a><p>
    </c:if>
    
    <c:if test = "${listCongViec.soDonhangChoDuyet > 0}">
         <p style="font-size: 30px">Bạn có: <a href='<c:url value="/admin/don-hang" />' style="color: red"> ${listCongViec.soDonhangChoDuyet} đơn hàng chờ duyệt</a><p>
    </c:if>

	<c:if test = "${listCongViec.soLienHeMoi > 0}">
         <p style="font-size: 30px">Bạn có: <a href='<c:url value="/admin/lien-he" />' style="color: red"> ${listCongViec.soLienHeMoi} liên hệ mới</a><p>
    </c:if>
    
</div>
</div>