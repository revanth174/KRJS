<div class="container">


	<c:if test="${inserted == true }">
		<h4>details are submitted</h4>
	</c:if>
	<c:if test = "${updated == true }">
		<h4> details are updated</h4>
	</c:if>
	<c:if test = "${newpasswordchanged == true }">
		<h4> new password has been set</h4>
		<a href="${contextRoot }/login">click here to login</a> to go home page
	</c:if>
	
	<a href="${contextRoot }/home">click here</a> to go home page
</div>