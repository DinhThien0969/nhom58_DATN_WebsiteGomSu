<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quản lý nhãn hiệu</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<jsp:include page="template/header.jsp"></jsp:include>
	<jsp:include page="template/sidebar.jsp"></jsp:include>

	<div class="col-md-9 animated bounce">
      <h3 class="page-header">Quản lý Nhãn hiệu</h3>

      <button class="btn btn-success btnThemNhanHieu">Thêm mới Nhãn hiệu</button>
      
            <hr/>
            
      <table class="table table-hover nhanHieuTable">
        <thead>
        <tr>
          <th>Mã</th>
          <th>Tên Hãng</th>
          <th></th>
         </tr>

        </thead>
        <tbody>
        </tbody>

      </table>
      
      <ul class="pagination">
	  </ul>
    </div>
    <div class="row col-md-6">
		<form class="nhanHieuForm" id="form">

			<div>
				<div class="modal fade" id="nhanHieuModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true" data-backdrop="static" data-keyboard="false">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Tạo mới/Cập nhật Nhãn hiệu</h5>
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
									<label for="name">Tên hãng sản xuất:</label> <input type="text"
										class="form-control" id="tenHangSanXuat" placeholder="Nhập vào tên hãng sản xuất" required />
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

	<jsp:include page="template/footer.jsp"></jsp:include>
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
	<script src="<c:url value='/js/nhanHieuAjax.js'/>" ></script>
</body>
</html>