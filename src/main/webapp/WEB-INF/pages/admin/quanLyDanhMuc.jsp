<%@page contentType="text/html" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="ISO-8859-1">
				<title>Category Management</title>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			</head>

			<body>
				<jsp:include page="template/header.jsp"></jsp:include>
				<jsp:include page="template/sidebar.jsp"></jsp:include>

				<div class="col-md-9 animated bounce">
					<h3 class="page-header">Category Management</h3>

					<button class="btn btn-success btnThemDanhMuc">Add new category</button>

					<hr />
					<!--       <ul class="breadcrumb">
        <li>
          <span class="glyphicon glyphicon-home">&nbsp;</span>Home</li>
        <li>
          <a href="#">Dashboard</a>
        </li> 
      </ul>-->
					<table class="table table-hover danhMucTable">
						<thead>
							<tr>
								<th>Category code</th>
								<th>Category name</th>
							</tr>

						</thead>
						<tbody>
						</tbody>

					</table>

					<ul class="pagination">
					</ul>
				</div>
				<div class="row col-md-6">
					<form class="danhMucForm" id="form">

						<div>
							<div class="modal fade" id="danhMucModal" tabindex="-1" role="dialog"
								aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static"
								data-keyboard="false">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Add New/Update category</h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<div class="form-group">
												<label for="id">Code:</label> <input type="text" class="form-control"
													id="id" />
											</div>
											<div class="form-group">
												<label for="name">Category name:</label> <input type="text"
													class="form-control" id="tenDanhMuc"
													placeholder="Enter the category name" required />
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
				<script src="<c:url value='/js/danhMucAjax.js'/>"></script>
			</body>

			</html>