<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>

<div class="container-fluid">
    <div class="col-md-3">

      <div id="sidebar">
        <div class="container-fluid tmargin">
          <div class="input-group">
<!--             <input type="text" class="form-control" placeholder="Search..." />
            <span class="input-group-btn">
              <button class="btn btn-default">
                <span class="glyphicon glyphicon-search"></span>
              </button>
            </span> -->
          </div>
        </div>

        <ul class="nav navbar-nav side-bar">       
         
          <li class="side-bar tmargin">
            <a href="<c:url value='/admin/don-hang' />">
              <span class="glyphicon glyphicon-shopping-cart">&nbsp;</span>Quản lý Đơn hàng</a>
          </li>
        
          <li class="side-bar">
            <a href='<c:url value="/admin/san-pham"/>' >
              <span class="glyphicon glyphicon-folder-open">&nbsp;</span>Quản lý Sản phẩm</a>
          </li>
        
          <li class="side-bar">
            <a href='<c:url value="/admin/danh-muc"/>'>
              <span class="glyphicon glyphicon-tasks">&nbsp;</span>Quản lý Danh Mục</a>
          </li>
          
          <li class="side-bar">
            <a href='<c:url value="/admin/nhan-hieu"/>' >
              <span class="glyphicon glyphicon-flag">&nbsp;</span>Quản lý Nhãn hiệu</a>
          </li>

          <li class="side-bar main-menu">
            <a href="<c:url value='/admin/tai-khoan' />">
              <span class="glyphicon glyphicon-th-list">&nbsp;</span>Quản lý Tài khoản</a>
          </li>
          
          <li class="side-bar main-menu">
            <a href="<c:url value='/admin/lien-he' />">
              <span class="glyphicon glyphicon-envelope">&nbsp;</span>Quản lý Liên Hệ</a>
          </li>
          
          <li class="dropdown">
  <button class="dropbtn" style="width: 220px;
    background-color: initial;margin-left: -48px;"><span class="glyphicon glyphicon-signal">&nbsp;</span>Thống Kê</button>
  <div class="dropdown-content" style=" width: 214px">
  <a href="<c:url value='/admin/thong-ke/doanh-thu-sp-theo-thang' />">Doanh thu sản phẩm </a>
  <a href="<c:url value='/admin/thong-ke/so-luong-sp-theo-thang' />">Số lượng sản phẩm </a>
  </div>
</li>

          
          <li class="side-bar">
            <a href="<c:url value='/admin/profile' />">
              <span class="glyphicon glyphicon-user">&nbsp;</span>Thông tin cá nhân</a>
          </li>

        </ul>
      </div>
    </div>
    
    <script src="<c:url value='/js/admin.js'/>" ></script>
