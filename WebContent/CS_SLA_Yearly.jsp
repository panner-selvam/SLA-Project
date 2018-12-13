<%@ include file="Main.jsp"%>
<script src="<%=request.getContextPath()%>/js/highchart/highcharts.js"></script>
<script src="js/datepicker.js"></script> 
<script src="js/bootbox.min.js"></script> 
</head>
<style>
.datepicker-dropdown {  
  	bottom: 0;			
  	left: 0;
}
.datepicker{
	height:235px !important;
}
.datepicker-years{
	width:214px;
	height:235px !important;
}
.datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-bottom{
	position :fixed;
	top: 262px;
	left: 40px;
	display: block;
	width: 220px;
	height: 220px;	

}
.datepicker {
	height: 240px !important;
}

</style>

<div class="main_content">

	
	<div id="jCrumbs" class="breadCrumb module">
		<div style="overflow: hidden; position: relative; width: 1065px;">
			<div>
				<ul style="width: 5006px;">
					<li class="first"><a href="Dashboard.jsp"><i
							class="glyphicon glyphicon-home"></i></a></li>
					<li><a href="#">Report</a></li>
					<!-- 	<li><a href="#">2.3</a></li> -->
					<li class="last"><b>SLA Yearly Report</b></li>
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
						
						<div class="col-sm-3" style="padding-right: 0px">

							<label>Year</label>
							<div class="input-group" data-date-format="dd/mm/yyyy">
								<span class="input-group-addon"><i class="splashy-calendar_day"></i></span>
								<input  class="form-control" type="text"  id="yrpick" style="background-color:white" readonly />
							</div>
						</div>
						
						
						<div class="clearfix">
							<div class="col-sm-6  mt-1">
								<!--   <a href="#" class="btn btn-gebo pull-right btn-default">Send</a></div> -->
								<button class="btn btn-primary mr-1" value="Search" id="search"
									onClick="getsearch('search');">Search</button>
								
								<button class="btn btn-warning mr-1  " value="Clear" id="clear"
									onClick="getsearch('refresh');">Refresh</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
	<div id="container" style="min-width: 310px; height: 400px; max-width: 1200px; margin: 0 auto"></div>
		</div>
		
		<script>		
		var year='';
		$(document).ready(function () {
            
            $('#yrpick').datepicker({
                minViewMode: 'years',
                autoclose: true,
                 format: 'yyyy',
                 endDate: "today"
            });
            $('#yrpick').datepicker().datepicker('setDate', 'y');
            year=$("#yrpick").val();
            thisYear();
        });
		
		function getsearch(val){
			
			if(val=='search'){
				year=$("#yrpick").val();
				ajaxCall();
				
			}
			else if(val=="refresh"){
				location.reload(true);
			}
			
		}
		function thisYear(){
			ajaxCall();			
		}
		
		function ajaxCall(){
			$.ajax({
				type : "post",
				url : path + "/Fetching_yearly_chart_value",
				async : false,
				data:{year:year},
				success : function(data){
						var obj = JSON.parse(data);
						if(obj.No_record_month=='12'){
							$('#container').hide();
							bootbox.alert("No Records for this Year");
						}
						else{
							$('#container').show();
							drawchart(obj);		
						}													
				},
					error : function(xhr, ajaxOptions, thrownError) {
						bootbox.alert("err"+xhr);},
					complete : function() {}
			});
			return false;
		}
		function drawchart(obj){
			var points1 =[],points2 =[],points3 =[],points4 =[],points5 =[],module=[];
			if(obj!=null){
				$.each(obj[0],function(key,data){					 
					 	points1.push([parseFloat(data.module_1)]);				 
				});
				$.each(obj[1],function(key,data){					 
				 	points2.push([parseFloat(data.module_2)]);				 
				});
				$.each(obj[2],function(key,data){					 
					 	points3.push([parseFloat(data.module_3)]);				 
				});
				$.each(obj[3],function(key,data){					 
					 	points4.push([parseFloat(data.module_4)]);				 
				});
				$.each(obj[4],function(key,data){					 
					 	points5.push([parseFloat(data.module_5)]);				 
				});
				$.each(obj[5],function(key,data){
					var count=1;
					module.push(data.module_1);
				 	module.push(data.module_2);
					module.push(data.module_3);
					module.push(data.module_4);
					module.push(data.module_5); 
				});
			}
			
			var chart = Highcharts.chart('container', {

			  title: {
			    text: 'Yearly Chart'
			  },

			  subtitle: {
			    text: ''
			  },

			  xAxis: {
			    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
			  },
			  yAxis: {
				 title: {
					    text: 'Points'
					  },
			   },

			  series: [{
			    name: module[0],
			    type: 'column',
			    colorByPoint: false,
			    color: "#e55b4b",
			    data: points1,
			    showInLegend: true
			  },
			  {
			    name: module[1],
			    type: 'column',
			    colorByPoint: false,
			    color: "#eae254",
			    data: points2,
			    showInLegend: true
			  },
			  {
			    name: module[2],
			    type: 'column',
			    colorByPoint: false,
			    color: "#4be54d",
			    data: points3,
			    showInLegend: true
			  },
			  {
			    name: module[3],
			    type: 'column',
			    colorByPoint: false,
			    color: "#546dea",
			    data: points4,
			    showInLegend: true
			  },
			  {
			    name: module[4],
			    type: 'column',
			    colorByPoint: false,
			    color: "#e054ea",
			    data: points5,
			    showInLegend: true
			  }]

			});

		}

		</script>