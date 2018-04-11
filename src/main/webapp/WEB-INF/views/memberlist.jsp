<script type="text/javascript">
	var start = 0;
	function namelist() {
		var s = $("#idlist").val();
		if (s[s.length - 1] == ',') {
			var k = s.substring(start, s.length - 1);
			alert(k);

			start = s.length;

		}
	}

	$(function() {

		$('[data-toggle="tooltip"]').tooltip(); 

	});
</script>
<div class="container">
<form id="memberlist" method="post" class="form-horizontal"
	action="${contextRoot }/report/memberlist">
	<div class="form-group">
		<label class="col-xs-3 control-label">list</label>
		<div class="col-xs-4">
			<textarea id="idlist" type="text" class="form-control" name="idlist"
				placeholder="Shop Address" style="height: 100px" maxlength="200"></textarea>
		</div>
	</div>

	<div class="form-group">
		<div class="col-xs-9 col-xs-offset-3">
			<input type="submit" name="add" class="btn btn-primary"
				value="Add Shop">
			<button type="reset" class="btn btn-default">Reset</button>
		</div>
	</div>
</form>
</div>
${validlist }
<div class="container">

<c:if test="${validlist != null }">
	<div class="col-md-8">
		<table class="table">
			<thead>
				<tr>
					<th> valid Member Ids</th>
					

				</tr>
			</thead>
			<tbody>
				<c:forEach var="id" items="${validlist }">
					<tr>
						<th>${id}</th>
						

					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>
</c:if>
<c:if test="${notvalidlist != null }">
	<div class="col-md-8">
		<table class="table">
			<thead>
				<tr>
					<th> Invalid Member Ids</th>
					

				</tr>
			</thead>
			<tbody>
				<c:forEach var="id" items="${notvalidlist }">
					<tr>
						<th style="color : red" data-toggle="tooltip" data-placement="rigth" title="Not a  Member!">${id}</th>
						

					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>
</c:if>	
<div class="clearfix"></div>
	<div>
		<a href="${contextRoot }/report/idcardgen" >click here to generate Id cards</a>
	</div>
</div>