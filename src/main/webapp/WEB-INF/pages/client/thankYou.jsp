<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<html>

		<head>
			<script src="Frontend/js/jquery.min.js"></script>
			<script src="Frontend/js/responsiveslides.min.js"></script>
			<script src="js/client/accounting.js"></script>
			<title>Payment</title>
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

			<!----start-Header---->
			<jsp:include page="include/homeHeader.jsp"></jsp:include>
			<!----End-Header---->

			<div class="container">
				<div class="row">
					<div class="col-md-1">
					</div>
					<div class="col-md-10">
						<br>
						<p><b>YOUR ORDER SUCCESSFULLY</b></p><br>

						<p>Ordered information:</p><br>
						<p><b>ID/Code orders: </b> ${donhang.getId() }</p><br>
						<p><b>Consignee's name:</b> ${donhang.getHoTenNguoiNhan()}</p><br>
						<p><b>Phone number:</b>${donhang.getSdtNhanHang()}</p><br>
						<p><b>Address:</b>${donhang.getDiaChiNhan()}</p><br>
						<p><b>Notes:</b>${donhang.getGhiChu() } </p><br>
						<p>At ${donhang.getNgayDatHang()} we have received an order for the following products:</p><br>



						<table class="table-cart-checkout mytable">
							<tr>
								<th>Image</th>
								<th>Product's name</th>
								<th>price</th>
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
						<p>Total value of order: <b id="ordertotal"> </b></p>
						<br>

						<p>HaoNguyenShop would like to thank our customers for trusting our services and products</p>
						<br>
						<a href="<%=request.getContextPath()%>/">Click here to continue shopping</a>
					</div>
					<div class="col-md-1">
					</div>

				</div>

			</div>
			<!----start-Footder---->
			<jsp:include page="include/homeFooter.jsp"></jsp:include>
			<!----End-Footder---->
			<script src="<c:url value='/js/client/checkoutAjax.js'/>"></script>
		</body>

		</html>