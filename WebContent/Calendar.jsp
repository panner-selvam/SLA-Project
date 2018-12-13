<%@ include file="Main.jsp"%>
    <!-- calendar -->
	<script src="lib/fullcalendar/fullcalendar.min.js"></script>
	<script src="lib/fullcalendar/gcal.js"></script>
   <!-- calendar -->
            <link rel="stylesheet" href="lib/fullcalendar/fullcalendar_gebo.css" />

<div class="main_content">
	<div id="jCrumbs" class="breadCrumb module">
		<div style="overflow: hidden; position: relative; width: 1065px;">
			<div>
				<ul style="width: 500px;">
					<li class="first"><a href="Dashboard.jsp"><i
							class="glyphicon glyphicon-home"></i></a></li>
					<li><a href="#">Calendar</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="w-box" id="w_sort01">
				<div class="w-box-header">Calendar</div>
				<div class="w-box-content cnt_a" style="height: 950px;">
					<div class="col-sm-3 mt-1" style="padding-right: 0px">
						<select id="monthsdrop" class=" col -md-2 form-control">
							<option id="01" value="0">January</option>
							<option id="02" value="1">February</option>
							<option id="03" value="2">March</option>
							<option id="04" value="3">April</option>
							<option id="05" value="4">May</option>
							<option id="06" value="5">June</option>
							<option id="07" value="6">July</option>
							<option id="08" value="7">August</option>
							<option id="09" value="8">September</option>
							<option id="10" value="9">October</option>
							<option id="11" value="10">November</option>
							<option id="12" value="11">December</option>
						</select>
					</div>
					<div class="col-sm-3 mt-1" style="padding-right: 0px">
						<select id="years" class="  col -md-2  form-control">
							<option value="2017">2017</option>
							<option value="2018">2018</option>
							<option value="2019">2019</option>
							<option value="2020">2020</option>
							<option value="2021">2021</option>
							<option value="2022">2022</option>
							<option value="2023">2023</option>
							<option value="2024">2024</option>
							<option value="2025">2025</option>
							<option value="2026">2026</option>
							<option value="2027">2027</option>
						</select>
					</div>
					<div class="clearfix">
						<div class="col-sm-6  mt-1">
							<button class="btn btn-primary mr-1" value="Search" id="search"
							onclick="changemonth();" >Search</button>
						<!-- 	<button class="btn btn-warning mr-1  " value="Clear" id="clear"
								onClick="getsearch('refresh');">Refresh</button> -->
						</div>
					</div>
			
			
	<div id="container"
		style="min-width: 310px; height: 400px; max-width: 1200px; margin: 0 auto">
		<div class="col-sm-12 col-md-12">
		<h2 class="heading" style="font-size:13px;font-weight:bold;">Consolidated Series Information</h2>
		<div id="events" class="fc fc-ltr"></div>
		</div>
	</div>
</div>
</div>	</div>
		</div>
	</div>
<script>
function goToMonth(month, year) {
	var date = new Date();
	var d = date.getDate();
	var m = month !== undefined ? parseInt(month, 0) : date.getMonth();
	var y = year !== undefined ? parseInt(year, 0) : date.getFullYear();
	return new Date(y, m, d);
}

function changemonth() {
	
	var e = document.getElementById("monthsdrop");
	var month1 = e.options[e.selectedIndex].id;
	var month2 = $("#monthsdrop").val();
	var year = $("#years").val();
	
	$('#events').fullCalendar('gotoDate', goToMonth(month2, year));
	$.ajax({
		type : 'POST',
	/* 	url : 'Calendar_result.jsp', */
		url :'<%=request.getContextPath()%>/Fetching_Calendar_List',
		data:{month:month1,year:year},
		dataType : 'json',
		success : function(data) {
				
				//alert(JSON.parse(data));
				$('#events').fullCalendar('removeEventSources');  
			 
			 
			    $('#events').fullCalendar('removeEvents', data);
			$('#events').fullCalendar('addEventSource', data);

			//alert(data);
		},
		error : function(errorThrown) {

		},
		complete : function() {

		}

	});
}

$(document)
		.ready(
				function() {
					var d = new Date();
					

					$("#years").val(d.getFullYear());
					//alert("calyr"+calyr);

					$("#monthsdrop").val(d.getMonth());
				//	changemonth();

					$('#events')
							.fullCalendar(
									{

										header : {
											left : 'prev,next today',
											center : 'title',

											right : 'month,agendaWeek,agendaDay,listMonth'

										},
										buttonText: {
											prev: '<i class="fa fa-chevron-left cal_prev" />',
											next: '<i class="fa fa-chevron-right cal_next" />'
										},
										//defaultDate: '2014-06-12',
										//defaultView: 'agendaDay',
										// defaultView: 'listMonth',
										//    listDayFormat: 'D MMMM YYYY',
										lang : 'en',
										eventLimit : true, // If you set a number it will hide the itens
										eventLimitText : "More", // Default is `more` (or "more" in the lang you pick in the option)
										/* dayClick: function() { 
										    alert('a day has been clicked!');
										}, */

										eventClick : function(event,
												jsEvent, view) {
										
										},

										dayClick : function(date, allDay,
												jsEvent, view) {

											if (allDay) {
												// Clicked on the entire day
												//   alert(date.toDate());
											}
										},
										eventMouseover : function(calEvent,
												jsEvent) {
											var tooltip = '<div class="tooltipevent" style="padding:5px;width:300px;height:auto;background:black;color:white;position:absolute;z-index:10001;"><b>Title</b>  - Points'
												+ '<br><b>Points</b> -'
													+ calEvent.points													
													+ '<br><b>Date</b> -'
													+ calEvent.start
													
													+ '</div>';
											var $tooltip = $(tooltip)
													.appendTo('body');

											$(this)
													.mouseover(
															function(e) {
																$(this)
																		.css(
																				'z-index',
																				10000);
																$tooltip
																		.fadeIn('500');
																$tooltip
																		.fadeTo(
																				'10',
																				1.9);
															})
													.mousemove(
															function(e) {
																$tooltip
																		.css(
																				'top',
																				e.pageY + 10);
																$tooltip
																		.css(
																				'left',
																				e.pageX + 20);
															});
										},

										eventMouseout : function(calEvent,
												jsEvent) {
											$(this).css('z-index', 8);
											$('.tooltipevent').remove();
										}
									});
					changemonth();

				});


</script>
