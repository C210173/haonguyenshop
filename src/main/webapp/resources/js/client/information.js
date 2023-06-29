function changeInformation()
{
	var name = document.getElementById("name").value;
	var phone = document.getElementById("phone").value;
	var address = document.getElementById("address").value;
	var flag = 0;
	if(name.length == 0)
	{
		flag = 1;
		document.getElementById("nameWarning").innerHTML = "Name cannot be left blank";	
	}
	if(phone.length == 0)
	{
		flag = 1;
		document.getElementById("phoneWarning").innerHTML = "Phone number can not be left blank";
	}
	if(address.length == 0)
	{
		flag = 1;
		document.getElementById("addressWarning").innerHTML = "Address cannot be left blank";	
	}
	var pat = "[0-9]+{9,10}"
	if(!/^([0-9]{9,10})$/.test(phone))
	{
		flag = 1;
		document.getElementById("phoneWarning").innerHTML = "Please enter a phone number from 9-10 numbers";
	}
	if(flag == 1)
	{
		return;
	}
	var send = new Object();
	send.hoTen = name;
	send.soDienThoai = phone;
	send.diaChi = address;
	var data = JSON.stringify(send)
	$.ajax({
			type: "POST",	
			data: data,	
			contentType : "application/json",
			url: "http://localhost:8080/haonguyenshop/updateInfo",
			success: function(result){
				alert("Information has been updated");
				window.location.href = "/haonguyenshop/account";
			},
			error : function(e){
				alert("Error: ",e);
				console.log("Error" , e );
			}
		});
	
}