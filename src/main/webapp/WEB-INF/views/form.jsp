
<div class="container">
		<form:form action="add" modelAttribute="member" method="post" enctype="multipart/form-data">
			<div class="row">
				<div class="col-md-6 form-group">
					<label>Application Number</label>
					<form:input type="text" id="appno" value="1245"
						class="form-control" path="appNo" />
				</div>
				<div class="col-md-6 form-group">
					<label>Membership Id</label>
					<form:input type="text" id="mid" class="form-control"
						path="memberId" />
				</div>

			</div>


			 <div class="row">
				<div class=" col-md-4 form-group">
					<label for="sel1">Select list (select one):</label>
					<form:select class="form-control" id="sel1" name="title"
						path="title">
						<form:option value="Mr">Mr</form:option>
						<form:option value="Mrs">Mrs</form:option>
						<form:option value="Miss">Miss</form:option>
						<form:option value="Dr">Dr.</form:option>
					</form:select>
					
				</div>
				<div class="col-md-8 form-group">
					<label>Name</label>
					<form:input type="text" class="form-control" path="name" />
				</div>
			</div>


			<div class="row">
				<div class="col-md-6 form-group">
					<label>Father's/Husband</label>
					<form:input type="text" class="form-control" path="fname" />
				</div>
				<div class="col-md-6 form-group">
					<label>Date Of Birth</label>
					<form:input type="date" class="form-control" path="dob" />
				</div>
			</div>

			<div class="row">
				<div class="col-md-6 form-group">
					<label>Phone Number</label>
					<form:input type="text" class="form-control" path="details.phone" />
				</div>
				<div class="col-md-6 form-group">
					<label>Email Address</label>
					<form:input type="text" class="form-control" path="details.gmail" />
				</div>
			</div>


			<div class="row">
				<div class="col-md-6 form-group">
					<label>Gender</label> <label class="radio-inline"> <form:radiobutton
							path="gender" value="M" />Male
					</label> <label class="radio-inline"> <form:radiobutton
							path="gender" value="F"/>Female
					</label>
				</div>
			</div>


			<div class="row">
				<div class="col-md-4 form-group">
					<label>Qualification</label>
					<form:input type="text" class="form-control"
						path="details.qualification" />
				</div>
				<div class="col-md-4 form-group">
					<label>Occupation</label>
					<form:input type="text" class="form-control"
						path="details.occupation" />
				</div>
				<div class="col-md-4 form-group">
					<label>vemana hard copy</label>
					<form:select class="form-control" id="sel1" name="title"
						path="details.vemanaVani">
						<option value="yes">yes</option>
						<option value="No">No</option>

					</form:select>
				</div>
			</div>


			<div class="row">
				<div class="col-md-6 form-group">
					<label>Marital status</label>
					<form:select class="form-control" id="sel1" name="title"
						path="details.maritalStatus">
						<option value="yes">yes</option>
						<option value="No">No</option>

					</form:select>
				</div>

				<div class="col-md-6 form-group">
					<label>No Of children</label>
					<form:input type="text" class="form-control" path="details.noc" />
				</div>
			</div>


			<div class="row">
				<div class="col-md-8 form-group">
					<label>communication Address</label> <form:input type="text" rows="3"
						class="form-control" path="address.address"/>
				   
				</div>

				<div class="col-md-4 form-group">
					<label>Town/Taluk</label> <form:input type="text" class="form-control" path="address.taluk"/>
				</div>

			</div>

			<div class="row">
				<div class="col-md-4 form-group">
					<label>City</label> <form:input type="text" class="form-control"  path="address.city"/>
				</div>
				<div class="col-md-4 form-group">
					<label>State</label> <form:input type="text" class="form-control" path="address.state" />
				</div>
				<div class="col-md-4 form-group">
					<label>Zip</label> <form:input type="text" class="form-control" path="address.pincode"/>
				</div>
			</div>


			<div class="row">
				<div class="col-md-4 form-group">
					<label>upload image</label> <input type="file" class="form-control"  name="file"/>
				</div>
			
			</div>


 			<button type="submit" class="btn btn-primary">submit</button>

		</form:form>
	</div>
