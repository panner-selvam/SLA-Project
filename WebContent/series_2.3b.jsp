<%@ include file="Main.jsp"%>
<script src="<%=request.getContextPath()%>/js/highchart/highcharts.js"></script>
<script src="<%=request.getContextPath()%>/js/highchart/drilldown.js"></script>
<script src="js/datepicker.js"></script>
<script src="js/bootbox.min.js"></script> 
<link rel="stylesheet" href="css/series_page_datepicker.css" />

<div class="main_content">

	<div id="jCrumbs" class="breadCrumb module">
		<div style="overflow: hidden; position: relative; width: 1065px;">
			<div>
				<ul style="width: 5006px;">
					<li class="first"><a href="Dashboard.jsp"><i
							class="glyphicon glyphicon-home"></i></a></li>
					<li><a href="#">Report</a></li>
					<!-- 	<li><a href="#">2.3</a></li> -->
					<li class="last"><b>Application Performance (includes any user/system application related to the project)</b></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
				<div class="w-box" id="w_sort01">
					<div class="w-box-header"><div class="btn-group pull-right" style="    margin-top: 3px;">
									<a href="#" class="btn bs_ttip btn-default btn-xs" data-placement="auto top" data-container="body" data-viewport="body" title="" data-original-title="Refresh list" 	onClick="getsearch('refresh');"><i class="glyphicon glyphicon-refresh"></i></a>
							
						</div>Series 2.3 (b)</div>
					<div class="w-box-content cnt_a">
						
						<div class="sepH_b col-sm-3">

							<label>From Date</label>
							<div class="input-group" >
								<span class="input-group-addon"><i class="splashy-calendar_day"></i></span> 
								<input  class="form-control" type="text"  id="fpick" style="background-color:white" readonly/>
							</div>
						</div>
						<div class="sepH_b col-sm-3">

							<label>To Date</label>
							<div class="input-group" >
								<span class="input-group-addon"><i class="splashy-calendar_day"></i></span> 
								<input  class="form-control" type="text"  id="epick" style="background-color:white" readonly/>
							</div>
						</div>
						
						<div class="clearfix">
							<div class="col-sm-6  mt-1">
								
								<button class="btn btn-primary mr-1" value="Search" id="search"
									onClick="getsearch('search');">Search</button>
								<button class="btn btn-success mr-1  " data-toggle="modal" data-target="#myModal"
									>Add new</button>
							
							</div>
						</div>
					</div>
				</div>
			</div>	
	</div>
	<div class="row" id="series_list">
			<table id="example" class="table table-striped table-bordered table table-hover"  style="width:100%">
				<thead>
				<tr id="msgcnt">
					<th colspan="11"><div id="rowpintdiv" style="font-weight: bold;">
							<div class="recordscnt">Total Records - <span id="passport_row_totcnt"></span> / <span
									id="passport_row_cnt"></span>
							</div></div>
					</th>
				</tr>
					<tr><th class="text-center" style="width:5%">S.No</th>
						<th class="col-md-2 text-center">Date</th>
						<th class="col-md-2 text-center">IP Address</th>
						<th class="col-md-2 text-center">Application Name</th>
						<th class="col-md-2 text-center">Location</th>
						<th class="col-md-2 text-center">Time (Secs)</th>
						<th class="col-md-2 text-center">Inserted Date</th>
					</tr>
				</thead>
				<tbody id="series_table"></tbody>
				</table>
				<div class="nav-custom" id="prison_photo_nav-custom" style="float: right;display:none;">
					<button type="button" id="prison_prev" class="btn -primary" onclick="getrecords(this.id)">
						<i class="glyphicon glyphicon-arrow-left"></i>
					</button>
					<button type="button" id="prison_next" class="btn -primary" onclick="getrecords(this.id)">
						<i class="glyphicon glyphicon-arrow-right" style="margin-left: 10px;"></i>
					</button>
				</div> 
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
	
		
			
		</div>
</div>	
	
	
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg"> 
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" id="btn_click" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> <b>Series 2.3 (b)</b></h4>
        </div>
        <div class="modal-body" id="modal-id" oninput="get_input()">
        	<div class="row">
        		<div class="col-sm-6 " style="float:right">
        			<div class="col-sm-6 ">
        				<label style="float:right"><b>Series Date</b></label>
        			</div>
    				<div class="col-sm-6 ">
    					<input class="form-control" type="text"  id="seriesDate" style="background-color:white" readonly/>
    				</div>   		
        		</div>
        	</div>
        	
        	<div class="row">
        		<div class="col-sm-6 ">
        			<label><b>IP Address</b></label>
        			<input type="text" class="form-control number_and_dot" id="ipAddress">	
        		</div>
        		<div class="col-sm-6 ">
        			<label><b>Application name</b></label>
        			<input type="text" class="form-control" id="applicationName" value="Review" disabled>
        		</div>
        	</div>
        	<div class="row">
        		<div class="col-sm-6 ">
    				<label><b>Location</b></label>
    				<input type="text" class="form-control" id="Location" value="RVC_ZVC_PS" disabled>   		
        		</div>
        		<div class="col-sm-6 ">
    				<label><b>Time (Secs)</b></label>
    				<input type="text" class="form-control numberonly" id="Time">   		
        		</div>
        	</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-success" id="save" disabled>SAVE</button>
          <button type="reset" class="btn btn-default" id="clr" onclick="clear()">CLEAR</button>
        </div>
      </div>
      
    </div>
</div> 		
<script>
				
	var vahan_pageIndex = "1", vahan_totrecord = "0", vahan_rowrecord = "0";
	
	function getrecords(id) {
		
		if (id == "prison_prev") {
			if (vahan_pageIndex >= "2") {
				vahan_pageIndex--;
			} else {
			}
			if ((vahan_pageIndex >= "1")) {

				ajaxRetrieveCall(vahan_pageIndex);

			} else {
			}
		} else {
			//alert(vahan_totrecord+">"+vahan_rowrecord);
			if (vahan_totrecord == (+vahan_rowrecord + 1)) {
				vahan_pageIndex++;

				ajaxRetrieveCall(vahan_pageIndex);

			}
			if (vahan_totrecord > (+vahan_rowrecord + 1)) {
				vahan_pageIndex++;

				ajaxRetrieveCall(vahan_pageIndex);

			} else {
			}
		}
	}

	
	function series_table(obj) {
		var obj = obj;
		var k = '<tbody class="table table-striped table-bordered table table-hover">'
		if (obj == "") {
			k += '<tr>';
			k += '<td colspan="11" class="text-center" >DATA NOT AVAILABLE</td>';
			k += '</tr>';

			k += '</tbody>';
			document.getElementById('series_table').innerHTML = k;

			$("#rowpintdiv").css("display", "none !important");

			$('#rowpintdiv').attr("style", "display:none");
			$("#prison_photo_nav-custom").css("display", "none");
			$("#rowpintdiv").css("display", "none");
		} else {
			$.each(obj, function(key, data) {
				k += '<tr>';
				k += '<td style="text-align:center;">' + data.rownumber
						+ '</td>';
				k += '<td class="col-md-1 text-center">' + data.date + '</td>';
				k += '<td class="col-md-1 text-center">' + data.ip_address
						+ '</td>';
				k += '<td class="col-md-1 text-center">' + data.application_name
						+ '</td>';
				k += '<td class="col-md-1 text-center">' + data.location_name
						+ '</td>';
				k += '<td class="col-md-2 text-center">' + data.time
						+ '</td>';
				k += '<td class="col-md-1 text-center">' + data.inserted_date
						+ '</td>';
				k += '</tr>';
				vahan_totrecord = data.Rcount;
				vahan_rowrecord = data.rownumber;
			});
			k += '</tbody>';
			document.getElementById('series_table').innerHTML = k;
			$('#passport_row_cnt').html(vahan_totrecord);
			$('#passport_row_totcnt').html(vahan_rowrecord);
			$("#prison_photo_nav-custom").css("display", "block");
			$("#rowpintdiv").css("display", "block");

		}
	}

	var series_no = "tbl_2_2_a_to_2_9", mode="tbl_2_3_b",ip_address="", location_name="", application_name="", time="",series_date="";
	var from_date = "", to_date = "";

	function get_input() {
		ip_address = $('#ipAddress').val();
		location_name = $('#Location').val();
		application_name = $('#applicationName').val();
		time = $('#Time').val();
		series_date = $('#seriesDate').val();

		if (ip_address != '' && location_name != '' && application_name != ''
				&& time != '' ) {
			document.getElementById("save").disabled = false;
		} else {
			document.getElementById("save").disabled = true;
		}
	}

	$("#clr").click(function() {
		clear();
	});

	function clear() {
		$('#ipAddress').val('');
		$('#Time').val('');
	}
	$("#save").click(function() {
		clear();
		console.log("work");
		$.ajax({
			type : "post",
			url : path + "/Series_save",
			async : false,
			data : {
				table_name : series_no,
				mode : mode,
				ip_address : ip_address,
				application_name : application_name,
				location_name : location_name,
				time : time,
				series_date : series_date
			},

			success : function(data) {
				var status = data.trim();
				if (status == "SUCCESS") {
					$("#btn_click").click();
					bootbox.alert("Record saved successfully !",
							function(){
								location.reload(true);
							}
						);				} else {
					alert("Error !!!");
					location.reload(true);
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				bootbox.alert("err" + xhr);
			},
			complete : function() {

			}
		});
		return false;
	});

	$(document).ready(function() {

		$('#seriesDate').datepicker({
			format : 'mm/dd/yy',
			changeMonth : true,
			changeYear : true,
			changeDate : true,
			autoclose : true,
			endDate : "today"
		});

		$('#fpick').datepicker({
			format : 'mm/dd/yy',
			changeMonth : true,
			changeYear : true,
			changeDate : true,
			autoclose : true,
			endDate : "today"
		});
		$('#epick').datepicker({
			format : 'mm/dd/yy',
			changeMonth : true,
			changeYear : true,
			changeDate : true,
			autoclose : true,
			endDate : "today"
		});

		$('#seriesDate').datepicker().datepicker('setDate', '-1d');
		$('#fpick').datepicker().datepicker('setDate', '-1d');
		$('#epick').datepicker().datepicker('setDate', '-1d');

		ajaxRetrieveCall(vahan_pageIndex);
	});

	$("#fpick").change(function() {
		from_date = $("#fpick").val();
	});
	$("#epick").change(function() {
		to_date = $("#epick").val();
	});

	function ajaxRetrieveCall(vahan_pageIndex) {
		from_date = $("#fpick").val();
		to_date = $("#epick").val();

		$.ajax({
			type : "post",
			url : path + "/Series_retrieve",
			async : false,
			data : {
				vahan_pageIndex : vahan_pageIndex,
				table_name : series_no,
				mode : mode,
				startDate : from_date,
				endDate : to_date
			},

			success : function(data) {
				var obj = JSON.parse(data);
				series_table(obj);
			},
			error : function(xhr, ajaxOptions, thrownError) {
				//	bootbox.alert("err"+xhr);
			},
			complete : function() {

			}
		});
		return false;
	}

	function getsearch(val) {

		if (val == "search") {
			from_date = $("#fpick").val();
			to_date = $("#epick").val();
			ajaxRetrieveCall(vahan_pageIndex);
		} else if (val == "refresh") {
			location.reload(true);
		}

	}
</script>


