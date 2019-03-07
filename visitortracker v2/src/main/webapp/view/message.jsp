<!DOCTYPE html>
<html>
<head>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css" />
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>   
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
</head>
<style>
/* Full-width input fields */
#numbers, #message, #sender {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* Set a style for all buttons */
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 60%;
}

/* Extra styles for the cancel button */
.cancelbtn {
    padding: 14px 20px;
    background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn,.signupbtn {
    float: left;
    width: 50%;
}

/* Add padding to container elements */
.container {
    padding: 16px;
}

/* Clear floats */
.clearfix::after {
    content: "";
    clear: both;
    display: table;
}
.clearfix{
width: 60%;
}
/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
    .cancelbtn, .signupbtn {
       width: 100%;
    }
}

/* Li*/
ul#menu {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

ul#menu li {
    float: left;
    border-right:1px solid #bbb;
}

ul#menu li:last-child {
    border-right: none;
}

ul#menu li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

ul#menu li a:hover:not(.active) {
    background-color: #111;
}

ul#menu .active {
    background-color: #4CAF50;
}

.pl0 {
	padding-left: 0;
}

.pl0 > div {
	padding:0;
}

#datetimepicker1 {
	width: 45%;
}

</style>



<body>

<%@ page import="com.sms.entity.PatientDetails"%>
<ul id="menu">
  <li><a  href="home">Home</a></li>
  <li><a  href="patient">Patient</a></li>
  <li><a class="active" href="message">Message</a></li>
  
</ul><br><br>
<h2>Signup Form</h2>

<form action="sendMessage1" style="border:1px solid #ccc">


  <div class="container">
    <label><b>Mobile Number</b></label>
    <input type="text" placeholder="Mobile Number" readonly="readonly"  name="numbers" id="numbers" value = '<%=request.getAttribute("contactNo") %>' >
<!-- <label><b>Message</b></label>
    <input type="text" placeholder="Enter Your Message" name="message" id="message" required>
   
    <label><b>Sender</b></label>
    <input type="text" placeholder="Enter sender Name" name="sender" id="sender" required>-->

   <div class="container pl0">
	    <div class='col-md-5'>
	        <div class="form-group">
	            <div class='input-group date' id='datetimepicker1' name="datetimepicker1">
	                <input type='text' class="form-control" id="appd" name="appd"  />
	                <span class="input-group-addon">
	                    <span class="glyphicon glyphicon-calendar"></span>
	                </span>
	            </div>
	        </div>
	    </div>
	</div>
   

    <div class="clearfix">
      <button type="button" class="cancelbtn" onclick="cancel()">Cancel</button>
      <button type="submit" class="signupbtn">Send</button>
    </div>
  </div>
  
  
  
</form>

<script type="text/javascript">
$(document).ready(function() {
        $(function () {
            $('#datetimepicker1').datetimepicker();
            
        });
    });
    
function cancel(){
	window.location.href = "/home";
}
    
</script>

</body>
</html>