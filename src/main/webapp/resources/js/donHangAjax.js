$(document).ready(function() {
	
	// load first when coming page
	ajaxGet(1);	
	
	function ajaxGet(page){		
		var data = { trangThai : $('#trangThai').val(), tuNgay: $('#fromDate').val(), denNgay: $('#toDate').val()  } 
		$.ajax({
			type: "GET",		
			data: data,
			contentType : "application/json",
			url: "http://localhost:8080/haonguyenshop/api/don-hang/all" + '?page=' + page,
			success: function(result){
				$.each(result.content, function(i, donHang){
					// tính giá trị đơn hàng\
					var sum = 0;
					var check = donHang.trangThaiDonHang == "complete" || donHang.trangThaiDonHang == "Waiting for approval";
					if(check){
						$.each(donHang.danhSachChiTiet, function(i, chiTiet){
							sum += chiTiet.donGia * chiTiet.soLuongNhanHang;
						});
					} else {
						$.each(donHang.danhSachChiTiet, function(i, chiTiet){
							sum += chiTiet.donGia * chiTiet.soLuongDat;
						});
					}

					var donHangRow = '<tr>' +
					                  '<td>' + donHang.id+ '</td>' +
					                  '<td>' + donHang.hoTenNguoiNhan + '</td>' +
					                  '<td>' + donHang.trangThaiDonHang + '</td>' +
					                  '<td>' + sum + '</td>' +
					                  '<td>' + donHang.ngayDatHang + '</td>' +
					                  '<td>' + donHang.ngayGiaoHang + '</td>' +
					                  '<td>' + donHang.ngayNhanHang + '</td>' +
					                  '<td width="0%">'+'<input type="hidden" class="donHangId" value=' + donHang.id + '>'+ '</td>'+
					                  '<td><button class="btn btn-warning btnChiTiet" >Detail</button>';
					     if(donHang.trangThaiDonHang == "Waiting for delivery" || donHang.trangThaiDonHang == "Delivering"){
					    	 donHangRow += ' &nbsp;<button class="btn btn-primary btnPhanCong">Assignment</button>'+
					    	               ' &nbsp;<button class="btn btn-danger btnHuy">Cancel</button>' ;
					     } else if (donHang.trangThaiDonHang == "Waiting for approval"){
					         donHangRow += ' &nbsp;<button class="btn btn-primary btnCapNhat" >Update</button> </td>';
					     }
					                  
					$('.donHangTable tbody').append(donHangRow);
					
					$('td').each( function(i){
						if ($(this).html() == 'null'){
							$(this).html('');
						}
					});
				});
								
				if(result.totalPages > 1 ){
					for(var numberPage = 1; numberPage <= result.totalPages; numberPage++) {
						var li = '<li class="page-item "><a class="pageNumber">'+numberPage+'</a></li>';
					    $('.pagination').append(li);
					};				
					
					// active page pagination
			    	$(".pageNumber").each(function(index){	
			    		if($(this).text() == page){
			    			$(this).parent().removeClass().addClass("page-item active");
			    		}
			    	});
				};
			},
			error : function(e){
				alert("Error: ",e);
				console.log("Error" , e );
			}
		});
	};
	
	
    // event khi click vào button Detail đơn
	$(document).on('click', '.btnPhanCong', function (event){
		event.preventDefault();
		var donHangId = $(this).parent().prev().children().val();	
		$("#donHangId").val(donHangId);
		console.log(donHangId);
		$("#phanCongModal").modal();
	});
	
	$(document).on('click', '#btnPhanCongSubmit', function (event) {
		var email = $("select[name=shipper]").val();
		var donHangId = $("#donHangId").val();
        console.log(donHangId);
		ajaxPostPhanCongDonHang(email, donHangId)

	});	
	
	function ajaxPostPhanCongDonHang(email, donHangId) { 

    	 $.ajax({
     		async:false,
 			type : "POST",
 			contentType : "application/json",
 			url : "http://localhost:8080/haonguyenshop/api/don-hang/assign?shipper="+email+"&donHangId="+donHangId,
 			enctype: 'multipart/form-data',
 	        
 			success : function(response) {
 				alert("Assignment order allocation successful");
 				var trangThai = $('#trangThai').val();
			    location.href = window.location.href;
 			},
 			error : function(e) {
 				alert("Error!")
 				console.log("ERROR: ", e);
 			}
 		}); 
    }	
		
	$(document).on('click', '#btnDuyetDonHang', function (event) {
		event.preventDefault();
		resetData();
	});	
	
    // reset table after post, put, filter
    function resetData(){   	
    	var page = $('li.active').children().text();
    	$('.donHangTable tbody tr').remove();
    	$('.pagination li').remove();
        ajaxGet(page);
    };
    
    // event khi click vào phân trang Đơn hàng
	$(document).on('click', '.pageNumber', function (event){
//		event.preventDefault();
		var page = $(this).text();	
    	$('.donHangTable tbody tr').remove();
    	$('.pagination li').remove();
    	ajaxGet(page);	
	});
	
    // event khi click vào button Detail đơn
	$(document).on('click', '.btnChiTiet', function (event){
		event.preventDefault();
		
		var donHangId = $(this).parent().prev().children().val();	
//		console.log(donHangId);
		var href = "http://localhost:8080/haonguyenshop/api/don-hang/"+donHangId;
		$.get(href, function(donHang) {
			$('#maDonHang').text("Order code: "+ donHang.id);
			$('#hoTenNguoiNhan').text("Receiver: "+ donHang.hoTenNguoiNhan);
			$('#sdtNhanHang').text("Phone number: "+ donHang.sdtNhanHang);
			$('#diaChiNhan').text("Address: "+ donHang.diaChiNhan);
			$('#trangThaiDonHang').text("Status: "+ donHang.trangThaiDonHang);
			$("#ngayDatHang").text("Order date: "+ donHang.ngayDatHang);
			
			if(donHang.ngayGiaoHang != null){
				$("#ngayShipHang").text("Delivery date: "+ donHang.ngayGiaoHang);
			}
			
			if(donHang.ngayNhanHang != null){
				$("#ngayNhanHang").text("Received date: "+ donHang.ngayNhanHang);
			}
			
			if(donHang.ghiChu != null){
				$("#ghiChu").html("<strong>Note: </strong>:<br> "+ donHang.ghiChu);
			}
			
			if(donHang.nguoiDat != null){
				$("#nguoiDat").html("<strong>Orderer</strong>:  "+ donHang.nguoiDat.hoTen);
			}
			
			if(donHang.shipper != null){
				$("#shipper").html("<strong>Shipper</strong>: "+ donHang.shipper.hoTen);
			}
			 
			var check = donHang.trangThaiDonHang == "complete" || donHang.trangThaiDonHang == "Waiting for approval" ;
			if(check){
				$('.chiTietTable').find('thead tr').append('<th id="soLuongNhanTag" class="border-0 text-uppercase small font-weight-bold"> amount received </th>');
			}
			// thêm bảng:
			var sum = 0; // tổng giá trị đơn
			var stt = 1;
			$.each(donHang.danhSachChiTiet, function(i, chiTiet){
				var chiTietRow = '<tr>' +
				'<td>' + stt + '</td>' +
                '<td>' + chiTiet.sanPham.tenSanPham + '</td>' +
                '<td>' + chiTiet.donGia + '</td>'+
                '<td>' + chiTiet.soLuongDat+ '</td>';

				if(check){
					chiTietRow += '<td>' + chiTiet.soLuongNhanHang + '</td>';
					sum += chiTiet.donGia * chiTiet.soLuongNhanHang;
				} else {
	                sum += chiTiet.donGia * chiTiet.soLuongDat;
				}
	             
				$('.chiTietTable tbody').append(chiTietRow);
                stt++;
	    	  });		

			$("#tongTien").text("Total : "+ sum);
		});
		$("#chiTietModal").modal();
	});
	
	
    // event khi click vào nhấn phím vào ô tìm kiếm đơn hàng theo id
	$(document).on('keyup', '#searchById', function (event){
		event.preventDefault();
		var donHangId = $('#searchById').val();
		console.log(donHangId);
		if(donHangId != ''){
    	  $('.donHangTable tbody tr').remove();
    	  $('.pagination li').remove();
		  var href = "http://localhost:8080/haonguyenshop/api/don-hang/"+donHangId;
		  $.get(href, function(donHang) {
				// tính giá trị đơn hàng
			  var sum = 0;
			  var check = donHang.trangThaiDonHang == "complete" || donHang.trangThaiDonHang == "Waiting for approval";
			  
				if(check){
					$.each(donHang.danhSachChiTiet, function(i, chiTiet){
						sum += chiTiet.donGia * chiTiet.soLuongNhanHang;
					});
				} else {
					$.each(donHang.danhSachChiTiet, function(i, chiTiet){
						sum += chiTiet.donGia * chiTiet.soLuongDat;
					});
				}	  
				
			 var donHangRow = '<tr>' +
             '<td>' + donHang.id+ '</td>' +
             '<td>' + donHang.hoTenNguoiNhan + '</td>' +
             '<td>' + donHang.trangThaiDonHang + '</td>' +
             '<td>' + sum + '</td>' +
             '<td>' + donHang.ngayDatHang + '</td>' +
             '<td>' + donHang.ngayGiaoHang + '</td>' +
             '<td>' + donHang.ngayNhanHang + '</td>' +
             '<td width="0%">'+'<input type="hidden" id="donHangId" value=' + donHang.id + '>'+ '</td>'+
             '<td><button class="btn btn-primary btnChiTiet" >Detail</button>';
			
			 if(donHang.trangThaiDonHang == "Waiting for delivery" || donHang.trangThaiDonHang == "Delivering"){
		    	 donHangRow += ' &nbsp;<button class="btn btn-danger btnPhanCong">Assignment</button>';
		     } else if (donHang.trangThaiDonHang == "Waiting for approval"){
		         donHangRow += ' &nbsp;<button class="btn btn-warning btnCapNhat" >Update</button> </td>';
		     }
            
             $('.donHangTable tbody').append(donHangRow);
			 $('td').each( function(i){
				if ($(this).html() == 'null'){
					$(this).html('');
				}
			 });             
		  });
		} else {
			resetData();
		}
	});
	
    // event khi click vào button Update đơn
	$(document).on('click', '.btnCapNhat', function (event){
		event.preventDefault();
		var donHangId = $(this).parent().prev().children().val();	
		$("#idDonHangXacNhan").val(donHangId);
		var href = "http://localhost:8080/haonguyenshop/api/don-hang/"+donHangId;
		$.get(href, function(donHang) {
			// thêm bảng:
			var stt = 1;
			$.each(donHang.danhSachChiTiet, function(i, chiTiet){
				var chiTietRow = '<tr>' +
				'<td>' + stt + '</td>' +
                '<td>' + chiTiet.sanPham.tenSanPham + '</td>' +
                '<td>' + chiTiet.donGia + '</td>'+
                '<td>' + chiTiet.soLuongDat + '</td>'+
                '<td>' + chiTiet.soLuongNhanHang + '</td>'+
                '<td><input type="hidden" value="'+chiTiet.id+'" ></td>'
				 $('.chiTietTable tbody').append(chiTietRow);
                stt++;
	    	  });		
			var sum = 0;
			$.each(donHang.danhSachChiTiet, function(i, chiTiet){
				sum += chiTiet.donGia * chiTiet.soLuongNhanHang;
			});
			$("#tongTienXacNhan").text("Total : "+ sum);
		});
		$("#capNhatTrangThaiModal").modal();
	});
		
    $(document).on('click', '#btnXacNhan', function (event) {
    	event.preventDefault();
    	ajaxPostXacNhanHoanThanh();
		resetData();
    });
    
	// post request xác nhận complete đơn hàng
	function ajaxPostXacNhanHoanThanh() { 
    	 $.ajax({
     		async:false,
 			type : "POST",
 			contentType : "application/json",
 			url : "http://localhost:8080/haonguyenshop/api/don-hang/update?donHangId="+$("#idDonHangXacNhan").val()+"&ghiChu="+$("#ghiChuAdmin").val(),
 			enctype: 'multipart/form-data',
			success : function(response) {
				$("#capNhatTrangThaiModal").modal('hide');
				alert("Confirmation of successful order completion");
			},
			error : function(e) {
				alert("Error!")
				console.log("ERROR: ", e);
			}
		}); 
    }	
	
    $(document).on('click', '.btnHuy', function (event) {
    	event.preventDefault();
		var donHangId = $(this).parent().prev().children().val();
		var confirmation = confirm("Are you sure you want to cancel this order?");
		if(confirmation){	 
    	    ajaxPostHuyDon(donHangId);
    		resetData();
		}
    });
    
	// post request xác nhận hủy đơn hàng
	function ajaxPostHuyDon(donHangId) { 
    	 $.ajax({
     		async:false,
 			type : "POST",
 			contentType : "application/json",
 			url : "http://localhost:8080/haonguyenshop/api/don-hang/cancel?donHangId="+donHangId,
			success : function(response) {
				alert("Canceled order successfully");
			},
			error : function(e) {
				alert("Error!")
				console.log("ERROR: ", e);
			}
		}); 
    }	
	
	// event khi ẩn modal Detail
	$('#chiTietModal,#capNhatTrangThaiModal').on('hidden.bs.modal', function(e) {
		e.preventDefault();
		$("#chiTietForm p").html(""); // reset text thẻ p
		$("#capNhatTrangThaiForm h4").text(""); 
		$("#ghiChuAdmin").text("");
		$('.chiTietTable #soLuongNhanTag').remove();		
		$('.chiTietTable tbody tr').remove();
		$('.chiTietCapNhatTable tbody tr').remove();
	});
});