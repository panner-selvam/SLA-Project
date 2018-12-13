<%@ include file="Main.jsp"%>
<script src="<%=request.getContextPath()%>/js/highchart/highcharts.js"></script>
<script src="<%=request.getContextPath()%>/js/highchart/drilldown.js"></script>
<script src="js/datepicker.js"></script>
<script src="js/bootbox.min.js"></script>
<style>
.ui-datepicker-calendar {
    display: none;

}
.datepicker-months{
	width : 215px;
	height :228px;
}
.datepicker-years{
	width : 225px;
	height :228px;
}
</style>
<div class="main_content">

	<div id="jCrumbs" class="breadCrumb module">
		<div style="overflow: hidden; position: relative; width: 1065px;">
			<div>
				<div style="overflow:hidden; position:relative; width: 968px;"><div><ul style="width: 5006px;">
					<li class="first"><a href="Dashboard.jsp"><i class="glyphicon glyphicon-home"></i></a></li>
					<li><a href="#">Report</a></li>
					<!-- 	<li><a href="#">2.3</a></li> -->
					<li class="last"><b>SLA Quartely Report</b></li>
				</ul></div></div>
			</div>
		</div>
	</div>
	<div class="row">
			<div class="col-md-12">
				<div class="w-box" id="w_sort01">
					<div class="w-box-header"><div class="btn-group pull-right" style="margin-top: 3px;">
									<a href="#" class="btn bs_ttip btn-default btn-xs" data-placement="auto top" data-container="body" data-viewport="body" title="" data-original-title="Refresh list" onclick="getsearch('refresh');"><i class="glyphicon glyphicon-refresh"></i></a>
						</div>Series</div>
					<div class="w-box-content cnt_a ">
						
						<div class="col-sm-3" style="padding-right: 0px">

							<label>From</label>
							<div class="input-group" data-date-format="dd/mm/yyyy">
							<span class="input-group-addon"><i class="splashy-calendar_day"></i></span>
							<input class="form-control" type="text" id="mpick" style="background-color:white" readonly="">
							</div>
						</div>
						<div class="col-sm-3" style="padding-right: 0px">
						<label>To</label>
							<div class="input-group">
							<span class="input-group-addon"><i class="splashy-calendar_day"></i></span>
							<input class="form-control" type="text" id="next_3_month" style="background-color:white" readonly="">
							</div>
						</div>
						
						<div class="clearfix">
							<div class="col-sm-6  mt-1">
								<!--   <a href="#" class="btn btn-gebo pull-right btn-default">Send</a></div> -->
								
								<button class="btn btn-primary mr-1" value="Search" id="search" onclick="getsearch('search');">Search</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<div class="widget-container row" style="padding-top:15px">
		<div id="series_chart">
			<table class="table table-striped table-bordered table table-hover" style="width: 100%;">
				<tbody class="table table-striped table-bordered table table-hover"></tbody>
			</table>
		</div>

	</div>
		</div>
</body></html>
		<script>
		var Myear="Select month",year='',month=''; 
		var fdate='',ldate='';
		
		$(document).ready(function () {
             
            $('#mpick').datepicker({
                minViewMode: 'months',
                autoclose: true,
                 format: 'mm/yyyy',
                 endDate: "today"
            });  
            $('#mpick').datepicker().datepicker('setDate', '0m');
            dateSplit();
            thisMonth();
		});
		
		$("#mpick").change(function(){
		 	dateSplit();
    	});
		
		function dateSplit() {
            Myear = $("#mpick").val(); 
	    	year = Myear.slice(3,7);	
	    	month = Myear.slice(0,2);  
	    	
	    	var nowdate = new Date(); 
			var first_month = new Date(year, month-1); 
			var third_month = new Date(year, ((month-1)+3), 0);
			
			var first_month_YEAR = first_month.getFullYear();  			
			var first_month_MONTH = first_month.getMonth()+1; 
			var first_month_STARTDAY = first_month.getDate();
			
			third_month_YEAR = third_month.getFullYear();
			third_month_MONTH = third_month.getMonth()+1;
			third_month_STARTDAY = third_month.getDate();
			
			f_year = String(first_month_YEAR).slice(-2);
			f_month = ("0"+String(first_month_MONTH)).slice(-2); 
			f_date =  ("0"+String(first_month_STARTDAY)).slice(-2); 
			
			l_year = String(third_month_YEAR).slice(-2);
			l_month = ("0"+String(third_month_MONTH)).slice(-2); 
			l_date =  ("0"+String(third_month_STARTDAY)).slice(-2);
			
			fdate = ""+f_month+"/"+f_date+"/"+f_year;
			ldate = ""+l_month+"/"+l_date+"/"+l_year; 
          	
			$('#next_3_month').val(ldate);
        }
		
		
		
		function getsearch(val){
			if(val=="search"){
	            ajaxCall();
	                
			}
			else if(val=="refresh"){
				location.reload(true);
			}
		}
		
		
		function thisMonth(){
			ajaxCall();	
		}
		
		function ajaxCall(){
			
			$.ajax({
				type : "post",
				url : path + "/Fetching_quartely_chart_report",
				async : false,
				data:{startDate:fdate,endDate:ldate},
				success : function(data){ 
					var temp = data.trim(); 
					temp = JSON.parse(data); 
					
					if(temp!=null){ 
						series_chart_fn(temp);  
					}
					else{
						bootbox.alert("No Records for this Month");
					}				
				},
					error : function(xhr, ajaxOptions, thrownError) {
						bootbox.alert("err"+xhr);},
					complete : function() {
						
					}
			});
			return false;
		}
		
	
	

		function series_chart_fn(temp) {
			var m1=0,m2=0,m3=0,m4=0,m5=0,m6=0,m7=0;
			var obj = temp;
			 var k='<table class="table table-striped table-bordered table table-hover"  style="width:100%;">';
				k+='<thead>';
					k+='	<tr>';
						k+='		<th>S.No</th>';
							k+='		<th style="text-align: center;">Performance Area</th>';
								k+='	<th>Points</th>';
										k+='</tr>';
											k+=' </thead>';
	
												k+='<tbody class="table table-striped table-bordered table table-hover">';
			if ((obj == "")||(obj == null)) {
				k+='<tr>';
				k += '<td colspan="3" style="text-align: center;" >DATA NOT AVAILABLE</td>';
				k+='</tr>';

			k+='</tbody></table>';
			document.getElementById('series_chart').innerHTML = k;

			} else { 
				var s = 0;
				$.each(obj, function(key, data) {
					s++;
					
					if(data.module_no=='1'){
						if(m1==0){
							k+= '<tr>';
							k += '<i><td colspan="3" style="text-align: center;font-weight: bold;" >'+data.module+'</td></i>';
							k+= '</tr>';
							m1++;
						}
					}else if(data.module_no=='2'){
						if(m2==0){
							k+= '<tr>';
							k += '<td colspan="3" style="text-align: center;font-weight: bold;" >'+data.module+'</td>';
							k+= '</tr>';
							m2++;
						}
					}else if(data.module_no=='3'){
						if(m3==0){
							k+= '<tr>';
							k += '<td colspan="3" style="text-align: center;font-weight: bold;" >'+data.module+'</td>';
							k+= '</tr>';
							m3++;
						}
					}else if(data.module_no=='4'){
						if(m4==0){
							k+= '<tr>';
							k += '<td colspan="3" style="text-align: center;font-weight: bold;"  >'+data.module+'</td>';
							k+= '</tr>';
							m4++;
						}
					}else if(data.module_no=='5'){
						if(m5==0){
							k+= '<tr>';
							k += '<td colspan="3" style="text-align: center;font-weight: bold;"  >'+data.module+'</td>';
							k+= '</tr>';
							m5++;
						}
					}else if(data.module_no=='6'){
						if(m6==0){
							k+= '<tr>';
							k += '<td colspan="3" style="text-align: center;font-weight: bold;"  >'+data.module+'</td>';
							k+= '</tr>';
							m6++;
						}
					}else if(data.module_no=='7'){
						if(m7==0){
							k+= '<tr>';
							k += '<td colspan="3" style="text-align: center;font-weight: bold;"  >'+data.module+'</td>';
							k+= '</tr>';
							m7++;
						}
					}
					k += '<tr>';
					k+= '<td>'+s+'</td>';
					k += '<td>' + data.series+'</td>';
					k += '<td>' + data.points + '</td>';					
					k += '</tr>';
					
				});
				k += '</tbody></table>';
				document.getElementById('series_chart').innerHTML = k;
				
			} 
		}
		
	</script>