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
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-calendar3" viewBox="0 0 16 16">
  <path d="M14 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857V3.857z"/>
  <path d="M6.5 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
</svg><h2 class="text-uppercase fw-weight-bold mb-0"><script language="javascript">document.write(day_name);</script></h2>
                                <p class="text-gray fst-italic mb-0">  <div id="digital-clock"></div></p>
                            </div>
                        </div>
      
    
      
	<h1 class="page-header">Danh sách công việc</h1>
	<p style="font-size: 30px">Bạn có:<p>
	<ul class="list-group">
    <c:if test = "${listCongViec.soDonhangChoDuyet > 0}">  
        <li class="list-group-item d-flex justify-content-between align-items-center">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
  <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z"/>
  <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0z"/>
</svg>  
          <a href='<c:url value="/admin/don-hang" />' 
           style="color: red;font-size: 20px;font-family: 'auto';">Đơn hàng chờ duyệt</a>
         <span style="font-size: 17px;font-family: 'auto';" class="badge bg-primary rounded-pill" class="badge bg-primary rounded-pill">${listCongViec.soDonhangChoDuyet}</span>  
       </li>    
    </c:if>
    <c:if test = "${listCongViec.soDonHangMoi > 0}">
    <li class="list-group-item d-flex justify-content-between align-items-center">
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cursor" viewBox="0 0 16 16">
  <path d="M14.082 2.182a.5.5 0 0 1 .103.557L8.528 15.467a.5.5 0 0 1-.917-.007L5.57 10.694.803 8.652a.5.5 0 0 1-.006-.916l12.728-5.657a.5.5 0 0 1 .556.103zM2.25 8.184l3.897 1.67a.5.5 0 0 1 .262.263l1.67 3.897L12.743 3.52 2.25 8.184z"/>
</svg>
           <a href='<c:url value="/admin/don-hang" />'
            style="color: red;font-size: 20px;font-family: 'auto';">Đơn hàng chờ giao</a>
      <span style="font-size: 17px;font-family: 'auto';" class="badge bg-primary rounded-pill">${listCongViec.soDonHangMoi}</span>
     </li>  
    </c:if>
    <c:if test = "${listCongViec.soLienHeMoi > 0}">
   <li class="list-group-item d-flex justify-content-between align-items-center">
   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
  <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
</svg>
     <p style="font-size: 30px;font-size: 20px;font-family: 'auto';"><a href='<c:url value="/admin/lien-he" />' style="color: red">liên hệ mới</a><p>
     <span style="font-size: 17px;font-family: 'auto';" class="badge bg-primary rounded-pill" class="badge bg-primary rounded-pill"> 
     ${listCongViec.soLienHeMoi}</span>
    </li>
    </c:if>
   
</ul>
</div>
</div>