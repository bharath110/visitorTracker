$(document).ready(function() {
	console.log("ready!");
	/*
	 * $('#allVisitorsTable').DataTable({ "searching" : true,
	 * "ordering" : true, "pagingType" : "full_numbers" });
	 * $('#checkedInVisitorsTable').DataTable({ "searching" :
	 * true, "ordering" : true, "pagingType" : "full_numbers"
	 * }); $('#checkedOutVisitorsTable').DataTable({ "searching" :
	 * true, "ordering" : true, "pagingType" : "full_numbers"
	 * });
	 */

});
function showItems(visitorNameAndId) {
	var visitorArray = visitorNameAndId.split(":");
	var visitorName = visitorArray[1];
	var visitorId = visitorArray[0];

	console.log("Id of the visitor " + visitorId);
	$
			.ajax({
				type : "post",
				data : {
					"visitorId" : visitorId
				},
				url : "getCarriedItems",
				contenttype : "application/json",
				success : function(data) {
					console.log("+++++++ data.StatusCode:" + data.StatusCode);
					console.log("+++++++ data:" + data);
					if (data.StatusCode == 200) {
						console.log("success");
						var headerOutput = "";
						var output = "";
						var footerOutput = "";
						// var result = JSON.parse(data);
						if (data.carriedItems.length > 0) {
							headerOutput += "<center><h4 class=\"modal-title\">Visitor : "+visitorName+"</h4><\center>"
									+ "<button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>";
							output = "<span><center>"
									+ "<b>Visitor Items Carried</b>"
									+ "</center></span><table class=\"table table-bordered table-striped\">"
									+ "<thead><tr><th>Name</th><th>Bar Code</th><th>Description</th>"
									+ "</tr></thead><tbody>";
							for ( var i in data.carriedItems) {
								output += "<tr><td>"
										+ data.carriedItems[i].iName
										+ "</td><td>"
										+ data.carriedItems[i].barCode
										+ "</td><td>"
										+ data.carriedItems[i].description
										+ "</td></tr>";
							}
							output += "</tbody></table>";
						} else {
							output = "<span><center>"
									+ "<b>Visitor Items Carried</b>"
									
									+ "</center><br><center>No Items Carried</center>";
						}
						output += "<div>"
								+ "<center><label style=\"vertical-align: top;\">Remark :</label><textarea id='remark' name='remark' style='verticle-align:middle;'/></center>"
								+ "</div>";

						footerOutput += "<button class=\"btn btn-sm btn-primary\"  onclick='checkOutVisitor(\""
								+ visitorId
								+ "\:"
								+ visitorName
								+ "\");'>Check Out</button> "
								+ "<button type=\"button\" class=\"btn btn-sm btn-deafult\" data-dismiss=\"modal\" >Close</button>";

						$('#modelHeaderContent').html(headerOutput);
						$('#modelContent').html(output);
						$('#modelFooterContent').html(footerOutput);
						console.log("+++++++ result:" + data);
						console.log("+++++++ result.carriedItems:"
								+ data.carriedItems);

						$('#dialogBox').modal('show');
					}

					else {
						console.log("Error coccured 1");
					}
				},
				error : function(data) {
					console.log("------ :" + data);
					ajaxCallSuccess = false
					console.log("Error coccured");

				}
			})

}

function checkInChcekOut(listCode) {

	switch (listCode) {
	case 'ALL':
		$('.sub-heading').html("<h2>Today's Visitors</h2>");
		$('.visitorDiv').hide();
		$('#allVisitors').show();
		$('.nav-item').removeClass('active');
		$('#' + listCode).addClass();
		break;
	case 'IN':
		$('.sub-heading').html("<h2>Checked In Visitors</h2>");
		$('.visitorDiv').hide();
		$('#checkedInVisitors').show();
		$('.nav-item').removeClass('active');
		$('#' + listCode).addClass();
		break;
	case 'OUT':
		$('.sub-heading').html("<h2>Checked Out Visitors</h2>");
		$('.visitorDiv').hide();
		$('#checkedOutVisitors').show();
		$('.nav-item').removeClass('active');
		$('#' + listCode).addClass();
		break;
	default:
		$('.sub-heading').html("<h2>Today's Visitors</h2>");
		$('.visitorDiv').hide();
		$('#allVisitors').show();
		$('.nav-item').removeClass('active');
		$('#' + listCode).addClass();
		break;
	}

}
function checkOutVisitor(visitorNameAndId) {
	var visitorArray = visitorNameAndId.split(":");
	var visitorName = visitorArray[1];
	var visitorId = visitorArray[0];

	console.log("Id of the visitor " + visitorId);
	var remark = $('#remark').val();
	var returnedValue = confirm("Do you want to check out " + visitorName + "!");
	if (returnedValue) {

		$.ajax({
			type : "post",
			data : {
				"visitorId" : visitorId,
				"remark" : remark
			},
			url : "visitorCheckOut",
			contenttype : "application/json",
			success : function(data) {
				console.log("+++++++ data.StatusCode:" + data.StatusCode);
				console.log("+++++++ data:" + data);
				if (data.StatusCode == 200) {
					alert(data.message);
					location.reload();
				}
			},
			error : function(data) {
				console.log("------ :" + data);
				ajaxCallSuccess = false
				console.log("Error coccured");
			}
		})

		console.log("inn ---");
	} else {
		console.log("out ---");
		return 0;
	}

}
