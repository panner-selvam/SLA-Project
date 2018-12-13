<%@ include file="Main.jsp"%>
<%-- <script src="<%=request.getContextPath()%>/js/highchart/highcharts.js"></script>
<script src="<%=request.getContextPath()%>/js/highchart/highcharts-3d.js"></script>
<script src="<%=request.getContextPath()%>/js/highchart/ce_hc_exporting.js"></script>
<script src="<%=request.getContextPath()%>/js/highchart/ce_hc_exporting_offline.js"></script> --%>

<script src="<%=request.getContextPath()%>/js/highchart/highcharts.js"></script>
<script src="<%=request.getContextPath()%>/js/highchart/data.js"></script>
<script src="<%=request.getContextPath()%>/js/highchart/drilldown.js"></script>
<div class="main_content">

	<div class="breadCrumb module">
		<ul class="text-center">
			<li style="color: #0083bb;"><h4>
					<b>Today's</b>
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
					<li class="last"><b>SLA Matrix</b></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="container" style="min-width: 310px; height: 400px; max-width: 1200px; margin: 0 auto"></div>
		</div>
		
		<script>
		
		drawchart();

		function drawchart(){

				$(function () {
				    // Create the chart
				    $('#container').highcharts({
				         chart: {
				            type: 'bar',
				            options3d: {
				                enabled: true,
				                alpha: 45,
				                beta: 0
				            }
				        },
				        title: {
				            text: 'SLA Matrix'
				        },
				        subtitle: {
				          //  text: 'Click the slices to view versions. Source: netmarketshare.com.'
				        },
				        plotOptions: {
				            series: {
				                dataLabels: {
				                    enabled: true,
				                    format: '{point.name}: {point.y:.1f}%'
				                }
				            }
				        },

				        tooltip: {
				            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
				            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
				        },
				        series: [{
				            name: 'Performance Main Module',
				            colorByPoint: true,
				            data: [{
				                name: 'Microsoft Internet Explorer',
				                y: 56.33,
				                drilldown: 'Microsoft Internet Explorer'
				            }, {
				                name: 'Chrome',
				                y: 24.03,
				                drilldown: 'Chrome'
				            }, {
				                name: 'Firefox',
				                y: 10.38,
				                drilldown: 'Firefox'
				            }, {
				                name: 'Safari',
				                y: 4.77,
				                drilldown: 'Safari'
				            }, {
				                name: 'Opera',
				                y: 0.91,
				                drilldown: 'Opera'
				            }, {
				                name: 'Proprietary or Undetectable',
				                y: 0.2,
				                drilldown: null
				            }]
				        }],
				        drilldown: {
				            series: [{
				                name: 'Microsoft Internet Explorer',
				                id: 'Microsoft Internet Explorer',
				                data: [
				                    ['v11.0', 24.13],
				                    ['v8.0', 17.2],
				                    ['v9.0', 8.11],
				                    ['v10.0', 5.33],
				                    ['v6.0', 1.06],
				                    ['v7.0', 0.5]
				                ]
				            }, {
				                name: 'Chrome',
				                id: 'Chrome',
				                data: [
				                    ['v40.0', 5],
				                    ['v41.0', 4.32],
				                    ['v42.0', 3.68],
				                    ['v39.0', 2.96],
				                    ['v36.0', 2.53],
				                    ['v43.0', 1.45],
				                    ['v31.0', 1.24],
				                    ['v35.0', 0.85],
				                    ['v38.0', 0.6],
				                    ['v32.0', 0.55],
				                    ['v37.0', 0.38],
				                    ['v33.0', 0.19],
				                    ['v34.0', 0.14],
				                    ['v30.0', 0.14]
				                ]
				            }, {
				                name: 'Firefox',
				                id: 'Firefox',
				                data: [
				                    ['v35', 2.76],
				                    ['v36', 2.32],
				                    ['v37', 2.31],
				                    ['v34', 1.27],
				                    ['v38', 1.02],
				                    ['v31', 0.33],
				                    ['v33', 0.22],
				                    ['v32', 0.15]
				                ]
				            }, {
				                name: 'Safari',
				                id: 'Safari',
				                data: [
				                    ['v8.0', 2.56],
				                    ['v7.1', 0.77],
				                    ['v5.1', 0.42],
				                    ['v5.0', 0.3],
				                    ['v6.1', 0.29],
				                    ['v7.0', 0.26],
				                    ['v6.2', 0.17]
				                ]
				            }, {
				                name: 'Opera',
				                id: 'Opera',
				                data: [
				                    ['v12.x', 0.34],
				                    ['v28', 0.24],
				                    ['v27', 0.17],
				                    ['v29', 0.16]
				                ]
				            }]
				        }
				    });
				});
			}

		</script>