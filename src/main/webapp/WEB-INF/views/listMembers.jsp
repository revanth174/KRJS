<div class="container">

<div class="row">
			<div class="col-lg-3">
			
			<%@ include file="./shared/navbar.jsp" %>
			</div>
			
			<div class="col-lg-9">
			
					<c:if test=${ userclickcategorymember == true && category==memberid}>
					<%@ include file="memberidcategory.jsp" %>
					</c:if>
			</div>
		</div>
<script>
	$(document).ready(function() {

		$('#w-input-search').autocomplete({
			serviceUrl: '${contextRoot}/gettags',
			paramName: "tagName",
			delimiter: ",",
		    transformResult: function(response) {
		    	
		        return {
		        	
		            suggestions: $.map($.parseJSON(response), function(item) {
		            	
		                return { value: item.Name, data: item.name };
		            })
		            
		        };
		        
		    }
		    
		});
		
		
	});
	</script>
</div>