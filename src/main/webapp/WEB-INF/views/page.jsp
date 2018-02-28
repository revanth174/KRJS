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
<link href="<c:url value="/resources/css/footer.css" />" rel="stylesheet" >

<script src="<c:url value="/resources/js/country.js" />"></script>
<script src="<c:url value="/resources/js/imageupload.js" />"></script>

<link href="<c:url value="/resources/css/homepage.css" />"
	rel="stylesheet">

<%-- <link href="<c:url value="/resources/css/remarks.css" />"
	rel="stylesheet"> --%>


<title>krjs-${title }</title>
</head>
<body>
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

	<c:if test="${userclickpendingmembers == true }">
		<%@ include file="appliedmembers.jsp"%>
	</c:if>


	<c:if test="${userclickform == true }">
		<%@ include file="form.jsp"%>
	</c:if>
	
	
	<%-- <div class="heading">
            <span class="title1">GTCoding</span>
            <span class="title2">For those who love technology</span>
            <button class="register">
                <a href="#modal" class="registerLink">REGISTER NOW</a>
            </button>
        </div>
        
        <div class="modal_container" id="modal">
            <div class="modal">
                <a href="#" class="close">X</a>
                <span class="modal_heading">
                    ENTER YOUR DETAILS
                </span>
                <form action="#">
                    <input type="text" placeholder="Email" ><br>
                    <input type="text" placeholder="Username"><br>
                    <input type="password" placeholder="Password"><br>
                    <input type="submit" class="btnRegister" value="REGISTER">
                </form>
                <a href="#" class="signin">
                    Have an account already?
                </a>
                <a href="#" class="forgotPassword">
                    Forgot Password?
                </a>
            </div>
        </div>
 --%>


	<%@ include file="./shared/footer.jsp"%>
</body>
</html>