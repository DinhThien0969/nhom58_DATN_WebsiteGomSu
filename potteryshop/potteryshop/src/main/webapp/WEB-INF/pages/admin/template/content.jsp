<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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

input:checked + label {
  text-decoration: line-through;
  color: #adb5bd;
}

label {
  cursor: pointer;
}

a {
  text-decoration: none;
}</style>

<div class="col-md-9 animated bounce">
 <script language="javascript">function getDateTime() {
     var now     = new Date(); 
     var year    = now.getFullYear();
     var month   = now.getMonth()+1; 
     var day     = now.getDate();
     var hour    = now.getHours();
     var minute  = now.getMinutes();
     var second  = now.getSeconds(); 
     if(month.toString().length == 1) {
          month = '0'+month;
     }
     if(day.toString().length == 1) {
          day = '0'+day;
     }   
     if(hour.toString().length == 1) {
          hour = '0'+hour;
     }
     if(minute.toString().length == 1) {
          minute = '0'+minute;
     }
     if(second.toString().length == 1) {
          second = '0'+second;
     }   
     var dateTime = year+'/'+month+'/'+day+' '+hour+':'+minute+':'+second;   
      return dateTime;
 }

 setInterval(function(){
     currentTime = getDateTime();
     document.getElementById("digital-clock").innerHTML = currentTime;
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
                            <img alt="" src="Frontend/img/lich.png"">
                                <h2 class="text-uppercase fw-weight-bold mb-0"><script language="javascript">document.write(day_name);</script></h2>
                                <p class="text-gray fst-italic mb-0">  <div id="digital-clock"></div></p>
                            </div>
                        </div>
      
    
      
	<h2 class="page-header">Danh sách công việc</h2>
	<p style="font-size: 26px">Bạn có:<p>
	<ul class="list-group">
	
  <%-- <c:if test = "${listCongViec.soDonhangChoDuyet > 0}">  
        <li class="list-group-item d-flex justify-content-between align-items-center">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
  <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z"/>
  <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0z"/>
</svg>  
          <a href='<c:url value="/admin/don-hang" />' 
           style="color: red;font-size: 20px;font-family: 'auto';">Đơn hàng hoàn thành</a>
         <span style="font-size: 17px;font-family: 'auto';" class="badge bg-primary rounded-pill" class="badge bg-primary rounded-pill">${listCongViec.soDonhangChoDuyet}</span>  
       </li>    
    </c:if>  --%>
    
    
    <c:if test = "${listCongViec.soDonHangMoi > 0}">
    <li class="list-group-item d-flex justify-content-between align-items-center">
           <img alt="" src="Frontend/img/donhang.png" style="margin-right: 10px;">
           <a href='<c:url value="/admin/don-hang" />'
            style="color: #286090;font-size: 20px;font-family: 'auto';"><b>Đơn hàng chờ giao</b></a>
      <span style="font-size: 20px;font-family: 'auto';background-color: #DC143C" class="badge bg-primary rounded-pill">${listCongViec.soDonHangMoi}</span>
     </li>  
    </c:if>
    <c:if test = "${listCongViec.soLienHeMoi > 0}">
   <li class="list-group-item d-flex justify-content-between align-items-center">
     <img alt="" src="Frontend/img/lienhe.png" style="margin-right: 10px;">
     <a href='<c:url value="/admin/lien-he" />' style="font-size: 20px;font-family: 'auto';color: #286090"> <b> Liên hệ mới</b></a>
     <span style="font-size: 20px;font-family: 'auto';background-color: #00BFFF "  class="badge bg-primary rounded-pill"> 
     ${listCongViec.soLienHeMoi}</span>
    </li>
    </c:if>
   
</ul>
</div>
</div>