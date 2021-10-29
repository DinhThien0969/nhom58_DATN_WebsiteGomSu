
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="Frontend/css/cartTable.css">
<style>
html
{
    font-size: 100%;
}
</style>
</head>
<script type="text/javascript">	  
	$(document).ready(function() { 
	 
		 $(".table-convert-price .covertPriceProduct").each(function() {
			  var value = accounting.formatMoney($(this).text())+ ' VND';
			  $(this).html(value);
			});
		 $(".table-convert-price .total").each(function() {
			  var value = accounting.formatMoney($(this).text());
			  $(this).html(value);
			});
		 
	  });
	</script>

<body>
<br>
<br>
<div class="container">
  <div class="row">
  <h2 style="">  QUẢN LÝ GIỎ HÀNG</h2> <br>
  <div class="col-10">
  <table class="table-cart-checkout mytable table-convert-price" >
 <tr>
		<td>STT</td>
		<td>Ảnh</td>
		<td>Tên sản phẩm</td>
		<td>Đơn giá</td>
		<td>Số lượng</td>
		<td>Tổng</td>
		<td>Xóa</td>
</tr>
<c:forEach var="sanpham" items="" varStatus="loop">			
<tr class="cart_line" id="">
		<div>
		<td></td>
		<td><img src="" style="width: 150px" class="cart-img"></td>
		<td style="text-align: center; mergin-top: -52px;">
			<p class="cart_ten"><a href=""></a></p>
			<p class="cart_masanpham">Mã sản phẩm : <span></span></p>
			<p class="">Bảo hành : </p>
		</td>
		<td class="covertPriceProduct"></td>
		<td>
			<input class="input_num_cart" type="number" value=""  onChange="">
		</td>
		<td><b><span class="total" id="" name="total_price"></span> VND</b></td>
		<td class="cart-img">
			<a class="btn btn-danger" onClick=""><span class="glyphicon glyphicon-trash"></span></a>
		</td>
		</div>
	
</tr>
</c:forEach>
<tr>
		<c:if test="">
		<td colspan="3">
		<a class="btn btn-primary" href=""><span class="glyphicon glyphicon-hand-left"></span> Mua thêm sản phẩm khác</a>
		&nbsp;  &nbsp;  &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		<a class="btn btn-warning " href=""><span class="glyphicon glyphicon-check"></span> Thanh toán</a>
		</td>
		</c:if>
		
		<c:if test="">
		<td colspan="3">
		<a class="btn btn-primary" href="">Mua thêm sản phẩm khác</a>
		</td>
		</c:if>
		
		
		<td colspan="4">
			<p class="cart_tongdonhang">Tổng giá trị đơn hàng : <span id="ordertotal"></span> VND</p>
		</td>
</tr>

</table>
  
</div>  
  
  <div class="col-xs-1">
  
  </div>
  
  </div>
</div>

<script src="<c:url value='/js/client/cartAjax.js'/>" ></script>	 

</body>
</html>