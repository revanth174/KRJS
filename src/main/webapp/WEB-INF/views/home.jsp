
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
					<c:when test="${category == 'phone' }">
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
				</c:when>
					<c:otherwise>
						<p>Total count ${totalCount }</p>
						
						<div class="container" >
							<table class="table table-bordered" id="datatable">
							
								<thead>
									<tr>
										<th>ID</th>
										<th>Application Number</th>
										<th>Name</th>
										<th>father name</th>
										<th>Address</th>
		
									</tr>

								</thead>
								<tbody>
									<c:forEach var="mem" items="${recentList }">
										<tr>
									<td><a href="#myModal${mem.getMemberId() }"
										data-toggle="modal">${mem.getMemberId()}</a>


										<div class="modal fade" id="myModal${mem.getMemberId() }">
											<div class="modal-dialog">

												<!-- Modal content-->
												<div class="modal-content">
													<!-- <div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Enter Remarks</h4>
									</div> -->

													<div class="modal-body" style="background-color: grey">


														<div>
															<p>MemberId : ${mem.getMemberId() }</p>
															<p>ApplicationNo : ${mem.getAppNo()}</p>
															<p>Name : ${mem.getName()}</p>
															<p>fatherName : ${mem.getFhname()}</p>
															<p>State : ${mem.getAddress().getState()}</p>
															<p>
																ProposerId : <a href=#>${mem.getProposerMemberId() }</a>
															</p>
														</div>

													</div>
													<div class="modal-footer" style="background-color: grey">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">Ok</button>

													</div>

												</div>

											</div>
										</div></td>
									<td>${mem.getAppNo()}</td>
									<td>${mem.getName()}</td>
									<td>${mem.getFhname()}</td>
									<td>${mem.getAddress().getState()}</td>



								</tr>
									</c:forEach>
								
								</tbody>
							
							
							</table>
						
						</div>
					</c:otherwise>
				</c:choose>
			</div>

			<div class="row">

				<%-- <%-- <c:if test="${memberobject == null }">
					<p> enter proper ${category }</p>
				</c:if> 
				<c:if test="${memberobject != null }">
					<table class="table table-bordered" id="datatable">
						<thead>
							<tr>
								<th>ID</th>
								<th>Application Number</th>
								<th>Name</th>
								<th>father name</th>
								<th>Address</th>

							</tr>

						</thead>
						<tbody>
							<c:forEach var="mem" items="${memberobject }">
								<tr>
									<td><a href="#myModal${mem.getMemberId() }"
										data-toggle="modal">${mem.getMemberId()}</a>


										<div class="modal fade" id="myModal${mem.getMemberId() }">
											<div class="modal-dialog">

												<!-- Modal content-->
												<div class="modal-content">
													<!-- <div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Enter Remarks</h4>
									</div> -->

													<div class="modal-body" style="background-color: grey">


														<div>
															<p>MemberId : ${mem.getMemberId() }</p>
															<p>ApplicationNo : ${mem.getAppNo()}</p>
															<p>Name : ${mem.getName()}</p>
															<p>fatherName : ${mem.getFhname()}</p>
															<p>State : ${mem.getAddress().getState()}</p>
															<p>
																ProposerId : <a href=#>${mem.getProposerMemberId() }</a>
															</p>
														</div>

													</div>
													<div class="modal-footer" style="background-color: grey">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">Ok</button>

													</div>

												</div>

											</div>
										</div></td>
									<td>${mem.getAppNo()}</td>
									<td>${mem.getName()}</td>
									<td>${mem.getFhname()}</td>
									<td>${mem.getAddress().getState()}</td>



								</tr>
							</c:forEach>
							<tr>
							<td>${memberobject.getMemberId()}</td>
							<td>${memberobject.getAppNo()}</td>
							<td>${memberobject.getName()}</td>
							<td>${memberobject.getFname()}</td>
							<td>${memberobject.getAddress().getState()}</td>
							
							
							
						</tr>
						</tbody>
					</table>
				</c:if> --%>
				
				<c:if test="${memberobject != null }">
				<div class="container" >
							<table class="table table-bordered" id="datatable">
							
								<thead>
									<tr>
										<th>ID</th>
										<th>Application Number</th>
										<th>Name</th>
										<th>father name</th>
										<th>Address</th>
		
									</tr>

								</thead>
								<tbody>
									<c:forEach var="mem" items="${memberobject }">
										<tr>
									<td><a href="#myModal${mem.getMemberId() }"
										data-toggle="modal">${mem.getMemberId()}</a>


										<div class="modal fade" id="myModal${mem.getMemberId() }">
											<div class="modal-dialog">

												<!-- Modal content-->
												<div class="modal-content">
													<!-- <div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Enter Remarks</h4>
									</div> -->

													<div class="modal-body" style="background-color: grey">


														<div>
															<p>MemberId : ${mem.getMemberId() }</p>
															<p>ApplicationNo : ${mem.getAppNo()}</p>
															<p>Name : ${mem.getName()}</p>
															<p>fatherName : ${mem.getFhname()}</p>
															<p>State : ${mem.getAddress().getState()}</p>
															<p>
																ProposerId : <a href=#>${mem.getProposerMemberId() }</a>
															</p>
														</div>

													</div>
													<div class="modal-footer" style="background-color: grey">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">Ok</button>

													</div>

												</div>

											</div>
										</div></td>
									<td>${mem.getAppNo()}</td>
									<td>${mem.getName()}</td>
									<td>${mem.getFhname()}</td>
									<td>${mem.getAddress().getState()}</td>



								</tr>
									</c:forEach>
								
								</tbody>
							
							
							</table>
						
						</div>
						</c:if>
				
			</div>
		



		</div>
	</div>
	<!-- /.row -->

</div>