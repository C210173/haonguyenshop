<%@page contentType="text/html" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="ISO-8859-1">
				<title>Statistical</title>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

				<script>
					window.onload = function () {
						var data = [];
						var label = [];
						var dataForDataSets = [];

						$.ajax({
							async: false,
							type: "GET",
							data: data,
							contentType: "application/json",
							url: "http://localhost:8080/laptopshop/api/don-hang/report",
							success: function (data) {
								for (var i = 0; i < data.length; i++) {
									label.push(data[i][0] + "/" + data[i][1]);
									dataForDataSets.push(data[i][2] / 1000000);
								}
							},
							error: function (e) {
								alert("Error: ", e);
								console.log("Error", e);
							}
						});

						var canvas = document.getElementById('myChart');


						data = {
							labels: label,
							datasets: [{
								label: "Total value (USD)",
								backgroundColor: "#0000ff",
								borderColor: "#0000ff",
								borderWidth: 2,
								hoverBackgroundColor: "#0043ff",
								hoverBorderColor: "#0043ff",
								data: dataForDataSets,
							}]
						};
						var option = {
							scales: {
								yAxes: [{
									stacked: true,
									gridLines: {
										display: true,
										color: "rgba(255,99,132,0.2)"
									}
								}],
								xAxes: [{
									barPercentage: 0.5,
									gridLines: {
										display: false
									}
								}]
							},
							maintainAspectRatio: false,
							legend: {
								labels: {
									// This more specific font property overrides the global property
									fontSize: 20
								}
							}
						};

						var myBarChart = Chart.Bar(canvas, {
							data: data,
							options: option
						});
					}
				</script>

			</head>

			<body>
				<jsp:include page="template/header.jsp"></jsp:include>
				<jsp:include page="template/sidebar.jsp"></jsp:include>

				<div class="col-md-9 animated bounce">
					<h3 class="page-header">Statistical</h3>

					<canvas id="myChart" width="600px" height="400px"></canvas>
					<h4 style="text-align: center; padding-right: 10%">The chart of the total value of completed orders
						by month</h4>

				</div>


				<jsp:include page="template/footer.jsp"></jsp:include>

				<script type="text/javascript"
					src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.3/Chart.min.js"></script>
			</body>

			</html>