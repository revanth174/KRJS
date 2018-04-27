<%-- <table>
	<tr>
		<th>memberId</th>
		<th>application Number</th>
		<th>name</th>
		<th>father's name</th>
		<th>state</th>
		<th>status</th>

	</tr>
	<c:forEach var="mem" items="${memberobject }">
		<tr>
			<td>${mem.getMemberId()}</td>
			<td>${mem.getAppNo()}</td>
			<td>${mem.getName()}</td>
			<td>${mem.getFname()}</td>
			<td>${mem.getAddress().getState()}</td>
			<td><a href=#>delete</a>/<a href=#>approve</a>
		</tr>
	</c:forEach>
</table> --%>

<div class="container">
	<table class="table table-hover" id="datatable">
		<thead>
			<tr>
				<th>photo</th>
				<th >memberId</th>
				<th>application Number</th>
				<th>name</th>
				<th>father's name</th>
				<th>state</th>
				<th>Proposer memberid</th>
				<th>dob(yyyy/mm/dd)</th>
				<th>status</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="mem" items="${memberobject }">
				<tr style="text-align: center">
					<td>
					<img src="<c:url value="/resources/images/${mem.getMemberId()}.jpg" />"
						alt="no image" height="100" width="100" /></td>
					<td >${mem.getMemberId()}</td>
					<td>${mem.getAppNo()}</td>
					<td>${mem.getName()}</td>
					<td>${mem.getFhname()}</td>
					<td>${mem.getAddress().getState()}</td>
					
					<td ><a href=# id="${mem.getProposerMemberId() }">${mem.getProposerMemberId() }</a></td>
					<td>${mem.getDob()}</td>
 
					<td><a data-toggle="modal"
							href="#myModal${mem.getMemberId()}">delete</a>/ <a
						href="${contextRoot }/show/pending/members/approve/${mem.getMemberId()}">approve</a>
						<div class="modal fade" id="myModal${mem.getMemberId()}">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Enter remarks</h4>
									</div>
									<form action="${contextRoot }/show/pending/members/delete/${mem.getMemberId()}">
									<div class="modal-body">

										
											<div class="form-group">

												<textarea class="form-control"
													id="exampleFormControlTextarea1" name="remarks" rows="3"></textarea>
											</div>
										
									</div>
									<div class="modal-footer">
										<%-- <button type="button" class="btn btn-default" onclick="${contextRoot }/show/pending/members/delete/${mem.getMemberId()}"
											data-dismiss="modal">Close</button> --%>
											<input type="submit" class="form-control" value="sumit" />
									</div>
									</form>
								</div>

							</div>
						</div></td>


				</tr>
			</c:forEach>
		</tbody>
	</table>

</div>


<%-- <div id="id01" class="modal">

				<form class="modal-content animate" action="${contextRoot }/show/pending/members/delete/${mem.getMemberId()}">
	
					<div class="container">
					     
     					
     						<label> ramarks</label>
     						<textarea name="uname">hello</textarea>
     					<!-- <input type="text" /> -->
    				</div>
    				
				
				</form>
			</div> --%>