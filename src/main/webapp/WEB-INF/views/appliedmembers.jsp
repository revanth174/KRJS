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
<table class="table table-hover">
	<thead>
		<tr>
			<th>photo</th>
			<th>memberId</th>
			<th>application Number</th>
			<th>name</th>
			<th>father's name</th>
			<th>state</th>
			<th>Proposer memberid</th>
			<th>status</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="mem" items="${memberobject }">
		<tr>
			<td><img src="<c:url value="/resources/images/${mem.getMemberId()}.jpg" />" alt="no image" height="100" width="100" class="img-thumbnail"></td>
			<td>${mem.getMemberId()}</td>
			<td>${mem.getAppNo()}</td>
			<td>${mem.getName()}</td>
			<td>${mem.getFname()}</td>
			<td>${mem.getAddress().getState()}</td>
			<td><a href=#>${mem.getPayment().getProposerMemberId() }</a></td>
			
			<td><a	onclick="document.getElementById('id01').style.display='block'"
						style="width: auto;">delete</a>/<a href="${contextRoot }/show/pending/members/approve/${mem.getMemberId()}">approve</a>
			<div id="id01" class="modal">

				<form class="modal-content animate" action="${contextRoot }/show/pending/members/delete/${mem.getMemberId()}">
	
					<div class="container">
					     
     					
     						<label> ramarks</label>
     						<textarea name="uname">hello</textarea>
     					<!-- <input type="text" /> -->
    				</div>
    				
				
				</form>
			</div>
		
	</td>
	
			
		</tr>
	</c:forEach>
	</tbody>
</table>

</div>

