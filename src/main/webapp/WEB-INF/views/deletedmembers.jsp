<div class="container">
	<table class="table table-hover" id="datatable">
		<thead>
			<tr >
				<th style="text-aligh : center">photo</th>
				<th>memberId</th>
				<th>application Number</th>
				<th>name</th>
				<th>father's name</th>
				<th>state</th>
				<th>remarks</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="mem" items="${memberobject }">
				<tr data-toggle="tooltip" title="${mem.getRemarks() }">
					<td>
					<div >
						<a href="#myModal" data-toggle="modal"> <img
								src="<c:url value="/resources/images/${mem.getMemberId()}.jpg" />"
								alt="no image" height="100" width="100">
						</a>
						</div>
						</td>
						
					<td><a href="#myModal${mem.getMemberId() }"
						data-toggle="modal">${mem.getMemberId()}</a>


						<div class="modal fade"  id="myModal${mem.getMemberId() }">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<!-- <div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Enter Remarks</h4>
									</div> -->

									<div class="modal-body">


										<div>
											<p>MemberId : ${mem.getMemberId() }</p>
											<p>ApplicationNo : ${mem.getAppNo()}</p>
											<p>Name : ${mem.getName()}</p>
											<p>fatherName : ${mem.getFhname()}</p>
											<p>State : ${mem.getAddress().getState()}</p>
											<p>ProposerId : <a href=#>${mem.getProposerMemberId() }</a></p>
										</div>

									</div>
									<div class="modal-footer" style="background-color:grey">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">submit</button>

									</div>

								</div>

							</div>
						</div></td>
					<td>${mem.getAppNo()}</td>
					<td>${mem.getName()}</td>
					<td>${mem.getFhname()}</td>
					<td>${mem.getAddress().getState()}</td>
					<td>${mem.getRemarks()}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>