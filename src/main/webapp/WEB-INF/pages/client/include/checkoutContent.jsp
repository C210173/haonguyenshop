<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<html>

		<head>

			<title>Payments</title>
		</head>

		<script type="text/javascript">
			$(document).ready(function () {
				$(".mytable .donGia .check").each(function () {
					var value = accounting.formatMoney($(this).text()) + ' $';
					$(this).html(value);
				});

				$(".mytable .total").each(function () {
					var value = accounting.formatMoney($(this).text()) + ' $';
					$(this).html(value);
				});
			});
		</script>

		<body>

			<div class="container">
				<form method="POST" action="<%=request.getContextPath()%>/thankyou">
					<div class="row">
						<br><br>
						<c:if test="${pageContext.request.userPrincipal.name != null}">
							<div class="col-md-3">
								<br>
								<p class="border-p" style="line-height:1.5;"><b>Account information</b></p>

								<p style="line-height:2;">Name</p>
								<input size="27" value="${user.hoTen}" disabled>

								<p style="line-height:2;">Email</p>
								<input size="27" value="${user.email}" disabled>

								<p style="line-height:2;">Phone number</p>
								<input size="27" value="${user.soDienThoai}" disabled>

								<p style="line-height:2;">Address</p>
								<textarea rows="5" cols="29" disabled>${user.diaChi}</textarea>

								<br><br>
							</div>
						</c:if>
						<div class="col-md-3">
							<br>
							<p class="border-p" style="line-height:1.5;"><b>Delivery information</b></p>

							<p style="line-height:2;">Consignee's full name *</p>
							<input size="27" name="hoTenNguoiNhan" required>

							<p style="line-height:2;">Phone number *</p>
							<input size="27" name="sdtNhanHang" required>


							<p style="line-height:2;">Address(house number, street, city) *</p>
							<textarea rows="5" cols="29" name="diaChiNhan" required></textarea>

							<br><br>
							<input type="hidden" id="tongGiaTri" name="tongGiaTri">
						</div>

						<div class="col-md-6">
							<br>
							<p class="border-p" style="line-height:1.5;"><b>Cart</b></p>
							<br>

							<table class="table-cart-checkout mytable">
								<tr>
									<th>Pictures</th>
									<th>Product's name</th>
									<th>Price</th>
									<th>Total</th>
								</tr>
								<c:forEach items="${cart}" var="sanpham">

									<tr style="text-align: center;">
										<td>
											<img src="/haonguyenshop/img/${sanpham.id}.png" alt="not found img"
												class="img-reponsive fix-size-img">
										</td>
										<td style="color:green">
											${sanpham.tenSanPham}
										</td>

										<td class="donGia">
											<div class="check " style="display: inline-block; ">${sanpham.donGia}</div>
											<div style="display: inline-block; "> x ${quanity[sanpham.id]}</div>
										</td>

										<td>
											<div class="total">${sanpham.donGia*quanity[sanpham.id]}</div>
										</td>
									</tr>
								</c:forEach>

							</table>


							<br>
							<p>Total value of order : <b id="ordertotal"> </b></p>
							<br>
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
							<a href="<%=request.getContextPath()%>/cart" class="btn btn-primary">Back to cart</a>
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;

							<button class="btn btn-danger pull-center" type="submit" id="submit">payment</button>

							<br><br>

						</div>

					</div>
				</form>
			</div>
			<script src="<c:url value='/js/client/checkoutAjax.js'/>"></script>
		</body>

		</html>