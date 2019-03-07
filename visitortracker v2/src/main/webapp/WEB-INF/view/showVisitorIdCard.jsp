<%@page import="java.util.Iterator"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import="com.nousinfo.bean.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<div class="container">

		<div class="row visitorDiv" id="allVisitors">
			<%
				Visitor visitorObj = (Visitor) request.getAttribute("visitorObj");
				String visitorId = (String) request.getAttribute("visitorId");
			%>



			<div class="card" style="border: red !important;">
				<center>
					<img height="60px" width="130px" src="images/Nous Logo.png">
					<p style="color: #0b438d;">
						<b>Visitor Id</b>
					</p>
				</center>
				<center>
					<img height="120px" width="110px"
						src="${pageContext.request.contextPath}/showImage?visitorId=<%out.println(visitorObj.getId());%>&signRequired=0">

					<br> <span><b> <%
 	out.println(visitorObj.getName());
 %>
					</b> </span> <br> <span><b> <%
 	out.println(visitorId);
 %>
					</b> </span>
				</center>
			</div>
		</div>
	</div>



</body>
</html>