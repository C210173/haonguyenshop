<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<html lang="en">

		<head>

			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

			<link href="Frontend/css/style.css" rel="stylesheet" type="text/css" media="all" />
			<link href='//fonts.googleapis.com/css?family=Londrina+Solid|Coda+Caption:800|Open+Sans' rel='stylesheet'
				type='text/css'>

			<link rel="stylesheet" href="Frontend/css/responsiveslides.css">
			<script src="Frontend/js/jquery.min.js"></script>
			<script src="Frontend/js/responsiveslides.min.js"></script>
			<script src="js/client/accounting.js"></script>

			<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>



			<script>
				// You can also use "$(window).load(function() {"
				$(function () {

					// Slideshow 1
					$("#slider1").responsiveSlides({
						maxwidth: 1600,
						speed: 600
					});
				});

			</script>

		</head>

		<body>
			<!-- dịch sang các ngôn ngữ khác bằng google -->
			<!-- <div id="google_translate_element" class="text-end"></div>
			<script type="text/javascript">
				function googleTranslateElementInit() {
					new google.translate.TranslateElement({ pageLanguage: 'en', includedLanguages: 'ja,en,vi,zh-CN,ru', layout: google.translate.TranslateElement.InlineLayout.SIMPLE }, 'google_translate_element');
				}
			</script>
			<script type="text/javascript"
				src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script> -->

			<div class="wrapper">
				<!----start-Header---->
				<div class="header">

					<div class="clear"></div>

					<div class="header-top-nav ">
						<c:if test="${pageContext.request.userPrincipal.name != null}">

							<ul>
								<li>welcome: ${loggedInUser.hoTen}</li>


								<!-- 	<li><a href="<%=request.getContextPath()%>/checkout"">Thanh toán</a></li> -->
								<li><a href="<%=request.getContextPath()%>/account">account</a></li>
								<li><a href="<%=request.getContextPath()%>/cart">
										<span>card &nbsp;&nbsp;: </span>
									</a>
									<span class="glyphicon glyphicon-shopping-cart"></span>
								</li>
								<li><a href="<%=request.getContextPath()%>/logout">log out</a></li>
							</ul>
						</c:if>

						<c:if test="${pageContext.request.userPrincipal.name == null}">
							<ul>
								<li><a href="<%=request.getContextPath()%>/register">Register</a></li>
								<li><a href="<%=request.getContextPath()%>/login">Log in</a></li>
								<li><a href="<%=request.getContextPath()%>/cart"><span>Cart&nbsp;&nbsp;&nbsp;</span></a>
									<span class="glyphicon glyphicon-shopping-cart"></span>
								</li>

							</ul>
						</c:if>
					</div>
					<div class="clear"></div>
				</div>
			</div>
			<div class="clear"></div>
			<div class="top-header">
				<div class="wrap-flex">
					<!----start-logo---->
					<div class="logo">
						<a href="<%=request.getContextPath()%>/"><img src="Frontend/img/logo3.png" title="logo"
								width="124px" /></a>
					</div>
					<!----end-logo---->
					<div class="search-bar">
						<form action="/haonguyenshop/search">
							<input type="text" name="name"><input type="submit" value="Search" />
						</form>
					</div>
					<!----start-top-nav---->
					<div class="top-nav">
						<ul>
							<li><a href="<%=request.getContextPath()%>/">Home</a></li>

							<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown"
									href="#">Category<span class="caret"></span></a>
								<ul class="dropdown-menu" style="background: #A5C89E" id="danhmuc2">
								</ul>
							</li>
							<li><a href="<%=request.getContextPath()%>/shipping">Free ship</a></li>
							<li><a href="<%=request.getContextPath()%>/guarantee">On-site warranty</a></li>
							<li><a href="<%=request.getContextPath()%>/contact">Contact</a></li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
			</div>
			<!----End-top-nav---->
			<!----End-Header---->

			<script src="<c:url value='/js/client/header.js'/>"></script>