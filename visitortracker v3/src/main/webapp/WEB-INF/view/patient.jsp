<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>

	
	
<link rel="stylesheet" type="text/css" href="/css/login.css"/>
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
    border-right:1px solid #bbb;
}

li:last-child {
    border-right: none;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover:not(.active) {
    background-color: #111;
}

.active {
    background-color: #4CAF50;
}
</style>

</head>

<body>




<ul>
  <li><a  href="home">Home</a></li>
  <li><a class="active" href="patient">Patient</a></li>
  <li><a href="message">Message</a></li>
  
</ul>




  <!-- Modal Content -->
  <form class="modal-content animate" action="save" method="post">
    <div class="imgcontainer">
    <p>Patient Details </p>
      <!--<img src="img_avatar2.png" alt="Avatar" class="avatar">-->
    </div>

    <div class="container">
      <label><b>Patient Name</b></label>
      <input type="text" placeholder="Enter Patient Name" name="name" id="name" required>

<label><b>Patient MobileNumber</b></label>
      <input type="text" placeholder="Enter MobileNumber" name="mobilenumber" id="mobilenumber" required>

      <label><b>Patient Addresh</b></label>
      <input type="text" placeholder="Enter Addresh" name="addresh" id="addresh" required>
      
 
      <button type="submit">Submit</button>
     
    </div>

    
  </form>
</div>
</body>
</html>