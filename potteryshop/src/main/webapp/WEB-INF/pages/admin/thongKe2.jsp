<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Thống kê số lượng sản phẩm</title>
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
		<h4 style="text-align: center; padding-right: 10%">Biểu đồ số lượng đơn hàng hoàn thành theo tháng</h4>

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
			url : "http://localhost:8080/potteryshop/api/don-hang/report/so-luong-theo-san-pham/"+month,
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					label.push(data[i][3]);
					dataForDataSets.push(data[i][5]);
				}
			},
			error : function(e) {
				alert("Error: ", e);
				console.log("Error", e);
			}
		});

		
		data = {
			labels : label,
			datasets : [ {
				label : "Tổng số lượng ",
				backgroundColor : "#0000ff",
				borderColor : "#0000ff",
				borderWidth : 2,
				hoverBackgroundColor : "#0043ff",
				hoverBorderColor : "#0043ff",
				data : dataForDataSets,
			} ]
		};
		var option = {
			scales : {
				yAxes : [ {
					stacked : true,
					gridLines : {
						display : true,
						color : "rgba(255,99,132,0.2)"
					}
				} ],
				xAxes : [ {
					barPercentage: 0.5,
					gridLines : {
						display : false
					}
				} ]
			},
			maintainAspectRatio: false,
			legend: {
	            labels: {
	                // This more specific font property overrides the global property
	                fontSize: 20
	            }
			}
		};
var canvas = document.getElementById('myChart');
		myBarChart = Chart.Bar(canvas, {
			data : data,
			options : option
		});
		
	};
	
</script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.3/Chart.min.js"></script>
</body>
</html>
