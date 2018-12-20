<%@ include file="Main.jsp"%>
<script src="js/highstock.js"></script>
<script src="js/exporting.js"></script>
<link rel="stylesheet" href="css/dashboard.css" />

<!-- <script src="js/jquery.min.js"></script> -->	



<body class="main_content2">
<!-- ajax loader -->
<div id="load"></div>  
<div class="main_content"> 

<!-- Total score ,Baseline, Lowerperformance, Breach -->

	<div class="row" id="dashboard_score"> 

		<div class="col-md-3 col-sm-6 widget-container">
			<div class="panel panel-coral ">
				<div class="panel-body ">
					<div class="col-md-6 widget-icon ">
						<i class="fa fa-cubes" style="font-size:40px;color:#008000ad"></i>
					</div>
					<div class="col-md-6 " style="font-size:30px;"><label id="dashboard_total_score">0</label></div>
					<div class="col-md-12 widget-details">
						
						<b class="text-primary" style="font-size:15px;">Total Score</b>
					</div>
				</div>
			</div>
		</div>

		<div class="col-md-3 col-sm-6  widget-container">
			<div class="panel panel-sky ">
				<div class="panel-body ">
					<div class="col-md-6 widget-icon">
						<i class="glyphicon glyphicon-stats" style="font-size:40px;color:#008000ad;"></i>					
					</div>
					<div class="col-md-6" style="font-size:30px;"><label id="dashboard_base_line">0</label></div>
					<div class="col-md-12 widget-details">
						
						<b class="text-primary" style="font-size:15px;">Base Line</b>
					</div>
				</div>
			</div>
		</div>

		<div class="col-md-3 col-sm-6  widget-container">
			<div class="panel panel-success">
				<div class="panel-body ">
					<div class="col-md-6 widget-icon">
						<i class="fa fa-line-chart" style="font-size:40px;color: #ffa500ab"></i>
					</div>
					<div class="col-md-6" style="font-size:30px;"><label id="dashboard_lower_performance">0</label></div>
					<div class="col-md-12 widget-details">
						
						<b class="text-primary" style="font-size:15px;">Lower Performance</b>
					</div>
				</div>
			</div>
		</div>

		<div class="col-md-3 col-sm-6  widget-container">
			<div class="panel panel-primary">
				<div class="panel-body ">
					<div class="col-md-6 widget-icon">
						<i class="fa fa-exclamation-circle" style="font-size:40px;color:#ff000094"></i>
					</div>
					<div class="col-md-6" style="font-size:30px;" ><label id="dashboard_breach">0</label></div>
					<div class="col-md-12 widget-details">
						
						<b class="text-primary" style="font-size:15px;">Breach</b>
					</div>
				</div>
			</div>
		</div>

	</div>
	
	<!-- Points Chart -->
	
	<div class="row">
		<div class="col-md-8" >
			<div id="Chart_container" style="height: 400px; margin: 0 auto"></div>
		</div>
		
		<!-- Previous Week Total Points Table -->
		
		<div class="col-md-4" >
			<div class="table-stretch" style="height : 398px">
			<table id="example" class="table table-striped table-bordered table table-hover" style="width: 100%; height: 100%">
				<thead>
					<tr>
						<th colspan="2"><label class="text-center"><b>PREVIOUS WEEK TOTAL POINTS</b></label></th>
					</tr>
					<tr>
						<th class="text-center" class="col-md-6" >Date</th>
						<th class="text-center" class="col-md-6" >Points</th>
					</tr>
				</thead>
				<tbody id="score_table"></tbody>
			</table>
			<script type="text/javascript">	
			function score_table(obj){
				var obj = obj;
				var k ='<tbody>'
				for (i=0;i<obj.length;i++){
					k+='<tr>';
					k+='<td class="text-center">'+obj[i].DATE+'</td>';
					k+='<td class="text-center">'+obj[i].POINTS+'</td>';
					k+='</tr>';
				}
				k+='</tbody>';
				document.getElementById('score_table').innerHTML = k;
			}
				
			</script>
			</div>		
		</div>
	</div>
	
	<!-- Performance area Points Table -->
	
	<div class="row ">
		<div class="col-md-8 widget-container " >
			<table id="example" class="table table-striped table-bordered table table-hover"  style="width:100%; display:block">
				<tbody id="series_table" style='height:316px; display:block; overflow:scroll; width:100%'></tbody>
			</table>
			<script type="text/javascript">
				function seriesTableFeed(obj){
					var obj = obj;
					var k ='<tbody >'
					if(obj==""){							
							k+='<thead ><tr class="tab-header"><th>S.No</th><th>PERFORMANCE AREA</th><th>POINTS</th><th>STATUS</th></tr></thead>';
							k+='<tr>';
							k+='<td colspan="4" class="text-center" style="width: 655px; background-color:white;" ><h5>DATA NOT AVAILABLE</h5></td>';
							k+='</tr>';
		
						k+='</tbody>';
						document.getElementById('series_table').innerHTML = k;
					}
					else{
				var s=0;
						k+='<head><tr class="tab-header"><th>S.No</th><th>PERFORMANCE AREA</th><th>POINTS</th><th>STATUS</th></tr></head>';
					for (i=0;i<obj.length;i++){
						s++;
						k+='<tr>';
						k+='<td "text-center">'+s+'</td>';
						k+='<td "text-left">'+obj[i].SERISE+'</td>';
						k+='<td "text-center">'+obj[i].POINTS+'</td>';
						if((obj[i].STATUS)==("Baseline")){
							k+='<td "text-center"><span class="label label-success">'+obj[i].STATUS+'</span></td>';
						}
						else if((obj[i].STATUS)==("Breach")){
							k+='<td "text-center"><span class="label label-danger">'+obj[i].STATUS+'</span></td>';
						}
						k+='</tr>';
					}
					k+='</tbody>';
					document.getElementById('series_table').innerHTML = k;
				}
			}
			</script>
		</div>
		
		<!-- Sticky note --> 
		
			<div class="panel panel-default col-md-4 ">
				<div class="panel-heading" style="padding-bottom:5px">
				<div class="row">
					<div class="col-md-12 " >
						<i class="fa fa-book"></i>Sticky Note
						<div style="float:right">
							<i id="reminder" style="display:none">Click to stick >&nbsp;</i>
							<i data-toggle="tooltip" title="Click to tag" id="tag_icon" class="fa fa-clipboard" style="font-size:15px;color:green;border:1px solid gray;float:right;padding:3px;border-radius:3px"></i>
						</div>
						
					</div>
					
				</div>
				</div>
				<div class="upcoming-event-container">
					<textarea name="note" cols="40" rows="10" id="sticky-note"
						class="sticky-note">My Quick Notes Here...
					</textarea>
					
				</div>
		</div>
	</div>

</div>
</body>
<script>
dashBoardCal(); Chartvalues(); weekScore(); seriesTable(); sticky_message();
function sticky_message(){
	$.ajax({
		
		type : "GET",
		url : path +"/Fetching_sticky_message",
		async : false,
		data:{},
		success : function(data) { 
			var obj = JSON.parse(data);
			$.each(obj,function (key,data){
				$('#sticky-note').val(data.message);
			});
		},
		error : function(xhr, errorType, exception) {
			alert("Error :"+xhr.status);
		},
		complete : function() {}
	});
	return false; 
}
//Sticky event

$(document).ready(function(){
	$(".panel-coral").mouseover(function(){ 
    	$(".fa-cubes").css("color", "green");
    	$(".panel-coral").css("border-color", "green");
    	$(".panel-coral .text-primary").css("font-size", "16px");
    });
	$(".panel-coral").mouseout(function(){ 
    	$(".fa-cubes").css("color", "#008000ad"); 
    	$(".panel-coral").css("border-color", "#cccccc");
    	$(".panel-coral .text-primary").css("font-size", "15px");
    });
	$(".panel-sky").mouseover(function(){ 
    	$(".glyphicon-stats").css("color", "green");
    	$(".panel-sky").css("border-color", "green");
    	$(".panel-sky .text-primary").css("font-size", "16px");
    });
	$(".panel-sky").mouseout(function(){ 
    	$(".glyphicon-stats").css("color", "#008000ad");
    	$(".panel-sky").css("border-color", "#cccccc");
    	$(".panel-sky .text-primary").css("font-size", "15px");
    });
	$(".panel-success").mouseover(function(){ 
    	$(".fa-line-chart").css("color", "orange");
    	$(".panel-success").css("border-color", "orange");
    	$(".panel-success .text-primary").css("font-size", "16px");
    });
	$(".panel-success").mouseout(function(){ 
    	$(".fa-line-chart").css("color", "#ffa500ab");
    	$(".panel-success").css("border-color", "#cccccc");
    	$(".panel-success .text-primary").css("font-size", "15px");
    });
	$(".panel-primary").mouseover(function(){ 
    	$(".fa-exclamation-circle").css("color", "red");
    	$(".panel-primary").css("border-color", "red");
    	$(".panel-primary .text-primary").css("font-size", "16px");
    });
	$(".panel-primary").mouseout(function(){ 
    	$(".fa-exclamation-circle").css("color", "#ff000094");
    	$(".panel-primary").css("border-color", "#cccccc");
    	$(".panel-primary .text-primary").css("font-size", "15px");
    });
    $("#sticky-note").mousedown(function(){
    	$("#tag_icon").css("color", "red");
    	$("#reminder").show();
    });
    $("#sticky-note").keypress(function(){
    	$("#tag_icon").css("color", "red");
    	$("#reminder").show();
    });
    $("#tag_icon").mouseover(function(){
    	$("#tag_icon").css("border", "0.4px solid gray");
    });
    $("#tag_icon").mouseleave(function(){
    	$("#tag_icon").css("border", "1px solid gray");
    });
    $("#tag_icon").click(function(){
    	var msg = $('#sticky-note').val();
    	$.ajax({
    		type : "POST",
    		url : path +"/Fetching_sticky_message",
    		async : false,
    		data:{msg:msg},
    		success : function(data) {
    			$("#tag_icon").css("color", "green");
    			$("#reminder").hide();
    		},
    		error : function(xhr, errorType, exception) {
    			alert("Error :"+xhr.status);
    		},
    		complete : function() {}
    	});
    	return false;
    });
});

//ajax call for dashboard total score,Baseline,Breach
	function dashBoardCal() {				
	    var baseLine="0", breach="0", lowerPerformance="0";
		$.ajax({
			
			type : "post",
			url : path +"/Fetching_Score_Details",
			async : false,
			data:{},
			success : function(data) {
				var t = data.trim();
				if(t=="NO DATA"){
					return false;
				}
				var obj = JSON.parse(data); 
				$.each(obj,function (key,data){
					if(data.status=="Baseline"){
						baseLine = data.cnt;
					}
					else if(data.status=="Breach"){
						breach = data.cnt; 
					}
				});
				
						var BL  = parseFloat(baseLine);
						//var LP  = parseFloat(lowerperformance);
						var B  = parseFloat(breach);				
						document.getElementById("dashboard_base_line").innerText = BL;
						document.getElementById("dashboard_breach").innerText = B;
						//document.getElementById("dashboard_lower_performance").innerText = LP;
						
						document.getElementById("dashboard_total_score").innerText = BL+B;
				
	
			},
			error : function() {},
			complete : function() {}
		});
	return false;
	}
//  points Chart
	function Chartvalues(){
			
			$.ajax({
					
					type : "post",
					url : path + "/Fetching_chart_points",
					async : false,
					data:{},
					success : function(data) { 
						var obj = JSON.parse(data);
						drawchart(obj);
					},
					error : function(xhr, errorType, exception) {
						alert("Error :"+xhr.status);
						
					},
					complete : function() {}
				});
			return false;
			

			

	}
	
// Chart values integration
	function drawchart(data){
		
		var obj = data;
		var BL_dates=[],LP_dates=[],B_dates=[];
		var BL_points=[],LP_points=[],B_points=[];
		
		var today= new Date();
		today.setDate(today.getDate()-7);
		var dd = today.getDate();
		var mm= today.getMonth()+1;
		var yyyy=today.getFullYear();
			
		if(obj!=null){
			
			 $.each(obj[0],function(key,data){	
				 
				 BL_dates.push(data.BL_date);
				 BL_points.push(parseFloat(data.BL_points));
				 
			});
			$.each(obj[1],function(key,data){	

				LP_dates.push(data.LP_date);
				LP_points.push(parseFloat(data.LP_points));
				
			});
			$.each(obj[2],function(key,data){	
				
				B_dates.push(data.B_date);
				B_points.push(parseFloat(data.B_points));
				 
			});
			
		}
 //LP_points=[0, 35, 60, 20, 20, 90, 90];
			
			
			Highcharts.chart('Chart_container', {
			    chart: {
			        type: 'areaspline'
			    },
			    title: {
			        text: 'Points Chart'
			    },
			   
			    xAxis: {
			    	
			        type: 'datetime',
			        dateTimeLabelFormats: {
			            day: '%e of %b'
			        },
			        title: {
			        	style: {
			                fontWeight: 'bold'
			            },
				        text:'Date'
				    },
				    scrollbar: {
			            enabled: true
			        }
			   
			    },
			    yAxis: {
			    
			    	title: {
			    		style: {
			                fontWeight: 'bold'
			            },
				        text: 'Points'
				    },
				   
			    },
			    
			    tooltip: {
			        pointFormat: '{series.name} had stockpiled <b>{point.y:,.0f}</b>'
			    },
			    plotOptions: {
			        area: {
			            
			            marker: {
			                enabled: false,
			                symbol: 'circle',
			                radius: 2,
			                states: {
			                    hover: {
			                        enabled: true   
			                    }
			                }
			            }
			        }
			    },
			    series: [{
			    	name: 'Base Line',
			    	color: '#8ff274',
			        data: BL_points.reverse(),
			        pointStart: Date.UTC(yyyy, mm, dd),
			        pointInterval: 24 * 3600 * 1000 // one day
			    },{
			    	name: 'Lower Performance',
			    	color: '#f27a3a',
			        data: LP_points.reverse(),
			        pointStart: Date.UTC(yyyy, mm, dd),
			        pointInterval: 24 * 3600 * 1000 // one day
			    },
			    {
			    	name: 'Breach',
			    	color: '#ef454b',
			        data: B_points.reverse(),
			        pointStart: Date.UTC(yyyy, mm, dd),
			        pointInterval: 24 * 3600 * 1000 // one day
			    }
			    ]
			});
		}
	//Previous week total points table call	
	function weekScore(){

		
		$.ajax({
				
				type : "post",
				url : path + "/Fetching_Weekly_Score",
				async : false,
				data:{},
				success : function(data) {
					var obj = JSON.parse(data);
					score_table(obj);
				},
				error : function(xhr, errorType, exception) {
					alert("Error :"+xhr.status);
					
				},
				complete : function() {}
			});
		return false;
}
	//Performanc and  points table call	
	function seriesTable(){
		$.ajax({
			type : "post",
			url : path + "/Fetching_series_table",
			async : false,
			data:{},
			success : function(data) {
				var obj = JSON.parse(data);
				seriesTableFeed(obj);
			},
			error : function() {},
			complete : function() {}
		});
	return false;
	}
// page loader event
	document.onreadystatechange = function () {
		  var state = document.readyState;
		  if (state == 'interactive') {
		       $("#main_content2").hide();
		  } else if (state == 'complete') {
		      setTimeout(function(){
		         document.getElementById('interactive');
		         $("#load").hide();
		         $("#main_content2").show();
		    },100);
		  }
		}
</script>