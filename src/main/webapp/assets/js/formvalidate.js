$(document).ready(function() {

	$.validator.setDefaults( {
		errorClass : "help-block",
		highlight : function(element) {
			$(element)
				.closest('.form-group')
				.addClass("has-error")
				.closest("label")
				.addClass("has-error")
		},
		unhighlight :  function(element) {
			$(element)
				.closest('.form-group')
				.removeClass("has-error")
				.closest("label")
				.removeClass("has-error")
		}
	});
	$.validator.addMethod("length",function(value,element) {
		return value.length > 12 
			&& /^[a-zA-Z]*$/.test(value);
	},'length must be allest 10 and it should onlu contains alphabets')

	$.validator.addMethod("startwith",function(value,element) {
		return /^[6789]/.test(value);
	},'phone number must begins with either 6,7,8 or 9')
	
	$("#register-form").validate({
		rules: {
			"details.gmail" : {
				required : true,
				email : true,
				//remote : "http://localhost:8080/"
			},
			name : {
				required : true,
				length : true
			},
			fname : {
				required : true,
				length : true
			},
			dob : "required",
			"details.phone" : {
				required : true
			},
			"details.phone" : {
				digits : true,
				maxlength : 10,
				minlength : 10,
				required : true,
				startwith : true
				
			},
			gender : "required",
			"details.qualification"  : "required",
			"details.occupation"  : "required",
			"details.vemanaVani"  : "required",
			"details.maritalStatus" : "required",
			"address.address" : "required",
			"address.taluk" :  "required",
			"address.city"  : "required",
			"details.ward": "required",
			"details.wardNo": "required"
			
			

		},
		messages : {
			"details.gmail" : {
				required : "email is mandatory",
				email : "enter proper email like 123@gmail.com"
			}
			


		}
	});
});