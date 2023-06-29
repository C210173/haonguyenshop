$(document).ready(function() {
	
	// load first when coming page
	ajaxGet(1);	
	
	function ajaxGet(page){		
		var data = { trangThaiLienHe : $('.trangThai').val(), tuNgay: $('#fromDate').val(), denNgay: $('#toDate').val()  } 
		$.ajax({
			type: "GET",		
			data: data,
			contentType : "application/json",
			url: "http://localhost:8080/haonguyenshop/api/lien-he/all" + '?page=' + page,
			success: function(result){
				$.each(result.content, function(i, lienHe){
					var lienHeRow = '<tr>' +
					                  '<td>' + lienHe.id+ '</td>' +
					                  '<td>' + lienHe.emailLienHe + '</td>' +
					                  '<td>' + lienHe.ngayLienHe + '</td>' +
					                  '<td>' + lienHe.trangThai + '</td>' +
					                  '<td>' + lienHe.ngayTraLoi + '</td>';
				
					        lienHeRow += '<td width="0%">'+'<input type="hidden" id="lienHeId" value=' + lienHe.id + '>'+ '</td>'+
					                  '<td><button class="btn btn-primary btnChiTiet" >Detail</button>' +
                                      '&nbsp; <button class="btn btn-warning btnTraLoi" >Reply</button></td>';
					                  
					$('.lienHeTable tbody').append(lienHeRow);
					
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
	
	
	$(document).on('click', '#btnDuyetLienHe', function (event) {
		event.preventDefault();
		console.log("123");
		resetData();
	});	
	
    // reset table after post, put, filter
    function resetData(){   	
    	var page = $('li.active').children().text();
    	$('.lienHeTable tbody tr').remove();
    	$('.pagination li').remove();
        ajaxGet(page);
    };
    
    // event khi click vào phân trang Đơn hàng
	$(document).on('click', '.pageNumber', function (event){
//		event.preventDefault();
		var page = $(this).text();	
    	$('.lienHeTable tbody tr').remove();
    	$('.pagination li').remove();
    	ajaxGet(page);	
	});
	
	// btnChiTiet click event
	$(document).on('click', '.btnChiTiet', function (event){
		event.preventDefault();
		var lienHeId =  $(this).parent().prev().children().val();
		var href = "http://localhost:8080/haonguyenshop/api/lien-he/"+lienHeId;
		$.get(href, function(lienHe) {
			$('#noiDungLienHe').html("<strong>Contact content</strong>: <br> "+ lienHe.noiDungLienHe);
			$('#ngayLienHe').html("<strong>Contact date</strong>: "+ lienHe.ngayLienHe);
			$('#email').html("<strong>Contact email</strong>: "+ lienHe.emailLienHe);
			$('#trangThai').html("<strong>Status</strong>: "+ lienHe.trangThai);
			
			if(lienHe.trangThai == "Answered"){
			  $('#noiDungTraLoi').html("<strong>Reply content</strong>: "+ lienHe.noiDungTraLoi);
			  $('#ngayTraLoi').html("<strong>Reply Date</strong>: "+ lienHe.ngayTraLoi);
			} else {
			    $('#noiDungTraLoi').html("");
			    $('#ngayTraLoi').html("");	
			}
		});		
		
		$("#chiTietModal").modal();
	});
	
	
	// btnChiTiet click event
	$(document).on('click', '.btnTraLoi', function (event){
		event.preventDefault();
		var lienHeId =  $(this).parent().prev().children().val();
		var href = "http://localhost:8080/haonguyenshop/api/lien-he/"+lienHeId;
		$.get(href, function(lienHe) {
			$('#ndLienHe').val(lienHe.noiDungLienHe);
			$('#emailLienHe').val(lienHe.emailLienHe);
		});
		$('input[name=lienHeId]').val(lienHeId);
		$("#lienHeModal").modal();
	});
	
    $(document).on('click', '.btnSubmitTraLoi', function (event) {
    	event.preventDefault();
    	ajaxPostReply();
		resetData();
    });
    
	function ajaxPostReply(){
    	// PREPARE FORM DATA
    	var formData = { id : $('input[name=lienHeId]').val(),
    			         noiDungTraLoi : $('textarea[name=noiDungTraLoi]').val(),
    	                 tieuDe : "Reply contact:" + $('textarea[name=noiDungLienHe]').val(),
    			         diaChiDen: $('input[name=emailLienHe]').val()} ;
    	console.log(formData);
    	// DO POST
    	$.ajax({
    		async:false,
			type : "POST",
			contentType : "application/json",
			url : "http://localhost:8080/haonguyenshop/api/lien-he/reply",
			data : JSON.stringify(formData),
			success : function(response) {
				if(response.status == "success"){
					$('#lienHeModal').modal('hide');
					alert("Reply successfully");
				} else {
			    	$('textarea').next().remove();
		            $.each(response.errorMessages, function(key,value){
		   	            $('textarea[name='+ key +']').after('<span class="error">'+value+'</span>');
		            });
				}
		    	
			},
			error : function(e) {
				alert("Can't Reply! try again")
				console.log("ERROR: ", e);
			}
		}); 
    };
    
	// event khi hide modal
	$('#lienHeModal').on('hidden.bs.modal', function () {
		$('textarea').next().remove();
	});
    
});