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
			else return false;
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

	<c:choose>
		<c:when test="${userclickcontact == true }">
		<%@ include file="contact.jsp"%>
		</c:when>
	
		<c:when test="${userclickallmembers == true or userclickcategorymembers == true}">
			<%@ include file="home.jsp"%>
		</c:when>
	
		<c:when test="${userclickabout == true }">
			<%@ include file="about.jsp"%>
		</c:when>
		
		<c:when test="${userclickupdate == true }">
			<%@ include file="update.jsp"%>
		</c:when>
		
		<c:when test="${clickupdateform == true }">
			<%@ include file="updateform.jsp"%>
		</c:when>
		
		
		
		
		<c:when test="${userclickid == true }">
			<%@ include file="print.jsp"%>
		</c:when>
		
		<c:when test="${success == true }">
			<%@ include file="success.jsp"%>
		</c:when>
		
		
		<c:when test="${idcard == true }">
			<%@ include file="memberlist.jsp"%>
		</c:when>
		
		
	
	
		<c:when test="${userclickreport == true }">
			<%@ include file="report.jsp"%>
		</c:when>
	
		<c:when test="${userclickpendingmembers == true }">
			<%@ include file="appliedmembers.jsp"%>
		</c:when>
		
		<c:when test="${userclickdeletedmembers == true }">
			<%@ include file="deletedmembers.jsp"%>
		</c:when>
	
	
		<c:when test="${userclickform == true }">
			<%@ include file="form.jsp"%>
		</c:when>
		
		<c:otherwise>
			<div class="container">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
			    <!-- Indicators -->
			    <ol class="carousel-indicators">
			      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			      <li data-target="#myCarousel" data-slide-to="1"></li>
			      
			    </ol>
			
			    <!-- Wrapper for slides -->
			    <div class="carousel-inner">
			      <div class="item active">
			        <img src="${contextRoot }/resources/images/banner1.jpg" alt="Los Angeles" style="width:100%;">
			      </div>
			
			      <div class="item">
			        <img src="${contextRoot }/resources/images/banner2.jpg" alt="Chicago" style="width:100%;">
			      </div>
			    
			      
			    </div>
			
			    <!-- Left and right controls -->
			    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
			      <span class="glyphicon glyphicon-chevron-left"></span>
			      <span class="sr-only">Previous</span>
			    </a>
			    <a class="right carousel-control" href="#myCarousel" data-slide="next">
			      <span class="glyphicon glyphicon-chevron-right"></span>
			      <span class="sr-only">Next</span>
			    </a>
			  </div>
		  </div>
		  
		  <div class="container">
		 <p>
		  	<h2>ABOUT KRJS</h2>
			<br/>
			KRJS laid its founadation in 1925 with the sole aim of catering the educational needs of all sections of society.
			Till today it continues to carve excellent niches in the minds of aspiring students. 
			KRJS now flourishes with 12 educational institutions spreading its colorful wings all over Bangalore. 
			Imparting 'VidyaDaana' by meditating on the slogan 'VidyaSarvasya Bhooshanam' taken from the golden hymns of our 
			Vedas, we elate our glory by adding various discipline starting from Pre-Nursery to postgraduation courses
			including technical courses. RJS PU College was started in 1991 with the noble aim of rendering excellent 
			knowledge and education for the growth of budding young generation. The college is recognized by
			Karnataka Pre- University Board and has earned 'A' Grade from the Board. It is located at lush green serenity
			and amidst the core IT hub in Koramangala. We aim to enable the students to make a significant contribution to
			the development of the society and the country at large by setting a strong code of ethics and values as well 
			as openness of mind which strives to know and to learn. Our college ensures that our students live up to the high standards 
			and the expectations and come up as a well qualified person to meet the new horizons of his dreams.
		  </p>
	
	</div>
		 
		  
		</c:otherwise>

	</c:choose>

	
	
	
</div>
	


	<%@ include file="./shared/footer.jsp"%>
 <script type='text/javascript' src='<c:url value="/resources/js/state.js" />'></script>
 
	<%-- <script type='text/javascript' src='<c:url value="/resources/js/formvalidate.js" />'></script> --%>
	
</body>
</html>