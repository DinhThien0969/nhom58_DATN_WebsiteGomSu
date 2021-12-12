<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>top4 Doanh Thu Cua Nhan Vien Theo Thang</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


</head>
<body>
	<jsp:include page="template/header.jsp"></jsp:include>
	<jsp:include page="template/sidebar.jsp"></jsp:include>

	<div class="col-md-9 animated bounce">
		<h3 class="page-header">Thống kê</h3>
		
		<select id="month">
			<option value=1> Tháng 1 </option>
			<option value=2 > Tháng 2 </option>
			<option value=3> Tháng 3 </option>
			<option value=4> Tháng 4 </option>
			<option value=5> Tháng 5 </option>
			<option value=6> Tháng 6 </option>
			<option value=7> Tháng 7 </option>
			<option value=8> Tháng 8 </option>
			<option value=9> Tháng 9 </option>
			<option value=10> Tháng 10 </option>
			<option value=11> Tháng 11 </option>
			<option value=12> Tháng 12 </option>
		</select>
		<canvas id="myChart" width="600px" height="400px"></canvas>
		<h4 style="text-align: center; padding-right: 10%;color:#D2691E"><b>Biểu đồ doanh thu của nhân viên theo tháng</b></h4>

	</div>


	<jsp:include page="template/footer.jsp"></jsp:include>

<script>


	var month = new Date().getMonth()+1;
	$("#month").val(month).change();
	var myBarChart ;
	
	
	$(document).on('change','#month',function(){
		var select = document.getElementById('month');
		month = select.options[select.selectedIndex].value;
		
		myBarChart.destroy();
		window.onload();
	});
	
		window.onload = function() {
		
		console.log(month);
		var data = [];
		var label = [];
		var dataForDataSets = [];

		$.ajax({
			async : false,
			type : "GET",
			data : data,
			contentType : "application/json",
			url : "http://localhost:8080/potteryshop/api/don-hang/report/top4DoanhThuCuaNhanVienTheoThang/"+month,
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					label.push(data[i][2]);
					dataForDataSets.push(data[i][0]);
				}
			},
			error : function(e) {
				alert("Error: ", e);
				console.log("Error", e);
			}
		});

		labelsAjusted=label.map(label=>label.split(' '));
		data = {
			labels : labelsAjusted,
			datasets : [ {
				label : "Tổng doanh thu ",
				backgroundColor : "#CD5C5C",
				borderColor : "#CD5C5C",
				borderWidth : 2,
				hoverBackgroundColor : "#DC143C",
				hoverBorderColor : "#DC143C",
				data : dataForDataSets,
			} ]
		};
		var option = {
				scales : {
					y :  { ticks: {
						font: {
	                        family: 'Raleway', // Your font family
	                        size: 18,
	                    },
		        },
						stacked : true,
						gridLines : {
							display : true,
							color : "rgba(255,99,132,0.2)"
						}
					} ,
					x : 
						
						{ ticks: {
							font: {
	family: 'Raleway', // Your font family
		                        size: 15,
		                    },
			        },
						barPercentage: 0.5,
						gridLines : {
							display : false
						}
					} 
				},
				maintainAspectRatio: false,
				 plugins: {
					 legend: {
				            labels: {
				                // This more specific font property overrides the global property
				            	font: {
			                        family: 'Raleway', // Your font family
			                        size: 18,
			                    },
				            }
						}
			        }
				
			};
		const canvas = document.getElementById('myChart').getContext('2d');
		 myBarChart = new Chart(canvas, {type: 'bar',
			 /* myBarChart = Chart.Bar(canvas, { */
			data : data,
			options : option
		});
		
	};
	
</script>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.6.2/chart.min.js" 
	integrity="sha512-tMabqarPtykgDtdtSqCL3uLVM0gS1ZkUAVhRFu1vSEFgvB73niFQWJuvviDyBGBH22Lcau4rHB5p2K2T0Xvr6Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
