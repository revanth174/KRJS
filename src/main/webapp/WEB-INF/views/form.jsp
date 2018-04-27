<% int a = 10;
%>
<div class="container well" style="margin-top: 50px">
	<form:form action="${contextRoot }/add" modelAttribute="member" id="register-form"
		method="post" enctype="multipart/form-data">
		<fieldset style="margin-top: 15px">
			<legend>MemberShip form</legend>
		</fieldset>
		<p>
			<b>fill this deatils</b>
		</p>
		<!-- <div class="row"> -->
		<div class="col-md-6 form-group">
			<label>Application Number</label>
			<form:input type="text" name="register_appno" id="appno"
				value='${appno }' class="form-control" path="appNo" readonly="true" />
		</div>

		<div class="col-md-6 form-group">
			<label>Membership Id</label>
			<form:input type="text" id="mid" name="register_memid"
				class="form-control" value="${memid }" path="memberId"
				readonly="true" />
		</div>

		
		<div class="clearfix"></div>

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
			<form:input type="text" name="register_name" placeholder="enter name"
				class="form-control" path="name" />
		</div>
		<!-- //</div> -->


		<!-- <div class="row"> -->
		<div class="col-md-6 form-group">
			<label>Father's/Husband</label>
			<form:input type="text" class="form-control" path="fhname"
				name="register_fname" />
		</div>
		<script>
/* $(function() {
	$.validator.addMethod("datechange",function(value,element) {
		alert("here");
			var dob = new Date(value);
			var today = new Date();
			alert("you are here");
			return (dob.getFullYear() + 18 < today.getFullYear())
	},'length must be allest 10 and it should onlu contains alphabets')
	$("#datepicker").datepicker({
		changeMonth: true,
	    changeYear: true,
	    dateFormat: 'dd/mm/yy',
	    yearRange: "1950:2050",
	    datechange : true,
	   /*  onSelect: function (date) {
	            var dob = new Date(date);
	            var today = new Date();

	           if (dob.getFullYear() + 18 < today.getFullYear())
	           {
	               alert("Under 18");
	           }
	           else
	           {
	               alert(" Over 18");
	           }
	       } 
	})
});  */
</script>
		<div class="col-md-6 form-group">
			<label>Date Of Birth</label>
			<form:input type="text" id="datepicker" class="form-control"
				path="dob" pattern="" name="register_dob" />
		</div>
		<!-- </div> -->

		<!-- <div class="row"> -->
		<div class="col-md-6 form-group">
			<label>Phone Number</label>
			<form:input type="text" class="form-control" path="details.phone"
				value="" name="register_phone" />
		</div>
		<div class="col-md-6 form-group">
			<label>Email Address</label>
			<form:input type="text" class="form-control" path="details.gmail"
				name="register_email" />
		</div>
		<!-- </div> -->


		<!-- <div class="row"> -->
		<div class="col-md-6 form-group">
			<label Gender class="radio-inline">
			 <form:radiobutton path="gender" value="M" name="register_gender" />Male
			</label> 
			<label class="radio-inline">
			 <form:radiobutton path="gender" value="F" name="register_gender" />Female
			</label>
			<label id="gender-error" class="help-block" for="gender" class="has-error"></label>
		</div>
		
		<!-- </div> -->

		<div class="clearfix"></div>


		<!-- <div class="row"> -->
		<div class="col-md-4 form-group">
			<label>Qualification</label>
			<form:input type="text" class="form-control"
				path="details.qualification" name="register_qualification" />
		</div>
		<div class="col-md-4 form-group">
			<label>Occupation</label>
			<form:input type="text" class="form-control"
				path="details.occupation" name="register_occupation" />
		</div>
		<div class="col-md-4 form-group">
			<label>vemana hard copy</label>
			<form:select class="form-control" id="sel1" name="register_vemana"
				path="details.vemanaVani">
				<option value="yes">yes</option>
				<option value="No">No</option>

			</form:select>
		</div>
		<!-- </div> -->
		<div class="clearfix"></div>


		<!-- <div class="row"> -->
		<div class="col-md-6 form-group">
			<label>Marital status</label>
			<form:select class="form-control" id="marital"
				path="details.maritalStatus" name="register_marital ">
				
				<option value="yes">yes</option>
				<option value="No" selected>No</option>

			</form:select>
		</div>

		<div class="col-md-6 form-group">
			<label>No Of children</label>
			<form:input type="text" class="form-control" path="details.noc"
				name="register_noc" id="noc"/>
		</div>
		<!-- </div> -->

<script type="text/javascript">
	$(function() {
		$("#noc").attr("readonly","true");
		$("#marital").change(function (event) {
			$val = $(this).val();
			
			if($val == "yes"){
				alert($val);
				$("#noc").removeAttr("readonly");
			}
			else{
				$("#noc").attr("readonly","true");
			}
				
				
		})
	
	});
</script>
		<p>Communication Address</p>
		<!-- <div class="row"> -->
		<div class="col-md-4 form-group">
			<label>Dno and street name</label>
			<form:input type="text" rows="3" class="form-control"
				path="address.address" name="register_address" />

		</div>

		<div class="col-md-4 form-group">
			<label>village/Area</label>
			<form:input type="text" rows="3" class="form-control"
				path="address.village" name="register_address" />

		</div>

		
		<!-- </div> -->

		<!-- <div class="row"> -->
		
		<div class="col-md-4 form-group">
			<label>State</label>
			<form:select class="form-control" path="address.state" id="register_state"
				 >
				<form:option value="select">select</form:option>
				<form:option value="karnataka">karnataka</form:option>
				<form:option value="andhra pradesh">Andhra Pradesh</form:option>
				<form:option value="telangana">Telangana</form:option>
				<form:option value="tamilnadu">tamilnadu</form:option>
				
			</form:select>
		</div>
		<div class="col-md-4 form-group">
			<label>Disrict</label>
			<form:select class="form-control" path="address.district" id="register_district"
				 >
				
			</form:select>
		</div>
		
		<div class="col-md-4 form-group">
			<label>Town/Taluk</label>
			<form:select class="form-control" path="address.taluk"
				id="register_taluk" >
				<form:option value="select"> select</form:option>
			</form:select>
		</div>
		
<script type="text/javascript">

var kar = ["Bagalkot","Belagavi","Bellary","Bengaluru Urban","Bengaluru Rural","Bidar","Bijapura","Chamarajanagar","Chikballapur",
	"Chikkamagaluru","Chitradurga","Dakshina Kannada","Davanagere","Dharwad","Gadag","Gulbarga","Haveri","Hassan","Kolar",
	"Koppal","Kodagu","Mandya","Mysuru","Raichur","Ramanagara","Shivmogga","Tumakuru","Udupi","Uttara Kannada","Yadgir"];
var ap = ["Anantapur","Chittoor","East Godavari","Guntur","YSR Kadapa","Krishna","Kurnool","Nellore","Prakasam","Srikakulam",
	"Visakhapatnam","Vizianagaram","West Godavari"];

var tn = ["Ariyalur","Chennai","Coimbatore","Cuddalore","Dharmapuri","Dindigul","Erode","Kancheepuram","Karur","Krishnagiri",
	"Madurai","Nagapattinam","Kanyakumari","Namakkal","Perambalur","Pudukottai","Ramanathapuram","Salem","Sivagangai","Thanjavur",
	"Theni","Thiruvallur","Thiruvarur","Tiruppur","Thiruvannamalai","The Nilgiris","Vellore","Villupuram","Virudhunagar"];
var ts = ["Adilabad","Bhadradri Kothagudem","Hyderabad","Jagtial","Jangaon","Jayashankar Bhupalpally","Jogulamba Gadwal",
	"Kamareddy","Karimnagar","Khammam","Kumuram Bheem","Mahabubabad","Mahabubnagar","Mancherial","Medak","Medchal","Nagarkurnool",
	"Nalgonda","Nirmal","Nizamabad","Peddapalli","Rajanna Sircilla","Rangareddy","Sangareddy","Siddipet","Suryapet","Vikarabad",
	"Wanaparthy","Warangal (Rural)","Warangal (Urban)","Yadadri Bhuvanagiri"];

var kt = [];
kt["Bagalkot"] = "Bagalkote|Jamkhandi|Mudhola|Badami|Bilagi|Hungunda|Ilkal|Rabkavi Banhatti|Guledgudda";
kt["Belagavi"] = "Athani|Bailahongala|Belagavi|Chikodi|Gokak|Hukkeri|Khanapura|Ramdurga|Raybaga|Saundatti|Kittur|Nipani|Mudalgi|Kagawad";
kt["Bellary"] = "Ballari|Hospete|Hoovina Hadagalli|Hagaribommanahalli|Kudligi|Sanduru|Siruguppa|Kotturu|Kampli|Kurugodu";
kt["Bengaluru Urban"] = "Anekal|Bengaluru South|Bengaluru North|Bengaluru East";
kt["Bengaluru Rural"] = "Doddaballapura|Devanhalli|Hosakote|Nelmangala";
kt["Bidar"] = "Aurad|Basavakalyana|Bidar|Bhalki|Homnabad|Chitgoppa|Hulsoor|Kamalnagar";
kt["Bijapura"] = "Bijapur|Basavan Bagevadi|Indi|Muddebihala|Sindagi|Talikote|Chadchan|Devar Hipparagi|Kolhar|Nidagundi|Babaleshwar|Tikota";
kt["Chamarajanagar"] = "Chamrajnagara|Gundlupete|Kollegala|Yelandur|Hanur";
kt["Chikballapur"] = "Chikkaballapur|Bagepalli|Chintamani|Gauribidanuru|Gudibanda|Sidlaghatta";
kt["Chikkamagaluru"] = "Chikkamagaluru|Kadur|Koppa|Mudigere|Narasimharajapura|Sringeri|Tarikere|Ajjampura";
kt["Chitradurga"] = "Chitradurga|Challakere|Hiriyuru|Holalkere|Hosdurga|Molakalmuru";
kt["Dakshina Kannada"] = "Mangalore|Ullal|Kotekar| Mulki|Puttur|Bantwala|Beltangadi|Sulya|Moodbidri";
kt["Davanagere"] = "Davanagere|Harihara| Harpanahalli| Honnali|Nyamathi|Jagaluru";
kt["Dharwad"] = "Kalghatgi|Dharwada|Hubballi (Rural)|Hubballi (Urban)|Kundgol|Navalgunda|Alnavar|Annigeri";
kt["Gadag"] = "Gadaga-Betigeri|Nargunda|Mundargi|Ron|Shirahatti";
kt["Gulbarga"] = "Gulbarga|Afzalpura|Alanda|Chincholi|Chitapura|Jevargi|Sedam|Shahabad";
kt["Haveri"] = "Ranibennur|Byadgi|Hangal|Haveri|Savanur|Hirekeruru|Shiggaon";
kt["Hassan"] ="Alur|Arkalgud|Arsikere|Belur|Channarayapatna|Hassan|Hole Narasipur|Sakleshpur"
kt["Kolar"] = "Hassan|Arsikere|Channarayapattana|Holenarsipura|Sakleshpura|Alur|Arkalgudu|Belur";

	$(function() {
		$state = $("#register_state");
		$dis = $('#register_district');
		
		var i;
		$state.change(function() {
			//alert($(this).val());
			if($(this).val() == "karnataka") {
				//alert($(this).val());
				
				$options ="<option>select district</option>"
				for (i = 0; i < kar.length; i++) { 
				    
					$options += "<option value='"+kar[i] +"'>"+kar[i]+"</option>";
					
				}
				$('select#register_district').html($options);
			} else if($(this).val() == "andhra pradesh") {
				//alert($(this).val());
				
				$options ="<option>select district</option>"
				for (i = 0; i < ap.length; i++) { 
				    
					$options += "<option value='"+ap[i] +"'>"+ap[i]+"</option>";
					
				}
				$('select#register_district').html($options);
			} else if($(this).val() == "tamilnadu") {
				//alert($(this).val());
				$options ="<option>select district</option>"
				for (i = 0; i < tn.length; i++) { 
				    
					$options += "<option value='"+tn[i] +"'>"+tn[i]+"</option>";
					
				}
				$('select#register_district').html($options);
			} else if($(this).val() == "telangana") {
				//alert($(this).val());
				$options ="<option>select district</option>"
				for (i = 0; i < ts.length; i++) { 
				    
					$options += "<option value='"+ts[i] +"'>"+ts[i]+"</option>";
					
				}
				$('select#register_district').html($options);
			}
			
		});
		$dis.change(function() {
			var dis = $(this).val();
			//alert(dis);
			var talukString = kt[dis];
			var taluks = talukString.split("|");
			//alert(taluks);
			//alert(taluks[0]);
			$talukOptions = "<option>select taluk</option>";
			var i;
			for(i=0;i<taluks.length;i++) {
				$talukOptions += "<option value='"+taluks[i] +"'>"+taluks[i]+"</option>";
			}
			
			$("select#register_taluk").html($talukOptions);
		}) 
	});
</script>



		<div class="col-md-4 form-group">
			<label>Zip</label>
			<form:input type="text" class="form-control" path="address.pincode"
				name="register_zip" />
		</div>
		<!-- </div> -->
		<div class="clearfix"></div>

		
		<div class=" col-md-6 form-group">
			<label for="sel1">ward Name</label>
			<form:select class="form-control" id="sel1" name="register_ward"
				path="details.ward">
				<%-- <c:forEach var="ward" items="${wards }">
					<form:option value="${ward.getWardName()}">${ward.getWardName()}</form:option>
				</c:forEach> --%>
				<form:option value="one">one</form:option>
				<form:option value="two">two</form:option>
				<form:option value="three">three</form:option>
				
			</form:select>

		</div>
		
		<div class="col-md-6 form-group">
			<label>Ward Number</label>
			<form:input type="text" class="form-control" path="details.wardNo"
				name="register_wardno" />
		</div>

		<div class="clearfix"></div>

		<p>Proposer Details</p>
		<div class="col-md-4 form-group">
			<label>Proposer MemberID</label>
			<form:input type="text" class="form-control" id="pmid"
				path="ProposerMemberId" name="register_ward" />
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
			<form:input type="text" class="form-control" id="pname"
				readonly="true" placeholder="enter proposer number"
				path="proposerName" name="register_wardno" />
		</div>

		<div class="col-md-4 form-group">
			<label>Proposer phone number</label>
			<form:input type="text" class="form-control" id="pno" readonly="true"
				path="proposerPhoneNumber" name="register_wardno" />
		</div>

		<!-- <div class="row"> -->
		<div class="col-md-4 form-group">
			<label>upload image</label> <input type="file" id="upload"
				class="form-control" name="register_image" />
		</div>
		<div class="col-md-4 form-group">
			<img src="" heigth="100" width="100" id="preview" class="popupimage">
		</div>

		<!-- </div> -->
		<div class="clearfix"></div>
		<div class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">

					<img id="formimg" src="" />
				</div>
			</div>
		</div>
		
		<c:if test ="${member.getMemberId() !=0 }">
			
		</c:if>

<script type="text/javascript">
	$(function() {
		$("#formimg").hide();
		$("#upload").change(function (event) {
			var url = URL.createObjectURL(event.target.files[0]);
			$("img").attr('src',url).show();
		})
	
	});
</script>

		<div class="clearfix"></div>
		<p>Documents to submit</p>
		<div class="col-md-4 form-group">
			<label for="sel1">Select list:</label> 
			<select class="form-control" id="document">
				<option value="">select</option>
				<option value="pan">pan card</option>
				<option value="aadhar">aadhar card</option>
				<option value="voter">voter card</option>
			</select>
		</div>

		<div class="col-md-4 form-group voter" >
			<label >enter number</label>
			<form:input type="text" class="form-control" id="voter" path="voter" />
		</div>
		<div class="col-md-4 form-group pan">
			<label >enter number</label>
			<form:input type="text" class="form-control" id="pan" path="pan" />
		</div>
		<div class="col-md-4 form-group docs aadhar">
			<label >enter number</label>
			<form:input type="text" class="form-control" id="aadhar" path="aadhar" />
		</div>
		
		<div class="clearfix"></div>
		
		<p> payment details</p>
		<div class="col-md-4 form-group">
			<label for="sel1">mode of payment</label> 
			<select class="form-control" id="document" path="payment.mop">
				<option value="">select</option>
				<option value="check">check</option>
				<option value="cash">cash</option>
				<option value="dd">DD</option>
			</select>
		</div>

		<!-- <div class="row"> -->
		<div class="col-md-4 form-group">
			<label>amout paid</label>
			<form:input type="text" class="form-control" id="amout"
				 
				path="payment.feePaid" name="register_wardno" />
		</div>
		
		

		<div class="col-md-4 form-group">
			<label>ref No</label>
			<form:input type="text" class="form-control" id="ref"
				 
				path="payment.refNo" name="register_wardno" />
		</div>
		<div class="clearfix"></div>
		
		<div class="form-group col-md-12">
			<div class="checkbox">
				<label> <input id="terms" name="terms" type="checkbox">
					I have read, consent and agree to Company's User Agreement and
					Privacy Policy (including the processing and disclosing of my
					personal data), and I am of legal age. I understand that I can
					change my communication preferences at any time. Please read the
					Key Payment and ServiceInformation.
				</label>
			</div>
			<label id="terms-error" class="help-block" for="terms" style=""></label>
		</div>
<script type="text/javascript">
	$(function() {
		
		$(".voter").hide();
		$(".pan").hide();
		$(".aadhar").hide();
		$('#document').change(function () {
			
			
			var name = $("#document").val();
			//alert(name);
			if(name == 'aadhar') {
				$(".aadhar").show();
				$(".voter").hide();
				$(".pan").hide();
				$("#aadhar").attr("placeholder","enter aadhar number");
				
				
			} else if(name == 'pan') {
				$(".pan").show();
				$(".aadhar").hide();
				$(".voter").hide();
				$("#pan").attr("placeholder","enter pan number");
				
				
			} else if(name == 'voter') {
				$(".voter").show();
				$(".pan").hide();
				$(".aadhar").hide();
				$("#voter").attr("placeholder","enter voter number");
				
				
			}else
				$("#docs").hide();
				
			
		}) 
	
	});
</script>
		<div>

			<input type="submit" class="btn btn-primary"
				style="margin-bottom: 10px" value="Submit"> <input
				type="reset" class="btn btn-primary"
				style="margin-bottom: 10px; float: right"></input> <input
				type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</div>

	</form:form>
</div>
