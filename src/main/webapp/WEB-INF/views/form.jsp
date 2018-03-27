
<div class="container well" style="margin-top: 50px">
		<form:form action="add" modelAttribute="member" id="register-form" method="post" enctype="multipart/form-data">
		<fieldset style="margin-top : 15px">
        	<legend>MemberShip form</legend>
      	</fieldset>
      	<p><b>fill this deatils</b></p>
			<!-- <div class="row"> -->
				<div class="col-md-6 form-group">
					<label>Application Number</label>
					<form:input type="text" name="register_appno" id="appno" value='${appno }'
						class="form-control" path="appNo" readonly="true" />
				</div>
				
				<div class="col-md-6 form-group">
					<label>Membership Id</label>
					<form:input type="text" id="mid" name="register_memid" class="form-control"  value="${memid }"
						path="memberId" readonly="true"/>
				</div>   

			<!-- </div> -->
				<div class="clearfix">
				</div>

			 <!-- <div class="row"> -->
				<div class=" col-md-4 form-group">
					<label for="sel1">Select list (select one):</label>
					<form:select class="form-control" id="sel1" name="register_title"
						path="title">
						<form:option value="Mr">Mr</form:option>
						<form:option value="Mrs">Mrs</form:option>
						<form:option value="Miss">Miss</form:option>
						<form:option value="Dr">Dr.</form:option>
					</form:select>
					
				</div>
				<div class="col-md-8 form-group">
					<label class="control-label">Name</label>
					<form:input type="text" name="register_name" placeholder="enter name" class="form-control" path="name" />
				</div>
			<!-- //</div> -->


			<!-- <div class="row"> -->
				<div class="col-md-6 form-group">
					<label>Father's/Husband</label>
					<form:input type="text" class="form-control" path="fhname" name="register_fname"/>
				</div>
				<div class="col-md-6 form-group">
					<label>Date Of Birth</label>
					<form:input type="date" class="form-control" path="dob" pattern="" name="register_dob"/>
				</div>
			<!-- </div> -->

			<!-- <div class="row"> -->
				<div class="col-md-6 form-group">
					<label>Phone Number</label>
					<form:input type="text" class="form-control" path="details.phone" value="" name="register_phone"/>
				</div>
				<div class="col-md-6 form-group">
					<label>Email Address</label>
					<form:input type="text" class="form-control" path="details.gmail" name="register_email"/>
				</div>
			<!-- </div> -->


			<!-- <div class="row"> -->
				<div class="col-md-6 form-group">
					<label Gender class="radio-inline"> 
						<form:radiobutton path="gender" value="M" name="register_gender"/>Male
					</label> 
					<label class="radio-inline"> 
						<form:radiobutton path="gender" value="F" name="register_gender"/>Female
					</label>
				</div>
			<!-- </div> -->
			
				<div class="clearfix">
				</div>


			<!-- <div class="row"> -->
				<div class="col-md-4 form-group">
					<label>Qualification</label>
					<form:input type="text" class="form-control" path="details.qualification" name="register_qualification"/>
				</div>
				<div class="col-md-4 form-group">
					<label>Occupation</label>
					<form:input type="text" class="form-control" path="details.occupation" name="register_occupation"/>
				</div>
				<div class="col-md-4 form-group">
					<label>vemana hard copy</label>
					<form:select class="form-control" id="sel1" name="register_vemana" path="details.vemanaVani">
						<option value="yes">yes</option>
						<option value="No">No</option>

					</form:select>
				</div>
			<!-- </div> -->
			<div class="clearfix">
			</div>


			<!-- <div class="row"> -->
				<div class="col-md-6 form-group">
					<label>Marital status</label>
					<form:select class="form-control" id="sel1" path="details.maritalStatus" name="register_marital">
						<option value="yes">yes</option>
						<option value="No">No</option>

					</form:select>
				</div>

				<div class="col-md-6 form-group">
					<label>No Of children</label>
					<form:input type="text" class="form-control" path="details.noc" name="register_noc"/>
				</div>
			<!-- </div> -->


			<p> Communication Address </p>
			<!-- <div class="row"> -->
				<div class="col-md-8 form-group">
					<label>Address</label> 
					<form:input type="text" rows="3" class="form-control" path="address.address" name="register_address"/>
				   
				</div>

				<div class="col-md-4 form-group">
					<label>Town/Taluk</label> <form:input type="text" class="form-control" path="address.taluk" name="register_town"/>
				</div>

			<!-- </div> -->

			<!-- <div class="row"> -->
				<div class="col-md-4 form-group">
					<label>Disrict</label> 
					<form:input type="text" class="form-control"  path="address.district" name="register_district"/>
				</div>
				<div class="col-md-4 form-group">
					<label>State</label> 
					<form:input type="text" class="form-control" path="address.state" name="register_state"/>
				</div>
				<div class="col-md-4 form-group">
					<label>Zip</label> 
					<form:input type="text" class="form-control" path="address.pincode" name="register_zip"/>
				</div>
			<!-- </div> -->
				<div class="clearfix">
				</div>
				
				<div class="col-md-6 form-group">
					<label>Ward Name</label> 
					<form:input type="text" class="form-control"  path="details.ward" name="register_ward"/>
				</div>
				<div class="col-md-6 form-group">
					<label>Ward Number</label> 
					<form:input type="text" class="form-control"  path="details.wardNo" name="register_wardno"/>
				</div>
				
				<div class="clearfix">
				</div>
				
				<p>Proposer Details </p>
				<div class="col-md-4 form-group">
					<label>Proposer MemberID</label> 
					<form:input type="text" class="form-control" id="pmid"  path="ProposerMemberId" name="register_ward"/>
				</div>
<script type="text/javascript">
$(function() {
	$("#pmid").on("change",function() {
		if($("#pmid").val != null) {
			$.getJSON('pid?id='+$("#pmid").val(),function(data) {
				$("#pname").val(data.name);
				$("#pno").val(data.phone);
			});
		} else {
			$("#pname").val("");
			$("#pno").val("");
		}
			
	});

});
</script> 
				<div class="col-md-4 form-group">
					<label>Propser Name</label> 
					<form:input type="text" class="form-control" id="pname" readonly="true" placeholder="enter proposer number" path="proposerName" name="register_wardno"/>
				</div>
				
				<div class="col-md-4 form-group">
					<label>Proposer phone number</label> 
					<form:input type="text" class="form-control" id="pno"  readonly="true"  path="proposerPhoneNumber" name="register_wardno"/>
				</div>

			<!-- <div class="row"> -->
				<div class="col-md-4 form-group">
					<label>upload image</label> <input type="file"  id="upload" class="form-control"  name="register_image"/>
				</div>
				<div class="col-md-4 form-group">
					<img src="" heigth="100" width="100" id="preview" class="popupimage">
				</div>
			
			<!-- </div> -->
			<div class="clearfix">
			</div>
			<div class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						
						<img id="formimg" src="" />
					</div>
				</div>
			</div>

<script type="text/javascript">
$(function() {
	$("#formimg").hide();
	$("#upload").change(function (event) {
		var url = URL.createObjectURL(event.target.files[0]);
		$("img").attr('src',url).show();
	})

});
</script>
			<div class="form-group col-md-12">
		       <div class="checkbox">
		         <label>
		           <input id="terms" name="terms" type="checkbox"> 
		           I have read, consent and agree to Company's User Agreement and Privacy Policy
		           (including the processing and disclosing of my personal data), and I am of 
		           legal age. I understand that I can change my communication preferences at any
		           time. Please read the Key Payment and ServiceInformation.
		         </label>
		       </div>
		       <label id="terms-error" class="help-block" for="terms" style="">This field is required.</label>
		           	 </div>
     <div>

 			<input type="submit" class="btn btn-primary" style="margin-bottom:10px" value="Submit">
 			<input type="reset" class="btn btn-primary" style="margin-bottom:10px;float: right"></input>
 			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
 		</div>

		</form:form>
	</div>
