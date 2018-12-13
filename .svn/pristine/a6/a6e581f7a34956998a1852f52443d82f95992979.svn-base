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
	function getrefresh(){
		location.reload();
	}
	
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
		var excel = path+'/ExporttoExcel_1.jsp?uid=<%=session_vid_resouce%>&fdate='+dp_start+'&tdate='+dp_end+'&sub_series_list='+sub_series_list+'&sname='+sname;
		
			
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
			url : path + "/Fetching_fst_Series_report_lazyload",
			async : false,
			data:{vahan_pageIndex:vahan_pageIndex,series_list:series_list,sub_series_list:sub_series_list,dp_start:dp_start,dp_end:dp_end},
			success : function(h) {				
				var a = h.trim();				
				var j = JSON.parse(a);					
				var i=0;
				var uniqueavg=0,onlineavg=0,offlineavg=0,ratioliveavg=0,peravg=0;
				var uniquetotavg=0,onlinetotavg=0,offlinetotavg=0,ratiototavg=0,pertotavg=0;			
				var cond='<table class="table table-striped table-bordered table-condensed  "	id="reportdata" width="100%"><thead><tr id="msgcnt"><th colspan="9" ><div id="rowpintdiv" style="font-weight:bold;"><div class="recordscnt">Total Records - <span id="passport_row_totcnt"></span>/<span id="passport_row_cnt"></span></div></th></tr>';
				if(sub_series_list!="<%=series_name_1_1a%>" && sub_series_list!="<%=series_name_1_1b%>" && sub_series_list!="<%=series_name_1_2%>" && sub_series_list!="<%=series_name_1_8%>" && sub_series_list!="<%=series_name_1_9%>" && sub_series_list!="<%=series_name_1_12%>"){
					 cond=cond+'<tr><th colspan="3"></th><th  colspan="4" style="text-align:center;" >Camera Count</th><th colspan="2" ></th></tr>';
				 cond=cond+'<tr><th class="text-center">Sl.No</th><th class="text-center;">System  IPaddress</th><th class="text-center">AVG-Display FPS</th><th class="text-center">Unique</th><th class="text-center">Online </th><th class="text-center">Offline</th><th class="text-center">Ratio Live Camera </th><th class="text-center">Location</th> <th>Date</th></tr></thead><tbody>';
				}else{
					if(sub_series_list=="<%=series_name_1_8%>"){
					cond=cond+'<tr><th class="text-center" style="width:5%;">Sl.No</th><th class="text-center"  style="width:13%;">Date Time</th><th class="text-center">Name</th><th class="text-center">Online</th><th class="text-center">Offline</th><th class="text-center">Uptime(%)</th> </tr></thead><tbody>';
					}else if(sub_series_list=="<%=series_name_1_9%>"){
						cond=cond+'<tr><th class="text-center" style="width:5%;">Sl.No</th><th class="text-center">System IP</th><th class="text-center">Good</th><th class="text-center">Bad</th><th class="text-center">Date</th><th class="text-center">Percentage</th> </tr></thead><tbody>';	
					}
					else if(sub_series_list=="<%=series_name_1_1a%>"){
						//cond=cond+'<tr><th class="text-center" style="width:5%;">Sl.No</th><th class="text-center">IP Address</th><th class="text-center">Host Name</th><th class="text-center">Region</th><th class="text-center">Zone</th><th class="text-center">Police Station</th><th class="text-center">Uptime(%)</th><th class="text-center">Downtime(%)</th> </tr></thead><tbody>';
							cond='<table class="table table-striped table-bordered table-condensed  "	id="reportdata" width="100%" ><thead><tr id="msgcnt"><th colspan="12" ><div id="rowpintdiv" style="font-weight:bold;"><div class="recordscnt">Total Records - <span id="passport_row_totcnt"></span>/<span id="passport_row_cnt"></span></div></th></tr>';
						cond=cond+'<tr><th class="text-center" style="width:5%;">Sl.No</th><th class="text-center">Camera IP</th><th class="text-center">Region</th><th class="text-center">Zone</th><th class="text-center">Police Station</th><th class="text-center">Camera Name</th><th class="text-center">Camera Type</th><th class="text-center">Connection Type</th><th class="text-center">Camera Status</th><th class="text-center">Start Time</th><th class="text-center">End Time</th></tr></thead><tbody>';
					}
					else if(sub_series_list=="<%=series_name_1_1b%>"){
						//cond=cond+'<tr><th class="text-center" style="width:5%;">Sl.No</th><th class="text-center">Camera IP</th><th class="text-center">Camera Name</th><th class="text-center">Region</th><th class="text-center">Zone</th><th class="text-center">Police Station</th><th class="text-center">Uptime(%)</th><th class="text-center">Downtime(%)</th> </tr></thead><tbody>';	
				cond='<table class="table table-striped table-bordered table-condensed  "	id="reportdata" width="100%" ><thead><tr id="msgcnt"><th colspan="12" ><div id="rowpintdiv" style="font-weight:bold;"><div class="recordscnt">Total Records - <span id="passport_row_totcnt"></span>/<span id="passport_row_cnt"></span></div></th></tr>';
						cond=cond+'<tr><th class="text-center" style="width:5%;">Sl.No</th><th class="text-center">Camera IP</th><th class="text-center">Region</th><th class="text-center">Zone</th><th class="text-center">Police Station</th><th class="text-center">Camera Name</th><th class="text-center">Camera Type</th><th class="text-center">Connection Type</th><th class="text-center">Camera Status</th><th class="text-center">Start Time</th><th class="text-center">End Time</th></tr></thead><tbody>';
					}
					else if(sub_series_list=="<%=series_name_1_2%>"){
						cond='<table class="table table-striped table-bordered table-condensed  "	id="reportdata" width="100%" ><thead><tr id="msgcnt"><th colspan="8" ><div id="rowpintdiv" style="font-weight:bold;"><div class="recordscnt">Total Records - <span id="passport_row_totcnt"></span>/<span id="passport_row_cnt"></span></div></th></tr>';
						cond=cond+'<tr><th class="text-center" style="width:5%;">Sl.No</th><th class="text-center">Date</th><th class="text-center">Start Time</th><th class="text-center">End Time</th><th class="text-center">Total No. of Camera</th><th class="text-center">Online Camera</th><th class="text-center">Offline Camera</th><th class="text-center">Live(%)</th> </tr></thead><tbody>';
					}
					else if(sub_series_list=="<%=series_name_1_12%>"){
						cond='<table class="table table-striped table-bordered table-condensed  "	id="reportdata" width="100%" ><thead><tr id="msgcnt"><th colspan="8" ><div id="rowpintdiv" style="font-weight:bold;"><div class="recordscnt">Total Records - <span id="passport_row_totcnt"></span>/<span id="passport_row_cnt"></span></div></th></tr>';
						cond=cond+'<tr><th class="text-center" style="width:5%;">Sl.No</th><th class="text-center">Camera Name</th><th class="text-center">Region</th><th class="text-center">Zone</th><th class="text-center">Police Station</th><th class="text-center">Min Value</th><th class="text-center">Max Value</th><th class="text-center">Avg Value(%)</th> </tr></thead><tbody>';
					}
					
					else{
						
					}
				}
				if(j.length>0){
				$.each(j,function(a, b) {
					i++;
					if(sub_series_list!="<%=series_name_1_1a%>" && sub_series_list!="<%=series_name_1_1b%>" && sub_series_list!="<%=series_name_1_2%>" && sub_series_list!="<%=series_name_1_8%>" && sub_series_list!="<%=series_name_1_9%>" && sub_series_list!="<%=series_name_1_12%>"){
						
				cond=cond+"<tr><td style='text-align:center;'>"+b.rownumber+"</td><td style='width:20px'>"+b.SystemIP+"</a></td><td >"+b.Avg_DisplayFPS+"</td><td style='text-align:Center;'>"+b.unique_Camera_Count+"</td><td style='text-align:Center;'>"+b.Online_Camera_Count+"</td><td style='text-align:Center;'>"+b.Offline_Camera_Count+"</td><td style='text-align:Center;'>"+b.Ratio_Live_Camera+"</td><td style='text-align:Center;'>"+b.Location+"</td><td>"+b.datedt+"</td></tr>";
								
				uniqueavg=parseInt(uniqueavg)+parseInt(b.unique_Camera_Count);
				onlineavg=parseInt(onlineavg)+parseInt(b.Online_Camera_Count);
				offlineavg=parseInt(offlineavg)+parseInt(b.Offline_Camera_Count);
				ratioliveavg=parseInt(ratioliveavg)+parseInt(b.Ratio_Live_Camera);
				 
				uniquetotavg= b.Totuniquecamcnt;
				onlinetotavg= b.Total_online_camcnt;
				offlinetotavg= b.Total_offline_ccnt;
				ratiototavg= b.Total_ratio_ccnt;
					}else{
						if(sub_series_list=="<%=series_name_1_8%>"){
							cond=cond+"<tr><td style='text-align:center;'>"+b.rownumber+"</td><td style='width:20px'>"+b.datetime+"</a></td><td >"+b.name+"</td><td style='text-align:Center;'>"+b.online+"</td><td style='text-align:Center;'>"+b.offline+"</td><td style='text-align:Center;width:10%;'>"+b.uptime+"</td></tr>"; 
						
							peravg=parseFloat(peravg)+parseFloat(b.uptime);							 
							pertotavg= b.Total_Average;
							
						}
						
						if(sub_series_list=="<%=series_name_1_1a%>" || sub_series_list=="<%=series_name_1_1b%>" ){
							cond=cond+"<tr><td style='text-align:center;'>"+b.rownumber+"</td><td style='width:20px'>"+b.CameraIP+"</a></td><td >"+b.Region+"</td><td style='text-align:Center;'>"+b.Zone+"</td><td style='text-align:Center;'>"+b.PS+"</td><td style='text-align:Center;width:10%;'>"+b.Cameraname+"</td><td style='text-align:Center;width:10%;'>"+b.CameraType+"</td><td style='text-align:Center;width:10%;'>"+b.Connectiontype+"</td><td style='text-align:Center;width:10%;'>"+b.CameraStatus+"</td><td style='text-align:Center;width:10%;'>"+b.StartTIme+"</td><td style='text-align:Center;width:10%;'>"+b.EndTime+"</td></tr>"; 
							
						}
						else if(sub_series_list=="<%=series_name_1_9%>"){
							cond=cond+"<tr><td style='text-align:center;'>"+b.rownumber+"</td><td style='width:20px'>"+b.SystemIP+"</a></td><td style='text-align:Center;width:15%' >"+b.good+"</td><td style='text-align:Center;width:15%'>"+b.bad+"</td><td style='text-align:Center;width:15%'>"+b.dt+"</td><td style='text-align:Center;width:10%;'>"+b.percentag+"</td></tr>";	
							peravg=parseFloat(peravg)+parseFloat(b.percentag);							 
							pertotavg= b.Total_Average;
						}
						
						else if(sub_series_list=="<%=series_name_1_2%>"){
							cond=cond+"<tr><td style='text-align:center;'>"+b.rownumber+"</td><td>"+b.date+"</a></td><td style='text-align:Center;width:15%' >"+b.StartTime+"</td><td style='text-align:Center;width:15%'>"+b.EndTime+"</td><td style='text-align:Center;width:15%'>"+b.TotalCount+"</td><td style='text-align:Center;width:10%;'>"+b.onlineCount+"</td><td style='text-align:Center;width:10%;'>"+b.OfflineCount+"</td><td style='text-align:Center;width:20%;'>"+b.Avg+"</td></tr>";	
							peravg=parseFloat(peravg)+parseFloat(b.Avg);							 
							pertotavg= b.Total_Average;
						}
						
						else if(sub_series_list=="<%=series_name_1_12%>"){
							camera_name,region,zone,ps,minvalue,maxvalue,avgvalue,Total_Average
							cond=cond+"<tr><td style='text-align:center;'>"+b.rownumber+"</td><td>"+b.camera_name+"</a></td><td style='text-align:Center;width:15%' >"+b.region+"</td><td style='text-align:Center;width:15%'>"+b.zone+"</td><td style='text-align:Center;width:15%'>"+b.ps+"</td><td style='text-align:Center;width:10%;'>"+b.minvalue+"</td><td style='text-align:Center;width:10%;'>"+b.maxvalue+"</td><td style='text-align:Center;width:20%;'>"+b.avgvalue+"</td></tr>";	
							peravg=parseFloat(avgvalue)+parseFloat(b.avgvalue);							 
							pertotavg= b.Total_Average;
						}
						
						
						
					}
				vahan_totrecord = b.Rcount;
				vahan_rowrecord=b.rownumber; 	
				});			
				if(sub_series_list!="<%=series_name_1_1a%>" && sub_series_list!="<%=series_name_1_1b%>" && sub_series_list!="<%=series_name_1_2%>" && sub_series_list!="<%=series_name_1_8%>" && sub_series_list!="<%=series_name_1_9%>" && sub_series_list!="<%=series_name_1_12%>"){
				cond=cond+" <tfoot>            <tr>                <th colspan='3' style='text-align:right;font-weight:bold;'>Average:</th>                <th id='uniqueavg' style='text-align:center;font-weight:bold;'></th>    <th id='onlineavg' style='text-align:center;font-weight:bold;'></th>  <th id='offlineavg' style='text-align:center;font-weight:bold;'></th>  <th id='ratioliveavg' style='text-align:center;font-weight:bold;'></th> <th colspan='2'></th>           </tr>        </tfoot>";
				
				
				uniqueavg=parseInt(uniqueavg)/parseInt(i);
				uniqueavg=parseFloat(uniqueavg.toFixed(2));				
				onlineavg=parseInt(onlineavg)/parseInt(i);
				onlineavg=parseFloat(onlineavg.toFixed(2));				
				offlineavg=parseInt(offlineavg)/parseInt(i);
				offlineavg=parseFloat(offlineavg.toFixed(2));
				ratioliveavg=parseInt(ratioliveavg)/parseInt(i);
				ratioliveavg=parseFloat(ratioliveavg.toFixed(2));			
				
				
				$("#report").html(cond+"</tbody> </table>");
				}else{
					if(sub_series_list=="<%=series_name_1_8%>"){
						cond=cond+" <tfoot>            <tr>       <td colspan='5'  style='text-align:right;font-weight:bold;'>Average</td><td id='peravg' style='text-align:center;font-weight:bold;'></td></tr></tfoot>";
						peravg=parseInt(peravg)/parseInt(i);
						peravg=parseFloat(peravg.toFixed(2));								
						
						$("#report").html(cond+"</tbody> </table>");
					}
					
					if(sub_series_list=="<%=series_name_1_1a%>" || sub_series_list=="<%=series_name_1_1b%>" ){
						$("#report").html(cond+"</tbody> </table>");
					}
					else if(sub_series_list=="<%=series_name_1_9%>"){
						cond=cond+" <tfoot>            <tr>       <td colspan='5'  style='text-align:right;font-weight:bold;'> Average</td><td id='peravg' style='text-align:center;font-weight:bold;'></td></tr></tfoot>";
						peravg=parseInt(peravg)/parseInt(i);
						peravg=parseFloat(peravg.toFixed(2));								
						
						$("#report").html(cond+"</tbody> </table>");
					}
					
					else if(sub_series_list=="<%=series_name_1_2%>"){
						cond=cond+" <tfoot>            <tr>       <td colspan='7'  style='text-align:right;font-weight:bold;'> Average</td><td id='peravg' style='text-align:center;font-weight:bold;'></td></tr></tfoot>";
						peravg=parseFloat(peravg)/parseFloat(i);
						peravg=parseFloat(peravg.toFixed(2));								
						
						$("#report").html(cond+"</tbody> </table>");
					}
					
					else if(sub_series_list=="<%=series_name_1_12%>"){
						cond=cond+" <tfoot>            <tr>       <td colspan='8'  style='text-align:right;font-weight:bold;'> Average</td><td id='peravg' style='text-align:center;font-weight:bold;'></td></tr></tfoot>";
						peravg=parseFloat(peravg)/parseFloat(i);
						peravg=parseFloat(peravg.toFixed(2));								
						
						$("#report").html(cond+"</tbody> </table>");
					}
				}
				
		 		 if(a=="0"){
					//alert(data);
			$("#prison_photo_nav-custom").css("display","none");
			$("#rowpintdiv").css("display","none");
			$("#exporttoexcel").css("display","none");
				
				}else{
					if(sub_series_list!="<%=series_name_1_1a%>" && sub_series_list!="<%=series_name_1_1b%>" && sub_series_list!="<%=series_name_1_2%>" && sub_series_list!="<%=series_name_1_8%>" && sub_series_list!="<%=series_name_1_9%>" && sub_series_list!="<%=series_name_1_12%>"){
					$("#uniqueavg").html(uniqueavg+"<br>(Overall - " +uniquetotavg+")");
					$("#onlineavg").html(onlineavg+"<br>(Overall - " +onlinetotavg+")");
					$("#offlineavg").html(offlineavg+"<br>(Overall - " +offlinetotavg+")");
					$("#ratioliveavg").html(ratioliveavg+"<br>(Overall - " +ratiototavg+")");
					}
					else{
						
						$("#peravg").html(peravg+"(Total Average - " +pertotavg+")");
					}
					$('#passport_row_cnt').html(vahan_totrecord);
					$('#passport_row_totcnt').html(vahan_rowrecord);
					$("#prison_photo_nav-custom").css("display","block"); 
					$("#rowpintdiv").css("display","block");
					$("#exporttoexcel").css("display","");
				} 
				}
				else{
					
					cond=cond+"<tr><td colspan='13'>No data available</td></tr>";
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
