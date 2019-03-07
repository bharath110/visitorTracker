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
	<header>
	<div class="container-fluid">
		<div class="row" style="background-color: rgba(0, 176, 217, 1);">
			<div class="col-sm-12 animated lightSpeedIn">
				<div style="float: left;">
					<img src="images/nous1.png">
				</div>

				<div
					style="text-align: center; color: #fff; text-transform: uppercase;">
					<h1>Visitor Tracking</h1>
				</div>

			</div>
		</div>
	</div>
	</header>
	<div class="container">


		<div class="sub-heading" id="sub-heading">
			<h2>Today's Visitors</h2>
		</div>

		<div class="row">
			<ul class="nav nav-tabs " style="background-color: aliceblue">
				<li class="nav-item active " id="ALL"><a class="nav-link abc"
					href="#" onclick="checkInChcekOut('ALL')">All Visitors</a></li>
				<li class="nav-item nav-hover" id="IN"><a class="nav-link abc"
					href="#" onclick="checkInChcekOut('IN')">Checked In Visitors</a></li>
				<li class="nav-item " id="OUT"><a class="nav-link abc" href="#"
					onclick="checkInChcekOut('OUT')">Checked Out Visitors</a></li>
			</ul>
		</div>

		<div class="row visitorDiv" id="allVisitors">
			<%
				List<Visitor> todaysAllVisitorsList = (List<Visitor>) request.getAttribute("todaysVisitors");
				Iterator<Visitor> todaysAllVisitorsListIterator = todaysAllVisitorsList.iterator();
			%>


			<table class="table  table-bordered table-hover "
				id="allVisitorsTable">

				<tr>
					<th>Name</th>
					<th>Picture</th>
					<th>Details</th>
					<th>Check In Time</th>
					<th>Check Out Time</th>
					<th>Remark</th>
					<th>Action</th>
				</tr>

				<%
					while (todaysAllVisitorsListIterator.hasNext()) {
						Visitor visitorObj = todaysAllVisitorsListIterator.next();
				%>
				<%
					String visitorData = visitorObj.getId() + ":" + visitorObj.getName();
				%>
				<tbody>
					<tr>


						<td><b> <%=visitorObj.getName()%>
						</b></td>
						<td><img class="imgSize"
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
								String remark = visitorObj.getRemark() != null ? visitorObj.getRemark() : " ";
									out.println(remark);
							%>
						</td>

						<td>
							<%
								if (!visitorObj.isCheckedOut()) {
							%>
							<button class="btn btn-sm btn-danger"
								onclick="showItems('<%=visitorData%>')">Check Out</button> <br>
							<br> <a class="btn btn-sm btn-default"
							href="${pageContext.request.contextPath}/generateVisitorIdCard?visitorId=<%out.println(visitorObj.getId());%>"
							target="_blank">Generate Visitor Id Card</a> <%
 	}
 %>
						</td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>


		<div class="row visitorDiv" id="checkedInVisitors"
			style="display: none">
			<%
				List<Visitor> todaysCheckedInVisitors = (List<Visitor>) request.getAttribute("todaysVisitors");
				Iterator<Visitor> todaysCheckedInVisitorsListIterator = todaysCheckedInVisitors.iterator();
			%>



			<table class="table  table-bordered table-hover "
				id="checkedInVisitorsTable">

				<tr>
					<th>Name</th>
					<th>Picture</th>
					<th>Details</th>
					<th>Check In Time</th>

					<th>Action</th>
				</tr>
				<tbody>
					<%
						while (todaysCheckedInVisitorsListIterator.hasNext()) {
							Visitor visitorObj = todaysCheckedInVisitorsListIterator.next();
							if (!visitorObj.isCheckedOut()) {
					%>
					<%
						String visitorData = visitorObj.getId() + ":" + visitorObj.getName();
					%>
					<tr>

						<td><b> <%=visitorObj.getName()%>
						</b></td>
						<td><img class="imgSize"
							src="${pageContext.request.contextPath}/showImage?visitorId=<%out.println(visitorObj.getId());%>&signRequired=0"></td>
						<td>Email : <%
							out.println(visitorObj.getEmail());
						%> <br> Mobile : <%
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
								if (!visitorObj.isCheckedOut()) {
							%>
							<button class="btn btn-sm btn-danger"
								onclick="showItems('<%=visitorData%>')">Check Out</button> <br>
							<br> <a class="btn btn-sm btn-default"
							href="${pageContext.request.contextPath}/generateVisitorIdCard?visitorId=<%out.println(visitorObj.getId());%>"
							target="_blank">Generate Visitor Id Card</a> <%
 	}
 %>

						</td>
					</tr>
					<%
						}
						}
					%>
				</tbody>
			</table>


		</div>

		<div class="row visitorDiv" id="checkedOutVisitors"
			style="display: none">
			<%
				List<Visitor> todaysCheckedOutVisitors = (List<Visitor>) request.getAttribute("todaysVisitors");
				Iterator<Visitor> todaysCheckedOutVisitorsListIterator = todaysCheckedOutVisitors.iterator();
			%>


			<table class="table  table-bordered table-hover "
				id="checkedOutVisitorsTable">
				<thead>
					<tr>
						<th>Name</th>
						<th>Picture</th>
						<th>Details</th>
						<th>Check In Time</th>
						<th>Check Out Time</th>
						<th>Remark</th>


					</tr>
				</thead>
				<tbody>

					<%
						while (todaysCheckedOutVisitorsListIterator.hasNext()
								&& todaysCheckedOutVisitorsListIterator.next().getCheckOutTime() != null) {
							Visitor visitorObj = todaysCheckedOutVisitorsListIterator.next();
							if (visitorObj.getCheckOutTime() != null) {
					%>

					<tr>
						<td><b> <%
 	out.println(visitorObj.getName());
 %></b></td>
						<td><img class="imgSize"
							src="${pageContext.request.contextPath}/showImage?visitorId=<%out.println(visitorObj.getId());%>" /></td>
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
								String remark = visitorObj.getRemark() != null ? visitorObj.getRemark() : " ";
										out.println(remark);
							%>
						</td>

					</tr>
					<%
						}
						}
					%>
				</tbody>
			</table>


		</div>
	</div>
	<div class="modal fade" id="dialogBox" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" id="modelHeaderContent"></div>

				<div class="modal-body">
					<div id="modelContent"></div>
				</div>

				<div class="modal-footer" id="modelFooterContent">
					<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
				</div>
			</div>

		</div>
	</div>
	<footer>
	<div class="container-fluid">
		<div class="row"
			style="background-color: rgba(0, 176, 217, 1); padding-left: 15px !important;">
			©2018 NOUS Infosyetems <br> DEV: Visitor Tracker v1.0
			(06-06-2018)
		</div>

		<div class="col-md-7"></div>

		<div class="overlay" style="display: none"></div>

		<div id="processing" class="processing" style="display: none">
			<p>Processing...</p>
		</div>

	</div>
	</footer>
</body>
</html>