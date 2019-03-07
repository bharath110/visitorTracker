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
		<%
			Visitor visitorObj = (Visitor) request.getAttribute("visitorObj");
			String visitorId = (String) request.getAttribute("visitorId");
		%>
		<center>
			<div class="idCardHolder"
				style="align: center; width: 225px; padding: 4px; margin: 0 auto; border-color: black; border-radius: 10px; position: relative; width: 225px; background-color: #a2c7ea;">

				<div class="idCard" style="background-color: #fff;">
					<div class="header">

						<img class="visitorIdimg" width="65%;" src="images/Nous2.png" style="margin-top: 10px;">
					</div>
					<hr
						style="color: #204284 !important; width: 90%; margin-bottom: 0;">
					<h2 style="color: red; margin: 0;">VISITOR</h2>
					<div class="photo">
						<img width="48%" height="125px !important;"
							src="${pageContext.request.contextPath}/showImage?visitorId=<%out.println(visitorObj.getId());%>&signRequired=0">
					</div>
					<h3 style="margin: 0;">
						<%
							out.println(visitorObj.getName());
						%>
					</h3>
					<h3 style="margin: 0;">
						<%
							out.println(visitorObj.getVisitorIdCardNo());
						%>
					</h3 style="margin: 0;">

					<h5 style="margin: 0;">www.nousinfosystems.com</h5>
					<hr style="color: #204284 !important; width: 90%; margin: 0;">
					<p style="margin: 0;">
						<!-- <strong>NOUS Infosystems</strong> -->

						1,1st Main Road,1st Block, Koramangala, Bengaluru, Karnataka
						560034
					<p>
				</div>
		</center>
	</div>
</body>
</html>