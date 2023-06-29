<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<head>
			<link rel="stylesheet" href="Frontend/css/searchResult.css">
			<script src="Frontend/js/jquery.min.js"></script>
			<script src="Frontend/js/responsiveslides.min.js"></script>
			<script src="js/client/accounting.js"></script>
			<script src="<c:url value='/js/client/store.js'/>"></script>
		</head>

		<script type="text/javascript">
			$(document).ready(function () {
				$(".grid_1_of_4 .changeToUSD").each(function () {
					var value = accounting.formatMoney($(this).text()) + ' $';
					$(this).html(value);
				});


			});
		</script>




		<body>
			<div class="clear"> </div>
			<div class="wrap">
				<div class="content">
					<div class="content-grids">

						<c:if test="${list.size() == 0}">
							<div class="section group">
								<h4>No results found</h4>
							</div>
						</c:if>
						<c:forEach var="sanpham" items="${list}" varStatus="loop">
							<c:if test="${loop.index != list.size()-1}">
								<c:if test="${loop.index%4 == 0}">
									<div class="section group">
										<div class="grid_1_of_4 images_1_of_4 products-info"
											style=" width: 224px; height: 400px;"><a href="sp?id=${sanpham.id}">
												<img style="width: 225px; height: 230px"
													src="/haonguyenshop/img/${sanpham.id}.png">
												<h3 style="font-weight: bold; height: 43.2px">${sanpham.tenSanPham}</h3>
											</a>
											<h3 class="changeToUSD">${sanpham.donGia}</h3>
											<button onClick="addToCart(${sanpham.id})" class="btn cart-btn"><span
													class="glyphicon glyphicon-shopping-cart pull-center"></span>Cart</button>
											<h3></h3>
										</div>
								</c:if>

								<c:if test="${loop.index%4 != 0}">
									<c:if test="${loop.index%4 == 3}">
										<div class="grid_1_of_4 images_1_of_4 products-info"
											style=" width: 224px; height: 400px;"><a href="sp?id=${sanpham.id}">
												<img style="width: 225px; height: 230px"
													src="/haonguyenshop/img/${sanpham.id}.png">
												<h3 style="font-weight: bold;height: 44px">${sanpham.tenSanPham}</h3>
											</a>
											<h3 class="changeToUSD">${sanpham.donGia}</h3>
											<button onClick="addToCart(${sanpham.id})" class="btn cart-btn"><span
													class="glyphicon glyphicon-shopping-cart pull-center"></span>Cart</button>
											<h3></h3>
										</div>
					</div>
					</c:if>

					<c:if test="${loop.index%4 != 3}">
						<div class="grid_1_of_4 images_1_of_4 products-info" style=" width: 224px; height: 400px;"><a
								href="sp?id=${sanpham.id}">
								<img style="width: 225px; height: 230px" src="/haonguyenshop/img/${sanpham.id}.png">
								<h3 style="font-weight: bold;height: 44px">${sanpham.tenSanPham}</h3>
							</a>
							<h3 class="changeToUSD">${sanpham.donGia}</h3>
							<button onClick="addToCart(${sanpham.id})" class="btn cart-btn"><span
									class="glyphicon glyphicon-shopping-cart pull-center"></span>Cart</button>
							<h3></h3>
						</div>
					</c:if>
					</c:if>
					</c:if>
					<c:if test="${loop.index == list.size()-1}">
						<c:if test="${loop.index%4 == 0}">
							<div class="section group">
								<div class="grid_1_of_4 images_1_of_4 products-info"
									style=" width: 224px; height: 400px;"><a href="sp?id=${sanpham.id}">
										<img style="width: 225px; height: 230px"
											src="/haonguyenshop/img/${sanpham.id}.png">
										<h3 style="font-weight: bold;height: 44px">${sanpham.tenSanPham}</h3>
									</a>
									<h3 class="changeToUSD">${sanpham.donGia}</h3>
									<button onClick="addToCart(${sanpham.id})" class="btn cart-btn"><span
											class="glyphicon glyphicon-shopping-cart pull-center"></span>Cart</button>
									<h3></h3>
								</div>
							</div>
						</c:if>
						<c:if test="${loop.index%4 != 0}">
							<div class="grid_1_of_4 images_1_of_4 products-info" style=" width: 224px; height: 400px;">
								<a href="sp?id=${sanpham.id}">
									<img style="width: 225px; height: 230px" src="/haonguyenshop/img/${sanpham.id}.png">
									<h3 style="font-weight: bold;height: 44px">${sanpham.tenSanPham}</h3>
								</a>
								<h3 class="changeToUSD">${sanpham.donGia}</h3>
								<button onClick="addToCart(${sanpham.id})" class="btn cart-btn"><span
										class="glyphicon glyphicon-shopping-cart pull-center"> </span>Cart</button>
								<h3></h3>
							</div>
				</div>
				</c:if>
				</c:if>
				</c:forEach>
				<c:if test="${list.size() != 0}">
					<div class="paging">
						<c:if test="${currentPage != 1}">
							<a
								href="/haonguyenshop/store?page=${currentPage-1}&range=${range}&brand=${brand}&manufactor=${manufactor}&os=${os}&ram=${ram}&pin=${pin}">Back</a>
						</c:if>
						<c:if test="${currentPage == 1}">
							<a class="current">1</a>
						</c:if>
						<c:if test="${currentPage != 1}">
							<a
								href="/haonguyenshop/store?page=1&range=${range}&brand=${brand}&manufactor=${manufactor}&os=${os}&ram=${ram}&pin=${pin}">1</a>
						</c:if>

						<c:forEach var="pag" items="${pageList}" varStatus="loop">
							<c:if test="${currentPage == pag}">
								<a class="current">${pag}</a>
							</c:if>
							<c:if test="${currentPage != pag}">
								<a
									href="/haonguyenshop/store?page=${pag}&range=${range}&brand=${brand}&manufactor=${manufactor}&os=${os}&ram=${ram}&pin=${pin}">${pag}</a>
							</c:if>
						</c:forEach>

						<c:if test="${currentPage != totalPage}">
							<a
								href="/haonguyenshop/store?page=${currentPage+1}&range=${range}&brand=${brand}&manufactor=${manufactor}&os=${os}&ram=${ram}&pin=${pin}">Next</a>
						</c:if>
					</div>
				</c:if>


			</div>


			</div>
			<div class="content-sidebar">
				<h4>Filter products</h4>
				<form>
					<input type="hidden" name="name" value="${name}">
					<p>Price</p>
					<div class="select-range">
						<select name="range" class="form-control">
							<option value="">All prices</option>
							<option value="Under-200">Under $200</option>
							<option value="200-400">200$ - 400$</option>
							<option value="400-600">400$ - 600$</option>
							<option value="600-1000">600$ - 1000$</option>
							<option value="Over-1000">Over 1000$</option>
						</select>
					</div>
					<p>Production company</p>
					<div class="select-range">
						<select name="manufactor" class="form-control">
							<option value="">All manufacturers</option>
							<c:forEach var="manufactor" items="${hangsx}" varStatus="loop">
								<option value="${manufactor}">${manufactor}</option>
							</c:forEach>
						</select>
					</div>
					<c:if test="${brand == 'Laptop'}">
						<p>OS: </p>
						<div class="select-range">
							<select name="os" class="form-control">
								<option value="">All OS</option>
								<option value="ubuntu">Ubuntu</option>
								<option value="dos">DOS</option>
								<option value="mac">MAC</option>
								<option value="linux">Linux</option>
								<option value="windows 10">Window 10</option>
							</select>
						</div>
						<p>RAM</p>
						<div class="select-range">
							<select name="ram" class="form-control">
								<option value="">All RAM</option>
								<option value="2 GB">2 GB</option>
								<option value="3 GB">3 GB</option>
								<option value="4 GB">4 GB</option>
								<option value="6 GB">6 GB</option>
								<option value="8 GB">8 GB</option>
								<option value="16 GB">16 GB</option>
							</select>
						</div>
						<p>Battery</p>
						<div class="select-range">
							<select name="pin" class="form-control">
								<option value="">All battery</option>
								<c:forEach var="manufactor" items="${pinSet}" varStatus="loop">
									<option value="${manufactor}">${manufactor}</option>
								</c:forEach>
							</select>
						</div>
					</c:if>
					<input type="hidden" name="brand" value="${brand}">
					<input class="search-submit" type="submit" value="Filter products">
				</form>

			</div>
			</div>
			<div class="clear"> </div>
		</body>

		</html>