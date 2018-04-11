<div class="container">
	<h2>Inline form</h2>
	<form class="form-inline" action="${contextRoot }/update" method="post">
		<div class="form-group">
			<label for="email">Enter MemberLd : </label> <input type="text"
				class="form-control" id="idl" placeholder="Enter memberid to update"
				name="id">
		</div>


		<button type="submit" class="btn btn-default">Submit</button>
	</form>


	<c:if test="${nomember == false}">

<script type="text/javascript">

$(document).ready(function() {
	$("#myModal").modal("show");
});
</script>
		<div class="modal fade" id="myModal">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<!-- <div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Enter Remarks</h4>
									</div> -->

					<div class="modal-body">


						<div>
							<p>MemberId : ${member.getMemberId() }</p>
							<p>ApplicationNo : ${member.getAppNo()}</p>
							<p>Name : ${member.getName()}</p>
							<p>fatherName : ${member.getFhname()}</p>
							<p>State : ${member.getAddress().getState()}</p>
							<p>
								ProposerId : <a href=#>${member.getProposerMemberId() }</a>
							</p>
						</div>

					</div>
					<div class="modal-footer">
						<a href="${contextRoot }/updatemember/ ${member.getMemberId() }">click here to change details</a>
						<button type="button" class="btn btn-default" data-dismiss="modal">submit</button>

					</div>

				</div>

			</div>
		</div>
	</c:if>
	<c:if test="${nomember == true}">
		<p> No Member Found</p>
	</c:if>

</div>
