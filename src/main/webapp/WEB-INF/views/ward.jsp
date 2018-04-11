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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
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


				<li><a class="btn" href="${contextRoot }/form">Application
						form</a></li>
				<li><a class="btn" href="${contextRoot }/ward/">ward</a></li>
				<li><a class="btn" href="${contextRoot }/contact">contact
						us</a></li>

				<li><a class="btn" href="${contextRoot }/show/all/members">view
						Members</a></li>
				<li><a class="btn"
					href="${contextRoot }/show/pending/all/members">Pending members</a></li>
				<li><a class="btn" href="${contextRoot }/report/">Report
						Generation</a></li>
				<li><a class="btn"
					href="${contextRoot }/show/deleted/all/members">Deleted Members</a></li>
				<li><a class="btn" href="${contextRoot }/update/">update</a></li>

			</ul>
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${pageContext.request.userPrincipal.name==null }">
					<li><a href="#"><span class="glyphicon glyphicon-user"></span>
							Sign Up</a></li>
				</c:if>
				<c:if test="${pageContext.request.userPrincipal.name!=null }">
					<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
							welcome ${pageContext.request.userPrincipal.name} </a></li>
					<li><a href="<c:url value="/logout"></c:url>"><span
							class="glyphicon glyphicon-user"></span> logout</a></li>
				</c:if>
				<c:if test="${pageContext.request.userPrincipal.name==null }">
					<li><a href="<c:url value="/login"></c:url>"><span
							class="glyphicon glyphicon-log-in"></span> Login</a></li>
				</c:if>


			</ul>
		</div>
		</nav>
 
		<div class="container">
			<div class="col-md-8">
				<table class="table">
					<thead>
						<tr>
							<th>wardName</th>
							<th>WardNumber</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach var="ward" items="${wards }">
							<tr>
								<th>${ward.getWardName() }</th>
								<td>${ward.getWardNumber() }</td>

							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		

		
		<div class="col-md-8">
			<form:form action="${contextRoot }/ward/add" modelAttribute="ward">
				<div class="form-group">
					<label for="exampleInputEmail1">Email WardName</label> <form:input
						type="text" class="form-control" path="wardName" id="exampleInputEmail1" />
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Enter WardNumber</label> <form:input
						type="text" class="form-control" path="wardNumber" id="exampleInputPassword1" />
				</div>

				<button type="submit" class="btn btn-primary">Submit</button>
			</form:form>
		</div>
	</div>
	</div>
	<%@ include file="./shared/footer.jsp"%>
</body>
</html>