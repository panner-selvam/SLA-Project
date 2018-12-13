<%@ include file="Main.jsp"%>
<!-- test -->
	<script src="lib/list_js/list.min.js"></script>
    <script src="lib/list_js/plugins/paging/list.paging.min.js"></script>
 <script src="<%=request.getContextPath()%>/js/highchart/highcharts.js"></script>
<script src="<%=request.getContextPath()%>/js/highchart/highcharts-3d.js"></script>
<script src="<%=request.getContextPath()%>/js/highchart/ce_hc_exporting.js"></script>
<script src="<%=request.getContextPath()%>/js/highchart/ce_hc_exporting_offline.js"></script> 

<script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-Knob/1.2.13/jquery.knob.min.js"></script>
<style>
.tile_count{margin-bottom:20px;margin-top:20px}.tile_count .tile_stats_count{border-bottom:1px solid #D9DEE4;padding:0 10px 0 20px;position:relative}.tile_count .tile_stats_count:before{content:"";position:absolute;left:0;height:65px;border-left:2px solid #ADB2B5;margin-top:10px}@media (min-width:992px){footer{margin-left:230px}.tile_count .tile_stats_count{margin-bottom:10px;border-bottom:0;padding-bottom:10px}.tile_count .tile_stats_count:first-child:before{border-left:0}}.tile_count .tile_stats_count .count{font-size:30px;line-height:47px;font-weight:600}@media (min-width:768px){.tile_count .tile_stats_count .count{font-size:25px}}@media (min-width:992px) and (max-width:1100px){.tile_count .tile_stats_count .count{font-size:30px}}.tile_count .tile_stats_count span{font-size:12px}@media (min-width:768px){.tile_count .tile_stats_count span{font-size:13px}}.tile_count .tile_stats_count .count_bottom i{width:12px}.dashboard_graph{background:#fff;padding:7px 10px}.
</style>
<div class="main_content">

	<div class="breadCrumb module">
		<ul class="text-center">
			<li style="color: #0083bb;"><h4>
					<b>Dashboard</b>
				</h4></li>
		</ul>
	</div>

	<div class="row ">
	
	  
	  <div class="col-md-12">
	  <div class="col-md-4"><input type="text" class="dial" value="34"></div>
	    <div class="col-md-8">
	  <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
	  
	  </div>
	  <div class="col-md-4">
	  	<h3 class="heading">consolidated Current Status </h3>
	  <div class=" tile_count">
            <div class="col-md-6 col-sm-6 col-xs-12 tile_stats_count">
              <span class="count_top"><i class="fa fa-list"></i> Series 1</span>
              <div class="count">99.6%</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>4% </i> From last Week</span>
            </div>
            <div class="col-md-6 col-sm-6 col-xs-12 tile_stats_count">
              <span class="count_top"><i class="fa fa-list"></i> Series 2</span>
              <div class="count">98%</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>3% </i> From last Week</span>
            </div>
              <div class="tile_count">
            <div class="col-md-6 col-sm-6 col-xs-12 tile_stats_count">
              <span class="count_top"><i class="fa fa-list"></i>  Series 3</span>
              <div class="count">100%</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>4% </i> From last Week</span>
            </div>
            <div class="col-md-6 col-sm-6 col-xs-12 tile_stats_count">
              <span class="count_top"><i class="fa fa-list"></i> Series 4</span>
              <div class="count">96%</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>3% </i> From last Week</span>
            </div>
              <div class="tile_count">
            <div class="col-md-6 col-sm-6 col-xs-12 tile_stats_count">
              <span class="count_top"><i class="fa fa-list"></i> Series 5</span>
              <div class="count">98%</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>4% </i> From last Week</span>
            </div>
            <div class="col-md-6 col-sm-6 col-xs-12 tile_stats_count">
              <span class="count_top"><i class="fa fa-list"></i> Series 6</span>
              <div class="count">100%</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>3% </i> From last Week</span>
            </div>
              <div class="tile_count">
            <div class="col-md-6 col-sm-6 col-xs-12 tile_stats_count">
              <span class="count_top"><i class="fa fa-list"></i> Series 7</span>
              <div class="count">90%</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>4% </i> From last Week</span>
            </div>
            <div class="col-md-6 col-sm-6 col-xs-12 tile_stats_count">
              <span class="count_top"><i class="fa fa-list"></i> Series 8</span>
              <div class="count">96%</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>3% </i> From last Week</span>
            </div>
            </div>
          </div></div></div>
           
          </div>
          
          <!-- //2nd column -->
          
            <div class="col-sm-4 col-lg-6" id="user-list">
			<h3 class="heading">Series <small>last 24 hours</small></h3>
			<div class="row">
				<div class="col-lg-12">
					<div class="input-group input-group-sm sepH_b">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
						</span>
						<input class="user-list-search search form-control input-sm" placeholder="Search user" type="text">
					</div>
					<ul class="nav nav-pills line_sep">
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">Sort by <b class="caret"></b></a>
							<ul class="dropdown-menu sort-by">
								<li><a href="javascript:void(0)" class="sort" data-sort="sl_name">by name</a></li>
								<li><a href="javascript:void(0)" class="sort" data-sort="sl_status">by status</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">Show <b class="caret"></b></a>
							<ul class="dropdown-menu filter">
								<li class="active"><a href="javascript:void(0)" id="filter-none">All</a></li>
								<li><a href="javascript:void(0)" id="filter-online">Online</a></li>
								<li><a href="javascript:void(0)" id="filter-offline">Offline</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<ul class="list user_list">

                <li>
					<span class="label label-success pull-right sl_status">online</span>
					<a href="javascript:void(0)" class="sl_name">Series 1.8</a><br>
					
				</li>
				 <li>
					<span class="label label-success pull-right sl_status">online</span>
					<a href="javascript:void(0)" class="sl_name">Series 1.9</a><br>
					
				</li>
					<li>
					<span class="label label-success pull-right sl_status">online</span>
					<a href="javascript:void(0)" class="sl_name">Series 2</a><br>
					
				</li>
					<li>
					<span class="label label-success pull-right sl_status">online</span>
					<a href="javascript:void(0)" class="sl_name">Series 2.1</a><br>
					
				</li>
					<li>
					<span class="label label-success pull-right sl_status">online</span>
					<a href="javascript:void(0)" class="sl_name">Series 2.2</a><br>
					
				</li>
					<li>
					<span class="label label-danger pull-right sl_status">offline</span>
					<a href="javascript:void(0)" class="sl_name">Series 2.3</a><br>
					
				</li>
				<li>
					<span class="label label-danger pull-right sl_status">offline</span>
					<a href="javascript:void(0)" class="sl_name">Series 3</a><br>
					
				</li>
				<li>
					<span class="label label-danger pull-right sl_status">offline</span>
					<a href="javascript:void(0)" class="sl_name">Series 4</a><br>
					
				</li>
				<li>
					<span class="label label-danger pull-right sl_status">offline</span>
					<a href="javascript:void(0)" class="sl_name">Series 5</a><br>
					
				</li>
				<li>
					<span class="label label-success pull-right sl_status">online</span>
					<a href="javascript:void(0)" class="sl_name">Series 6</a><br>
					
				</li>
				<li>
					<span class="label label-danger pull-right sl_status">offline</span>
					<a href="javascript:void(0)" class="sl_name">Series 7</a><br>
					
				</li>
					<li>
					<span class="label label-danger pull-right sl_status">offline</span>
					<a href="javascript:void(0)" class="sl_name">Series 8</a><br>
					
				</li>
		
          </ul><ul class="pagination paging bottomPaging"></ul>
          </div> <!-- //2nd row -->
          
      <div class="col-md-6">
      	<div id="container1" style="min-width: 310px; height: 400px; max-width: 1200px; margin: 0 auto"></div>
      </div>
       <div class="col-md-12">
      	<div id="container2" style="min-width: 310px; height: 400px; max-width: 1200px; margin: 0 auto"></div>
      </div>
                    
          </div>
          </div>
		</div>
		<script>
		$(document).ready(function() {
			//* filterable list
			//* sortable/searchable list
		gebo_flist.init();
						
		});
		gebo_flist = {
				init: function(){
					//*typeahead
					var list_source = [];
					$('.user_list li').each(function(){
						var search_name = $(this).find('.sl_name').text();
						//var search_email = $(this).find('.sl_email').text();
						list_source.push(search_name);
					});
					$('.user-list-search').typeahead({local: list_source, limit:5});
					
					var options = {
							valueNames: [ 'sl_name', 'sl_status', 'sl_email' ],
							page: 8,
							plugins: [
								[ 'paging', {
									pagingClass	: "bottomPaging",
									innerWindow: 1,
									outerWindow: 2
								} ]
							]
						},
						userList = new List('user-list', options);
					
					$('#filter-online').on('click',function() {
						$('ul.filter li').removeClass('active');
						$(this).parent('li').addClass('active');
						userList.filter(function(item) {
							return item.values().sl_status == "online";
						});
						return false;
					});
					$('#filter-offline').on('click',function() {
						$('ul.filter li').removeClass('active');
						$(this).parent('li').addClass('active');
						userList.filter(function(item) {
							return item.values().sl_status == "offline";
						});
						return false;
					});
					$('#filter-none').on('click',function() {
						$('ul.filter li').removeClass('active');
						$(this).parent('li').addClass('active');
						userList.filter();
						return false;
					});
					
					$('#user-list').on('click','.sort',function(){
							$('.sort').parent('li').removeClass('active');
							if($(this).parent('li').hasClass('active')) {
								$(this).parent('li').removeClass('active');
							} else {
								$(this).parent('li').addClass('active');
							}
						}
					);
				}
			};

		Highcharts.chart('container', {
		    chart: {
		        type: 'area'
		    },
		    title: {
		        text: 'Consolidated Report'
		    },
		    subtitle: {
		       
		    },
		    xAxis: {
		        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'June', 'Jul'],
		        tickmarkPlacement: 'on',
		        title: {
		            enabled: false
		        }
		    },
		    yAxis: {
		        title: {
		            text: 'Average Points'
		        },
		        labels: {
		            formatter: function () {
		                return this.value / 1000;
		            }
		        }
		    },
		    tooltip: {
		        split: true,
		        valueSuffix: 'Avg Points'
		    },
		    plotOptions: {
		        area: {
		            stacking: 'normal',
		            lineColor: '#666666',
		            lineWidth: 1,
		            marker: {
		                lineWidth: 1,
		                lineColor: '#666666'
		            }
		        }
		    },
		    series: [{
		        name: 'Series 1',
		        data: [7, 9, 6, 0, 0, 9, 10]
		    }, {
		        name: 'Series 2',
		        data: [9, 10, 9, 10, 9, 10, 9]
		    }, {
		        name: 'Series 3',
		        data: [8, 10, 8, 10, 8, 10, 8]
		    }, {
		        name: 'Series 4',
		        data: [7, 10, 7, 10, 7, 10, 7]
		    }, {
		        name: 'Series 5',
		        data: [9, 7, 9, 7, 9, 7, 9]
		    }, {
		        name: 'Series 6',
		        data: [9, 3, 9, 3, 9, 3, 9]
		    }, {
		        name: 'Series 7',
		        data: [9, 6, 9, 6, 9, 6, 9]
		    }, {
		        name: 'Series 8',
		        data: [9, 8, 9, 8, 9, 8, 9]
		    }]
		});
		
		drawchart();

		function drawchart(){



			// Make monochrome colors
			var pieColors = (function () {
			    var colors = [],
			        base = Highcharts.getOptions().colors[0],
			        i;

			    for (i = 0; i < 10; i += 1) {
			        // Start out with a darkened base color (negative brighten), and end
			        // up with a much brighter color
			        colors.push(Highcharts.Color(base).brighten((i - 3) / 7).get());
			    }
			    return colors;
			}());

			// Build the chart
			Highcharts.chart('container1', {
			    chart: {
			        plotBackgroundColor: null,
			        plotBorderWidth: null,
			        plotShadow: false,
			        type: 'pie'
			    },
			    title: {
			        text: 'Consolidate Report'
			    },
			    tooltip: {
			        pointFormat: '{series.name}: <b>{point.percentage:.1f} %</b>'
			    },
			    plotOptions: {
			        pie: {
			            allowPointSelect: true,
			            cursor: 'pointer',
			            colors: pieColors,
			            dataLabels: {
			                enabled: true,
			              /*   format: '<b>{point.name}</b><br>{point.percentage:.0f} %',
			                distance: -50,
			                filter: {
			                    property: 'percentage',
			                    operator: '>',
			                    value: 4
			                } */
			            }
			        }
			    },
			    series: [{
			        name: 'Share',
			        data: [
			            { name: 'Series 1', y: 80 },
			            { name: 'Series 2', y: 90 },
			            { name: 'Series 3', y: 100 },
			            { name: 'Series 4', y: 96 },
			            { name: 'Series 5', y: 98 },
			            { name: 'Series 5', y: 100 }
			        ]
			    }]
			});			}

		Highcharts.chart('container2', {
		    chart: {
		        type: 'column'
		    },
		    title: {
		        text: 'Detailed Report'
		    },
		    xAxis: {
		        categories: ['Series 1', 'Series 2', 'Series 3', 'Series 4', 'Series 5']
		    },
		    yAxis: {
		        min: 0,
		        title: {
		            text: 'Avg Points'
		        },
		        stackLabels: {
		            enabled: true,
		            style: {
		                fontWeight: 'bold',
		                color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
		            }
		        }
		    },
		    legend: {
		        align: 'right',
		        x: -30,
		        verticalAlign: 'top',
		        y: 25,
		        floating: true,
		        backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
		        borderColor: '#CCC',
		        borderWidth: 1,
		        shadow: false
		    },
		    tooltip: {
		        headerFormat: '<b>{point.x}</b><br/>',
		        pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
		    },
		    plotOptions: {
		        column: {
		            stacking: 'normal',
		            dataLabels: {
		                enabled: true,
		                color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
		            }
		        }
		    },
		    series: [{
		        name: 'Points',
		        data: [8, 9, 7, 8, 9]
		    }, {
		        name: 'Points',
		        data: [8, 6, 8, 2, 1]
		    }, {
		        name: 'Points',
		        data: [9, 8, 4, 7, 8]
		    }]
		});
		
		
		$(document).ready(function (){
		    $('.dial').val(0).trigger('change').delay(20000);
		    var myColor = 'red';    
		    var myKnob = $(".dial").knob({
		        'min':0,
		        'max':100,
		        'readOnly': true,
		        'width': 120,
		        'height': 120,
		        'fgColor': myColor,
		        'dynamicDraw': true,
		        'thickness': 0.2,
		        'tickColorizeValues': true,
		        'skin':'tron'
		    })         
		    
		        var tmr = self.setInterval(function(){myDelay()},600);        
		        var m = 0;       
		        function myDelay(){
		            m += 10;
		            switch(m)
		            {
		            case 40:
		                  myColor = 'yellow';
		              break;
		            case 70:
		                  myColor = 'green';
		              break;                    
		            case 100:
		              window.clearInterval(tmr);
		              break;
		            }            
		            $('.dial').trigger('configure', {'fgColor':myColor}); 
		            $('.dial').val(m).trigger('change');
		        }    
		    });
		</script>