<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="<c:url value="/resources/css/footer.css" />"
	rel="stylesheet">

<script src="<c:url value="/resources/js/country.js" />"></script>
<script src="<c:url value="/resources/js/imageupload.js" />"></script>

<link href="<c:url value="/resources/css/homepage.css" />"
	rel="stylesheet">

<%-- <link href="<c:url value="/resources/css/remarks.css" />"
	rel="stylesheet"> --%>
<style type="text/css">
#wrap {
	min-height: 100%;
	height: auto;
	/* Negative indent footer by its height */
	margin: 0 auto -60px;
	/* Pad bottom by footer height */
	padding: 0 0 60px;
}

body {
	height: 100%;

	/* The html and body elements cannot have any padding or margin. */
}

.container {
	width: auto;
	max-width: 1200px;
	padding: 0 15px;
}

.container .credit {
	margin: 20px 0;
}

#footer {
	height: 60px;
	background-color: #f5f5f5;
}
</style>

<title>krjs-${title }</title>
</head>
<body>
	<div id="wrap">
		<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">KRJS</a>
			</div>
			<ul class="nav navbar-nav">


				<li><a class="btn" href="${contextRoot }/home"> home</a></li>
			</ul>

		</div>
		</nav>

		<div class="container">
			<div class="row">
			
				<c:if test="${not empty error }">
					<div class="alert alert-danger">${error }
					</div>
					
				</c:if>
			</div>
			
			<div class="row">
			
				<c:if test="${not empty logout }">
					<div class="alert">${logout }
					</div>
					
				</c:if>
			</div>
			
				<div id="loginbox" style="margin-top: 50px;"
					class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
					<div class="panel panel-info">
						<div class="panel-heading">
							<div class="panel-title">Sign In</div>
							<div
								style="float: right; font-size: 80%; position: relative; top: -10px">
								<a href="${contextRoot }/login/forgot">Forgot password</a>
							</div>
						</div>

						<div style="padding-top: 30px" class="panel-body">

							<div style="display: none" id="login-alert"
								class="alert alert-danger col-sm-12"></div>

							<form id="loginform" class="form-horizontal" role="form" method="post" action="${contextRoot }/login">

								<div style="margin-bottom: 25px" class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> <input
										id="login-username" type="text" class="form-control"
										name="username" value="" placeholder="username or email">
								</div>

								<div style="margin-bottom: 25px" class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-lock"></i></span> <input
										id="login-password" type="password" class="form-control"
										name="password" placeholder="password">
								</div>



								<div class="input-group">
									<div class="checkbox">
										<label> <input id="login-remember" type="checkbox"
											name="remember" value="1"> Remember me
										</label>
									</div>
								</div>


								<div style="margin-top: 10px" class="form-group">
									<!-- Button -->

									<div class="col-sm-12 controls">
										
										<input type="submit" value="click" class="btn btn-success" /> 
										

									</div>
								</div>

							</form>



						</div>
					</div>
				</div>
			
		</div>

	</div>
	<%@ include file="./shared/footer.jsp"%>
</body>
</html>