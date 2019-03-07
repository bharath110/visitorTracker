<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
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
    width: 20%;
}
</style>
<body>
<%@ page import="com.sms.entity.PatientDetails"%>
<form action="sendNotification" style="border:1px solid #ccc">
<table>
  <tr>
    <th>Patient Name</th>
    <th>Address</th>
    <th>Contact Number</th>
  </tr>
  <%
  PatientDetails patientDetails = (PatientDetails)request.getAttribute("patientDetails");
  %>
  <tr>
    <td><%=patientDetails.getName() %></td>
    <td><%=patientDetails.getAddresh() %></td>
    <td><%=patientDetails.getMobilenumber() %></td>
  </tr>
  
  </table>
  	<input type="hidden" name = "contactNo" value="<%=patientDetails.getMobilenumber() %>">
    <button type="button" class="cancelbtn" onclick="cancel()">Cancel</button>
    <button type="submit" class="signupbtn">Send Notification</button>
</form>
</body>
<script>
function cancel(){
	window.location.href = "/home";
}

</script>
</html>