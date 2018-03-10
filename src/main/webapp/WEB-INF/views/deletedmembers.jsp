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
					<td><img
						src="<c:url value="/resources/images/${mem.getMemberId()}.jpg" />"
						alt="no image" height="100" width="100" class="img-thumbnail"></td>
					<td>${mem.getMemberId()}</td>
					<td>${mem.getAppNo()}</td>
					<td>${mem.getName()}</td>
					<td>${mem.getFname()}</td>
					<td>${mem.getAddress().getState()}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>