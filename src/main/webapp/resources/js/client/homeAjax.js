
function addToCart(id)
	{
		$.ajax({
			type: "GET",		
			url: "http://localhost:8080/haonguyenshop/api/gio-hang/addSanPham?id="+id,
			success: function(result){
				if(result.status == "false")
				{
					window.alert("The product is out of stock, please come back later");	
				}else
				{
					window.alert("Product added to cart");
				}		
			},
			error : function(e){
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
			url: "http://localhost:8080/haonguyenshop/api/san-pham/latest",
			success: function(result){
				var content;
				var section = '<div class="section group">';
				var endsection = '</div>'+'<br>';
				$.each(result, function(i, sanpham){
					
					if(i != result.length-1)
					{
						if(i%4==0)
						{
							content = '';
							content = '<div class="grid_1_of_4 images_1_of_4 products-info"><a href="sp?id='+sanpham.id+'">' +
									'<img style="width: 300px; height: 238px" src="/haonguyenshop/img/'+sanpham.id+'.png">' +
									'<h3 style="font-weight: bold;">'+sanpham.tenSanPham+'</h3></a>' +
									'<h3>'+accounting.formatMoney(sanpham.donGia)+' $</h3>'+
									'<button onClick="addToCart('+sanpham.id+')" class="btn cart-btn"><span class= "glyphicon glyphicon-shopping-cart pull-center"></span> Cart </button>'+
									'<h3></h3>'+
									'</div>';
						}else 
						{
							content = content+'<div class="grid_1_of_4 images_1_of_4 products-info"><a href="sp?id='+sanpham.id+'">' +
									'<img style="width: 300px; height: 238px" src="/haonguyenshop/img/'+sanpham.id+'.png">' +
									'<h3 style="font-weight: bold;">'+sanpham.tenSanPham+'</h3><a/>' +
									'<h3>'+accounting.formatMoney(sanpham.donGia)+' $</h3>'+
									'<button onClick="addToCart('+sanpham.id+')" class="btn cart-btn"><span class= "glyphicon glyphicon-shopping-cart pull-center"></span> Cart </button>'+
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
									'<img style="width: 300px; height: 238px" src="/haonguyenshop/img/'+sanpham.id+'.png">' +
									'<h3 style="font-weight: bold;">'+sanpham.tenSanPham+'</h3>></a>' +
									'<h3>'+accounting.formatMoney(sanpham.donGia)+' $</h3>'+
									'<button onClick="addToCart('+sanpham.id+')" class="btn cart-btn"><span class= "glyphicon glyphicon-shopping-cart pull-center"></span> Cart </button>'+
									'<h3></h3>'+
									'</div>';
							content = section + content + endsection;
							$('.content-grids').append(content);
						}else
						{
							content = content+'<div class="grid_1_of_4 images_1_of_4 products-info"><a href="sp?id='+sanpham.id+'">' +
									'<img style="width: 300px; height: 238px" src="/haonguyenshop/img/'+sanpham.id+'.png">' +
									'<h3 style="font-weight: bold;">'+sanpham.tenSanPham+'</h3></a>' +
									'<h3>'+accounting.formatMoney(sanpham.donGia)+' $</h3>'+
									'<button  onClick="addToCart('+sanpham.id+')" class="btn cart-btn"><span class= "glyphicon glyphicon-shopping-cart pull-center"></span> Cart </button>'+
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
