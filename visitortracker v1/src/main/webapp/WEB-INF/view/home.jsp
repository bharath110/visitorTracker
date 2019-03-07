<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page import="com.nousinfo.bean.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Visitor Tracker</title>
<%@ include file="templates/header.jsp"%>

</head>
<body>

	<%
		List<Visitor> todaysVisitors = (List<Visitor>) request.getAttribute("todaysVisitors");
		Iterator<Visitor> todaysVisitorsListIterator = todaysVisitors.iterator();
	%>
	<table class="table table-striped table-bordered table-hover ">

		<tr>
			<th>Name</th>
			<th>Email</th>
			<th>Mobile</th>
			<th>Meeting Person</th>
			<th>Purpose</th>
			<th>From</th>
			<th>Location</th>
			<th>Check In Time</th>
			<th>Check Out Time</th>
			<th>Pic</th>
			<th>Action</th>
		</tr>

		<%
			while (todaysVisitorsListIterator.hasNext()) {
				Visitor visitorObj = todaysVisitorsListIterator.next();
		%>

		<tr>
			<td>
				<%
					out.println(visitorObj.getName());
				%>
			</td>
			<td>
				<%
					out.println(visitorObj.getEmail());
				%>
			</td>
			<td>
				<%
					out.println(visitorObj.getMobile());
				%>
			</td>
			<td>
				<%
					out.println(visitorObj.getPurpose());
				%>
			</td>
			<td>
				<%
					out.println(visitorObj.getMeetingPerson());
				%>
			</td>
			<td>
				<%
					out.println(visitorObj.getFromPlace());
				%>
			</td>
			<td>
				<%
					out.println(visitorObj.getLocation());
				%>
			</td>
			<td>
				<%
					out.println(visitorObj.getCheckInTime());
				%>
			</td>
			<td>
				<%
					out.println(visitorObj.getCheckOutTime() != null ? visitorObj.getCheckOutTime() : "");
				%>
			</td>
			<td><img height="100px" width="150px"
				src="${pageContext.request.contextPath}/showImage?visitorId=<%out.println(visitorObj.getId());%>"></td>
			<td><button type="submit" action-class="btn btn-primary">Edit</button>
				<br>
				<button class="btn btn-primary">Delete</button></td>


			<%
				}
			%>
		
</body>
</html>