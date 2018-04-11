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
<link rel="stylesheet"  href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<script type="text/javascript" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.17.0/jquery.validate.min.js"></script> -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
<link href="<c:url value="/resources/css/footer.css" />"
	rel="stylesheet">

<script src="<c:url value="/resources/js/country.js" />"></script>


<link href="<c:url value="/resources/css/homepage.css" />"
	rel="stylesheet">
	<!-- <script type='text/javascript' src='/resources/js/jquery.min.js'></script> -->
<script type="text/javascript">
$(document).ready(function() {
	
	  
	  $.validator.setDefaults( {
		errorClass : "help-block",
		highlight : function(element) {
			$(element)
				.closest('.form-group')
				.addClass("has-error")
				.closest("label")
				.addClass("has-error")
		},
		unhighlight :  function(element) {
			$(element)
				.closest('.form-group')
				.removeClass("has-error")
				.closest("label")
				.removeClass("has-error")
		}
	});
	$.validator.addMethod("length",function(value,element) {
		return  /^[a-zA-Z ]*$/.test(value);
	},'length must be allest 10 and it should onlu contains alphabets')

	$.validator.addMethod("startwith",function(value,element) {
		return /^[6789]/.test(value);
	},'phone number must begins with either 6,7,8 or 9')
	
	$.validator.addMethod("datechange",function(value,element) {
			
			var dob = new Date(value);
			var today = new Date();
			
			var age = today.getFullYear() - dob.getFullYear() ;
			if(age>=18)
				return true;
	},'age should minimun 18 years ')
	
	$('#datatable').DataTable();
	
	
	$("#datepicker").datepicker({
		changeMonth: true,
	    changeYear: true,
	    dateFormat: 'dd/mm/yy',
	    yearRange: "1950:2050",
	    
	})
	
	$("#register-form").validate({
		rules: {
			"details.gmail" : {
				required : true,
				email : true,
				//remote : "http://localhost:8080/"
			},
			name : {
				required : true,
				length : true
			},
			terms : {
				required : true,
				
			},
			fname : {
				required : true,
				length : true
			},
			dob : "required",
			"details.phone" : {
				required : true
			},
			"details.phone" : {
				digits : true,
				maxlength : 10,
				minlength : 10,
				required : true,
				startwith : true
				
			},
			dob : {
				datechange : true
			},
			gender : "required",
			"details.qualification"  : "required",
			"details.occupation"  : "required",
			"details.vemanaVani"  : "required",
			"details.maritalStatus" : "required",
			"address.address" : "required",
			"address.taluk" :  "required",
			"address.city"  : "required",
			"details.ward": "required",
			"details.wardNo": "required",
			"ProposerMemberId" : {
				required : true,
				remote    : {
					url : '<c:url value="/member" />',
					method : 'post',
					data : {
						name : function () {
							return $("#pmid").val();
						}
						
					}
				}
			},
			"payment.refNo"  : {
				required : true,
				remote  : {
					url : '<c:url value="/memberref" />',
					method : 'post',
					data : {
						name : function () {
							return $("#ref").val();
						}
						
					}
				}
			}
			

		},
		messages : {
			"details.gmail" : {
				required : "email is mandatory",
				email : "enter proper email like 123@gmail.com"
			},
			"ProposerMemberId" : {
				remote : 'member doesnot exist'
			},
			"payment.refNo" : {
				remote : 'already exist'
			}
			
		


		},
		
		
	});   
});

</script> 




	

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
/* body{ background:url(../images/bg-top.jpg) no-repeat;
background-repeat: no-repeat;
background-position: center center;
 background-attachment: fixed;
 margin: 0;
 padding: 0px;
 font-family:'Roboto Condensed',sans-serif;
 
 } */


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
<body  background="<c:url value="/resources/js/country.js" />" >
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
	
	<c:if test="${userclickupdate == true }">
		<%@ include file="update.jsp"%>
	</c:if>
	
	<c:if test="${clickupdateform == true }">
		<%@ include file="updateform.jsp"%>
	</c:if>
	
	
	
	
	<c:if test="${userclickid == true }">
		<%@ include file="print.jsp"%>
	</c:if>
	
	<c:if test="${success == true }">
		<%@ include file="success.jsp"%>
	</c:if>
	
	
	<c:if test="${idcard == true }">
		<%@ include file="memberlist.jsp"%>
	</c:if>
	
	


	<c:if test="${userclickreport == true }">
		<%@ include file="report.jsp"%>
	</c:if>

	<c:if test="${userclickpendingmembers == true }">
		<%@ include file="appliedmembers.jsp"%>
	</c:if>
	
	<c:if test="${userclickdeletedmembers == true }">
		<%@ include file="deletedmembers.jsp"%>
	</c:if>


	<c:if test="${userclickform == true }">
		<%@ include file="form.jsp"%>
	</c:if>
	
	
</div>
	

</div>
	<%@ include file="./shared/footer.jsp"%>
 <script type='text/javascript' src='<c:url value="/resources/js/state.js" />'></script>
 
	<%-- <script type='text/javascript' src='<c:url value="/resources/js/formvalidate.js" />'></script> --%>
	
</body>
</html>