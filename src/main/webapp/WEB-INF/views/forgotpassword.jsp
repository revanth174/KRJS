<div class="container">
			<div class="panel panel-primary">
				<div class="panel-heading">Panel with panel-primary class</div>
				<div class="panel-body">

					<form action="${contextRoot }/login/forgot" class="form-inline"
						id="forgotpassword-form">
						<div class="form-group">
							<label for="email">MemberId:</label> <input type="text"
								name="memberid"  class="form-control" id="mid">
						</div>
						<div class="clearfix"></div>
						<div class="form-group">
							<label for="pwd">Enter the code sent your mobile:</label> <input
								type="text" name="code" class="form-control" id="code">
						</div>
						
						
						<div class="clearfix"></div>
						<div class="form-group">
							<label for="pwd">Enter new password:</label> <input 
								type="text" name="newpassword" class="form-control" id="newpass">
						</div>

						<div class="clearfix"></div>
						<div class="form-group">

							<input type="submit" class="form-control" id="pwd" value="submit">
						</div>



					</form>






				</div>
			</div>


		</div>
	</div>