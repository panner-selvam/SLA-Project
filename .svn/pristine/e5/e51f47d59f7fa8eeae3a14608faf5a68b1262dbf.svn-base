<%@ include file="Main.jsp"%>
<script src="<%=request.getContextPath()%>/js/AesUtil.js"></script>
<script src="<%=request.getContextPath()%>/js/pbkdf2.js"></script>
<script src="<%=request.getContextPath()%>/js/aes.js"></script>

    <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style>
th { white-space: nowrap; }
</style>
    
    <script src="https://nightly.datatables.net/js/jquery.dataTables.js"></script>
<!-- <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script> -->

<div class="main_content">
	<div class="breadCrumb module">
		<ul class="text-center">
			<li style="color: #0083bb;"><h4>
					<b>Common Reporting</b>
				</h4></li>
		</ul>
	</div>
	<div id="jCrumbs" class="breadCrumb module">
		<div style="overflow: hidden; position: relative; width: 1065px;">
			<div>
				<ul style="width: 5006px;">
					<li class="first"><a href="#"><i
							class="glyphicon glyphicon-home"></i></a></li>
					<li>Report</a></li>
					<!-- 	<li><a href="#">2.3</a></li> -->
					<li ><a href="<%=request.getContextPath()%>/Series.jsp"><b>Common Reporting</b></a></li>
					<li class="last" id="seriesname"><b></b></li>
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
						<div class="sepH_b col-sm-3" style="display:none;">

							<label for="mode">Series </label> <select
								name="series_list" id="series_list"
								class="form-control" onchange="getsubseriesinfo();">

							</select>
						</div>
						<div class="sepH_b col-sm-3" style="display:none;">

							<label for="mode">Sub Series </label> <select
								name="sub_series_list" id="sub_series_list"
								class="form-control">

							</select>
						</div>
						<div class="sepH_b col-sm-4">

							<label>From Date</label>
							<div class="input-group" data-date-format="dd/mm/yyyy">
								<span class="input-group-addon"><i
									class="splashy-calendar_day"></i></span> <input class="form-control"
									readonly="" type="text" id="dp_start"
									style="position: static; background-color: white;" />
							</div>
						</div>
						<div class="sepH_b col-sm-4">
							<label>To Date</label>
							<div class="input-group" data-date-format="dd/mm/yyyy">
								<span class="input-group-addon"><i
									class="splashy-calendar_day"></i></span> <input class="form-control"
									readonly="" type="text" id="dp_end"
									style="position: static; background-color: white;" />
							</div>
						</div>
						<div class="clearfix">
							<div class="col-sm-4  mt-1">
								<!--   <a href="#" class="btn btn-gebo pull-right btn-default">Send</a></div> -->
								<button class="btn btn-warning mr-1  " value="Clear" id="clear"
									>Clear</button>
								<button class="btn btn-primary " value="Search" id="search"
									onClick="getsearch('search');">Search</button>
							<!-- 	<button class="btn btn-info mr-1" value="Show All" id="showall"
									onClick="getsearch('showall');">Show all</button>
								 -->
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
	var jq = jQuery.noConflict(true);
	function getsubseriesinfo(){
		var headerseries=$("#series_list").val();
		
		if(headerseries!=""){
		$.ajax({
			type : "post",
			url : path + "/Fetching_Sub_Series_List",
			data:{id:headerseries},
			async : false,
			success : function(h) {
				var a = h.trim();				
				var j = JSON.parse(a);			
				var cond="<option value=''>--Select--</option>";
				$.each(j,function(a, b) {
				cond=cond+"<option  id='"+b.series_serialNo+"' value='"+b.id+"'>"+b.series_serialNo+" "+b.series_name+"</option>";
				});				
				$("#sub_series_list").html(cond);
			
			    },
				error : function() {
				},
				complete : function() {
							
			    }
		});
		}
		else{
			
		}
	return false;

	}
	function getUrlVars() {
	    var vars = {};
	    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
	        vars[key] = value;
	    });
	    return vars;
	}
	//List of Reports
	//getsearch();
	function getsearch() {
		
			/*  var skillsSelect = document.getElementById("sub_series_list");
			   var sub_series_list = skillsSelect.options[skillsSelect.selectedIndex].id;  */
			  
		//	var series_list=$("#series_list").val();
			 //  var sub_series_list="";
			 //  var series_list="";
			  	var number = getUrlVars()["req"];		
		var o = "<%=itcnt%>";
		var j = "<%=ksize%>";
		var  m = "<%=iv%>";
		var l = "<%=salt%>";			
		var k = new AesUtil(j, o);	
		var result = k.decrypt(l, m, "data", number);			
		var id=result;
		if(id!="No"){
			var sid ="",sno="",sname="";
			var fields = id.split(/~/);
			
			 sno = fields[0];
			 sname = fields[1];
			
		if (typeof sno != 'undefined'){
				$("#seriesname").html(sno+" "+sname);
		}else{
			$("#seriesname").html("");
		}	
		var series_list="";
				var sub_series_list=sno;
		var dp_start=$("#dp_start").val();
		var dp_end=$("#dp_end").val();
		
		
$.ajax({
			type : "post",
			url : path + "/Fetching_Series_report",
			async : false,
			data:{series_list:series_list,sub_series_list:sub_series_list,dp_start:dp_start,dp_end:dp_end},
			success : function(h) {
				
				var a = h.trim();				
				var j = JSON.parse(a);	
				var i=0;
				var avg=0;
				var cond='<table class="table table-striped table-bordered table-condensed display nowrap"	id="reportdata" width="100%"><thead><tr><th class="text-center">Sl.No</th><th class="text-center">IPADDRESS</th><th class="text-center">LOCATION</th><th class="text-center">DATE</th><th class="text-center">APPLICATION NAME</th><th class="text-center">TIME(Sec)</th> </tr></thead><tbody>';
				if(j.length>0){
				$.each(j,function(a, b) {
					i++;
				cond=cond+"<tr><td style='text-align;center;'>"+i+"</td><td style='width:5px;'>"+b.ipaddress+"</td><td>"+b.location+"</a></td><td >"+b.date+"</td><td style='text-align:Center;'>"+b.applicationname+"</td><td style='text-align:Center;'>"+b.time+"</td></tr>";
				avg=parseInt(avg)+parseInt(b.time);
				
				});			
				
				
				}
				else{
				//	cond=cond+"<tr><td colspan='6'>No data available</td></tr>";	
				}
				
				avg=parseInt(avg)/parseInt(i);
				avg=parseFloat(avg.toFixed(2));
				$("#report").html(cond+"</tbody>  <tfoot>            <tr>                <th colspan='5' style='text-align:right'>Average:</th>                <th id='avg' style='text-align:center;font-weight:bold;'></th>            </tr>        </tfoot></table>");
				$("#avg").html(avg);
			    },
				error : function() {
				},
				complete : function() {
					
				
					$(document).ready(function() {
						$('#reportdata').DataTable( {

					      "columnDefs": [ {
					        "targets": [5],
					        "render": function() { return "30"}
					      }], 
					      "footerCallback": function ( row, data, start, end, display ) {
					    	  alert(row);
					            var api = this.api();
					            alert(api);
					 
					            // Remove the formatting to get integer data for summation
					            var intVal = function ( i ) {
					                return typeof i === 'string' ?
					                    i.replace(/[\$,]/g, '')*1 :
					                    typeof i === 'number' ?
					                        i : 0;
					            };
					 
					            rendered = api
					                .cells( null, 5, { page: 'current'} )
					                .render('display')
					                .reduce( function (a, b) {
					                    return intVal(a) + intVal(b);
					                }, 0 );
					 alert(rendered);
					            pageTotal = api
					                .column( 5, { page: 'current'} )
					                .data()
					                .reduce( function (a, b) {
					                    return intVal(a) + intVal(b);
					                }, 0 );
					 
					            // Update footer
					            $( api.column( 5 ).footer() ).html(
					              'Age: '+pageTotal + '(' + rendered +')'
					            );
					        }
					    } );
					} );
			    }
		});
	return false;
		}
}
	
	
		var flag = 0;
		var id = "";
		$(document).ready(function($){
		//	getserieslist();
		
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
					
					$("#series_list").html(cond);
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
