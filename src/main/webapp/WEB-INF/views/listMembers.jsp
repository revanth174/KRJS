<div class="container">

<div class="row">
			<div class="col-lg-3">
			
			<%@ include file="./shared/navbar.jsp" %>
			</div>
			
			<div class="col-lg-9">
			
					<c:if test=${ userclickcategorymember == true && category==memberid}>
					<%@ include file="memberidcategory.jsp" %>
					
					
					</c:if>
			</div>
		</div>
</div>