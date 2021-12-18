<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quản lý danh mục</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<jsp:include page="template/header.jsp"></jsp:include>
	<jsp:include page="template/sidebar.jsp"></jsp:include>

	<div class="col-md-9 animated bounce">
      <h3 class="page-header">Quản lý Danh Mục</h3>

      <button class="btn btn-success btnThemDanhMuc">Thêm mới danh mục</button>
      
            <hr/>
<!--       <ul class="breadcrumb">
        <li>
          <span class="glyphicon glyphicon-home">&nbsp;</span>Home</li>
        <li>
          <a href="#">Dashboard</a>
        </li> 
      </ul>--> 
      <table class="table table-hover danhMucTable">
        <thead>
        <tr>
          <th>Mã danh mục</th>
          <th>Tên Danh mục</th>
         </tr>

        </thead>
        <tbody>
        </tbody>

      </table>
      
      <ul class="pagination">
	  </ul>
    </div>
    <div class="row col-md-6">
		<form class="danhMucForm" id="form">

			<div>
				<div class="modal fade" id="danhMucModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true" data-backdrop="static" data-keyboard="false">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Tạo mới/Cập nhật danh mục</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="form-group">
									<label for="id">ID:</label> <input type="text"
										class="form-control" id="id" />
								</div>
								<div class="form-group">
									<label for="name">Tên danh mục:</label> <input type="text"
										class="form-control" id="tenDanhMuc" placeholder="Nhập vào tên danh mục" required />
								</div>
								
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Hủy</button>
									<input class="btn btn-primary" id="btnSubmit" type="button"
										value="Xác nhận"/>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
  </div>
<script>
		setInterval(function (){
        	$("#here").load(window.location.href + " #here" );
       	    $("#lienHeMoi").load(window.location.href + " #lienHeMoi" );
   	        $("#donHangMoi").load(window.location.href + " #donHangMoi" );
          	 if(parseInt(document.getElementById("list").innerHTML)<parseInt(document.getElementById("listCurrent").innerHTML))
          	 {
          		Swal.fire(
          			  'Bạn có thông báo mới!',
          			  'Nhấn "ok" để hủy',
          			  'warning'
          			)
          		 $("#here1").load(window.location.href + " #here1" );	
          		
          	 }
          	
          		
          	}, 5000);
		
	</script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<c:if test = "${listCongViec.soDonHangMoi > 0}" >
       <div hidden id="donHangMoi"> ${listCongViec.soDonHangMoi}</div> 
       </c:if>
       
       <c:if test = "${listCongViec.soLienHeMoi > 0}">
       <div hidden id="lienHeMoi"> ${listCongViec.soLienHeMoi}</div> 
       </c:if>

	<jsp:include page="template/footer.jsp"></jsp:include>
	<script src="<c:url value='/js/danhMucAjax.js'/>" ></script>
</body>
</html>