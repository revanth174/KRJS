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

html, body {
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

	<%@ include file="./shared/navbar.jsp"%>

	

	<c:if test="${userclickcontact == true }">
		<%@ include file="contact.jsp"%>
	</c:if>

	<c:if
		test="${userclickallmembers == true or userclickcategorymembers == true}">
		<%@ include file="home.jsp"%>
	</c:if>

	<c:if test="${userclickabout == true }">
		<%@ include file="about.jsp"%>
	</c:if>
	
	
	<c:if test="${userclickid == true }">
		<%@ include file="print.jsp"%>
	</c:if>
	
	


	<c:if test="${userclickreport == true }">
		<%@ include file="report.jsp"%>
	</c:if>

	<c:if test="${userclickpendingmembers == true }">
		<%@ include file="appliedmembers.jsp"%>
	</c:if>
	
	<c:if test="${userclickdeletedmembers == true }">
		<%@ include file="appliedmembers.jsp"%>
	</c:if>


	<c:if test="${userclickform == true }">
		<%@ include file="form.jsp"%>
	</c:if>

</div>
	<%@ include file="./shared/footer.jsp"%>
	
</body>
</html>