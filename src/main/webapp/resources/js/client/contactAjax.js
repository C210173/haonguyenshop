function sendContact()
{
	var email =  document.getElementById("email").value;
	var content = document.getElementById("content").value;
	var flag = 0;
	if(!/^[^0-9][A-z0-9_]+([.][A-z0-9_]+)*[@][A-z0-9_]+([.][A-z0-9_]+)*[.][A-z]{2,4}$/.test(email))
	{
		document.getElementById("emailWarning").innerHTML = "Email is wrong format";	
		flag = 1;		
	}
	if(content.length == 0)	
	{
		document.getElementById("contentWarning").innerHTML = "Need to fill in the content";	
		flag = 1;	
	}	
	if(flag == 1)
	{
		return;
	}
	var send = new Object();
	send.emailLienHe = email;
	send.noiDungLienHe = content;
	send.trangThai = 'Waiting for reply';
	var data = JSON.stringify(send)
	$.ajax({
			type: "POST",	
			data: data,	
			contentType : "application/json",
			url: "http://localhost:8080/haonguyenshop/createContact",
			success: function(result){
				alert("Thank you for contacting us. HaoNguyenshop will reply to you soon!");
				window.location.href = "/haonguyenshop/contact";
			},
			error : function(e){
				alert("Error: ",e);
				console.log("Error" , e );
			}
		});
}