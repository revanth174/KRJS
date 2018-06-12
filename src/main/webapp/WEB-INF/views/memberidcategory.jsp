
<form action="${contextRoot }/show/category/${category }/members" id="search-form">
	<c:choose>

		<c:when test="${category == 'taluk' }">
			<div class="col-md-3 form-group">
				<label>State</label> <select class="form-control" name="state"
					id="state">
					<option value="select">select</option>
					<option value="karnataka">karnataka</option>
					<option value="andhra pradesh">Andhra Pradesh</option>
					<option value="telangana">Telangana</option>
					<option value="tamilnadu">tamilnadu</option>

				</select>
			</div>
			<div class="col-md-3 form-group">
				<label>District</label> <select class="form-control" name="district"
					id="district">
					<option value="select">select</option>
				</select>
			</div>
			<div class="col-md-3 form-group">
				<label>Taluk</label> <select class="form-control" name="taluk"
					id="taluk">
					<option value="select">select</option>
				</select>
			</div>

			<div class="col-md-3 form-group">
				<label>click</label> <input type="submit" class="form-control"
					value="submit">
			</div>

		</c:when>


		<c:when test="${category == 'district' }">

			<div class="col-md-3 form-group">
				<label>State</label> <select class="form-control" name="state"
					id="state">
					<option value="select">select</option>
					<option value="karnataka">karnataka</option>
					<option value="andhra pradesh">Andhra Pradesh</option>
					<option value="telangana">Telangana</option>
					<option value="tamilnadu">tamilnadu</option>

				</select>
			</div>
			<div class="col-md-3 form-group">
				<label>District</label> <select class="form-control" name="district"
					id="district">
					<option value="select">select</option>
				</select>
			</div>
			

			<div class="col-md-3 form-group">
				<label>click</label> <input type="submit" class="form-control"
					value="submit">
			</div>



		</c:when>
		
		<c:when test="${category == 'state' }">
			<div class="col-md-3 form-group">
				<label>State</label> <select class="form-control" name="state"
					id="state">
					<option value="select">select</option>
					<option value="karnataka">karnataka</option>
					<option value="andhra pradesh">Andhra Pradesh</option>
					<option value="telangana">Telangana</option>
					<option value="tamilnadu">tamilnadu</option>

				</select>
			</div>
			<div class="col-md-3 form-group">
				<label>click</label> <input type="submit" class="form-control"
					value="submit">
			</div>
		</c:when>
		
		
		
		<c:otherwise>
			<div class="col-md-3 form-group">

				<label>Enter ${category}</label> <input type="text"
					name="input-search" id="w-input-search" class="form-control" />

			</div>
			<div class="col-md-3 form-group">
				<label>click</label> <input type="submit" class="form-control"
					value="submit">
			</div>
		</c:otherwise>
	</c:choose>

	


</form>

<script type="text/javascript">
	var kar = [ "Bagalkot", "Belagavi", "Bellary", "Bengaluru Urban",
			"Bengaluru Rural", "Bidar", "Bijapura", "Chamarajanagar",
			"Chikballapur", "Chikkamagaluru", "Chitradurga",
			"Dakshina Kannada", "Davanagere", "Dharwad", "Gadag", "Gulbarga",
			"Haveri", "Hassan", "Kolar", "Koppal", "Kodagu", "Mandya",
			"Mysuru", "Raichur", "Ramanagara", "Shivmogga", "Tumakuru",
			"Udupi", "Uttara Kannada", "Yadgir" ];
	var ap = [ "Anantapur", "Chittoor", "East Godavari", "Guntur",
			"YSR Kadapa", "Krishna", "Kurnool", "Nellore", "Prakasam",
			"Srikakulam", "Visakhapatnam", "Vizianagaram", "West Godavari" ];

	var tn = [ "Ariyalur", "Chennai", "Coimbatore", "Cuddalore", "Dharmapuri",
			"Dindigul", "Erode", "Kancheepuram", "Karur", "Krishnagiri",
			"Madurai", "Nagapattinam", "Kanyakumari", "Namakkal", "Perambalur",
			"Pudukottai", "Ramanathapuram", "Salem", "Sivagangai", "Thanjavur",
			"Theni", "Thiruvallur", "Thiruvarur", "Tiruppur",
			"Thiruvannamalai", "The Nilgiris", "Vellore", "Villupuram",
			"Virudhunagar" ];
	var ts = [ "Adilabad", "Bhadradri Kothagudem", "Hyderabad", "Jagtial",
			"Jangaon", "Jayashankar Bhupalpally", "Jogulamba Gadwal",
			"Kamareddy", "Karimnagar", "Khammam", "Kumuram Bheem",
			"Mahabubabad", "Mahabubnagar", "Mancherial", "Medak", "Medchal",
			"Nagarkurnool", "Nalgonda", "Nirmal", "Nizamabad", "Peddapalli",
			"Rajanna Sircilla", "Rangareddy", "Sangareddy", "Siddipet",
			"Suryapet", "Vikarabad", "Wanaparthy", "Warangal (Rural)",
			"Warangal (Urban)", "Yadadri Bhuvanagiri" ];

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
	kt["Kolar"] = "Hassan|Arsikere|Channarayapattana|Holenarsipura|Sakleshpura|Alur|Arkalgudu|Belur";

	$(function() {

		$("search-from").validate({
			rules : {
				"input-search" : "required"
			}
		});

		$state = $("#state");
		$dis = $('#district');
		$options = "<option>select district</option>";
		var i;
		$state.change(function() {
			//alert($(this).val());
			if ($(this).val() == "karnataka") {
				//alert($(this).val());

				for (i = 0; i < kar.length; i++) {

					$options += "<option value='"+kar[i] +"'>" + kar[i]
							+ "</option>";

				}
				$('select#district').html($options);
			} else if ($(this).val() == "andhra pradesh") {
				//alert($(this).val());

				for (i = 0; i < ap.length; i++) {

					$options += "<option value='"+ap[i] +"'>" + ap[i]
							+ "</option>";

				}
				$('select#district').html($options);
			} else if ($(this).val() == "tamilnadu") {
				//alert($(this).val());

				for (i = 0; i < tn.length; i++) {

					$options += "<option value='"+tn[i] +"'>" + tn[i]
							+ "</option>";

				}
				$('select#district').html($options);
			} else if ($(this).val() == "telangana") {
				//alert($(this).val());

				for (i = 0; i < ts.length; i++) {

					$options += "<option value='"+ts[i] +"'>" + ts[i]
							+ "</option>";

				}
				$('select#district').append($options);
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
			for (i = 0; i < taluks.length; i++) {
				$talukOptions += "<option value='"+taluks[i] +"'>" + taluks[i]
						+ "</option>";
			}

			$("select#taluk").html($talukOptions);
		})
	});
</script>

