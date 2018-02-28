
<div class="container">

	<div class="row">

		<div class="col-lg-3">

			<%@ include file="./shared/sidebar.jsp"%>

		</div>
		<!-- /.col-lg-3 -->

		<div class="col-lg-9">

			<%-- 	<p>hello world</p>
			
			<c:if test="${category == 'memberid'}">
					<%@ include file="memberidcategory.jsp" 
					
					
			</c:if> --%>

			<div class="row">
				<c:choose>
					<c:when test="${category != null }">
						<%@ include file="memberidcategory.jsp"%>
					</c:when>
					<%-- <c:when test="${category == 'phone' }">
					<%@ include file="memberidcategory.jsp" %>
				</c:when>
				<c:when test="${category == 'state' }">
					<%@ include file="memberidcategory.jsp" %>
				</c:when>
				<c:when test="${category == 'taluk' }">
					<%@ include file="memberidcategory.jsp" %>
				</c:when>
				<c:when test="${category == 'district' }">
					<%@ include file="memberidcategory.jsp" %>
				</c:when>
				<c:when test="${category == 'applicationNumber' }">
					<%@ include file="memberidcategory.jsp" %>
				</c:when> --%>
					<c:otherwise>
						<p>hello world</p>

					</c:otherwise>
				</c:choose>
			</div>

			<div class="row">

				<c:if test="${memberobject != null }">
					<table class="table table-bordered" id="employee_table">
						<tr>
							<th width="5%">ID</th>
							<th width="5%">Application Number</th>
							<th width="25%">Name</th>
							<th width="20%">father name</th>
							<th width="35%">Address</th>
							
							
							
						</tr>
						<c:forEach var="mem" items="${memberobject }" >
							<tr>
							<td>${mem.getMemberId()}</td>
							<td>${mem.getAppNo()}</td>
							<td>${mem.getName()}</td>
							<td>${mem.getFname()}</td>
							<td>${mem.getAddress().getState()}</td>
							
							
							
						</tr>
						</c:forEach>
						<%-- <tr>
							<td>${memberobject.getMemberId()}</td>
							<td>${memberobject.getAppNo()}</td>
							<td>${memberobject.getName()}</td>
							<td>${memberobject.getFname()}</td>
							<td>${memberobject.getAddress().getState()}</td>
							
							
							
						</tr> --%>
					</table>
				</c:if>
			</div>



		</div>
	</div>
	<!-- /.row -->

</div>