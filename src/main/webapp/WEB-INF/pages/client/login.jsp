<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="Frontend/css/login.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>


	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<div class="login-page">
		<div class="form">
		    <h2 class="form-signin-heading" style="text-align: center">LOGIN</h2>
		    <hr>
			<c:if test="${param.error != null}">
				<div class="alert alert-danger">
					<p>Username or password is incorrect.</p>
				</div>
			</c:if>
			<c:if test="${param.logout != null}">
				<div class="alert alert-success">
					<p>You have successfully signed out.</p>
				</div>
			</c:if>
			<c:if test="${param.accessDenied != null}">
				<div class="alert alert-danger">
					<p>You do not have permission to access this page</p>
				</div>
			</c:if>

			<form class="login-form" method="POST" action="${contextPath}/login">
			    
				<input type="text" placeholder="Email" name="email" required="required" style="padding:  10px;"/> 
				
				<input type="password" placeholder="password" name="password" required="required" style="padding:  10px;" /> 
				
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				
                <label style="padding-right: 130px; font-size: 15px;" id="label">
                    <input type="checkbox" class="form-check-input" id="" name="remember-me">
					remember login info</label>
				
				<input id="submit" type="submit" value="LOGIN">
				<p class="message" style="font-size: 18; padding-top:10px">No account yet? <a href="<c:url value='/register'/> ">Create a new account</a></p>
			</form>
		</div>
	</div>


	<%-- <div class="main-w3layouts wrapper">
		<h1>LOGIN</h1>
		<div class="main-agileinfo">
			<div class="agileits-top">

				<c:if test="${param.error != null}">
					<div class="alert alert-danger">
						<p>Username or password is incorrect.</p>
					</div>
				</c:if>
				<c:if test="${param.logout != null}">
					<div class="alert alert-success">
						<p>You have successfully signed out.</p>
					</div>
				</c:if>
				<c:if test="${param.accessDenied != null}">
					<div class="alert alert-danger">
						<p>You do not have permission to access this page</p>
					</div>
				</c:if>

				<form method="POST" action="${contextPath}/login">
					<input class="text" type="text" name="email"
						placeholder="Tên đăng nhập" required> <input class="text"
						type="password" name="password" placeholder="Mật khẩu" required>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <input type="submit" value="ĐĂNG NHẬP">
				</form>
				<p>
					No account yet? <a href="${contextPath}/register"> Register!</a>
				</p>
			</div>
		</div>
		<!-- copyright -->
		<div class="colorlibcopy-agile">
			<p>© copyright by NGUYEN QUANG HAO</p>
		</div>
	</div> --%>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

</body>
</html>