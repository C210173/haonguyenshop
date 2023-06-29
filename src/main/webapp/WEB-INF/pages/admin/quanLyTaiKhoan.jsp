<%@page contentType="text/html" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="ISO-8859-1">
				<title>Account Management</title>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			</head>

			<body>
				<jsp:include page="template/header.jsp"></jsp:include>
				<jsp:include page="template/sidebar.jsp"></jsp:include>

				<div class="col-md-9 animated bounce">
					<h3 class="page-header">Account Management</h3>

					<button class="btn btn-success btnThemTaiKhoan">Add new account</button>
					<hr>
					<div class="form-group form-inline">
						<label for="sel1"><strong>Filter accounts:</strong> </label> <select id="vaiTro"
							class="form-control">
							<c:forEach var="vaiTro" items="${listVaiTro}">
								<option value="${vaiTro.tenVaiTro }">${vaiTro.tenVaiTro }</option>
							</c:forEach>
						</select>
					</div>
					<hr>


					<table class="table table-hover taiKhoanTable" style="text-align: center;">
						<thead>
							<tr>
								<th>Code</th>
								<th>Full name</th>
								<th>Email</th>
								<th>Phone number</th>
								<th>
									<Address></Address>
								</th>
								<th>Role</th>
								<th></th>
							</tr>

						</thead>
						<tbody>
						</tbody>

					</table>
				</div>
				<div class="row col-md-6">
					<form class="taiKhoanForm" id="form">
						<div>
							<div class="modal fade" id="taiKhoanModal" tabindex="-1" role="dialog"
								aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static"
								data-keyboard="false">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Create new account</h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<!-- 								<div class="form-group">
									<input type="hidden" class="form-control" name="id" />
								</div> -->
											<div class="form-group">
												<label for="name">Email</label> <input type="email" class="form-control"
													name="email" required />
											</div>
											<div class="form-group">
												<label for="name">Password:(8-32 character)</label> <input
													type="password" class="form-control" name="password" required />
											</div>
											<div class="form-group">
												<label for="name">Confirm password:</label> <input type="password"
													class="form-control" name="confirmPassword" required />
											</div>

											<div class="form-group">
												<label for="name">Chose role:</label>
												<c:forEach var="vaiTro" items="${listVaiTro}">
													<label class="radio-inline">
														<input type="radio" name="tenVaiTro" value="${vaiTro.tenVaiTro}"
															checked="checked">
														${vaiTro.tenVaiTro}
													</label>
												</c:forEach>
											</div>

											<div class="form-group">
												<label for="name">Full name:</label> <input type="text"
													class="form-control" name="hoTen" required />
											</div>
											<div class="form-group">
												<label for="name">Phone number:</label> <input type="text"
													class="form-control" name="sdt" required />
											</div>
											<div class="form-group">
												<label for="name">Address:</label> <input type="text"
													class="form-control" name="diaChi" required />
											</div>


											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Cancel</button>
												<input class="btn btn-primary" id="btnSubmit" type="button"
													value="Confirm" />
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				</div>

				<jsp:include page="template/footer.jsp"></jsp:include>
				<script
					src="https://cdnjs.cloudflare.com/ajax/libs/jquery.serializeJSON/2.9.0/jquery.serializejson.js"></script>
				<script src="<c:url value='/js/taiKhoanAjax.js'/>"></script>
			</body>

			</html>