<%@ include file="Main.jsp"%>
<script src="<%=request.getContextPath()%>/js/AesUtil.js"></script>
<script src="<%=request.getContextPath()%>/js/pbkdf2.js"></script>
<script src="<%=request.getContextPath()%>/js/aes.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
    <!-- <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script> -->
<style>
th { white-space: nowrap; }
</style>
    
    <!-- <script src="https://nightly.datatables.net/js/jquery.dataTables.js"></script> -->
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
						<div class="sepH_b col-sm-3">

							<label>From Date</label>
							<div class="input-group" data-date-format="dd/mm/yyyy">
								<span class="input-group-addon"><i
									class="splashy-calendar_day"></i></span> <input class="form-control"
									readonly="" type="text" id="dp_start"
									style="position: static; background-color: white;" />
							</div>
						</div>
						<div class="sepH_b col-sm-3">
							<label>To Date</label>
							<div class="input-group" data-date-format="dd/mm/yyyy">
								<span class="input-group-addon"><i
									class="splashy-calendar_day"></i></span> <input class="form-control"
									readonly="" type="text" id="dp_end"
									style="position: static; background-color: white;" />
							</div>
						</div>
						<div class="clearfix">
							<div class="col-sm-6  mt-1">
								<button class="btn btn-warning mr-1  " value="refresh" id="refresh"  onClick="getrefresh();"
									>Refresh</button>
								<button class="btn btn-primary mr-1 " value="Search" id="search"
									onClick="getsearch('1');">Search</button>
							 	 <button class="btn btn-info mr-1" value="Export to Excel" id="exporttoexcel"
									onclick="getexlview_ins()" style="display:none;"> Export to Excel</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="row">
			<div class="col-md-12">
				<div id="report"></div>
				
					<div class="nav-custom" id="prison_photo_nav-custom"
				style="float: right;display:none;">
				<button type="button" id="prison_prev" class="btn -primary"
					onclick="getrecords(this.id)">
					<i class="glyphicon glyphicon-arrow-left"></i>
				</button>
				<button type="button" id="prison_next" class="btn -primary"
					onclick="getrecords(this.id)">
					<i class="glyphicon glyphicon-arrow-right"
						style="margin-left: 10px;"></i>
				</button>
			</div> 
			<br> <br> <br> <br> <br> <br> <br>
			<br> <br> <br> <br> <br> <br> <br>
			</div>
		</div>
	</section>

	<script type="text/javascript">
	
	
	function getexlview_ins(){
		//	alert("hi");
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
		<%-- 	var excel = path+'/ExporttoExcel_2.jsp?uid=<%=session_vid_resouce%>&fdate='+dp_start+'&tdate='+dp_end+'&sub_series_list='+sub_series_list+'&sname='+sname+'&exportToExcel=YES'; --%>
		var excel = path+'/ExporttoExcel_3.jsp?uid=<%=session_vid_resouce%>&fdate='+dp_start+'&tdate='+dp_end+'&sub_series_list='+sub_series_list+'&sname='+sname;
		
			
		document.location.href=excel;
}
			}
	
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
	
		$(document).ready(function () {
     				
	 
					   // getsearch('1');    
				 
			});
			var vahan_pageIndex="1",vahan_totrecord="0",vahan_rowrecord="0";
			function getrecords(id){
				//alert(id);
				if(id=="prison_prev" ){
					if(vahan_pageIndex >="2"){
					vahan_pageIndex--;
					}else{}	if((vahan_pageIndex  >= "1" )){
					
								getsearch(vahan_pageIndex);
							
					}else{
					}
				}else{		
					//alert(vahan_totrecord+">"+vahan_rowrecord);
					 if(vahan_totrecord == (+vahan_rowrecord + 1)){
						 vahan_pageIndex++;
						
						
										getsearch(vahan_pageIndex);
									
					} 
					 if(vahan_totrecord > (+vahan_rowrecord + 1)){ 
						vahan_pageIndex++;
						
						
						
									getsearch(vahan_pageIndex);
								
					 }
					else{
					} 
				}
				}
	
	
	function getsearch(vahan_pageIndex) {
		
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
		 $("#search").attr("disabled", true);
		  $("#search").html('<i class="fa fa-refresh"></i> Processing ...');
		//alert(vahan_pageIndex);
$.ajax({
			type : "post",
			url : path + "/Fetching_thr_Series_report_lazyload",
			async : false,
			data:{vahan_pageIndex:vahan_pageIndex,series_list:series_list,sub_series_list:sub_series_list,dp_start:dp_start,dp_end:dp_end},
			success : function(h) {
				
				var a = h.trim();				
				var j = JSON.parse(a);	
				
				var i=0;
				var successavg=0,failureavg=0;
				var succtotavg=0,failtotavg=0;
			
				var cond='<table class="table table-striped table-bordered table-condensed display nowrap"	id="reportdata" width="100%"><thead><tr id="msgcnt"><th colspan="6" ><div id="rowpintdiv" style="font-weight:bold;"><div class="recordscnt">Total Records - <span id="passport_row_totcnt"></span>/<span id="passport_row_cnt"></span></div></th></tr>';
				
				 cond=cond+'<tr><th class="text-center">S.No.</th><th class="text-center">Location</th><th class="text-center">Date</th><th class="text-center">Application Name</th><th class="text-center">Success</th><th class="text-center">Failure</th> </tr></thead><tbody>';
			
				if(j.length>0){
				$.each(j,function(a, b) {
					i++;
				cond=cond+"<tr><td style='text-align:center;'>"+b.rownumber+"</td><td>"+b.location+"</a></td><td >"+b.date+"</td><td style='text-align:right;'>"+b.applicationname+"</td><td style='text-align:right;'>"+b.success+"</td><td style='text-align:right;'>"+b.failure+"</td></tr>";
			
				vahan_totrecord = b.Rcount;
				vahan_rowrecord=b.rownumber; 			
				successavg=parseInt(successavg)+parseInt(b.success);
				failureavg=parseInt(failureavg)+parseInt(b.failure);
				 
				succtotavg= b.Total_success;
				failtotavg= b.Total_failure;
				});			
				
				cond=cond+" <tfoot>            <tr>                <th colspan='4' style='text-align:right'>Average:</th>                <th id='successavg' style='text-align:right;font-weight:bold;'></th>  <th id='failureavg' style='text-align:right;font-weight:bold;'></th>            </tr>        </tfoot>";
				
				successavg=parseInt(successavg)/parseInt(i);
				successavg=parseFloat(successavg.toFixed(2));
				
				failureavg=parseInt(failureavg)/parseInt(i);
				failureavg=parseFloat(failureavg.toFixed(2));
				
				$("#report").html(cond+"</tbody> </table>");
				
				
		 		 if(a=="0"){
					//alert(data);
			$("#prison_photo_nav-custom").css("display","none");
			$("#rowpintdiv").css("display","none");
			$("#exporttoexcel").css("display","none");
				
				}else{
					
					$("#successavg").html(successavg+"(Total Average - " +succtotavg+")");
					$("#failureavg").html(failureavg+"(Total Average - " +failtotavg+")");
					
					$('#passport_row_cnt').html(vahan_totrecord);
					$('#passport_row_totcnt').html(vahan_rowrecord);
					$("#prison_photo_nav-custom").css("display","block"); 
					$("#rowpintdiv").css("display","block");
					$("#exporttoexcel").css("display","");
				} 
				}
				else{
					
					cond=cond+"<tr><td colspan='6'>No data available</td></tr>";
					$("#report").html(cond+"</tbody> </table>");	
				
					$("#rowpintdiv").css("display","none !important");
					
					$('#rowpintdiv').attr("style", "display:none" );
					$("#prison_photo_nav-custom").css("display","none");
					$("#rowpintdiv").css("display","none");
					$("#exporttoexcel").css("display","none");
				
				
				}
				
				
				
			    },
				error : function() {
					 $("#search").attr("disabled", false);
                     $("#search").html("Search"); 
				},
				complete : function() {
					 $("#search").attr("disabled", false);
                     $("#search").html("Search"); 
			
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
