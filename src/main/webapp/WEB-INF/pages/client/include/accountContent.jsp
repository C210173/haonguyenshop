<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<html>

		<head>
		</head>
		<script src="<c:url value='/js/client/information.js'/>"></script>
		<script src="<c:url value='/js/client/password.js'/>"></script>

		<script type="text/javascript">
			$(document).ready(function () {
				$(".mytable .tongGiaTri ").each(function () {
					var value = accounting.formatMoney($(this).text()) + ' $';
					console.log(value)
					$(this).html(value);
				});

			});
		</script>

		<body>

			<div class="container">
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<br>
						<p style="font-size: 20px">
							<b>Account information:</b>
						</p>
						<br>
						<h3 style="line-height: 2;">
							<span style="font-weight: bold">Name : </span>${user.getHoTen()}
						</h3>
						<h3 style="line-height: 2;">
							<span style="font-weight: bold">Phone number : </span>${user.getSoDienThoai()}
						</h3>
						<h3 style="line-height: 2;">
							<span style="font-weight: bold">Email : </span>${user.getEmail()}
						</h3>
						<h3 style="line-height: 2;">
							<span style="font-weight: bold">Address : </span>${user.getDiaChi()}
						</h3>
						<br> <a class="btn btn-primary" data-toggle="modal" data-target="#modalInformation">Update your
							personal information</a>
						&nbsp; &nbsp; &nbsp; <a class="btn btn-danger" data-toggle="modal"
							data-target="#modalChangePassword">Change Password</a> <br> <br>
						<br>
						<h3>
							<b>Purchase history :</b>
						</h3>
						<br>
						<table class="table-cart-checkout mytable">
							<tr>
								<th>Order code</th>
								<th>Date of purchase</th>
								<th>Delivery date</th>
								<th>Date of receipt</th>
								<th>Product</th>
								<th>Total payment</th>
								<th>Order Status</th>
							</tr>

							<c:forEach var="donHang" items="${list}" varStatus="loop">
								<tr style="text-align: center;">
									<td>${donHang.id}</td>
									<td>${donHang.ngayDatHang}</td>

									<td>${donHang.ngayGiaoHang}</td>

									<td>${donHang.ngayNhanHang}</td>

									<%-- <c:set var="tongGiaTri"
										value="${tongGiaTri + chiTiet.soLuongNhanHang*chiTiet.donGia}" /> --%>
									<td>
										<c:forEach var="chiTiet" items="${donHang.danhSachChiTiet}">
											<p>
												<a
													href='<c:url value="/sp?id=${chiTiet.sanPham.id}" />'>${chiTiet.sanPham.tenSanPham}</a><br>
											</p>

											<c:choose>
												<c:when
													test='${(donHang.trangThaiDonHang == "Đang chờ giao") || (donHang.trangThaiDonHang =="Đang giao")  }'>

													<p>Quantity : ${chiTiet.soLuongDat }</p>
													<hr>
													<c:set var="tongGiaTri"
														value="${tongGiaTri + chiTiet.soLuongDat*chiTiet.donGia}" />
												</c:when>
												<c:otherwise>
													<p>Quantity : ${chiTiet.soLuongNhanHang }</p>
													<hr>
													<c:set var="tongGiaTri"
														value="${tongGiaTri + chiTiet.soLuongNhanHang*chiTiet.donGia}" />
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</td>

									<td class="tongGiaTri">${tongGiaTri}</td>
									<td>${donHang.trangThaiDonHang}</td>
								</tr>
							</c:forEach>
						</table>

					</div>
					<div class="col-md-1"></div>
				</div>
			</div>
			<!-- Modal Update account information -->
			<div class="modal fade" id="modalInformation" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">
								<b>Update account information</b>
							</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>

						<div class="modal-body">
							<div class="form-group ">
								<label style="line-height: 2">Customer name *:</label><br>
								<label id="nameWarning" style="color: red"></label> <input class="form-control"
									id="name" name="name" type="text" value=${user.getHoTen()}>
							</div>
							<div class="form-group ">
								<label style="line-height: 2">Phone number *:</label><br> <label id="phoneWarning"
									style="color: red"></label> <input class="form-control" id="phone" name="phone"
									type="text" value=${user.getSoDienThoai()}>
							</div>
							<div class="form-group">
								<label style="line-height: 2">Address *:</label><br> <label id="addressWarning"
									style="color: red"></label>
								<textarea rows="3" cols="1" class="form-control"
									id="address">${user.getDiaChi()}</textarea>
							</div>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
							<button type="button" class="btn btn-primary" onclick="changeInformation()">Update</button>
						</div>

					</div>
				</div>
			</div>
			<!-- Modal Update account information -->

			<!-- Modal Change Password -->

			<div class="modal fade" id="modalChangePassword" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">
								<b>Change Password</b>
							</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="form-group ">
								<label style="line-height: 2">Old password *:</label><br> <label id="oldWarning"
									style="color: red"></label> <input class="form-control" id="old" name="old"
									type="password">
							</div>
							<div class="form-group ">
								<label style="line-height: 2">New password *:</label><br> <label id="new1Warning"
									style="color: red"></label> <input class="form-control" id="new1" name="new1"
									type="password">
							</div>
							<div class="form-group ">
								<label style="line-height: 2">Confirm New Password *:</label><br>
								<label id="new2Warning" style="color: red"></label> <input class="form-control"
									id="new2" name="new2" type="password">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
							<button type="button" class="btn btn-primary" onClick="changePass()">Change</button>
						</div>
					</div>
				</div>
			</div>

			<!-- Modal đổi pass -->


		</body>

		</html>