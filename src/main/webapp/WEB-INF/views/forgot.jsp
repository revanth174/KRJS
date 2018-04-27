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
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
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

<script type="text/javascript">
	$(document).ready( function() {

				 $.validator.setDefaults({
					errorClass : "help-block",
					highlight : function(element) {
						$(element).closest('.form-group').addClass("has-error")
								.closest("label").addClass("has-error")
					},
					unhighlight : function(element) {
						$(element).closest('.form-group').removeClass(
								"has-error").closest("label").removeClass(
								"has-error")
					}
				}); 

				$("#forgotpassword-form").validate({
					rules : {
						
						
						memberid : {
							required : true,
							remote : {
								url : '<c:url value="/sendcode/" />',
								method : 'post',
								data : {
									name : function() {
										return $("#mid").val();
									}

								}
							}
						},
						newpassword : {
							required : true
						},
						code : {
							required : true,
							remote  : {
								url : '<c:url value="/checkcode/" />',
								method : 'post',
								data : {
									name : function() {
										return $("#mid").val();
									},
									enteredcode : function() {
										return $("#code").val();
									}

								}
								
							}
						}
 
					},
					messages : {
						
						memberid : {
							
							remote : 'member doesnot exist',
							required : 'code sent to mobile'
						},
						code : {
							remote : "doesnot match"
						}

					},

				});
			});
</script>


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

		<c:if test="${forgotpassword == true }">
			<%@ include file="forgotpassword.jsp"%>
		
		</c:if>
		
		<c:if test="${success == true}" >
			<%@ include file="success.jsp"%>
		</c:if>
	</div>
	<%@ include file="./shared/footer.jsp"%>
</body>
</html>