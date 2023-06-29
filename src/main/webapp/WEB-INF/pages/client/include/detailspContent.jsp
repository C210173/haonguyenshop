<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<head>
			<link rel="stylesheet" href="Frontend/css/detailsp.css">
		</head>
		<script type="text/javascript">
			$(document).ready(function () {
				var priceConvert = accounting.formatMoney(${ sp.getDonGia() }) + ' $';
				document.getElementById("priceConvert").innerHTML = priceConvert;

			});
		</script>

		<body>
			<div class="container">
				<div class="card">
					<div class="container-fliud">
						<div class="wrapper row">
							<div class="preview col-md-6">

								<div class="preview-pic tab-content">
									<div class="tab-pane active" id="pic-1"><img
											src="/haonguyenshop/img/${sp.getId()}.png" /></div>
								</div>
							</div>
							<div class="details col-md-6">
								<p style="display:none" id="spid">${sp.getId()}</p>
								<h2 class="product-title">${sp.getTenSanPham()}</h2>
								<h4 class="price">Product Description</h4>
								<c:if test="${sp.getCpu().length() > 0}">
									<p class="product-description">CPU: ${sp.getCpu()}</p>
								</c:if>
								<c:if test="${sp.getRam().length() > 0}">
									<p class="product-description">RAM: ${sp.getRam()}</p>
								</c:if>
								<c:if test="${sp.getThietKe().length() > 0}">
									<p class="product-description">Design: ${sp.getThietKe()}</p>
								</c:if>
								<c:if test="${sp.getHeDieuHanh().length() > 0}">
									<p class="product-description">OS: ${sp.getHeDieuHanh()}</p>
								</c:if>
								<c:if test="${sp.getManHinh().length() > 0}">
									<p class="product-description">Display: ${sp.getManHinh()}</p>
								</c:if>
								<c:if test="${sp.getDungLuongPin().length() > 0}">
									<p class="product-description">Battery capacity: ${sp.getDungLuongPin()}</p>
								</c:if>
								<p class="product-description">Production company: ${sp.hangSanXuat.tenHangSanXuat}</p>
								<p class="product-description"><span class="important">GENERAL INFO:</span>
									${sp.getThongTinChung()}</p>
								<p class="product-description"><span class="important">WARRANTY:</span>
									${sp.getThongTinBaoHanh()}</p>
								<h4 class="price" id="blabla">Price: <span id="priceConvert"></span></h4>
								<div class="action">
									<button class="add-to-cart btn cart-btn" type="button">
										<span class="glyphicon glyphicon-shopping-cart pull-center"></span>Cart</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</body>

		<script src="<c:url value='/js/client/detailspAjax.js'/>"></script>