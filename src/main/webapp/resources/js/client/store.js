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
		
		itemCount ++;
		$('#itemCount').html(itemCount).css('display', 'block');
		
	}