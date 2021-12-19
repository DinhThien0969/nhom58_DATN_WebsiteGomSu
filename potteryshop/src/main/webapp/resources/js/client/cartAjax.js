calculateOrder()
function changeQuanity(id,value,price)
	{ if(value>=20){
	$('#soLuongSp'+ id).val('20');
	value=20;
	calculatePrice(id,20,price);
				calculateOrder();
				allCalculateOrder();
	Swal.fire(
  'Thông báo',
  'Nếu bạn muốn mua số lượng lớn vui lòng liên hệ trực tiếp với cửa hàng',
  'info'
)}else if(/^\d+$/.test(value)==false ){
alert("Lỗi số lượng ");
$('#soLuongSp'+ id).val('1');
	value=1;
	calculatePrice(id,1,price);
				calculateOrder();
				allCalculateOrder();
}else if(value == null){
alert("Số lượng không được để trống");
$('#soLuongSp'+ id).val('1');
	value=1;
	calculatePrice(id,1,price);
				calculateOrder();
				allCalculateOrder();
}else if(value ==0){alert("Số lượng phải lớn hơn 0");
$('#soLuongSp'+ id).val('1');
	value=1;
	calculatePrice(id,1,price);
				calculateOrder();
				allCalculateOrder();}
		$.ajax({
			type: "GET",		
			url: "http://localhost:8080/potteryshop/api/gio-hang/changSanPhamQuanity?id="+id+"&value="+value,
			success: function(result){			
				calculatePrice(id,value,price);
				calculateOrder();
				allCalculateOrder();				
			},
			error : function(e){
				alert("Lỗi số lượng ",e);
				$('#soLuongSp'+ id).val('1');
				calculatePrice(id,1,price);
				calculateOrder();
				allCalculateOrder();
				console.log("Error" , e );
			}
		});
	}
	

function deleteFromCart(id)
{
	$.ajax({
		type: "GET",		
		url: "http://localhost:8080/potteryshop/api/gio-hang/deleteFromCart?id="+id,
		success: function(result){
		$("#here").load(window.location.href + " #here" );
		    var element = document.getElementById("item"+id);
			element.parentNode.removeChild(element);
			calculateOrder();
			allCalculateOrder();
		},
		error : function(e){
			alert("Error: ",e);
			console.log("Error" , e );
		}
	});
}
function deleteFromCartNew(id)
{
	$.ajax({
		type: "GET",		
		url: "http://localhost:8080/potteryshop/api/gio-hang/deleteFromCartNew?id="+id,
		success: function(result){
		$("#here").load(window.location.href + " #here" );
		    var element = document.getElementById("itemNew"+id);
			element.parentNode.removeChild(element);
			calculateOrderNew();
			allCalculateOrder();				
		},
		error : function(e){
			alert("Error: ",e);
			console.log("Error" , e );
		}
	});
}

function calculatePrice(id,value,price)
{
	var element = document.getElementById("item"+id+"_total");
	elementConvert=accounting.formatMoney(value * price);
	element.innerHTML = elementConvert ;
}
function calculatePriceNew(id,value,price)
{
	var element = document.getElementById("itemNew"+id+"_totalNew");

    elementConvert=accounting.formatMoney(value * price);
	element.innerHTML = elementConvert ;
}
function parseNumber(strg) {
    var strg = strg || "";
    var decimal = '.';
    strg = strg.replace(/[^0-9$.,]/g, '');
    if(strg.indexOf(',') > strg.indexOf('.')) decimal = ',';
    if((strg.match(new RegExp("\\" + decimal,"g")) || []).length > 1) decimal="";
if (decimal != "" && (strg.length - strg.indexOf(decimal) - 1 == 3) && strg.indexOf("0" + decimal)!==0) decimal = "";
    strg = strg.replace(new RegExp("[^0-9$" + decimal + "]","g"), "");
    strg = strg.replace(',', '.');
    return parseFloat(strg);
}

function changeQuanityNew(id,value,price)
	{

	if(value>=20){
	$('#soLuongSpNew'+ id).val('20');
	value=20
	calculatePriceNew(id,1,price);
				calculateOrderNew();
				allCalculateOrder();
	Swal.fire(
  'Thông báo',
  'Nếu bạn muốn mua số lượng lớn vui lòng liên hệ trực tiếp với cửa hàng',
  'info'
)}else if(/^\d+$/.test(value)==false ){
alert("Lỗi số lượng ");
$('#soLuongSpNew'+ id).val('1');
	value=1;
	calculatePriceNew(id,1,price);
				calculateOrderNew();
				allCalculateOrder();
}else if(value == null){
alert("Số lượng không được để trống");
$('#soLuongSpNew'+ id).val('1');
	value=1;
	calculatePriceNew(id,1,price);
				calculateOrderNew();
				allCalculateOrder();
}else if(value ==0){alert("Số lượng phải lớn hơn 0");
$('#soLuongSpNew'+ id).val('1');
	value=1;
	calculatePriceNew(id,1,price);
				calculateOrderNew();
				allCalculateOrder();}

$.ajax({
			type: "GET",		
			url: "http://localhost:8080/potteryshop/api/gio-hang/changSanPhamQuanityNew?id="+id+"&value="+value,
			success: function(result){
				calculatePriceNew(id,value,price);
				calculateOrderNew();
				console.log("sucessNew"+id,value,price);
				allCalculateOrder();	
			},
			error : function(e){
				alert("Lỗi số lượng ",e);
				console.log("Error" , e );
			}
		});
	}


function calculateOrder()
{
	var element = document.getElementsByClassName("total");
	var res = 0;
	for (i = 0; i < element.length; i++) {

res = res + parseNumber(element[i].textContent);
	}
	var element2 = document.getElementById("ordertotal");
	resConvert = accounting.formatMoney(res);
	element2.innerHTML = resConvert;
}

function calculateOrderNew()
{

var element = document.getElementsByClassName("totalNew");
	var res = 0;
	for (i = 0; i < element.length; i++) {
		res = res + parseNumber(element[i].textContent);
	}
	var element2 = document.getElementById("ordertotalNew");
	resConvert = accounting.formatMoney(res);
	element2.innerHTML = resConvert;
}

function allCalculateOrder()
		{		
var element1 =parseNumber( document.getElementById("ordertotal").textContent);
var element = document.getElementsByClassName("total");
var res = 0;
for (i = 0; i < element.length; i++) {
	res = res + parseNumber(element[i].textContent);
}
var element2 = document.getElementById("ordertotal");
resConvert = accounting.formatMoney(res);
element2.innerHTML = resConvert;

var elementNew = document.getElementsByClassName("totalNew");
var resNew = 0;
for (i = 0; i < elementNew.length; i++) {
	resNew = resNew + parseNumber(elementNew[i].textContent);
}
var element2New = document.getElementById("ordertotalNew");
resConvertNew = accounting.formatMoney(resNew);
element2New.innerHTML = resConvertNew;
var totalAllOrder = document.getElementById("myElementJS");	       
	      totalAllOrderConvert = accounting.formatMoney(parseNumber(resConvert)+ parseNumber(resConvertNew));
	      totalAllOrder.innerHTML = totalAllOrderConvert;
	       
		  console.log("Old" , parseNumber(resConvert));
		  console.log("New" , parseNumber(resConvertNew));}
$('myElementJS').innerHTML = allCalculateOrder();
