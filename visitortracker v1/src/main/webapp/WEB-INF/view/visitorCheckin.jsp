<!DOCTYPE html>
<html lang="en">
<head>
<title>Visitor Tracker</title>
<%@ include file="templates/header.jsp"%>
</head>
<body>
	<div class="container">
		<div class="row">

			<div class="col-md-6">
				<form class="well form-horizontal" action="saveVisitor"
					method="post" id="contact_form">
					<fieldset>

						<!-- Form Name -->
						<legend>Visitor Check In</legend>

						<!-- Text input-->

						<div class="form-group">
							<label class="col-md-4 control-label">Name</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> <input name="name"
										placeholder="Name" class="form-control" type="text">
								</div>
							</div>
						</div>

						<!-- Text input-->



						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label">E-Mail</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-envelope"></i></span> <input name="email"
										placeholder="E-Mail Address" class="form-control" type="text">
								</div>
							</div>
						</div>


						<!-- Text input-->

						<div class="form-group">
							<label class="col-md-4 control-label">Mobile #</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-earphone"></i></span> <input name="mobile"
										placeholder="Mobile" class="form-control" type="text">
								</div>
							</div>
						</div>





						<!-- Text input-->

						<div class="form-group">
							<label class="col-md-4 control-label">From</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-home"></i></span> <input name="fromPlace"
										placeholder="From" class="form-control" type="text">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label">Meeting Person</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-home"></i></span> <input
										name="meetingPerson" placeholder="Meeting Person"
										class="form-control" type="text">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label">Purpose</label>
							<div class="col-md-4 inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-home"></i></span> <input name="purpose"
										placeholder="Purpose" class="form-control" type="text">
								</div>
							</div>
						</div>

						<!-- Select Basic -->

						<div class="form-group">
							<label class="col-md-4 control-label">Location</label>
							<div class="col-md-4 selectContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-list"></i></span> <select name="location"
										class="form-control selectpicker">
										<option value=" ">Please select your state</option>
										<option>HSR Office</option>
										<option>Koramangala Office</option>

									</select>
								</div>
							</div>
						</div>

						<div>
							<div>
								<label for="image_file">Please select image file</label>
							</div>
							<div>
								<input type="file" name="visitorPic" id="image_file"
									onchange="fileSelected();" />
							</div>
						</div>




						<!-- Button -->
						<div class="form-group">
							<label class="col-md-4 control-label"></label>
							<div class="col-md-4">
								<button type="submit" class="btn btn-warning">
									Send <span class="glyphicon glyphicon-send"></span>
								</button>
							</div>
						</div>
			</div>
			<div class="col-md-6">
				<!-- Form Name -->
				<legend>Item</legend>

				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">Name</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input name="iName"
								placeholder="Name" class="form-control" type="text">
						</div>
					</div>
				</div>
				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label">Bar Code</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i class=""></i></span> <input
								name="barCode" placeholder="E-Mail Address" class="form-control"
								type="text">
						</div>
					</div>
				</div>


				<!-- Text input-->

				<div class="form-group">
					<label class="col-md-4 control-label">Description</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-earphone"></i></span> <input
								name="description" placeholder="Mobile" class="form-control"
								type="text">
						</div>
					</div>
				</div>





				<!-- Text input-->


			</div>
			</fieldset>
			</form>

		</div>
	</div>

	<!-- /.container -->
</body>
</html>
