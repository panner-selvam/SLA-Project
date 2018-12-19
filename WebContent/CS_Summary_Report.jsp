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
				<ul style="width: 5006px;">
					<li class="first"><a href="Dashboard.jsp"><i
							class="glyphicon glyphicon-home"></i></a></li>
					<li><a href="#">Statistics</a></li>
					<!-- 	<li><a href="#">2.3</a></li> -->
					<li class="last"><b>SLA Summary Report</b></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
				<div class="w-box" id="w_sort01">
					<div class="w-box-header">
					<div class="btn-group pull-right" style="    margin-top: 3px;">
									<a href="#" class="btn bs_ttip btn-default btn-xs" data-placement="auto top" data-container="body" data-viewport="body" title="" data-original-title="Refresh list" 	onClick="getsearch('refresh');"><i class="glyphicon glyphicon-refresh"></i></a>
							
						</div>
					Series</div>
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
								
								
							
							</div>
						</div>
					</div>
				</div>
			</div>	
	</div>
	<div id="container" style="min-width: 310px; height: 400px; max-width: 1200px; margin: 0 auto"></div>
		</div>
		
		<script>
		
		var from_date="",to_date="";
		
		$(document).ready(function () {
			var currentDate = new Date();
			
            $('#fpick').datepicker({
    			format : 'mm/dd/yy',
    			changeMonth : true,
    			changeYear : true,
    			changeDate : true,
    			autoclose: true ,
    			endDate: "today"
            });
            $('#epick').datepicker({                  
				format : 'mm/dd/yy',
				changeMonth : true,
				changeYear : true,
				changeDate : true,
				autoclose: true,
				endDate: "today"
            });
            $('#fpick').datepicker().datepicker('setDate', '-1d');
            $('#epick').datepicker().datepicker('setDate', '-1d');

            yesterday_chart();	
        });
		
		 $("#fpick").change(function(){
		    	from_date = $("#fpick").val(); 
		    	
		    });
         $("#epick").change(function(){
         	to_date = $("#epick").val(); 
         	
		   });
			
        
				
		
	function getsearch(val){
	
		if(val=="search"){
			from_date = $("#fpick").val(); 
			to_date = $("#epick").val();
			ajaxCall(from_date,to_date);
		}
		else if(val=="refresh"){
			location.reload(true);
		}
	
	}
	
	
	function yesterday_chart(){
      	
		ajaxCall(from_date,to_date);
	}
	
	function ajaxCall(from_date,to_date){
			
			$.ajax({
				type : "post",
				url : path + "/Fetching_drilldown_chart_value",
				async : false,
				data:{startDate:from_date,endDate:to_date},
				
				success : function(data) {	
					var obj = JSON.parse(data);
					if(obj!=null){
						drawchart(obj);
					}
					else{
						bootbox.alert("No Records for this date");
					}					
				},
					error : function(xhr, ajaxOptions, thrownError) {
						bootbox.alert("err"+xhr);
						},
					complete : function() {
						
					}
			});
		return false;
	}
	

	function drawchart(obj){
		var module=[],series_1=[],series_2=[],series_3=[],series_4=[],series_5=[];
		if(obj!=null){
			$.each(obj,function(key,data){
				if(data.module_no=='1'){					
					$.each(data.series_list,function(key,data){
						series_1.push([data.series_no,parseFloat(data.series_point)]);
					});
				}
				if(data.module_no=='2'){					
					$.each(data.series_list,function(key,data){
						series_2.push([data.series_no,parseFloat(data.series_point)]);
					});
				}if(data.module_no=='3'){					
					$.each(data.series_list,function(key,data){
						series_3.push([data.series_no,parseFloat(data.series_point)]);
					});
				}if(data.module_no=='4'){					
					$.each(data.series_list,function(key,data){
						series_4.push([data.series_no,parseFloat(data.series_point)]);
					});
				}if(data.module_no=='5'){					
					$.each(data.series_list,function(key,data){
						series_5.push([data.series_no,parseFloat(data.series_point)]);
					});
				}
				
			});
			$.each(obj,function(key,data){
				module.push({
					"name" : data.module_name,
		        	"y"  : parseInt(data.series_total),
		        	"drilldown" : data.module_name
				});
			});
			
		}
			$(function () {
			    // Create the chart
			    $('#container').highcharts({
			         chart: {
			            type: 'column',
			            options3d: {
			                enabled: true,
			                alpha: 45,
			                beta: 0
			            }
			        },
			        title: {
			            text: 'SLA Drilldown'
			        },
			        subtitle: {
			            text: 'Click the slices to view versions. Source: SLA.'
			        },
			        xAxis: {
			            type: 'category'
			          },
			          yAxis: {
			            title: {
			              text: 'Total Points'
			            }

			          },
			        plotOptions: {
			            series: {
			                dataLabels: {
			                    enabled: true,
			                    format: '{point.y:.1f}'
			                }
			            }
			        },

			        tooltip: {
			            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
			            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}</b> of total<br/>'
			        },
			        series: [{
			            name: 'Main Module',
			            colorByPoint: true,
			            data:module
			        }],
			        drilldown: {
			             series: [{
			                name:module[0].name,
			                id: module[0].name,
			                data:series_1 
			            }, {
			                name: module[1].name,
			                id: module[1].name,
			                data: series_2
			            }, {
			                name:module[2].name,
			                id: module[2].name,
			                data: series_3
			            }, {
			                name: module[3].name,
			                id: module[3].name,
			                data: series_4
			            }, {
			                name: module[4].name,
			                id: module[4].name,
			                data: series_5
			            }] 
			        //  series: [{"name":"Camera, Video Feed Uptime and Quality","id":"Camera, Video Feed Uptime and Quality","data":[["Requested",7],["Approved",0],["Declined",1],["Clip Ready",2],["Video Not Available",1],["Completed",0]]},{"name":"SOUTH","id":"SOUTH","data":[["Requested",7],["Approved",0],["Declined",1],["Clip Ready",2],["Video Not Available",1],["Completed",0]]}]
			        }
			    });
			});
	}

		</script>