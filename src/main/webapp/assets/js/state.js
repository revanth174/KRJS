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
$(function() {
	$state = $("#register_state");
	$dis = $('#register_district');
	
	$state.change(function() {
		alert($(this).val());
		if($(this).val() == "kar") {
			alert($(this).val());
			$options ="";
			var i;
			for (i = 0; i < kar.length; i++) { 
			    
				$options += "<option value='"+kar[i] +"'>"+kar[i]+"</option>";
				
			}
			$('select#register_district').html($options);
		}
		
	})
});