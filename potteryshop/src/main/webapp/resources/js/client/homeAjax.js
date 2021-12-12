function addToCart(id)
	{$.ajax({
			type: "GET",		
			url: "http://localhost:8080/potteryshop/api/gio-hang/addSanPham?id="+id,
			success: function(result){
			console.log(result.status );
				if(result.status == "false")
				{
					Swal.fire(
  'Thông báo',
  'Sản phẩm đang hết hàng, quý khách vui lòng quay lại sau',
  'warning'
)	
				}else if(result.status == "max")
				{
				Swal.fire(
  'Thông báo',
  'Nếu bạn muốn mua số lượng lớn vui lòng liên hệ trực tiếp với cửa hàng',
  'info'
)}
				else
				{ $("#here").load(window.location.href + " #here" );
				
					Swal.fire(
  'Thông báo',
  'Đã thêm sản phẩm vào giỏ hàng',
  'success'
)
				}		
			},error : function(e){
				alert("Error: ",e);
				console.log("Error" , e );
			}
		});	
	}
$(document).ready(function(){
	ajaxGet();

	function ajaxGet(){
		$.ajax({
			type: "GET",		
			url: "http://localhost:8080/potteryshop/api/san-pham/latest",
			success: function(result){
				var content;
				var section = '<div class="section group">';
				var endsection = '</div>'+'<br>';
				$.each(result, function(i, sanpham){					
					if(i != result.length-1)
					{if(i%4==0)
						{content = '';
							content = '<div class="grid_1_of_4 images_1_of_4 products-info"><a href="sp?id='+sanpham.id+'">' +
									'<img style="width: 300px; height: 238px" src="/potteryshop/img/'+sanpham.id+'.png">' +
									'<h3 style="font-weight: bold;">'+sanpham.tenSanPham+'</h3></a>' +
									'<h3 style="color: #941313;font-weight: bold">'+accounting.formatMoney(sanpham.donGia)+' VND</h3>'+
									'<button style="background-color: #4d9d45;" onClick="addToCart('+sanpham.id+')" class="btn btn-warning"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart-plus-fill" viewBox="0 0 16 16"> <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM9 5.5V7h1.5a.5.5 0 0 1 0 1H9v1.5a.5.5 0 0 1-1 0V8H6.5a.5.5 0 0 1 0-1H8V5.5a.5.5 0 0 1 1 0z"/> </svg> Giỏ hàng</button>'+
									'<h3></h3>'+
									'</div>';
						}else{
							content = content+'<div class="grid_1_of_4 images_1_of_4 products-info"><a href="sp?id='+sanpham.id+'">' +
									'<img style="width: 300px; height: 238px" src="/potteryshop/img/'+sanpham.id+'.png">' +
									'<h3 style="font-weight: bold;">'+sanpham.tenSanPham+'</h3><a/>' +
									'<h3 style="color: #941313;font-weight: bold">'+accounting.formatMoney(sanpham.donGia)+' VND</h3>'+
									'<button style="background-color: #4d9d45;" onClick="addToCart('+sanpham.id+')" class="btn btn-warning"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart-plus-fill" viewBox="0 0 16 16"> <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM9 5.5V7h1.5a.5.5 0 0 1 0 1H9v1.5a.5.5 0 0 1-1 0V8H6.5a.5.5 0 0 1 0-1H8V5.5a.5.5 0 0 1 1 0z"/> </svg> Giỏ hàng</button>'+
									'<h3></h3>'+
									'</div>';
							if(i%4==3)
							{
								content = section + content + endsection;
								$('.content-grids').append(content);
							}				
						}
					}else
					{
						if(i%4==0)
						{
							content = '';
							content = '<div class="grid_1_of_4 images_1_of_4 products-info"><a href="sp?id='+sanpham.id+'">' +
									'<img style="width: 300px; height: 238px" src="/potteryshop/img/'+sanpham.id+'.png">' +
									'<h3 style="font-weight: bold;">'+sanpham.tenSanPham+'</h3>></a>' +
									'<h3 style="color: #941313;font-weight: bold">'+accounting.formatMoney(sanpham.donGia)+' VND</h3>'+
									'<button style="background-color: #4d9d45;" onClick="addToCart('+sanpham.id+')" class="btn btn-warning"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart-plus-fill" viewBox="0 0 16 16"> <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM9 5.5V7h1.5a.5.5 0 0 1 0 1H9v1.5a.5.5 0 0 1-1 0V8H6.5a.5.5 0 0 1 0-1H8V5.5a.5.5 0 0 1 1 0z"/> </svg> Giỏ hàng</button>'+
									'<h3></h3>'+
									'</div>';
							content = section + content + endsection;
							$('.content-grids').append(content);
						}else
						{
							content = content+'<div class="grid_1_of_4 images_1_of_4 products-info"><a href="sp?id='+sanpham.id+'">' +
									'<img style="width: 300px; height: 238px" src="/potteryshop/img/'+sanpham.id+'.png">' +
									'<h3 style="font-weight: bold;">'+sanpham.tenSanPham+'</h3></a>' +
									'<h3 style="color: #941313;font-weight: bold">'+accounting.formatMoney(sanpham.donGia)+' VND</h3>'+
									'<button style="background-color: #4d9d45;"  onClick="addToCart('+sanpham.id+')" class="btn btn-warning"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart-plus-fill" viewBox="0 0 16 16"> <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM9 5.5V7h1.5a.5.5 0 0 1 0 1H9v1.5a.5.5 0 0 1-1 0V8H6.5a.5.5 0 0 1 0-1H8V5.5a.5.5 0 0 1 1 0z"/> </svg> Giỏ hàng</button>'+
									'<h3></h3>'+
									'</div>';
							content = section + content + endsection;
							$('.content-grids').append(content);
						}
					}
				});
			},
			error : function(e){
				alert("Error: ",e);
				console.log("Error" , e );
			}
		});
	}
	
	
	
})

