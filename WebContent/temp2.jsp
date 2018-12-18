
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.ResourceBundle"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>PIU</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- Page Meta -->
<!-- The page meta is used by search engines to provide useful information about the site -->
<meta name="description" content="PIU">
<meta name="keywords" content="PIU">
<meta name="author" content="PIU">
<!-- Viewport -->
<meta name="viewport"
	content="user-scalable=no, width=device-width, initial-scale=1, maximum-scale=1">


<!-- Icons -->
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/img/dashboard_logo.png" />
<!-- Application CSS -->
<link
	href="<%=request.getContextPath()%>/css/bootstrap/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/animate/animate.min.css"
	rel="stylesheet" type="text/css">
<link
	href="<%=request.getContextPath()%>/css/nanoscroller/nanoscroller.min.css"
	rel="stylesheet" type="text/css">
<link
	href="<%=request.getContextPath()%>/css/metis-menu/metis-menu.min.css"
	rel="stylesheet" type="text/css">
<link
	href="<%=request.getContextPath()%>/css/perfect-scrollbar/perfect-scrollbar.min.css"
	rel="stylesheet" type="text/css">
<link
	href="<%=request.getContextPath()%>/css/icons/pixeden-stroke-icons.min.css"
	rel="stylesheet" type="text/css">
<link
	href="<%=request.getContextPath()%>/css/icons/font-awesome-icons.min.css"
	rel="stylesheet" type="text/css">
<!-- Application Theme -->
<link
	href="<%=request.getContextPath()%>/css/application/application.min.css"
	rel="stylesheet" type="text/css">
<link
	href="<%=request.getContextPath()%>/css/datatables/datatables.min.css"
	rel="stylesheet" type="text/css">
<!-- Page Specific Links -->
<link href="<%=request.getContextPath()%>/css/loader.css"
	rel="stylesheet" type="text/css" />
<!-- Theme -->
<script src="<%=request.getContextPath()%>/js/themes/base.min.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/themes/volta.min.js"
	type="text/javascript"></script>
<!-- Document -->
<script src="<%=request.getContextPath()%>/js/jquery/jquery.min.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/tether/tether.min.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/moment/moment.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/js/bootstrap/bootstrap.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/js/validator/validator.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/js/perfect-scrollbar/perfect-scrollbar.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/js/datepicker/datepicker.min.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/cookie/cookie.min.js"
	type="text/javascript"></script>
<!-- Animations -->
<script src="<%=request.getContextPath()%>/js/gsap/tweenlite.min.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/gsap/plugins/css.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/js/gsap/easing/easepack.min.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/animus/animus.min.js"
	type="text/javascript"></script>
<!-- Notifications -->
<script src="<%=request.getContextPath()%>/js/gritter/gritter.min.js"
	type="text/javascript"></script>
<!-- Analytics -->
<!-- <script src="js/googleanalytics/googleanalytics.min.js" type="text/javascript"></script><script src="js/hotjar/hotjar.min.js" type="text/javascript"></script> -->
<!-- Sidebar -->
<script
	src="<%=request.getContextPath()%>/js/metis-menu/metis-menu.min.js"
	type="text/javascript"></script>
<!-- Application Components -->
<script
	src="<%=request.getContextPath()%>/js/application/components/morph-dropdown.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/js/application/components/navbar.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/js/application/components/panel.min.js"
	type="text/javascript"></script>
<!-- Allow Theme Cookies -->
<script src="<%=request.getContextPath()%>/js/themes/themeable.min.js"
	type="text/javascript"></script>
<!-- Application -->
<script
	src="<%=request.getContextPath()%>/js/application/application.min.js"
	type="text/javascript"></script>
<!-- Page Specific Scripts -->
<%-- <script src="<%=request.getContextPath()%>/js/sparkline/sparkline.min.js" type="text/javascript"></script>
		<script src="<%=request.getContextPath()%>/js/flot/jquery.flot.min.js" type="text/javascript"></script>
		<script src="<%=request.getContextPath()%>/js/application/views/charts/chart.min.js" type="text/javascript"></script>
		<script src="<%=request.getContextPath()%>/js/flot/jquery.flot.pie.min.js" type="text/javascript"></script>
		<script src="<%=request.getContextPath()%>/js/flot/jquery.flot.resize.min.js" type="text/javascript"></script>
		<script src="<%=request.getContextPath()%>/js/flot/jquery.flot.animator.min.js"
			type="text/javascript"></script>
 --%>
<%-- <script src="<%=request.getContextPath()%>/js/chart/chart.min.js" type="text/javascript"></script>
			<script src="<%=request.getContextPath()%>/js/application/views/charts/chart.min.js" type="text/javascript"></script>
			
		<script src="<%=request.getContextPath()%>/js/application/views/index.min.js" type="text/javascript"></script> --%>


<%-- <script src="<%=request.getContextPath()%>/js/dough.js"></script> --%>
<!-- Page Specific Scripts -->
<script
	src="<%=request.getContextPath()%>/js/datatables/datatables.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/js/application/views/tables/datatables.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/js/fullcalendar/fullcalendar.min.js"
	type="text/javascript"></script>
<%-- <script src="<%=request.getContextPath()%>/js/application/views/pages/calendar.min.js" type="text/javascript"></script> --%>

<!-- Notifications -->
<script src="<%=request.getContextPath()%>/js/gritter/gritter.min.js"
	type="text/javascript"></script>
<!-- Page Specific Scripts -->
<%-- <script src="<%=request.getContextPath()%>/js/application/views/ui/notifications.min.js" type="text/javascript"></script> --%>
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/js/Ticker/waitMe.min.css">
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/js/Ticker/waitMe.css">
<script src="<%=request.getContextPath()%>/js/Ticker/waitMe.js"></script>
<%-- 
<script src="<%=request.getContextPath()%>/js/jquery.elevateZoom-3.0.8.min.js"></script> --%>
<%-- <script src="<%=request.getContextPath()%>/js/dashboard.bundle.js" type="text/javascript"></script>  --%>

<style>
.morph-links.-small li {
	font-size: .8rem;
}

#scrtitle {
	font-family: monospace;
	Font-size: 46px;
	float: left;
	text-align: center;
	margin-left: 8%;
	text-transform: uppercase;
	font-weight: bold;
	display: none !important;
}

@media screen and (min-width: 1350px) {
	#scrtitle {
		display: block !important;
	}
}
</style>
</head>

<%
ResourceBundle resource = ResourceBundle.getBundle("commonvariables");
String weburl=resource.getString("weburl");
/* System.out.println(">>>weburl>>>"+getServletContext()
		.getRealPath("/")); */
String webcccurl=resource.getString("webcccurl");
String Admin_role=resource.getString("Admin_role");
String Cv_Single_admin_role=resource.getString("Cv_Single_admin_role");
String Cv_Operator_role=resource.getString("Cv_Operator_role");
String Cv_Approval_role=resource.getString("Cv_Approval_role");
String Cv_Station_role=resource.getString("Cv_Station_role");
String Cv_Zone_role=resource.getString("Cv_Zone_role");
String Cv_Region_role=resource.getString("Cv_Region_role");



String CE_Admin_role=resource.getString("CE_Admin_role");
String CE_Policestation_role=resource.getString("CE_Policestation_role");
String CE_Approval_role=resource.getString("CE_Approval_role");
String CE_Operator_role=resource.getString("CE_Operator_role");
String SS_Admin_role=resource.getString("SS_Admin_role");
%>
<%
	session = request.getSession();

	String session_uOfficername = "",session_policestation="",img="";
	String session_Reg_Id="",session_Zone_Id="",session_Ps_Id="",session_userkey="",session_role="",session_urank="",ses_mobileno="";
	
	try {
		img=session.getAttribute("images").toString();
		session_uOfficername = session.getAttribute("session_uOfficername").toString();
		session_policestation = session.getAttribute("session_policestation").toString();
		session_Reg_Id = session.getAttribute("session_Reg_Id").toString();
		session_Zone_Id = session.getAttribute("session_Zone_Id").toString();
		session_Ps_Id = session.getAttribute("session_Ps_Id").toString();
		session_userkey =session.getAttribute("session_userkey").toString();
		session_role=session.getAttribute("session_role").toString();
		session_urank=session.getAttribute("session_urank").toString();
		ses_mobileno=session.getAttribute("session_mobileno").toString();
		
	} catch (Exception e) {
		session_uOfficername = "NO";
%>
<script type="text/javascript">

 var username = '<%=session_uOfficername%>';
//alert("Sorry,your session timed out after a long time of inactivity.Please,click OK and sign in again.");

/* $(
"#maindb_myModalLabel2")
.html(
		"Sorry,your session timed out after a long time of inactivity.Please,click OK and sign in again.");
$(
'#maindb_myModal2')
.modal(
		'show');
 */

	if (username == "NO")
		<%-- document.location.href = "<%=request.getContextPath()%>/Sessionterminate"; --%>
		 document.location.href = "<%=request.getContextPath()%>/Login.jsp"; 
</script>
<%
	}
	%>


<script>
function getsignout(){
	document.location.href = "<%=request.getContextPath()%>/Sessionterminate";
	}
<%-- $(document).ready(function() {
$.dough("doughempid", '<%=session_userkey%>');
$.dough("doughusename", '<%=session_uOfficername%>');

	}); --%>
	/* function getclsdb(){
		$(
		'#maindb_myModal2')
		.modal(
				'show');
	} */
	
	
	
	$(window).on("load", function() {
		  var e;
		  e = $(".loader-wrapper"), TweenLite.to(e, .5, {
		   opacity: 0,
		   onComplete: function() {
		    e.remove()
		   }
		  })
		 })
</script>


<body data-themeable="true">
	<div class="loader-wrapper">
		<div class="loader">
			<span class="loader-block"></span><span class="loader-block"></span><span
				class="loader-block"></span><span class="loader-block"></span><span
				class="loader-block"></span><span class="loader-block"></span><span
				class="loader-block"></span><span class="loader-block"></span><span
				class="loader-block"></span><span class="loader-block"></span><span
				class="loader-block"></span><span class="loader-block"></span><span
				class="loader-block"></span><span class="loader-block"></span><span
				class="loader-block"></span><span class="loader-block"></span>
		</div>
	</div>
	<!-- Navbar -->
	<div class="navbar -dark -fixed-top -has-5-items">
		<div class="navbar-wrapper">
			<a class="navbar-brand"
				href="<%=request.getContextPath()%>/Dashboard.jsp"><span
				class="hidden-sm-up"><img
					src="<%=request.getContextPath()%>/img/PIU-logo.png"
					style="height: 40px;"></span><span class="hidden-xs-down"> <img
					src="<%=request.getContextPath()%>/img/PIU-logo.png"
					style="height: 60px;">
			</span></a> <span id="scrtitle">Mumbai City Surveillance </span>
			<%-- <a class="navbar-brand"
				href="<%=request.getContextPath()%>/Login.jsp"><span class="hidden-sm-up">
					
					<div style="font-family:MyFont1;Font-size: 46px;width: 26px;height: 19px;float:left;">
   PIU
</div>

<div style="width: 61px;height: 54px;clear:both;float:left;font-size: 5px;/* margin-bottom: 11px; */">
  Picture Intelligent Unit
</div>
					</span>
					
					<span class="hidden-xs-down"> 
					

<div style="font-family:MyFont1;Font-size: 78px;width: 251px;height: 25px;float:left;">
   PIU
</div>

<div style="width: 267px;height: 38px;clear:both;float:left;font-size: 8px;/* margin-bottom: 11px; */">
  Picture Intelligent Unit
</div>
					<!-- <span><sub style="font-size:10px;font-family:none;height:10px;float:left;">Mumbai City Surveillance</sub> 
					<span style="font-family:MyFont1;Font-size:60px;">PIU</span></span> -->
					
			</span>
					</a> --%>
			<!-- <a class="navbar-brand" href="index.html"><span
				class="hidden-sm-up" >MCS</span><span class="hidden-xs-down">Mumbai City Surveillance</span></a> -->
			<ul class="navbar-nav -right">
				<li onClick="getnotify();" onmouseover="getnotify();"><a
					class="has-morph-dropdown" href="#notifications-dropdown"> <i
						class="pe pe-bell"></i> <span class="navbar-item-count"
						id="bell_cnt"></span></a></li>
				<li><a class="has-morph-dropdown" href="#applications-dropdown">
						<i class="pe pe-keypad"></i>
				</a></li>
				<li class="navbar-profile" style="cursor: pointer;"><a
					class="has-morph-dropdown" href="#profile-dropdown"> <i
						class="pe pe-user"></i>
				</a></li>
				<li id="right-sidebar-toggle" onClick="getnotify1();"><a
					onClick="getnotify1();"> <i class="pe pe-edit -rotate-90"></i>
				</a></li>

			</ul>
			<div class="morph-dropdown-wrapper -dark -right">
				<div class="morph-dropdown-list -links">
					<div class="morph-dropdown" id="notifications-dropdown">
						<div class="morph-content">
							<h3>Notifications</h3>
							<p id="msg_noti" class="_text-muted"></p>
							<!-- <div  class="morph-links -small" id="notification"></div> -->
							<div id="btn_notify">
								<ul class="morph-links -small" id="notification">
									<%-- <li><a href="#"> <!-- Image --> <img
										src="<%=request.getContextPath()%>/img/users/male3.jpg"> <strong>John Doe</strong> has
										accepted your team invitation.<small>Just Now</small></a></li>
								<li><a href="#"> <!-- Image --> <img
										src="<%=request.getContextPath()%>/img/users/female1.jpg"> <strong>Gabriella
											Cruz</strong> has invited you to her event.<small>12 Hours Ago</small></a></li>
								<li><a href="#"> <!-- Image --> <img
										src="<%=request.getContextPath()%>/img/users/female2.jpg"> <strong>Sofia
											Owens</strong> has started following you.<small>1 Day Ago</small></a></li> --%>
								</ul>
								<div class="_margin-top-1x">
									<a class="btn -primary -block"
										href="<%=request.getContextPath()%>/pages/Notification.jsp">View
										All Notifications</a>
								</div>
							</div>
						</div>
					</div>
					<div class="morph-dropdown" id="applications-dropdown">
						<div class="morph-content -gallery">
							<h3>Applications</h3>

							<ul class="morph-gallery ps-container ps-theme-default"
								data-ps-id="159bcae2-7d5f-f714-da49-9b3770879429">
								<li><a href="<%=request.getContextPath()%>/Dashboard.jsp">
										<!-- <i class="fa fa-users"></i> --> <i> <img
											src="<%=request.getContextPath()%>/img/dashboard.png"
											style="width: 20px; height: 20px;"></i> Dashboard
								</a></li>



							<%-- 	<li><a
									href="<%=request.getContextPath()%>/pages/PIU_ANPR.jsp">
										<!-- <i class="pe pe-graph2"></i> --> <i> <img
											src="<%=request.getContextPath()%>/img/anpr.png"
											style="width: 20px; height: 20px;"></i> ANPR
								</a></li> --%>
								<li><a
									href="<%=request.getContextPath()%>/pages/Map_Sample.jsp">
										<i class="pe pe-map-marker" style="height: 20px;"></i> Map
								</a></li>
								<li><a
									href="<%=request.getContextPath()%>/pages/Calendar.jsp"
									rel="nofollow"> <!-- <i class="pe pe pe-date"></i> --> <i>
											<img src="<%=request.getContextPath()%>/img/calendar.png"
											style="width: 20px; height: 20px;">
									</i> Calendar
								</a></li>
							<%-- 	<li><a
									href="<%=request.getContextPath()%>/pages/CAIS_CCTNS_Prison.jsp">
										<i class="fa fa-search"></i> Smart Matching
								</a></li> --%>

							<%-- 	<li><a
									href="<%=request.getContextPath()%>/pages/PIU_RequestList_New.jsp">
										<!-- <i class="pe  pe-note"></i> --> <i><img
											src="<%=request.getContextPath()%>/img/fr-request.png"
											style="width: 20px; height: 20px;"></i> Suspect Search
								</a></li>--%>
								<li><a
									href="<%=request.getContextPath()%>/Vahan_service_down.jsp"
									rel="nofollow"> <!-- <i class="fa fa-motorcycle"></i> --> <i>
											<img src="<%=request.getContextPath()%>/img/vahan.png"
											style="width: 20px; height: 20px;">
									</i> Vahan Vivaran
								</a></li> 

								<%-- <li><a href="<%=request.getContextPath()%>/PIU_NamewisenewReport.jsp" 
									rel="nofollow"> <!-- <i class="pe pe-portfolio"></i> -->
									 <i><img src="<%=request.getContextPath()%>/img/audit-trail.png" style="width:20px;height:20px;"></i>
									 Audit Trail
								</a></li> --%>
								<%-- 	<li><a
									href="<%=request.getContextPath()%>/pages/PIU_Police_Enroll_List.jsp"
									rel="nofollow"> <!-- <i class="pe  pe-note"></i> --> <i><img
											src="<%=request.getContextPath()%>/img/suspect-database.png"
											style="width: 20px; height: 20px;"></i> Suspect Database
								</a></li> --%>
								<div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 0px;">
									<div class="ps-scrollbar-x" tabindex="0"
										style="left: 0px; width: 0px;"></div>
								</div>
								<div class="ps-scrollbar-y-rail" style="top: 0px; right: 0px;">
									<div class="ps-scrollbar-y" tabindex="0"
										style="top: 0px; height: 0px;"></div>
								</div>
							</ul>
							<div class="_margin-top-1x">
								<!-- <a class="btn -primary -block">View All Applications</a> -->
							</div>
						</div>
					</div>
					<div class="morph-dropdown" id="profile-dropdown">
						<div class="morph-content -links">
							<div class="morph-profile">
								<!-- Image -->
								<img src="<%=img%>">
								<h4><%=session_uOfficername%></h4>

								<p><%=session_role%>(<%=session_policestation%>)
								</p>

							</div>
							<ul class="morph-links">
								<li><a onclick="getsubprofView('<%=session_userkey%>');"
									style="cursor: pointer;">My Profile</a></li>
								<!-- <li><a href="#">Account Settings</a></li> -->
							</ul>
							<div class="_margin-top-1x">
								<a class="btn -primary -block" onClick="getsignout();">Sign
									Out</a>
							</div>
						</div>
					</div>




				</div>
			</div>
		</div>
	</div>
	<!-- /Navbar -->
	<!-- Left Sidebar -->
	<div class="sidebar -dark -left -collapsible" id="sidebar">
		<div class="nano">
			<div class="nano-content">
				<div class="sidebar-wrapper">
					<ul class="sidebar-menu metismenu">
						<!--   <li class="sidebar-heading">Main</li> -->


						<%if(session_role.equals(CE_Admin_role) || session_role.equals(CE_Policestation_role) ||   session_role.equals(CE_Approval_role) || session_role.equals(CE_Operator_role) ||  session_role.equals(SS_Admin_role)){ %>

						<!-- CE Admin  -->
						<%if(session_role.equals(CE_Admin_role)){ %>

						<%} %>
						<!-- CE Police Station  -->
						<%if(session_role.equals(CE_Policestation_role)){ %>

						<%} %>
						<!-- CE Approval  -->
						<%if(session_role.equals(CE_Approval_role)){ %>

						<%} %>
						<!-- CE PIU Operator  -->
						<%if(session_role.equals(CE_Operator_role)){ %>

						<%} %>
						<!-- SS Admin  -->

						<%if(session_role.equals(SS_Admin_role)){ %>

						<%} %>

						<%}else{ }%>



						<li id="menu_dash" class=""><a
							href="<%=request.getContextPath()%>/Dashboard.jsp"> <!-- <i 	class="pe pe-home"></i> -->
								<i> <img
									src="<%=request.getContextPath()%>/img/dashboard.png"
									style="width: 20px; height: 20px;">
							</i> <span>Dashboard</span></a></li>

						<%-- <li id="menu_map" class=""><a
							href="<%=request.getContextPath()%>/pages/Integrating_map.jsp">
								<i class="pe pe-map-marker"></i> <span>Map</span>
						</a></li> --%>
<%if(!session_role.equals(SS_Admin_role)){ %>


						<li id="menu_map" class=""><a
							href="<%=request.getContextPath()%>/pages/Map_Sample.jsp"> <i
								class="pe pe-map-marker"></i> <span>Map</span>
						</a></li>
						<li style="padding: 1rem; font-size: .9rem; color: #fff;">
							Clip Export Statistics</li>

						<li id="menu_CE_regionwise" class=""><a
							href="<%=request.getContextPath()%>/pages/CW_Region_wise.jsp">
								<i class="fa fa-bar-chart-o"></i> <span>Region</span>
						</a></li>
						<li id="menu_CE_zonewise" class=""><a
							href="<%=request.getContextPath()%>/pages/CW_Zone_wise.jsp">
								<i class="fa fa-bar-chart"></i> <span>Zone</span>
						</a></li>
						<li id="menu_CE_pswise" class=""><a
							href="<%=request.getContextPath()%>/pages/CW_Station_wise.jsp">
								<i class="fa fa-bar-chart"></i> <span>Police Station</span>
						</a></li>


						<li style="padding: 1rem; font-size: .9rem; color: #fff;">
							Clip Export-Incidents Statistics</li>
						<li id="menu_incident_region" class=""><a
							href="<%=request.getContextPath()%>/pages/Incident_Region.jsp">
								<i class="fa fa-server"></i> <span>All Region</span>
						</a></li>
						<li id="menu_incident_cregion" class=""><a
							href="<%=request.getContextPath()%>/pages/Incident_cregion.jsp">
								<i class="fa fa-server"></i> <span>Central</span>
						</a></li>
						<li id="menu_incident_eregion" class=""><a
							href="<%=request.getContextPath()%>/pages/Incident_eregion.jsp">
								<i class="fa fa-server"></i> <span>East</span>
						</a></li>
						<li id="menu_incident_nregion" class=""><a
							href="<%=request.getContextPath()%>/pages/Incident_nregion.jsp">
								<i class="fa fa-server"></i> <span>North</span>
						</a></li>
						<li id="menu_incident_wregion" class=""><a
							href="<%=request.getContextPath()%>/pages/Incident_wregion.jsp">
								<i class="fa fa-server"></i> <span>West</span>
						</a></li>
						<li id="menu_incident_sregion" class=""><a
							href="<%=request.getContextPath()%>/pages/Incident_sregion.jsp">
								<i class="fa fa-server"></i> <span>South</span>
						</a></li>
						<li id="menu_incident_overall_sregion" class=""><a
							href="<%=request.getContextPath()%>/pages/Incident_overall_sregion.jsp">
								<i class="fa fa-server"></i> <span>Summary Region</span>
						</a></li>
						<li id="menu_incident_overall_Policestation" class=""><a
							href="<%=request.getContextPath()%>/pages/Incident_overall_sp.jsp">
								<i class="fa fa-server"></i> <span>Summary PS</span>
						</a></li>
						<li style="padding: 1rem; font-size: .9rem; color: #fff;">
							Incidents Statistics</li>
						<li id="menu_smc_incident" class=""><a
							href="<%=request.getContextPath()%>/pages/SMC_Incident_Chart.jsp">
								<i class="fa fa-line-chart"></i> <span>Analysis of SMC
									Incidents</span>
						</a></li>
						<li class="" id="menu_smc_incident_detail"><a
							href="<%=request.getContextPath()%>/pages/Incident_Information.jsp">
								<i class="fa fa-info"></i> <span>Incidents Info</span>
						</a></li>
						<li class="" id="menu_smc_incident_analysis"><a
							href="<%=request.getContextPath()%>/Report/PIU_Incident_Anlaysis.jsp">
								<i class="pe pe-graph2"></i> <span>Incidents List</span>
						</a></li>
						<li class="" id="menu_smc_incident_analysis1"><a
							href="<%=request.getContextPath()%>/Report/PIU_Incident_Status.jsp">
								<i class="fa fa-th-list"></i> <span>Incidents Status</span>
						</a></li>
						<li class="" id="menu_smc_incident_analysis2"><a
							href="<%=request.getContextPath()%>/Report/PIU_Incident_Chart.jsp">
								<i class="fa fa-bar-chart"></i> <span>Incidents Chart</span>
						</a></li>
						
						<%} %>
											<%if(!session_role.equals(CE_Admin_role) && !session_role.equals(CE_Policestation_role) &&   !session_role.equals(CE_Approval_role) && !session_role.equals(CE_Operator_role) ){ %>	
						
						<li style="padding: 1rem; font-size: .9rem; color: #fff;">
							Camera Statistics</li>

						<li class="" id="menu_smc_camera_analysis"><a
							href="<%=request.getContextPath()%>/Report/PIU_Camera_Anlaysis.jsp">
								<i class="fa fa-file-video-o"></i> <span> Average Report</span>
						</a></li>
						<li class="" id="menu_smc_camera_analysis1"><a
							href="<%=request.getContextPath()%>/Report/PIU_Camera_chart.jsp">
								<i class="fa fa-bar-chart"></i> <span> Camera Status
									Chart</span>
						</a></li>

						<li style="padding: 1rem; font-size: .9rem; color: #fff;">
							CCTNS - Statistics</li>


						<li class="" id="menu_chart_crime"><a href="#"> <i
								class="fa fa-area-chart"></i> <%-- <i>	<img src="<%=request.getContextPath()%>/img/suspect-database.png" style="width:20px;height:20px;"> </i> --%>
								<span>Crime Details</span> <span class="fa arrow"></span></a>
							<ul>
								<%-- 		<li class=""><a
									href="<%=request.getContextPath()%>/pages/Crime_details_cnt.jsp">
									Crime Details(Current Week Report)	 </a></li> --%>
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/Crime_details_wf.jsp">Crime
										Details with Filteration </a></li>

								<%-- 	<li class=""><a
									href="<%=request.getContextPath()%>/pages/Crime_details_pie.jsp">Pie Chart
										 </a></li>
								 --%>
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/Crime_details_trend.jsp">Crime
										Details (Weekly wise Report) </a></li>

							</ul></li>

						<li class="" id="menu_chart_arrest"><a href="#"> <i
								class="fa fa-bar-chart-o"></i> <span>Arrest Details</span> <span
								class="fa arrow"></span></a>
							<ul>
								<%-- 	<li class=""><a
									href="<%=request.getContextPath()%>/pages/Arrest_details_cnt.jsp">
									Arrest Details	(Current Week Report) </a></li> --%>
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/Age_wise_Chart.jsp">


										<span>Age Wise Chart</span>
								</a></li>
								<%-- <li class=""><a
									href="<%=request.getContextPath()%>/pages/Arrest_details_wf.jsp">Arrest Details with Filteration
										 </a></li>
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/Arrest_details_pie.jsp">Pie Chart
										 </a></li>
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/Arrest_details_trend.jsp">Arrest Trend Chart
										 </a></li>		 --%>

							</ul></li>








						<li style="padding: 1rem; font-size: .9rem; color: #fff;">
							Smart Searching</li>


						<li class="" id="menu_combine_info"><a href="#"> <i
								class="fa fa-search"></i> <span>Smart Matching</span> <span
								class="fa arrow"></span></a>
							<ul>
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/CAIS_CCTNS.jsp">
										CAIS with CCTNS </a></li>
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/CCTNS_Prison.jsp">
										CCTNS with Prison </a></li>
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/Prison_CAIS.jsp">Prison
										with CAIS </a></li>
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/CAIS_CCTNS_Prison.jsp">CAIS
										with CCTNS and PRISON </a></li>
							</ul></li>










						<li id="menu_cal" class=""><a
							href="<%=request.getContextPath()%>/pages/Calendar.jsp"> <!-- <i	class="pe pe-date"></i> -->
								<i> <img
									src="<%=request.getContextPath()%>/img/calendar.png"
									style="width: 20px; height: 20px;">
							</i> <span>Calendar</span> <!-- <span
								class="tag -dark">4</span> --></a></li>

						<li style="padding: 1rem; font-size: .9rem; color: #fff;">
							Suspect Info</li>





						<!-- <li class="sidebar-heading">Applications</li> -->

						<li class="" id="menu_sb"><a href="#"> <!-- <i class="pe pe-users"></i> -->
								<i> <img
									src="<%=request.getContextPath()%>/img/suspect-database.png"
									style="width: 20px; height: 20px;">
							</i> <span>Suspect Database</span> <span class="fa arrow"></span></a>
							<ul>
								<%-- 	<li class=""><a
									href="<%=request.getContextPath()%>/pages/PIU_Police_Enroll_List.jsp">Police
								</a></li> --%>
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/PIU_CCTNS_Enroll_List.jsp">CAIS
								</a></li>
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/PIU_CCTNSNew_Enroll_List.jsp">CCTNS
								</a></li>
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/PIU_Missing_Person_Enroll_List.jsp">Missing
								</a></li>
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/PIU_Prison_Enroll_List.jsp">Prison
								</a></li>

								<li class=""><a
									href="<%=request.getContextPath()%>/pages/PIU_Stolen_Enroll_List.jsp">Stolen
								</a></li>



	<li class=""><a
									href="<%=request.getContextPath()%>/pages/PIU_Credit_Enroll_List.jsp">Credit Card Info
								</a></li>

	<li class=""><a
									href="<%=request.getContextPath()%>/pages/PIU_Telecom_Enroll_List.jsp">Telecom
								</a></li>



								<%-- 	<li class=""><a
									href="<%=request.getContextPath()%>/pages/PIU_Prison_Enroll_List.jsp">Prison
								</a></li>
								 --%>
								<%-- <li class=""><a
									href="<%=request.getContextPath()%>/pages/PIU_Passport_Enroll_List.jsp">Passport
								</a></li>
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/PIU_Sarathi_Enroll_List.jsp">RTO(Sarathi)
								</a></li>
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/PIU_Vahan_Enroll_List.jsp">RTO(Vahan)
								</a></li>
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/PIU_Vms_Enroll_List.jsp">Bank
								</a></li> --%>

								<%-- <li class=""><a
									href="<%=request.getContextPath()%>/pages/PIU_Visa_Enroll_List.jsp">Visa
								</a></li> --%>
							</ul></li>
							
<%} %>
						<%if(!session_role.equals("Administrator")){%>
						<%if(!session_role.equals(CE_Admin_role) && !session_role.equals(CE_Policestation_role) &&   !session_role.equals(CE_Approval_role) && !session_role.equals(CE_Operator_role)){ %>
						<li class="" id="menu_frr"><a href="#"> <!-- <i class=" pe pe-note"></i> -->
								<i> <img
									src="<%=request.getContextPath()%>/img/fr-request.png"
									style="width: 20px; height: 20px;">
							</i> <span>Suspect Search</span> <span class="fa arrow"></span></a>

							<ul>

								<li class=""><a
									href="<%=request.getContextPath()%>/pages/PIU_RequestForm_New.jsp">
										Search</a></li>
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/PIU_RequestList_New.jsp">
										Result</a></li>

								<li class=""><a
									href="<%=request.getContextPath()%>/pages/PIU_ManualRequestList_New.jsp"><span>
											PIU Response</span></a></li>

							</ul></li>

						<li class="" style="display: none;"><a href="#"> <i
								class="fa fa-camera-retro"></i><span>Live Alert</span> <span
								class="fa arrow"></span></a>

							<ul class="">
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/PIU_Police_Alarm_List.jsp">Request
										Form</a></li>
								<li class=""><a href="<%=weburl%>/LiveResponse.aspx">Response
										List</a></li>
								<%if(session_role.equals("Super Admin")){
						%>
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/PIU_ManualLiveList.jsp">Manual
										Live Response</a></li>
								<%} %>
							</ul></li>

<%} %>
<%if(!session_role.equals(SS_Admin_role)){ 

System.out.println("SS_Admin_role"+SS_Admin_role);
%>
						<li style="padding: 1rem; font-size: .9rem; color: #fff;">Clip
							Request</li>
						<li class="" id="menu_frs"><a href="#"> <!-- <i class="pe pe-video"></i> -->
								<i> <img
									src="<%=request.getContextPath()%>/img/fr-surveillance.png"
									style="width: 20px; height: 20px;">
							</i> <span>FR Surveillance</span> <span class="fa arrow"></span></a> <%if(session_role.equals(Cv_Station_role) || session_role.equals(Cv_Zone_role) || session_role.equals(Cv_Region_role) || session_role.equals(CE_Policestation_role)){ %>
							<ul class="">

								<li><a
									href="<%=request.getContextPath()%>/pages/PIU_Streaming.jsp">
										Search </a></li>
								<%-- <li class=""><a
									href="<%=request.getContextPath()%>/pages/Streaming_List.jsp">Result</a></li>
									
								 --%>
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/FRS_Result_Modern_search.jsp">Result</a></li>



							</ul> <%} %> <%-- <%if(session_role.equals("Zone User")){ %>
							<ul class="">

								<li><a
									href="<%=request.getContextPath()%>/pages/PIU_Zone_Streaming.jsp">
										Search </a></li>
								
								 <li class=""><a
									href="<%=request.getContextPath()%>/pages/FRS_Result_Zone_search.jsp">Result</a></li>
																		
																
									
							</ul> <%} %> --%> <%if(session_role.equals(Cv_Approval_role) || session_role.equals(CE_Approval_role)){ %>

							<ul class="">

								<li class=""><a
									href="<%=request.getContextPath()%>/pages/FRS_Result_Approval_search.jsp">
										Approval</a></li>



							</ul> <%} %> <%if(session_role.equals(Cv_Operator_role) || session_role.equals(CE_Operator_role)){%>
							<ul class="">



								<li class=""><a
									href="<%=request.getContextPath()%>/pages/FRS_Result_Update_search.jsp">
										Update</a></li>
							</ul> <%} %> <%if(session_role.equals(Admin_role) || (session_role.equals(CE_Admin_role))){ %>

							<ul class="">

								<li><a
									href="<%=request.getContextPath()%>/pages/PIU_Streaming.jsp">
										Search </a></li>

								<li class=""><a
									href="<%=request.getContextPath()%>/pages/FRS_Result_Modern_search.jsp">Result</a></li>
								<%-- <li><a
									href="<%=request.getContextPath()%>/pages/PIU_Zone_Streaming.jsp">
										Zone - Search </a></li>
								
								 <li class=""><a
									href="<%=request.getContextPath()%>/pages/FRS_Result_Zone_search.jsp">Zone - Result</a></li>
											
										 --%>
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/FRS_Result_Approval_search.jsp">
										Approval</a></li>
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/FRS_Result_Update_search.jsp">
										Update</a></li>
							</ul> <%} %></li>
						
						
						
						
						<%if(!session_role.equals(Cv_Single_admin_role)){ %>
						<li id="menu_ce"><a href="#"> <!-- <i		class="fa fa-file-movie-o"></i> -->
								<i> <img
									src="<%=request.getContextPath()%>/img/clip-export.png"
									style="width: 20px; height: 20px;">
							</i> <span>Clip Export</span><span class="fa arrow"></span></a>


							<ul class="">
								<%if(session_role.equals(Cv_Station_role) || session_role.equals(Cv_Zone_role)  || session_role.equals(Cv_Region_role) ||  session_role.equals(CE_Policestation_role)){ %>
								<li><a
									href="<%=request.getContextPath()%>/pages/Station_PIU_Streaming.jsp">
										Clip Request </a></li>
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/Clip_Result_Modern_search.jsp">Result</a></li>

								<%} %>
								<%-- <%if(session_role.equals("Zone User")){ %>
								<li><a
									href="<%=request.getContextPath()%>/pages/Station_PIU_Zone_Streaming.jsp">
										Clip Request </a></li>								
								 <li class=""><a
									href="<%=request.getContextPath()%>/pages/Clip_Result_Zone_search.jsp">Result</a></li>
																					
								
								<%} %> --%>
								<%if(session_role.equals(Cv_Approval_role) || session_role.equals(CE_Approval_role)){ %>
								<%-- <li class=""><a
									href="<%=request.getContextPath()%>/pages/Auth_Streaming_List.jsp">Clip
										- Approval</a></li> --%>
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/Clip_Result_Approval_search.jsp">Clip
										- Approval</a></li>


								<% } %>
								<%if(session_role.equals(Cv_Operator_role) || session_role.equals(CE_Operator_role)){%>
								<%-- <li class=""><a
									href="<%=request.getContextPath()%>/pages/Ctrl_Streaming_List.jsp">Clip
										Update</a></li> --%>
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/Clip_Result_Update_search.jsp">Clip
										Update</a></li>
								<%} %>
								<%if(session_role.equals(Admin_role) || session_role.equals(CE_Admin_role)){ %>
								<li><a
									href="<%=request.getContextPath()%>/pages/Station_PIU_Streaming.jsp">
										Clip Request </a></li>

								<li class=""><a
									href="<%=request.getContextPath()%>/pages/Clip_Result_Modern_search.jsp">Result</a></li>

								<%-- 	<li><a
									href="<%=request.getContextPath()%>/pages/Station_PIU_Zone_Streaming.jsp">
									Zone - Clip Request </a></li>								
								 <li class=""><a
									href="<%=request.getContextPath()%>/pages/Clip_Result_Zone_search.jsp">Zone - Result</a></li>
								 --%>

								<li class=""><a
									href="<%=request.getContextPath()%>/pages/Clip_Result_Approval_search.jsp">Clip
										- Approval</a></li>

								<li class=""><a
									href="<%=request.getContextPath()%>/pages/Clip_Result_Update_search.jsp">Clip
										Update</a></li>
								<%} %>
							</ul></li>




						<%} %>



						<li id="menu_ce_graph"><a href="#"> <i
								class="pe pe-graph"></i> <span>CE Graph</span><span
								class="fa arrow"></span></a>

							<ul class="">


								<li class=""><a
									href="<%=request.getContextPath()%>/CE_Graph/CE_Graph_Footage_wise.jsp">Footage
										Wise</a></li>

								<li class=""><a
									href="<%=request.getContextPath()%>/CE_Graph/CE_Graph_Footage_Specify_wise.jsp">Footage
										Specific status Wise</a></li>
								<li><a
									href="<%=request.getContextPath()%>/CE_Graph/CE_Graph_Ins_analysis.jsp">
										Incident Analysis</a></li>
								<li class=""><a
									href="<%=request.getContextPath()%>/CE_Graph/CE_Graph_Location_analysis_wise.jsp">Location
										wise analysis</a></li>

								<li class=""><a
									href="<%=request.getContextPath()%>/CE_Graph/CE_Graph_Monthly_wise.jsp">Monthly
										Wise</a></li>

								<li class=""><a
									href="<%=request.getContextPath()%>/CE_Graph/CE_Graph_Region_analysis_wise.jsp">Region
										wise analysis</a></li>


							</ul></li>



						<%if(!session_role.equals(Cv_Single_admin_role)){ %>


						<%-- <li id="menu_vahan"><a	href="<%=request.getContextPath()%>/Vahan.jsp"> --%>

						<li style="padding: 1rem; font-size: .9rem; color: #fff;">
							Vehicle Info</li>

						<li id="menu_vahan"><a
							href="<%=request.getContextPath()%>/Vahan_service_down.jsp">


								<!-- <i
								class="pe pe-bicycle"></i> --> <i> <img
									src="<%=request.getContextPath()%>/img/vahan.png"
									style="width: 20px; height: 20px;">
							</i> <span>Vahan Vivaran</span>
						</a></li>


						<%}%>
						<li class="" id="menu_anpr"><a href="#"> <!-- <i class="pe pe-graph2"></i> -->
								<i> <img src="<%=request.getContextPath()%>/img/anpr.png"
									style="width: 20px; height: 20px;">
							</i> <span>ANPR</span> <span class="fa arrow"></span></a>

							<ul class="">

								<%-- 			<li><a
									href="<%=request.getContextPath()%>/pages/PIU_ANPRForm.jsp">ANPR
										Form </a></li>

								<li><a
									href="<%=request.getContextPath()%>/pages/PIU_ANPRView.jsp">ANPR
										Data Synchronize </a></li>
								<li><a
									href="<%=request.getContextPath()%>/pages/PIU_ANPR.jsp">
										ANPR List </a></li> --%>
								<li><a
									href="<%=request.getContextPath()%>/pages/PIUNew_ANPR.jsp">
										ANPR Form </a></li>
								<li><a
									href="<%=request.getContextPath()%>/pages/PIUNew_ANPR_List.jsp">
										ANPR List </a></li>
								<li><a
									href="<%=request.getContextPath()%>/pages/ANPR_LPR_wise.jsp">
										LPR Status </a></li>

								<li><a
									href="<%=request.getContextPath()%>/pages/ANPR_Region_wise.jsp">
										Region Wise </a></li>

								<li><a
									href="<%=request.getContextPath()%>/pages/ANPR_Vehicle_wise.jsp">
										Vehicle Wise </a></li>
								<li><a
									href="<%=request.getContextPath()%>/pages/ANPR_against_Alarms_wise.jsp">
										ANPR Alarms </a></li>

								<li><a
									href="<%=request.getContextPath()%>/pages/ANPR_Month_Vehicle_wise.jsp">
										Month wise Vehicle Status </a></li>
								<li><a
									href="<%=request.getContextPath()%>/pages/ANPR_Month_Region_wise.jsp">
										Month wise Region Status </a></li>


							</ul></li>
							<%} %><%} %>
						<%if(session_role.equals(Cv_Single_admin_role)||  session_role.equals(Admin_role)){ %>


						<li style="padding: 1rem; font-size: .9rem; color: #fff;">
							Reports</li>
						<li class="" id="menu_audittrail"><a href="#"> <!-- <i class="pe pe-portfolio"></i> -->
								<i> <img
									src="<%=request.getContextPath()%>/img/audit-trail.png"
									style="width: 20px; height: 20px;">
							</i> <span>Audit Trail</span> <span class="fa arrow"></span></a>
							<ul class="">


								<%-- 	<li><a href="<%=weburl%>PIU_ReportNameWise.aspx">Name Wise</a></li>
								<li><a href="<%=weburl%>PIU_ReportDateWise.aspx">Date Wise</a></li>
								<li><a href="<%=weburl%>PIU_ReportInprocess.aspx">Pending Request
										List</a></li>
								<li><a href="<%=weburl%>PIU_ReportMatchFound.aspx">Match Found List</a></li>
								<li><a href="<%=weburl%>PIU_ReportMatchNotFound.aspx">Match
										NotFound List</a></li>
								<li><a href="<%=weburl%>PIU_ReportTag.aspx">Tag</a></li> --%>

								<li><a
									href="<%=request.getContextPath()%>/PIU_logReport.jsp">Log
										Report</a></li>
								<li><a
									href="<%=request.getContextPath()%>/PIU_DatewisenewReport.jsp">Suspect
										Search - Date Wise</a></li>

								<li><a
									href="<%=request.getContextPath()%>/PIU_matchfoundnewReport.jsp">Suspect
										Search - Match Found List</a></li>

								<li><a
									href="<%=request.getContextPath()%>/PIU_matchnotfoundnewReport.jsp">Suspect
										Search - Match NotFound List</a></li>
								<li><a
									href="<%=request.getContextPath()%>/PIU_NamewisenewReport.jsp">Suspect
										Search - Name Wise</a></li>

								<li><a
									href="<%=request.getContextPath()%>/PIU_InprocessnewReport.jsp">Suspect
										Search - Pending Request List</a></li>

								<li><a
									href="<%=request.getContextPath()%>/PIU_tagnewReport.jsp">Suspect
										Search - Tag</a></li>
								<li><a
									href="<%=request.getContextPath()%>/CE_Streaming_List.jsp">Clip
										Export</a></li>
								<li><a
									href="<%=request.getContextPath()%>/FRS_Streaming_List.jsp">FR
										Surveillance</a></li>





							</ul></li>

						<li class="" id="menu_data"><a href="#"> <i
								class="fa fa-database"></i> <span>Data</span> <span
								class="fa arrow"></span></a>
							<ul class="">

								<li><a
									href="<%=request.getContextPath()%>/Report/PIU_CCTNS_Log.jsp">CCTNS
								</a></li>
								<li><a
									href="<%=request.getContextPath()%>/Report/PIU_PRISON_Log.jsp">PRISON
								</a></li>
								<li><a
									href="<%=request.getContextPath()%>/Report/PIU_CAIS_Log.jsp">CAIS
								</a></li>

								<li><a
									href="<%=request.getContextPath()%>/Report/PIU_CSV_Log.jsp">CSV
								</a></li>


								<%-- 	<li><a
									href="<%=request.getContextPath()%>/pages/Under_Construction.jsp">CCTNS
								</a></li>
								<li><a
									href="<%=request.getContextPath()%>/pages/Under_Construction.jsp">PRISON
								</a></li>
								<li><a
									href="<%=request.getContextPath()%>/pages/Under_Construction.jsp">CAIS
								</a></li>
								
								<li><a
									href="<%=request.getContextPath()%>/pages/Under_Construction.jsp">CSV
								</a></li> --%>


							</ul></li>
						<li class="" id="menu_service"><a href="#"> <i
								class="fa fa-server"></i> <span>Service</span> <span
								class="fa arrow"></span></a>
							<ul class="">


								<li><a
									href="<%=request.getContextPath()%>/Report/PIU_Verient_Log.jsp">Camera
										Status </a></li>
								<%-- 	<li><a
									href="<%=request.getContextPath()%>/Report/PIU_Camera_onoff_Log.jsp">Camera Online/Offline
								</a></li> --%>
								<li><a
									href="<%=request.getContextPath()%>/Report/PIU_arrest_Log.jsp">CSV
										Info </a></li>
								<li><a
									href="<%=request.getContextPath()%>/Report/PIU_Groupdb2_Log.jsp">Group
										DB2 </a></li>


								<%--  <li><a
									href="<%=request.getContextPath()%>/pages/Under_Construction.jsp">Verint
								</a></li>
								<li><a
									href="<%=request.getContextPath()%>/pages/Under_Construction.jsp">Camera Online/Offline
								</a></li>
								<li><a
									href="<%=request.getContextPath()%>/pages/Under_Construction.jsp">Group DB2
								</a></li>
							 --%>


								<li><a
									href="<%=request.getContextPath()%>/Report/PIU_ANPR_Sync_Log.jsp">ANPR
										Synchronization </a></li>

							</ul></li>
						<%} %>
						<%if(session_role.equals(Cv_Single_admin_role)){
						%>
						<li class="" id="menu_master"><a href="#"> <!-- <i class="pe pe-plus"></i> -->
								<i> <img src="<%=request.getContextPath()%>/img/masters.png"
									style="width: 20px; height: 20px;">
							</i> <span>Masters</span> <span class="fa arrow"></span></a>
							<ul class="">


								<li><a
									href="<%=request.getContextPath()%>/pages/PIU_Master_User_List.jsp">
										User Information </a></li>
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/PIU_Master_Source.jsp">Source
										Information </a></li>
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/PIU_Master_Tags.jsp">Tags
										Information </a></li>
								<li><a
									href="<%=request.getContextPath()%>/pages/Master_region.jsp">Manage
										Region</a></li>
								<li><a
									href="<%=request.getContextPath()%>/pages/Master_zone.jsp">Manage
										Zone</a></li>
								<li><a
									href="<%=request.getContextPath()%>/pages/Master_station.jsp">Manage
										Police Station</a></li>
								<li><a
									href="<%=request.getContextPath()%>/pages/Master_location.jsp">Manage
										Location</a></li>
								<li><a
									href="<%=request.getContextPath()%>/pages/Master_camera.jsp">Manage
										Camera</a></li>
							</ul></li>

						<%
						}%>
						<%if(session_role.equals(Admin_role)){ %>
						<li class=""><a href="#"> <!-- <i class="pe pe-plus"></i> -->
								<i> <img src="<%=request.getContextPath()%>/img/masters.png"
									style="width: 20px; height: 20px;">
							</i> <span>Masters</span> <span class="fa arrow"></span></a>
							<ul class="">


								<li><a
									href="<%=request.getContextPath()%>/pages/PIU_Master_User_List.jsp">
										User Information </a></li>
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/PIU_Master_Source.jsp">Source
										Information </a></li>
								<li class=""><a
									href="<%=request.getContextPath()%>/pages/PIU_Master_Tags.jsp">Tags
										Information </a></li>
								<li><a
									href="<%=request.getContextPath()%>/pages/Master_region.jsp">Manage
										Region</a></li>
								<li><a
									href="<%=request.getContextPath()%>/pages/Master_zone.jsp">Manage
										Zone</a></li>
								<li><a
									href="<%=request.getContextPath()%>/pages/Master_station.jsp">Manage
										Police Station</a></li>
								<li><a
									href="<%=request.getContextPath()%>/pages/Master_location.jsp">Manage
										Location</a></li>
								<li><a
									href="<%=request.getContextPath()%>/pages/Master_camera.jsp">Manage
										Camera</a></li>
							</ul></li>

						<%
						 }%>






					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- /Left Sidebar -->
	<!-- Right Sidebar -->
	<div class="sidebar -dark -right -slideable">
		<ul class="sidebar-tabs">

			<li class="sidebar-tab" data-target="#tasks-tab" style="width: 100%;">Suspect
				Search - Tasks <a id="charrt_1"
				style="float: right; cursor: pointer;" onclick="getnotify1();">
					<i class="fa fa-refresh"></i>
			</a>
			</li>


		</ul>
		<div class="sidebar-wrapper nano">
			<div class="sidebar-content nano-content">

				<div class="sidebar-tab-content -active" id="tasks-tab">
					<div class="tasks-list sidebar-content-section form -dark">
						<h5>Completed</h5>
						<div id="comp_request"></div>
						<!-- Form Group -->
						<!-- 	<div class="form-group task">
							<div class="form-check -checkbox">
								<input class="form-check-input" id="task-checkbox-1" name="task"
									type="checkbox" checked="true"><label
									for="task-checkbox-1">Email pipeline results to Susie
									and Anna</label>
							</div>
						</div>
						/Form Group
						Form Group
						<div class="form-group task">
							<div class="form-check -checkbox">
								<input class="form-check-input" id="task-checkbox-2" name="task"
									type="checkbox" checked="true"><label
									for="task-checkbox-2">Respond to email from James at
									Palmer Tech</label>
							</div>
						</div>
						/Form Group
						Form Group
						<div class="form-group task">
							<div class="form-check -checkbox">
								<input class="form-check-input" id="task-checkbox-3" name="task"
									type="checkbox" checked="true"><label
									for="task-checkbox-3">Prepare presentation for tomorrow</label>
							</div>
						</div> -->
						<!-- /Form Group -->
						<h5>Pending</h5>
						<!-- Form Group -->
						<div id="Pending_request"></div>
						<!-- <div class="form-group task">							<div class="form-check -checkbox">								<input class="form-check-input" id="task-checkbox-5" name="task"									type="checkbox"><label for="task-checkbox-5">Finish									Development Report on Volta</label>							</div>						</div>	 -->
						<!-- /Form Group -->
						<!-- Form Group -->
						<!-- 	<div class="form-group task">
							<div class="form-check -checkbox">
								<input class="form-check-input" id="task-checkbox-6" name="task"
									type="checkbox"><label for="task-checkbox-6">Review
									coworker&#39;s front-end commit and fix problems</label>
							</div>
						</div> -->
						<!-- /Form Group -->

					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- /Right Sidebar -->
	<!-- /Right Sidebar -->
	<!-- Content -->
	<div class="content -dark -with-left-sidebar -collapsible"
		id="loadfull">

		<!-- /Content -->
		<!-- </body> -->
		<!-- <div class="modal animated -light in" id="maindb_myModal2">
	<div class="modal-dialog">
		<div class="modal-content -padded">
			<div class="modal-header" style="display:none;">
				<button class="modal-close" data-dismiss="modal">
					<i class="pe pe-close"></i>
				</button>
			</div>
			<div class="modal-body _text-center">
				<div class="modal-icon _text-success">
					<i class="fa fa-exclamation-circle"></i>
				</div>
				<h1 class="_margin-bottom-2x">Danger</h1>
				<p id="maindb_myModalLabel2"></p>
			</div>
			<div class="modal-footer _text-center">
				<a class="btn -primary -dark _margin-right-1x" onclick="getclsdb();">OK</a>
			</div>
		</div>
	</div>
</div>
 -->
		<script>
getnotify();
function getnotify1(){
	//alert("");
	$.ajax({
		url : '<%=request.getContextPath()%>/Fetch_Notification',
		type : 'POST',	
		success : function(data) {
			/* var stcnt="0";
			var stcnt1="0"; */
		//	alert(data);
			var str=data.split("^");
			
			if(data!=''){
				if(JSON.parse(str[0]).length>0){
			var dropstr = '';
			
			$
					.each(
							JSON.parse(str[0]),
							function(index, element) {
								
								dropstr=dropstr+'<div class="form-group task">							<div>								<label style="color: rgba(255,255,255,.5);    text-decoration: line-through;cursor: pointer;" onClick="getimgView_rs(\''+element.RequestId+'\');">'+element.RequestId+'_'+element.reqName+'_'+element.Policestation+' Station</label>							</div>						</div>	';
								
							});
					
				}
				else{
					var dropstr = 'No data Found';
				}

				if(JSON.parse(str[1]).length>0){
					var dropstr1 = '';
					
					$
							.each(
									JSON.parse(str[1]),
									function(index, element) {
										
										dropstr1=dropstr1+'<div class="form-group task">							<div>								<input class="form-check-input" id="task-checkbox-'+element.id+'"   name="task"				style="display:none;"					type="checkbox"><label style="cursor: pointer;" onClick="getimgView_rs(\''+element.RequestId+'\');">'+element.RequestId+'_'+element.reqName+'_'+element.Policestation+'</label>							</div>						</div>	';
										
									});
													}else{
														var dropstr1 = 'No data Found';
													}
					
				//$("#bell_cnt").html(stcnt);
			}else{
				var dropstr1 = 'No data Found';
				var dropstr = 'No data Found';
			}
				$("#Pending_request").html(dropstr1);
				$("#comp_request").html(dropstr);
				
				},
				error : function(e) {

				},
				complete : function() {

				}
			});
		}
//getnotify();
/* function explode(){
	 // alert("Boom!");
	}
	setTimeout(getnotifyminipop, 12000); */
	getnotifyminipop();
	function getnotifyminipop(){
		
		$.ajax({
			url : '<%=request.getContextPath()%>/Fetch_all_subpopnotification',
			type : 'POST',
				success : function(data) {
			//	alert(data);
				
			var stcnt="0";
			
			
				if(data!=''){
					if(JSON.parse(data).length>0){
					//	var dropstr = '';
						
						$
								.each(
										JSON.parse(data),
										function(index, element) {
											if(element.notifymsg!=''){
											stcnt++;	
											
											 (function() {
													$(document)
													.ready(
															function(t) {
																return function() {
																	"use strict";	
																	$.gritter
																	.add({
																		class_name : "-dark",
																		title : "Notification",
																		text : element.notifymsg,
																		time:6e3
																	})
												
																}
															}(this))
											}).call(this); 
											
											 getclosenotify(element.notifymsg);
											}
											
											//dropstr=dropstr+'<div id="gritter-notice-wrapper_msg">						<div id="gritter-item-2" class="gritter-item-wrapper">							<div class="gritter-item -dark">								<a class="gritter-close" Onclick="getclosenotify(\''+element.notifymsg+ '\');" tabindex="1"><i									class="pe pe-close"></i></a>								<div class="gritter-without-image">		<span class="gritter-title" id="Notify_title">Notification</span>									<p id="Notify_msg">'+element.notifymsg+'</p>						</div>								<div style="clear: both"></div>							</div>						</div>					</div>	';
											
										/* 	if(stcnt=="1"){ 
												
												  }  */
																			}); 
						//$("#loadfull").html(dropstr);
						
					}
				}
					
					

					
			},
			error : function(e) {

			},
			complete : function() {

			}
		});
	}
	function getclosenotify(msg){
		$.ajax({
			url : '<%=request.getContextPath()%>/Close_Notification',
			type : 'POST',
			data:{msg:msg},
			success : function(data) {
			},
			error : function(e) {

			},
			complete : function() {

			}
		});
	
	}
function getnotify(){
	$.ajax({
		url : '<%=request.getContextPath()%>/Fetch_all_notification',
		type : 'POST',
		data:{mode:"subnotify"},
		success : function(data) {
			//alert(data);
			
		var stcnt="0";
		
		
			if(data!=''){
				if(JSON.parse(data).length>0){
			var dropstr = '';
			$
					.each(
							JSON.parse(data),
							function(index, element) {
								stcnt++;
								dropstr=dropstr+'<li style="cursor: default !important;"> <img	style="cursor: default !important;" onerror="getprofshowdefaultimg(this);" src='+element.images+' > <strong style="cursor: default !important;">'+element.notifymsg+'</strong> <small style="cursor: default;">'+element.responsedate+'</small></li>';
								//alert(JSON.parse(data).length+">>>"+stcnt);
								//alert(element.notifymsg);
								if(stcnt=="1"){ 
/*  (function() {
		$(document)
		.ready(
				function(t) {
					return function() {
						"use strict";	
						$.gritter
						.add({
							class_name : "-dark",
							title : "Notification",
							text : element.notifymsg,
							time : 6e3
						})
	
					}
				}(this))
}).call(this);  */
  } 
							});
			dropstr = ''
				+ dropstr + '';
		$("#bell_cnt").html(stcnt);
		$("#notification").html(dropstr);
				}
				else{
					$("#msg_noti").html("Not available any notification");
					$("#btn_notify").css("display","none");
					$("#notification").css("display","none");
				}
		}else{
			/* dropstr = dropstr
			+ '<tr ><td colspan="18">No Data Available</td></tr>'; */
			
			$("#msg_noti").html("Not available any notification");
			$("#btn_notify").css("display","none");
			$("#notification").css("display","none");
		}
			//alert(dropstr);
		
		},
		error : function(e) {

		},
		complete : function() {

		}
	});
}
function getprofshowdefaultimg(source){
    source.src = "<%=request.getContextPath()%>/img/dummy.jpg"; 
     source.onerror = ""; 
     return true; 
 } 

function run_waitMesubfullprof(effect){
	$('#subfullprof').waitMe({
		effect: effect,
		text: 'Loading ...',
		bg: 'rgba(255,255,255,0.7)',
		color:'#000',
		sizeW:'',
		sizeH:''
	});
}
function run_waitMe_rs(effect){
	$('#subfull_rs').waitMe({
		effect: effect,
		text: 'Loading ...',
		bg: 'rgba(255,255,255,0.7)',
		color:'#000',
		sizeW:'',
		sizeH:''
	});
}

function getsubprofView(id){
	$('#profmyModal').modal('show');
	run_waitMesubfullprof("pulse");
	$.ajax({
		url : '<%=request.getContextPath()%>/Fetch_User_subdetails',
						data : {
						
							subid : id
						},
						type : 'POST',
						success : function(data) {
							var cond = "";
							$
									.each(
											JSON.parse(data),
											function(index, element) {
												
												cond = cond
														+ '<div class="box-body table-responsive">																	<div class="col-md-12" id="printArea">																	<div class="panel panel-info">																		<div class="panel-body"><div class="col-md-3 col-lg-3 " align="center">';
												cond = cond
														+ '<div class="photoheading" >Photo</div><img alt="Not Found"  id="prisimg_'+(+index + 1)+'" onerror="getprofshowdefaultimg(this);" src="'+element.images+'" class="img-responsive img-circle" style="width:200px;height:200px;">';
												
												cond = cond
														+ '</div><div class=" col-md-9 col-lg-9 ">	<table class="table -dark -striped -bordered" id="viewdetail">';
														cond = cond
														+ '	<tr>	<td class="heading"> Name</td><td class="rfheading">'
														+ element.ofcname
														+ '</td></tr>';
														cond = cond
														+ '	<tr>	<td class="heading"> Rank</td><td style="text-align:left;">'
														+ element.rank
														+ '</td></tr>';
														cond = cond
														+ '	<tr>	<td class="heading"> Contact No</td><td class="rfheading">'
														+ element.mobileno
														+ '</td></tr>';
														cond = cond
														+ '	<tr>	<td class="heading">Username</td><td class="rfheading">'
														+ element.Username
														+ '</td></tr>';
														cond = cond
														+ '	<tr>	<td class="heading">Role</td><td class="rfheading">'
														+ element.role1
														+ '</td></tr>';
														cond = cond
														+ '	<tr>	<td class="heading">Region</td><td class="rfheading">'
														+ element.region
														+ ' </td></tr>';
												cond = cond
														+ '	<tr>	<td class="heading">Zone</td><td class="rfheading">'
														+ element.zone
														+ '</td></tr>';
												cond = cond
														+ '	<tr>	<td class="heading">PoliceStation</td><td class="rfheading">'
														+ element.policestation
														+ '</td></tr>';
														
												
												$("#subprofpopreport")
												.html(
														cond
																+ "</tbody></table></div></div></div></div>");	
														
											//	alert(cond);
											});
							
											
						},
						error : function(e) {

						},
						complete : function() {
							$('#subfullprof').waitMe('hide');
						}
	});	}
function getclsmainpop(){
	
	$('#myModal_right_sidebar').modal('hide');
	//location.reload();
	getDataForCharts();
}
function getclsmainpop1(){
	
	$('#profmyModal').modal('hide');
	//location.reload();
	//getDataForCharts();
}
	
function getimgView_rs(reqid){
	   
	   run_waitMe_rs("pulse");
		$.ajax({
			url : '<%=request.getContextPath()%>/Fetching_REimages_Detail',
					data : {

						reqid : reqid
					},
					type : 'POST',
					success : function(data) {

						$('#myModal_right_sidebar').modal('show');
						
					
						var cond = "";
						$
								.each(
										JSON.parse(data),
										function(index, element) {

											cond = cond
													+ '<div class="box-body table-responsive">																	<div class="col -md-12" id="printArea">																	<div class="panel panel-info">																		<div class="panel-body"><div class="col-md-3 col-lg-3 " align="center">';
											cond = cond
													+ '<div class="photoheading" >Photo</div><img alt="Not Found"  id="others_'
													+ (+index + 1)
													+ '" onerror="getprofshowdefaultimg(this);" src="'
													+ element.reqimages
													+ '"   onmouseover="getpiczoom(this.id)" style="height:200px;width:200px;margin-bottom:29px">';

											cond = cond
													+ '</div><div class=" col-md-9 col-lg-9 ">	<table class="table -dark -striped -bordered" id="viewdetail">';
											/* cond = cond
											+ '	<tbody><tr>	<td>Subject Code</td><td>'
											+ resid
											+ '</td></tr>'; */
											cond = cond
											+ '	<tr>	<td class="heading"> Request ID</td><td class="rfheading">'
											+ reqid
											+ '</td></tr>';
											cond = cond+ '	<tr>	<td class="heading">Suspect  ID</td><td>'		+ element.Subjectcode
											+ '</td></tr>';
											cond = cond
													+ '	<tr>	<td class="heading"> Name</td><td class="rfheading">'
													+ element.Name
													+ '</td></tr>';
											cond = cond
													+ '	<tr>	<td class="heading">Age</td><td class="rfheading">'
													+ element.Age
													+ '</td></tr>';
											cond = cond
													+ '	<tr>	<td class="heading">Gender</td><td class="rfheading">'
													+ element.Gender
													+ '</td></tr>';
											cond = cond
													+ '	<tr>	<td class="heading">Police Station</td><td class="rfheading">'
													+ element.Policeofficer
													+ '</td></tr>';
											cond = cond
													+ '	<tr>	<td class="heading">Requested by</td><td class="rfheading">'
													+ element.Enrolledby
													+ '</td></tr>';
											cond = cond
													+ '	<tr>	<td class="heading"> Date</td><td class="rfheading">'
													+ element.EnrolledDate
													+ '</td></tr>';
											cond = cond
													+ '	<tr>	<td class="heading">Source</td><td class="rfheading">'
													+ element.SourceFrom
													+ '</td></tr>';
											cond = cond
													+ '	<tr>	<td class="heading">Tag</td><td class="rfheading">'
													+ element.tag
													+ '</td></tr>';

													cond = cond
													+ '	<tr>	<td class="heading">Incident Details</td><td class="rfheading">'
													+ element.Remarks
													+ '</td></tr>';




											$("#subpopreport_rs")
													.html(
															cond
																	+ "</tbody></table></div></div></div></div>");

										});

					},
					error : function(e) {

					},
					complete : function() {
						$('#subfull_rs').waitMe('hide');
					}
				});

					
}
$(document).on('keydown', function(e) {
    // ESCAPE key pressed
    if (e.keyCode == 27) {
    	//alert("hi");
    //	$(".modal").css("position","absolute");
    	$('.modal').modal('hide');
    }
});
/* function getpiczoom(id){
	//alert("id");
	var iid="#"+id;
	try{
    $(iid).elevateZoom({
    zoomType: "inner",
cursor: "crosshair",
zoomWindowFadeIn: 500,
zoomWindowFadeOut: 750
   });
	}catch(Exception){
		alert(Exception);
	}
} */

/* function resizeIncidentCategoryGraph(){
	setTimeout(function(){ 
		$("#loadfull1 .chart").css('height',$("#loadfull2 .chart -lg").css('height'));
		}, 5000);
	var loadfull2 = $("#loadfull2").css('height');
	var px2 = [];
	px2 = loadfull2.split('px');
	var resize2 = parseInt(px2);
	var loadfull1 = $("#loadfull1").css('height');
	var px1 = [];
	px1 = loadfull1.split('px');
	var resize1 = parseInt(px1)
	alert(resize1+''+resize2)
	if(resize1>resize2){
	$("#loadfull2").css('height',resize1) 
	} 
} */
</script>

		<div class="modal animated -primary in" id="profmyModal"
			data-show="zoomInDown" data-hide="zoomOutDown">
			<div class="modal-dialog">
				<div class="modal-content -padded">
					<div class="modal-header">
						<h2 id="subpopmyModalLabel1">User Details</h2>
						<button class="modal-close" onclick="getclsmainpop1();">
							<i class="pe pe-close"></i>
						</button>
					</div>
					<div class="modal-body _text-center">
						<!-- 	<div class="modal-icon _text-danger">
					<i class="fa fa-exclamation-circle"></i>
				</div> -->
						<!-- <h1 class="_margin-bottom-2x">Danger</h1> -->
						<div class="row">
							<div class="col -md-12">

								<div class="row" id="subfullprof">
									<div class="col -md-12">


										<div class="row" id="subprofpopreport"></div>

									</div>
								</div>

							</div>
						</div>
					</div>

				</div>
			</div>
		</div>


		<div class="modal animated -primary in" id="myModal_right_sidebar"
			data-show="zoomInDown" data-hide="zoomOutDown">
			<div class="modal-dialog">
				<div class="modal-content -padded">
					<div class="modal-header">
						<h2 class="modal-title" id="subpopmyModalLabel1_rs">Request
							Details</h2>
						<button class="modal-close" onclick="getclsmainpop();">
							<i class="pe pe-close"></i>
						</button>
					</div>
					<div class="modal-body _text-center">
						<!-- 	<div class="modal-icon _text-danger">
					<i class="fa fa-exclamation-circle"></i>
				</div> -->
						<!-- <h1 class="_margin-bottom-2x">Danger</h1> -->
						<div class="row">
							<div class="col -md-12">

								<div class="row" id="subfull_rs">
									<div class="col -md-12">
										<div class="row" id="subpopreport_rs"></div>

									</div>
								</div>

							</div>
						</div>
					</div>
					<div class="modal-footer _text-center" style="display: none;">
						<a class="btn -primary -dark _margin-right-1x">Close</a>
					</div>
				</div>
			</div>
		</div>
		