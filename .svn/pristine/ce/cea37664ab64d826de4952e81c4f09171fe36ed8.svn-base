<%@ include file="Main.jsp"%>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.js"></script> -->
 <script src="js/jquery.dataTables.min.js"></script>
 <link   rel="stylesheet" href="css/jquery.dataTables.min.css"/> 
 <script src="js/dataTables.buttons.min.js"></script>
 <link   rel="stylesheet" href="css/buttons.dataTables.min.css"/> 
<style>
tr.group,
tr.group:hover {
    background-color: #ddd !important;
    font-weight:bold;
}
.label-success {
    background-color: #5cb85c;
    display: inline;
    padding: .2em .6em .3em;
    font-size: 75%;
    font-weight: 700;
    line-height: 1;
    color: #fff;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    border-radius: .25em;
}
.label-danger {
    background-color: #d9534f;
    display: inline;
    padding: .2em .6em .3em;
    font-size: 75%;
    font-weight: 700;
    line-height: 1;
    color: #fff;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    border-radius: .25em;
}
.label-warning {
    background-color: #FF6F00;
    display: inline;
    padding: .2em .6em .3em;
    font-size: 75%;
    font-weight: 700;
    line-height: 1;
    color: #fff;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    border-radius: .25em;
}
</style>
<div class="main_content">
	<div class="breadCrumb module">
		<ul class="text-center">
			<li style="color: #0083bb;"><h4>
					<b>Consolidated Reporting</b>
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
					<li class="last"><b>Consolidated Reporting</b></li>
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
			//$("#dp_start").datepicker("destroy");
			$("#dp_start").datepicker({ dateFormat: "mm/dd/yy"}).datepicker("setDate", "-1");

//$("#dp_end").datepicker("destroy");
$("#dp_end").datepicker({ dateFormat: "mm/dd/yy"}).datepicker("setDate", "-1");

			
			$("#headerseriesinsert").val("");
			/*  $("#dp_start").val("");
			$("#dp_end").val(""); 
			 */val='search';
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
			url : path + "/Fetching_Series_consolidate_Details",
			async : false,
			data:{val:val,series:series,dp_start:dp_start,dp_end:dp_end},
			success : function(h) {
				var a = h.trim();				
				var j = JSON.parse(a);	
				var i=0;
				var tot="0";
				var cond='<table class="table table-striped table-bordered table-condensed display"	style="width:1200px;" cellspacing="0" width="100%" id="example"><thead><tr><th class="text-center">S.No.</th><th class="text-center">Module</th><th class="text-center">Performance Area</th><th class="text-center">Points</th></tr></thead><tbody>';
				if(j.length>0){
				$.each(j,function(a, b) {
					i++;
				cond=cond+"<tr><td  style='width:5px;text-align:center'>"+i+"</td><td>"+b.Module+"</td><td>"+b.Series+"</td><td class='text-center'>"+b.points+"</td>";
				/*  if(b.status=="Baseline"){
					cond=cond+"<td><span class='label label-success'>"+b.status+"</span></td>";
				}
				else if(b.status=="Breach"){
					cond=cond+"<td><span class='label label-danger'>"+b.status+"</span></td>";
					}else{
						cond=cond+"<td><span class='label label-warning'>"+b.status+"</span></td>";
					}  */
				cond=cond+"</tr>";
				
				
				tot=parseFloat(tot)+parseFloat(b.points);
				
				});			
				}
				else{
				//	cond=cond+"<tr><td colspan='7'>No data available</td></tr>";	
				}
				$("#report").html(cond+"</tbody><tfoot><tr><td colspan='3' style='font-weight:bold;text-align:right;'>Total Score</td><td><div id='tot'></div></td></tr></tfoot></table>");
				$("#tot").html(tot);
				
			    },
				error : function() {
				},
				complete : function() {
				

					
					$(document).ready(function() {
					    var groupColumn = 1;
					    var table = $('#example').DataTable({
					    	  dom: 'Bfrtip',
					          buttons: [
					              {
					                  text: 'Excel',
					                  action: function ( e, dt, node, config ) {
					                	  var series=$("#headerseriesinsert").val();
					              		var dp_start=$("#dp_start").val();
					              		var dp_end=$("#dp_end").val();
					              		var excel = path+'/ExporttoExcel_CR.jsp?uid=<%=session_vid_resouce%>&fdate='+dp_start+'&tdate='+dp_end+'&sub_series_list='+series;
					            		
					        			
					            		document.location.href=excel;
					                  }
					              }
					          ],
					        "columnDefs": [
					            { "visible": false, "targets": groupColumn }
					        ],
					        "order": [[ groupColumn, 'asc' ]],
					        "displayLength": 25,
					        "drawCallback": function ( settings ) {
					            var api = this.api();
					            var rows = api.rows( {page:'current'} ).nodes();
					            var last=null;
					 
					            api.column(groupColumn, {page:'current'} ).data().each( function ( group, i ) {
					                if ( last !== group ) {
					                    $(rows).eq( i ).before(
					                        '<tr class="group"><td colspan="4">'+group+'</td></tr>'
					                    );
					 
					                    last = group;
					                }
					            } );
					        }
					    } );
					 
					    // Order by the grouping
					    $('#example tbody').on( 'click', 'tr.group', function () {
					        var currentOrder = table.order()[0];
					        if ( currentOrder[0] === groupColumn && currentOrder[1] === 'asc' ) {
					            table.order( [ groupColumn, 'desc' ] ).draw();
					        }
					        else {
					            table.order( [ groupColumn, 'asc' ] ).draw();
					        }
					    } );
					} );
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

	
		var flag = 0;
		var id = "";
		jQuery(document).ready(function($){
			getserieslist();
			
			var currentDate = new Date();			
			$('#dp_start').datepicker({
				
				defaultDate: -1, maxDate:'-1d',
				dateFormat : 'mm/dd/yy',
				changeMonth : true,
				changeYear : true,
				currentyear : true,
				onSelect : function(selected) {
					$("#dp_end").datepicker("option", "minDate", selected)
				}
			});
			$('#dp_end').datepicker({
				maxDate:'-1d',
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
			getsearch('search');
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
						


	</script>

</div>

