<%@ include file="Main.jsp"%>
<div class="main_content">
	<div class="breadCrumb module">
		<ul class="text-center">
			<li style="color: #0083bb;"><h4>
					<b>Series</b>
				</h4></li>
		</ul>
	</div>
	<div id="jCrumbs" class="breadCrumb module">
		<div style="overflow: hidden; position: relative; width: 1065px;">
			<div>
				<ul style="width: 5006px;">
					<li class="first"><a href="#"><i
							class="glyphicon glyphicon-home"></i></a></li>
					<li><a href="#">Report</a></li>
					<!-- 	<li><a href="#">2.3</a></li> -->
					<li class="last"><b>Common Reporting</b></li>
				</ul>
			</div>
		</div>
	</div>
	<section class="content_b">
		<div class="row">
			<div class="col-md-12">
				<div class="w-box" id="w_sort01">
					<div class="w-box-header">Series</div>
					<div class="w-box-content cnt_a">
						
						<div class="sepH_b col-sm-6">

							<label>From Date</label>
							<div class="input-group" data-date-format="dd/mm/yyyy">
								<span class="input-group-addon"><i
									class="splashy-calendar_day"></i></span> <input class="form-control"
									readonly="" type="text" id="dp_start"
									style="position: static; background-color: white;" />
							</div>
						</div>
						<div class="sepH_b col-sm-6">
							<label>To Date</label>
							<div class="input-group" data-date-format="dd/mm/yyyy">
								<span class="input-group-addon"><i
									class="splashy-calendar_day"></i></span> <input class="form-control"
									readonly="" type="text" id="dp_end"
									style="position: static; background-color: white;" />
							</div>
						</div>
						<div class="sepH_b col-sm-6">

							<label for="mode">Header </label> <select
								name="headerseriesinsert" id="headerseriesinsert"
								class="form-control">

							</select>
						</div>
						<div class="clearfix">
							<div class="col-sm-6  mt-1">
								<!--   <a href="#" class="btn btn-gebo pull-right btn-default">Send</a></div> -->
								<button class="btn btn-warning mr-1  " value="Clear" id="clear"
									onClick="getsearch('cancel');">Clear</button>
								<button class="btn btn-primary mr-1" value="Search" id="search"
									onClick="getsearch('search');">Search</button>
								<button class="btn btn-info mr-1" value="Show All" id="showall"
									onClick="getsearch('showall');">Show all</button>
								<button class="btn btn-success mr-1" value="Add Series"
									id="btnaddseries" onClick="getmodal('series');">Add
									Series</button>
								<button class="btn btn-success" value="Add Sub Series"
									id="btnaddubseries" onClick="getmodal('subseries');">Add
									Sub Series</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="row">
			<div class="col-md-12">
				<div id="report"></div>
			</div>
		</div>
	</section>

	<script type="text/javascript">
	
	//List of Reports
	
	function getsearch(val) {
		
		if(val=="cancel"){
			$("#headerseriesinsert").val("");
			$("#dp_start").val("");
			$("#dp_end").val("");
			val='search';
			}
			if(val=="showall"){
				$("#headerseriesinsert").val("");
				$("#dp_start").val("");
				$("#dp_end").val("");
			}
			else{}
			
		var series=$("#headerseriesinsert").val();
		var dp_start=$("#dp_start").val();
		var dp_end=$("#dp_end").val();
		
		
$.ajax({
			type : "post",
			url : path + "/Fetching_Series_List_Details",
			async : false,
			data:{val:val,series:series,dp_start:dp_start,dp_end:dp_end},
			success : function(h) {
				var a = h.trim();				
				var j = JSON.parse(a);			
				var cond='<table class="table table-striped table-bordered table-condensed"	id="tbl23a"><thead><tr><th class="text-center"></th><th class="text-center"></th><th class="text-center">Name</th><th class="text-center">Modified</th><th class="text-center">Actions</th></tr></thead><tbody>';
				if(j.length>0){
				$.each(j,function(a, b) {
				cond=cond+"<tr><td  style='width:5px;'></td><td style='width:5px;'><i class='splashy-folder_classic'></i></td><td><a href='javascript:void(0);' onclick='getsubseriesfw(\""+b.id+"\",\""+b.series_serialNo+"\",\""+b.series_name+"\");'>"+b.series_serialNo+" "+b.series_name+"</a></td><td style='width:20px'>"+b.modifieddatetime+"</td><td style='text-align:Center;width:10px'><a  href='javascript:void(0);' onclick='getremove(\""+b.id+"\",\"series\");'><i class='splashy-error_x'></i></td></tr>";
				});			
				}
				else{
					cond=cond+"<tr><td colspan='5'>No data available</td></tr>";	
				}
				$("#report").html(cond+"</tbody></table>");
				
			    },
				error : function() {
				},
				complete : function() {
							
			    }
		});
	return false;
}
	function getsubseriesfw(id,sno,sname){
			
			var o = "<%=itcnt%>";
			var j = "<%=ksize%>";
			var  m = "<%=iv%>";
			var l = "<%=salt%>";			
			var k = new AesUtil(j, o); 
			var req = id+"~"+sno+"~"+sname;
			var req = k.encrypt(l, m, "data", req);
		//	alert(req);
			//alert(k.decrypt(l, m, "data", req) );
			document.location.href="SubSeries.jsp?req="+req;

	}
	function getremove(id,val){
		
			
			bootbox.confirm({
			    message: "Are you sure want to delete this series?",
			    buttons: {
			        confirm: {
			            label: 'Yes',
			            className: 'btn-success'
			        },
			        cancel: {
			            label: 'No',
			            className: 'btn-danger'
			        }
			    },
			    callback: function (result) {
			        console.log('This was logged in the callback: ' + result);
			       // alert(result);
			        if(result==true){
			        //	alert("");
			$.ajax({
				type : "post",
				url : path + "/Removing_Series_Details",
				data : {
					val : val,id:id
				},
				async : false,
				success : function(i) {
					var b = i.trim();
					var c = "<%=itcnt%>";
					var h = "<%=ksize%>";
					var e = "<%=iv%>";
					var f = "<%=salt%>";
					var g = new AesUtil(h, c);
					var d = g.decrypt(f, e, "data", b);
					var q = d;
					if (q == "SUCCESS") {
				
						bootbox.alert("Removed Successfully", function() {
							location.reload();
						});
						
					} else {
						swal({
							text : "Please try again",
							type : "danger",
							confirmButtonColor : "green",
							confirmButtonText : "OK"
						})
					}
				},
				error : function() {
				},
				complete : function() {
				}
			});
			
			        }
			    }	
			 });
		
	}
	
		var flag = 0;
		var id = "";
		jQuery(document).ready(function($){
			getserieslist();
			getsearch('search');
			var currentDate = new Date();			
			$('#dp_start').datepicker({
				maxDate : 0,
				dateFormat : 'mm/dd/yy',
				changeMonth : true,
				changeYear : true,
				currentyear : true,
				onSelect : function(selected) {
					$("#dp_end").datepicker("option", "minDate", selected)
				}
			});
			$('#dp_end').datepicker({
				maxDate : 0,
				dateFormat : 'mm/dd/yy',
				changeMonth : true,
				changeYear : true,
				currentyear : true,
				onSelect : function(selected) {
					$("#dp_start").datepicker("option", "maxDate", selected)
				}
			});
			$("#dp_start").datepicker("setDate", currentDate);
			$("#dp_end").datepicker("setDate", currentDate);
			$("#btnclear").click(function() {
				var currentDate = new Date();
				$("#dp_start").datepicker("setDate", currentDate);
				$("#dp_end").datepicker("setDate", currentDate);
				loaddata();
			});		
		});	
function getmodal(id){
$("#"+id).modal("show");
}
//dropdown
function getserieslist() {
	$.ajax({
				type : "post",
				url : path + "/Fetching_Series_List",
				async : false,
				success : function(h) {
					var a = h.trim();				
					var j = JSON.parse(a);			
					var cond="<option value=''>--Select--</option>";
					$.each(j,function(a, b) {
					cond=cond+"<option value='"+b.id+"'>"+b.series_name+"</option>";
					});				
					$("#headerseries").html(cond);
					$("#headerseriesinsert").html(cond);
				    },
					error : function() {
					},
					complete : function() {
								
				    }
			});
		return false;
	}
						

//Save 
function getaddseriesinsert(sid){
	var seriesname="",seriesno="",headername="";
	
if(sid=="series"){
	seriesname=$("#serialname").val();
	seriesno=$("#serialno").val();
	headername="No";
}
else{
	seriesname=$("#ss_serialname").val();
	seriesno=$("#ss_serialno").val();
	headername=$("#headerseries").val();
	}
	if(headername!="" && seriesno!="" && seriesname!="" ){
		
			        	$("#btn"+sid).attr("disabled",
								true);
			        	$("#btn"+sid).html('<i class="fa fa-refresh"></i> Processing ...');
			        	
		$
		.ajax({
			type : 'POST',
			url : '<%=request.getContextPath()%>/Saving_Master_Reports',
			data:{mode:sid,seriesname:seriesname,headername:headername,seriesno:seriesno},
			success : function(f) {
				
				var g = f.trim();
							var h = "<%=itcnt%>";
							var e = "<%=ksize%>";
							var b = "<%=iv%>";
							var c = "<%=salt%>";
								var d = new AesUtil(e, h);
								var status = d.decrypt(c, b, "data", g);
								if (status == "SUCCESS") {
									$("#btn" + sid).attr("disabled", false);
									$("#btn" + sid).html('Add ' + sid);
									getserieslist();
									if (sid == "series") {
										bootbox
												.alert(
														"Added Series Successfully",
														function() {
															document.location.href = "Series.jsp";
														});
									} else {
										bootbox
												.alert(
														"Added Subseries  Successfully!",
														function() {
															document.location.href = "Series.jsp";
														});
									}

								} else if (status == "exists") {
									bootbox.alert("Already Series added'",
											function() {
											})
									$("#btn" + sid).attr("disabled", false);
									$("#btn" + sid).html('Add ' + sid);
								}

								else {
									bootbox.alert("Please try again",
											function() {
											});
									$("#btn" + sid).attr("disabled", false);
									$("#btn" + sid).html('Add ' + sid);

								}
							}

						});
			} else {
				$("#btn" + sid).attr("disabled", false);
				$("#btn" + sid).html('Add ' + sid);
				bootbox.alert("Kindly filled out all the mandatory fields.",
						function() {

						});
			}

		}
	</script>

</div>

<div class="modal inmodal fade" id="series" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" onclick="getpopupclsau1();">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">Add Series</h4>

			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-3">
						<label style="padding-top: 10px;">Serial No <span
							style="color: red;">*</span></label> <input class="form-control"
							type="text" placeholder="Series Number" maxlength="30"
							id="serialno">
					</div>
					<div class="col-sm-9">
						<label style="padding-top: 10px;">Name <span
							style="color: red;">*</span></label> <input class="form-control"
							type="text" placeholder="Series Name" maxlength="150"
							id="serialname" value="" style="background-color: white;">
					</div>
				</div>

			</div>
			<div class="modal-footer">
				<input type="reset" class="btn btn-warning btn-md"
					data-dismiss="modal" value="Close"> <input type="button"
					onClick="getaddseriesinsert('series')"
					class="btn btn-success btn-md" id="btnseries" value="Add">
			</div>
		</div>
	</div>
</div>



<div class="modal inmodal fade" id="subseries" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" onclick="getpopupclsau1();">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">Add Sub Series</h4>

			</div>
			<div class="modal-body">
				<div class="row">
					<div class=" col-md-12">
						<label style="padding-top: 10px;">Header <span
							style="color: red;">*</span></label> <select class="form-control"
							name="headerseries" id="headerseries"><option value="">--Select--</option></select>
					</div>
					<div class="col-md-3">
						<label style="padding-top: 10px;">Serial No <span
							style="color: red;">*</span></label> <input class="form-control"
							type="text" placeholder="Series Number" maxlength="30"
							id="ss_serialno">
					</div>
					<div class=" col-md-9">
						<label style="padding-top: 10px;">Name <span
							style="color: red;">*</span></label> <input class="form-control"
							type="text" placeholder="Series Name" maxlength="150"
							id="ss_serialname" value="" style="background-color: white;">
					</div>
				</div>

			</div>
			<div class="modal-footer">
				<input type="reset" class="btn btn-warning btn-md"
					data-dismiss="modal" value="Close"> <input type="button"
					onClick="getaddseriesinsert('subseries')"
					class="btn btn-success btn-md" id="btnsubseries"
					value="Add Sub Series">
			</div>
		</div>
	</div>
</div>
