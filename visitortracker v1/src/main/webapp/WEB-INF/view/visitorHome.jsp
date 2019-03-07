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
<title>Visitor Tracker</title>
<%@ include file="templates/header.jsp"%>
</head>
<body>
	<div class="container">
		<center>
			<h2>
				<span class="">Today's Visitors</span>
			</h2>
		</center>
		<div class="row">
			<ul class="nav nav-tabs">
				<li class="nav-item active"><a class="nav-link " href="#"
					onclick="checkInChcekOut('ALL')">All Visitors</a></li>
				<li class="nav-item"><a class="nav-link " href="#"
					onclick="checkInChcekOut('IN')">Checked In Visitors</a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					onclick="checkInChcekOut('OUT')">Checked Out Visitors</a></li>
			</ul>
		</div>




		<div class="row" id="checkedInVisitors">
			<%
				List<Visitor> todaysCheckedInVisitors = (List<Visitor>) request.getAttribute("todaysVisitors");
				Iterator<Visitor> todaysCheckedInVisitorsListIterator = todaysCheckedInVisitors.iterator();
			%>
			<div class="col-md-12">
				<table class="table  table-bordered table-hover ">

					<tr>
						<th>Name</th>
						<th>Picture</th>
						<th>Details</th>
						<th>Check In Time</th>
						<th>Check Out Time</th>
						<th>Action</th>
					</tr>

					<%
						while (todaysCheckedInVisitorsListIterator.hasNext()) {
							Visitor visitorObj = todaysCheckedInVisitorsListIterator.next();
					%>
					<%
						String visitorData = visitorObj.getId() + ":" + visitorObj.getName();
					%>
					<tr
						class="<%out.println(visitorObj.isCheckedOut() == true? "outVisitor" : "inVisitor");%>"
						onclick="showItems('<%=visitorData%>')">

						<td><b> <%=visitorObj.getName() %>
						</b></td>
						<td><img height="100px" width="150px"
							src="${pageContext.request.contextPath}/showImage?visitorId=<%out.println(visitorObj.getId());%>&signRequired=0"></td>
						<td>Email :<%
							out.println(visitorObj.getEmail());
						%> <br> Mobile :<%
 	out.println(visitorObj.getMobile());
 %> <br> Meeting Person: <%
 	out.println(visitorObj.getMeetingPerson());
 %> <br> Purpose :<%
 	out.println(visitorObj.getPurpose());
 %> <br> From Place :<%
 	out.println(visitorObj.getFromPlace());
 %> <br> Location :<%
 	out.println(visitorObj.getLocation());
 %> <br> Signature : <img height="30px" width="70px"
							src="${pageContext.request.contextPath}/showImage?visitorId=<%out.println(visitorObj.getId());%>&signRequired=1">
						<td>
							<%
								DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm");
									Date date = new Date();
									out.println(dateFormat.format(visitorObj.getCheckInTime()).split(" ")[1]);
							%>
						</td>
						<td>
							<%
								out.println(visitorObj.getCheckOutTime() != null
											? dateFormat.format(visitorObj.getCheckOutTime()).split(" ")[1] : "");
							%>
						</td>

						<td>
							<%
								if (!visitorObj.isCheckedOut()) {
							%>
							<%
 	}
 %>
						</td>



					</tr>
					<%
						}
					%>
				</table>

			</div>
		</div>

		<div class="row" id="checkedOutVisitors" style="display: none;">
			<%
				List<Visitor> todaysCheckedOutVisitors = (List<Visitor>) request.getAttribute("todaysVisitors");
				Iterator<Visitor> todaysCheckedOutVisitorsListIterator = todaysCheckedOutVisitors.iterator();
			%>
			<div class="col-md-12">
				<table class="table  table-bordered table-hover ">

					<tr>
						<th>Name</th>
						<th>Pic</th>
						<th>Details</th>
						<th>Check In Time</th>
						<th>Check Out Time</th>

						<th>Action</th>
					</tr>

					<%
						while (todaysCheckedOutVisitorsListIterator.hasNext()
								&& todaysCheckedOutVisitorsListIterator.next().getCheckOutTime() != null) {
							Visitor visitorObj = todaysCheckedOutVisitorsListIterator.next();
							if (visitorObj.isCheckedOut()) {
					%>

					<tr
						class="<%out.println(visitorObj.getCheckOutTime() != null ? "outVisitor" : "inVisitor");%>">
						<td ondblclick="showItems(<%=visitorObj.getId()%>)"><b> <%
 	out.println(visitorObj.getName());
 %></b></td>
						<td><img height="100px" width="150px"
							src="${pageContext.request.contextPath}/showImage?visitorId=<%out.println(visitorObj.getId());%>"></td>
						<td>Email :<%
							out.println(visitorObj.getEmail());
						%> <br> Mobile :<%
 	out.println(visitorObj.getMobile());
 %> <br> Meeting Person: <%
 	out.println(visitorObj.getMeetingPerson());
 %> <br> Purpose :<%
 	out.println(visitorObj.getPurpose());
 %> <br> From Place :<%
 	out.println(visitorObj.getFromPlace());
 %> <br> Location :<%
 	out.println(visitorObj.getLocation());
 %>
						</td>
						<td>
							<%
								DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm");
										Date date = new Date();
										out.println(dateFormat.format(visitorObj.getCheckInTime()).split(" ")[1]);
							%>
						</td>
						<td>
							<%
								out.println(visitorObj.getCheckOutTime() != null
												? dateFormat.format(visitorObj.getCheckOutTime()).split(" ")[1] : "");
							%>
						</td>

						<td>
							<%
								if (!visitorObj.isCheckedOut()) {
							%>
							<button class="btn btn-success">
								<a
									href="${pageContext.request.contextPath}/visitorCheckOut?visitorId=<%out.println(visitorObj.getId());%>">Check
									Out</a>
							</button> <%
 	}
 %>
						</td>



					</tr>
					<%
						}
						}
					%>
				</table>

			</div>
		</div>
	</div>
	<div class="modal fade" id="dialogBox" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Visitor Items Carried</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>

				</div>

				<div class="modal-body">
					<div id="modelContent"></div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

</body>
</html>