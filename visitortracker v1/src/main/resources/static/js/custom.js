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
						var output = "";
						// var result = JSON.parse(data);
						if (data.carriedItems.length > 0) {
							output = "<span><center>"
									+ "Visitor Name :"
									+ visitorName
									+ "</center></span><table class=\"table  table-bordered table-hover \">"
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
									+ "Visitor name:"
									+ visitorName
									+ "</center><br><center>No Items Carried</center>";
						}
						output += "<center>Remark :<input type='text'name='remark' /></center><br><br><button class='btn btn-success'>Check Out</button> ";
						$('#modelContent').html(output);

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

function checkInChcekOut() {
	$('#')

}