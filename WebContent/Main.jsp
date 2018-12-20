﻿<!-- Catch Control -->
<% response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setHeader("Pragma", "no-cache"); response.setDateHeader("Expires", 0);  %>
<%@ page language="java" import="java.util.ResourceBundle"%>
<!DOCTYPE html>
<html>
<title>SLA</title>
<link rel="shortcut icon" href="img/MCS-Logo.jpg" />
<!-- Bootstrap framework -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<!-- jQuery UI theme -->
<link rel="stylesheet" href="lib/jquery-ui/css/Aristo/Aristo.css" />
<!-- breadcrumbs -->
<link rel="stylesheet" href="lib/jBreadcrumbs/css/BreadCrumb.css" />
<!-- tooltips-->
<link rel="stylesheet" href="lib/qtip2/jquery.qtip.min.css" />
<!-- colorbox -->
<link rel="stylesheet" href="lib/colorbox/colorbox.css" />
<!-- code prettify -->
<link rel="stylesheet" href="lib/google-code-prettify/prettify.css" />
<!-- sticky notifications -->
<link rel="stylesheet" href="lib/sticky/sticky.css" />
<!-- aditional icons -->
<link rel="stylesheet" href="img/splashy/splashy.css" />
<!-- flags -->
<link rel="stylesheet" href="img/flags/flags.css" />
<!-- datatables -->
<link rel="stylesheet"
	href="lib/datatables/extras/TableTools/media/css/TableTools.css" />
<!-- font-awesome -->
<link rel="stylesheet" href="img/font-awesome/css/font-awesome.min.css" />
<!-- calendar -->
<link rel="stylesheet" href="lib/fullcalendar/fullcalendar_gebo.css" />
<link href="css/sweetalert.css" rel="stylesheet" />
<link rel="stylesheet"
	href="lib/datatables/extras/TableTools/media/css/TableTools.css" />
<link rel="stylesheet" href="lib/datepicker/datepicker.css" />
<link href="lib/timepicker/css/bootstrap-timepicker.css"
	rel="stylesheet" />
<!-- main styles -->
<link rel="stylesheet" href="css/style.css" />
<!-- theme color-->
<link rel="stylesheet" href="css/blue.css" id="link_theme" />

<link rel="stylesheet" href="css/common.css" />

<!-- favicon -->
<%--<link rel="shortcut icon" href="favicon.ico" />--%>

<script src="js/jquery.min.js"></script>
<script src="js/jquery-2.1.3.min.js"></script>
<script src="js/sweetalert.min.js"></script>
<script src="lib/datepicker/bootstrap-datepicker.min.js"></script>
<script src="lib/timepicker/js/bootstrap-timepicker.min.js"></script>
<script src="js/common.js"></script>
<style>
.Blink {
	animation: blinker 0.5s cubic-bezier(.5, 0, 1, 1) infinite alternate;
}

@
keyframes blinker {from { opacity:1;
	
}

to {
	opacity: 0;
}

}
.highcharts-credits {
	display: none;
}

.mr-1, .mx-1 {
	margin-right: 1rem !important;
}

.mt-1, .mx-1 {
	margin-top: 2rem !important;
}

.main_content{
	padding: 30px 15px 30px;
}
.sidebar .nav-pills > li > a{
	padding: 0px 15px;
}
.sidebar .nav-header {
	padding-left: 25x`	px;
}
.panel-body{
	padding-left :0px;
}
.well{
	padding : 12px;
}


.active {
    background-color: #666;
    color: white;
}
</style>



<%
ResourceBundle resource = ResourceBundle.getBundle("commonvariables");

//String series_name_1_1=resource.getString("series_name_1_1");
String series_name_1_1a=resource.getString("series_name_1_1a");
String series_name_1_1b=resource.getString("series_name_1_1b");
String series_name_1_2=resource.getString("series_name_1_2");
String series_name_1_3=resource.getString("series_name_1_3");
String series_name_1_4=resource.getString("series_name_1_4");
String series_name_1_5=resource.getString("series_name_1_5");
String series_name_1_6=resource.getString("series_name_1_6");
String series_name_1_7=resource.getString("series_name_1_7");
String series_name_1_8=resource.getString("series_name_1_8");
String series_name_1_9=resource.getString("series_name_1_9");
String series_name_1_10=resource.getString("series_name_1_10");
String series_name_1_11=resource.getString("series_name_1_11");
String series_name_1_12=resource.getString("series_name_1_12");

String series_name_8_1=resource.getString("series_name_8_1");
String series_name_8_2=resource.getString("series_name_8_2");

String series_name_4_2=resource.getString("series_name_4_2");
String series_name_4_2a=resource.getString("series_name_4_2a");
String series_name_4_3=resource.getString("series_name_4_3");



String series_name_2_1a=resource.getString("series_name_2_1a");
String series_name_2_1b=resource.getString("series_name_2_1b");

String series_name_5_1=resource.getString("series_name_5_1");
String series_name_5_2=resource.getString("series_name_5_2");
String series_name_5_3=resource.getString("series_name_5_3");
String series_name_5_4=resource.getString("series_name_5_4");
String series_name_5_5=resource.getString("series_name_5_5");

String series_name_7_1=resource.getString("series_name_7_1");
String series_name_7_2=resource.getString("series_name_7_2");
String series_name_7_3=resource.getString("series_name_7_3");
String series_name_7_4=resource.getString("series_name_7_4");
String series_name_7_5=resource.getString("series_name_7_5");

String series_name_6_4=resource.getString("series_name_6_4");
String series_name_6_1=resource.getString("series_name_6_1");
String series_name_6_2=resource.getString("series_name_6_2");
String series_name_6_3=resource.getString("series_name_6_3");
String series_name_6_5=resource.getString("series_name_6_5");



String series_main_module_name_1=resource.getString("series_main_module_name_1");
String series_main_module_name_2=resource.getString("series_main_module_name_2");
String series_main_module_name_3=resource.getString("series_main_module_name_3");
String series_main_module_name_4=resource.getString("series_main_module_name_4");
String series_main_module_name_5=resource.getString("series_main_module_name_5");
String series_main_module_name_6=resource.getString("series_main_module_name_6");
String series_main_module_name_7=resource.getString("series_main_module_name_7");



String Super_Admin_role = resource.getString("Super_Admin_role");
String weburl = resource.getString("weburl");
String Admin_role = resource.getString("Admin_role");

String itcnt = resource.getString("itcnt");
String ksize = resource.getString("ksize");		
String salt = resource.getString("salt");
String iv =  resource.getString("iv");
%>
<%
	session = request.getSession();
	String session_Role="",session_officername="",session_vid_resouce="",session_Login_Name="",session_mobileno="";
	
	try {
		

		
		session_Login_Name =session.getAttribute("session_Login_Name").toString();
		session_vid_resouce=session.getAttribute("session_vid").toString();
		session_officername=session.getAttribute("session_officername").toString();
		session_mobileno=session.getAttribute("session_mobileno").toString();		
		session_Role= session.getAttribute("session_Role").toString(); 
	
		
		 
	} catch (Exception e) {
		session_vid_resouce = "NO";
	
	
%>
<script type="text/javascript">
<%-- alert('<%=session_department%>'); --%>
 var session_vid_resouce = '<%=session_vid_resouce%>';

	if (session_vid_resouce == "NO")
		
	
		 document.location.href = "<%=request.getContextPath()%>/Sessionterminate";
</script>
<%
	}
	%>
<script>
var path = location.pathname;
var cur_path = path;
var arr = path.split("/");
var arr1 = arr[1].split("/");
path = "/" + arr1[0];

function getScripts(a) {
    var b = [];
    a.forEach(function(c) {
        (function(d) {
            b.push(new Promise(function(e) {
                $.getScript(d, function() {
                    e()
                })
            }))
        })(c)
    });
    return Promise.all(b, function() {
        return true
    })
}
$(function(){var a=[path+"/lib/validation/jquery.validate.js",path+"/js/aes.js",path+"/js/pbkdf2.js",path+"/js/AesUtil.js",path+"/js/bootbox.min.js"];
 getScripts(a).then(function() {})
});
</script>
</head>
<body class="full_width ptrn_a well">
	<div id="maincontainer" class="clearfix well">
		<header>
			<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
				<div class="navbar-inner">
					<div class="container-fluid">
						<a class="brand pull-left" href="#">MCSS</a>
						<ul class="nav navbar-nav" id="mobile-nav">

							<li><a href="Dashboard.jsp"><span
									class="glyphicon glyphicon-home"></span>Home</a></li>

							<li><a href="Calendar.jsp"><span
									class="glyphicon glyphicon-calendar"></span>Calendar</a></li>
							<li class="dropdown"><a data-toggle="dropdown"
								class="dropdown-toggle" href="#"> <span
									class="glyphicon glyphicon-th"></span>Modules <b class="caret"></b></a>
								<ul class="dropdown-menu">

									<li><a href="#">1 Series<b class="caret-right"></b></a>
										<ul class="dropdown-menu">
											<li><a href="#">1.1<b class="caret-right"></b></a>
												<ul class="dropdown-menu">
													<li><a href="series_1.1a.jsp">1.1 (a)</a></li>													
													<li><a href="series_1.1b.jsp">1.1 (b)</a></li>
												</ul>
											</li>
											<li><a href="series_1.2.jsp">1.2</a></li>
											<li><a href="series_1.3.jsp">1.3</a></li>
											<li><a href="series_1.4.jsp">1.4</a></li>
											<li><a href="series_1.5.jsp">1.5</a></li>
											<li><a href="series_1.6.jsp">1.6</a></li>
											<li><a href="series_1.7.jsp">1.7</a></li>
											<li><a href="series_1.8.jsp">1.8</a></li>
											<li><a href="series_1.9.jsp">1.9</a></li>
											<li><a href="series_1.10.jsp">1.10</a></li>
											<li><a href="series_1.11.jsp">1.11</a></li>
											<li><a href="series_1.12.jsp">1.12</a></li>
										</ul></li>
									<li><a href="#">2 Series<b class="caret-right"></b></a>
										<ul class="dropdown-menu">
											<li><a href="#">2.1 <b class="caret-right"></b></a>
												<ul class="dropdown-menu">
													<li><a href="series_2.1a.jsp">2.1 (a)</a></li>
													<li><a href="series_2.1b.jsp">2.1 (b)</a></li>
												</ul></li>

											<li><a href="#">2.2 <b class="caret-right"></b></a>
												<ul class="dropdown-menu">
													<li><a href="series_2.2a.jsp">2.2 (a)</a></li>
													<li><a href="series_2.2b.jsp">2.2 (b)</a></li>
												</ul></li>
											<li><a href="#">2.3 <b class="caret-right"></b></a>
												<ul class="dropdown-menu">
													<li><a href="series_2.3a.jsp">2.3 (a)</a></li>
													<li><a href="series_2.3b.jsp">2.3 (b)</a></li>
												</ul></li>
											<li><a href="#">2.4 <b class="caret-right"></b></a>
												<ul class="dropdown-menu">
													<li><a href="series_2.4a.jsp">2.4 (a)</a></li>
													<li><a href="series_2.4b.jsp">2.4 (b)</a></li>
												</ul></li>
											<li><a href="#">2.5 <b class="caret-right"></b></a>
												<ul class="dropdown-menu">
													<li><a href="series_2.5a.jsp">2.5 (a)</a></li>
													<li><a href="series_2.5b.jsp">2.5 (b)</a></li>
												</ul></li>
											<li><a href="#">2.6 <b class="caret-right"></b></a>
												<ul class="dropdown-menu">
													<li><a href="series_2.6a.jsp">2.6 (a)</a></li>
													<li><a href="series_2.6b.jsp">2.6 (b)</a></li>
													<li><a href="series_2.6c.jsp">2.6 (c)</a></li>
												</ul></li>
											<li><a href="#">2.7 <b class="caret-right"></b></a>
												<ul class="dropdown-menu">													
													<li><a href="series_2.7a.jsp">2.7 (a)</a></li>
													<li><a href="series_2.7b.jsp">2.7 (b)</a></li>
													<li><a href="series_2.7c.jsp">2.7 (c)</a></li>
												</ul></li>
											<li><a href="series_2.8.jsp">2.8</a></li>
											<li><a href="series_2.9.jsp">2.9</a></li>

										</ul></li>
									<li ><a href="#">3 Series<b class="caret-right"></b></a>
										<ul class="dropdown-menu">
											<li><a href="series_3.1.jsp">3.1</a></li>
											<li><a href="series_3.2.jsp">3.2</a></li>
											<li><a href="series_3.3.jsp">3.3</a></li>
											<li><a href="series_3.4.jsp">3.4</a></li>
											<!-- <li><a href="series_3.5.jsp">3.5</a></li> -->
										</ul></li>
									<li><a href="#">4 Series<b class="caret-right"></b></a>
										<ul class="dropdown-menu">
											<!-- <li><a href="#">4.1</a></li> -->
											<li><a href="series_4.2.jsp">4.2</a>
											<li><a href="series_4.3.jsp">4.3</a></li>
										</ul></li>
									<li><a href="#">5 Series<b class="caret-right"></b></a>
										<ul class="dropdown-menu">
											<li><a href="series_5.1.jsp">5.1</a></li>
											<li><a href="series_5.2.jsp">5.2</a></li>
											<li><a href="series_5.3.jsp">5.3</a></li>
											<li><a href="series_5.4.jsp">5.4</a></li>
											<li><a href="series_5.5.jsp">5.5</a></li>
										</ul></li>
									<li><a href="#">6 Series<b class="caret-right"></b></a>
										<ul class="dropdown-menu">
											<li><a href="series_6.1.jsp">6.1 </a>
											<li><a href="series_6.2.jsp">6.2 </a>
											<li><a href="series_6.3.jsp">6.3 </a>
											<li><a href="series_6.4.jsp">6.4 </a>
											<li><a href="series_6.5.jsp">6.5 </a>
										</ul></li>
									<li><a href="#">7 Series<b class="caret-right"></b></a>
										<ul class="dropdown-menu">
											<li><a href="series_7.1.jsp">7.1</a></li>
											<li><a href="series_7.2.jsp">7.2</a></li>
											<li><a href="series_7.3.jsp">7.3</a></li>
											<li><a href="series_7.4.jsp">7.4</a></li>
											<li><a href="series_7.5.jsp">7.5</a></li>
										</ul></li>
									<li><a href="#">8 Series<b class="caret-right"></b></a>
										<ul class="dropdown-menu">
											<li><a href="series_8.1.jsp">8.1</a></li>
											<li><a href="series_8.2.jsp">8.2</a></li>
											<!-- <li><a href="series_8.3.jsp">8.3</a></li>
											<li><a href="series_8.4.jsp">8.4</a></li>
											<li><a href="series_8.5.jsp">8.5</a></li> -->
										</ul></li>
								</ul></li>


							<li class="dropdown"><a data-toggle="dropdown"
								class="dropdown-toggle" href="#"><span
									class="glyphicon glyphicon-list-alt"></span>Report <b
									class="caret"></b></a>
								<ul class="dropdown-menu">
									<li><a href="Series.jsp">Common Reporting</a></li>
									<li><a href="Series_cr.jsp">Consolidated Reporting </a></li>
								
								</ul></li>
							<li class="dropdown"><a data-toggle="dropdown"
								class="dropdown-toggle" href="#"><span
									class="glyphicon glyphicon-th"></span>Statistics <b
									class="caret"></b></a>
								<ul class="dropdown-menu">
									<li><a href="CS_Summary_Report.jsp">Summary Report</a></li>
									<li><a href="CS_SLA_Quartely.jsp">Quarterly Report</a></li>
									<li><a href="CS_SLA_Monthly.jsp">Monthly Report</a></li>
									<li><a href="CS_SLA_Yearly.jsp">Yearly Report</a></li>


								</ul></li>
								<% 
									if(session_Role.equals("Admin") || session_Role.equals("Super Admin")){ %>
										<li class="dropdown"><a data-toggle="dropdown"
												class="dropdown-toggle" href="#"><span
													class="fa fa-users "></span> Users <b
													class="caret"></b></a>
												<ul class="dropdown-menu">
													<li><a href="user_reg.jsp">User Registration</a></li>
													<li><a href="users.jsp">User Details</a></li>
												
												</ul></li>
									
									<%} %>	
							
								
						</ul>
						<ul class="nav navbar-nav user_menu pull-right">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <img src="img/user_avatar.png"
									alt="" class="user_avatar" /><%=session_officername%> <b
									class="caret"></b></a>
								<ul class="dropdown-menu dropdown-menu-right">
									<li><a href="#">My Profile</a></li>
									<li><a href="change_pw.jsp">Change Password</a></li>
									<li class="divider"></li>
									<li><a href="javascript:void(0)" onclick="getlogout();">Log
											Out</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
			</nav>
		</header>
		<a href="javascript:void(0)" class="sidebar_switch on_switch bs_ttip"
			data-placement="auto right" data-viewport="body" title="Hide Sidebar">Sidebar
			switch</a> 
		<div class="sidebar">
			<div class="sidebar_inner_scroll">
				<div class="sidebar_inner">
					<div id="side_accordion" class="panel-group">
						<div class="panel panel-default">
							<div class="panel-heading">
								<a href="#collapseOne" data-parent="#side_accordion"
									data-toggle="collapse" class="accordion-toggle"> <i
									class="glyphicon glyphicon-folder-close"></i><b>Dashboard</b>
								</a>
							</div>
							<div class="accordion-body collapse" id="collapseOne">
								<div class="panel-body">
									<ul class="nav nav-pills nav-stacked">
										<li><a href="Dashboard.jsp">Dashboard</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="panel panel-default ">
							<div class="panel-heading">
								<a href="#collapseTwo" data-parent="#side_accordion"
									data-toggle="collapse" class="accordion-toggle"> <!-- <i
									class="glyphicon glyphicon-th"></i> -->
									<b> Modules</b>
								</a>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<a href="#collapseTwo" data-parent="#side_accordion"
									data-toggle="collapse" class="accordion-toggle"> <i
									class="glyphicon glyphicon-th"></i><b> Series 1</b>
								</a>
							</div>
							<div class="accordion-body collapse" id="collapseTwo">
								<div class="panel-body">
									<ul class="nav nav-pills nav-stacked">
									<!-- 	<li><a href="#">1.1</a><b class="caret-right"></b>
											<ul class="dropdown-menu">
												<li><a href="series_1.1a.jsp">1.1 (a)</a></li>
												<li><a href="series_1.1b.jsp">1.1 (b)</a></li>
											</ul>
										</li> -->
										<li class="nav-header">1.1</li>
										<li><a href="series_1.1a.jsp">1.1 (a)</a></li>
										<li><a href="series_1.1b.jsp">1.1 (b)</a></li>
										<li><a href="series_1.2.jsp">1.2</a></li>
										<li><a href="series_1.3.jsp">1.3</a></li>
										<li><a href="series_1.4.jsp">1.4</a></li>
										<li><a href="series_1.5.jsp">1.5</a></li>
										<li><a href="series_1.6.jsp">1.6</a></li>
										<li><a href="series_1.7.jsp">1.7</a></li>
										<li><a href="series_1.8.jsp">1.8</a></li>
										<li><a href="series_1.9.jsp">1.9</a></li>
										<li><a href="series_1.10.jsp">1.10</a></li>
										<li><a href="series_1.11.jsp">1.11</a></li>
										<li><a href="series_1.12.jsp">1.12</a></li>
									</ul>
								</div>
							</div>
						</div>

						<!-- series 2 -->

						<div class="panel panel-default">
							<div class="panel-heading">
								<a href="#collapseThree" data-parent="#side_accordion"
									data-toggle="collapse" class="accordion-toggle"> <i
									class="glyphicon glyphicon-th"></i><b> Series 2</b>
								</a>
							</div>
							<div class="accordion-body collapse" id="collapseThree">
								<div class="panel-body"  style="padding:5px;">
									<ul class="nav nav-pills nav-stacked" >

										<li class="nav-header">2.1</li>
										<li><a href="series_2.1a.jsp">2.1 (a)</a></li>
										<li><a href="series_2.1b.jsp">2.1 (b)</a></li>

										<li class="nav-header">2.2</li>
										<li><a href="series_2.2a.jsp">2.2 (a)</a></li>
										<li><a href="series_2.2b.jsp">2.2 (b)</a></li>
										<li class="nav-header">2.3</li>

										<li><a href="series_2.3a.jsp">2.3 (a)</a></li>
										<li><a href="series_2.3b.jsp">2.3 (b)</a></li>
										<li class="nav-header">2.4</li>
										<li><a href="series_2.4a.jsp">2.4 (a)</a></li>
										<li><a href="series_2.4b.jsp">2.4 (b)</a></li>
										<li class="nav-header">2.5</li>

										<li><a href="series_2.5a.jsp">2.5 (a)</a></li>
										<li><a href="series_2.5b.jsp">2.5 (b)</a></li>
										<li class="nav-header">2.6</li>
										<li><a href="series_2.6a.jsp">2.6 (a)</a></li>
										<li><a href="series_2.6b.jsp">2.6 (b)</a></li>
										<li><a href="series_2.6c.jsp">2.6 (c)</a></li>
										<li class="nav-header">2.7</li>
										<li><a href="series_2.7a.jsp">2.7 (a)</a></li>
										<li><a href="series_2.7b.jsp">2.7 (b)</a></li>
										<li><a href="series_2.7c.jsp">2.7 (c)</a></li>

										<li><a href="series_2.8.jsp">2.8</a></li>
										<li><a href="series_2.9.jsp">2.9</a></li>

									</ul>
								</div>
							</div>
						</div>
						<!-- Series 3 -->
						<div class="panel panel-default">
							<div class="panel-heading">
								<a href="#collapsefour" data-parent="#side_accordion"
									data-toggle="collapse" class="accordion-toggle"> <i
									class="glyphicon glyphicon-th"></i><b> Series 3</b>
								</a>
							</div>
							<div class="accordion-body collapse" id="collapsefour">
								<div class="panel-body">
									<ul class="nav nav-pills nav-stacked">
										<li><a href="series_3.1.jsp">3.1</a></li>
										<li><a href="series_3.2.jsp">3.2</a></li>
										<li><a href="series_3.3.jsp">3.3</a></li>
										<li><a href="series_3.4.jsp">3.4</a></li>
										<!-- <li><a href="series_3.5.jsp">3.5</a></li> -->
									</ul>
								</div>
							</div>
						</div>
						<!-- Series 4 -->
						<div class="panel panel-default">
							<div class="panel-heading">
								<a href="#collapsefive" data-parent="#side_accordion"
									data-toggle="collapse" class="accordion-toggle"> <i
									class="glyphicon glyphicon-th"></i><b> Series 4</b>
								</a>
							</div>
							<div class="accordion-body collapse" id="collapsefive">
								<div class="panel-body">
									<ul class="nav nav-pills nav-stacked">
										<!-- <li><a href="#">4.1</a></li> -->
										<li><a href="series_4.2.jsp">4.2</a>
										<li><a href="series_4.3.jsp">4.3</a></li>
									</ul>
								</div>
							</div>
						</div>
						<!-- Series 5 -->
						<div class="panel panel-default " >
							<div class="panel-heading ">
								<a href="#collapsesix" data-parent="#side_accordion"
									data-toggle="collapse" class="accordion-toggle"> <i
									class="glyphicon glyphicon-th "></i><b > Series 5</b>
								</a>
							</div>
							<div class="accordion-body collapse" id="collapsesix">
								<div class="panel-body">
									<ul class="nav nav-pills nav-stacked">
										<li><a href="series_5.1.jsp">5.1</a></li>
										<li><a href="series_5.2.jsp">5.2</a></li>
										<li><a href="series_5.3.jsp">5.3</a></li>
										<li><a href="series_5.4.jsp">5.4</a></li>
										<li><a href="series_5.5.jsp">5.5</a></li>
									</ul>
								</div>
							</div>
						</div>
						<!-- Series 6 -->
						<div class="panel panel-default">
							<div class="panel-heading">
								<a href="#collapseseven" data-parent="#side_accordion"
									data-toggle="collapse" class="accordion-toggle"> <i
									class="glyphicon glyphicon-th"></i><b> Series 6</b>
								</a>
							</div>
							<div class="accordion-body collapse" id="collapseseven">
								<div class="panel-body">
									<ul class="nav nav-pills nav-stacked">
										<li><a href="series_6.1.jsp">6.1 </a>
										<li><a href="series_6.2.jsp">6.2 </a>
										<li><a href="series_6.3.jsp">6.3 </a>
										<li><a href="series_6.4.jsp">6.4 </a>
										<li><a href="series_6.5.jsp">6.5 </a>
									</ul>
								</div>
							</div>
						</div>

						<!-- Series 7 -->
						<div class="panel panel-default">
							<div class="panel-heading">
								<a href="#collapseeight" data-parent="#side_accordion"
									data-toggle="collapse" class="accordion-toggle"> <i
									class="glyphicon glyphicon-th"></i><b> Series 7</b>
								</a>
							</div>
							<div class="accordion-body collapse" id="collapseeight">
								<div class="panel-body">
									<ul class="nav nav-pills nav-stacked">
										<li><a href="series_7.1.jsp">7.1</a></li>
										<li><a href="series_7.2.jsp">7.2</a></li>
										<li><a href="series_7.3.jsp">7.3</a></li>
										<li><a href="series_7.4.jsp">7.4</a></li>
										<li><a href="series_7.5.jsp">7.5</a></li>

									</ul>
								</div>
							</div>
						</div>
						<!-- Series 8 -->
						<div class="panel panel-default">
							<div class="panel-heading">
								<a href="#collapsenine" data-parent="#side_accordion"
									data-toggle="collapse" class="accordion-toggle"> <i
									class="glyphicon glyphicon-th"></i><b> Series 8</b>
								</a>
							</div>
							<div class="accordion-body collapse" id="collapsenine">
								<div class="panel-body">
									<ul class="nav nav-pills nav-stacked">
										<li><a href="series_8.1.jsp">8.1</a></li>
										<li><a href="series_8.2.jsp">8.2</a></li>
										<!-- <li><a href="series_8.3.jsp">8.3</a></li>
										<li><a href="series_8.4.jsp">8.4</a></li>
										<li><a href="series_8.5.jsp">8.5</a></li> -->

									</ul>
								</div>
							</div>
						</div>

						<!-- <div class="panel panel-default">
							<div class="panel-heading">
								<a href="#collapseTwo" data-parent="#side_accordion"
									data-toggle="collapse" class="accordion-toggle"> <i
									class="glyphicon  glyphicon-cog"></i><b>Masters</b>
								</a>
							</div>
							<div class="accordion-body collapse" id="collapseTwo">
								<div class="panel-body">
									<ul class="nav nav-pills nav-stacked">
										
										<li><a href="javascript:void(0)">Vehicle Type</a></li>
										<li><a href="javascript:void(0)">ANPR Type</a></li>
										<li><a href="javascript:void(0)">Shift</a></li>
										<li><a href="javascript:void(0)">User</a></li>
									</ul>
								</div>
							</div>
						</div>		 -->
						<div class="panel panel-default">
							<div class="panel-heading">
								<a href="#collapse7" data-parent="#side_accordion"
									data-toggle="collapse" class="accordion-toggle"> <i
									class="glyphicon glyphicon-th-list"></i> <b>Calculator</b>
								</a>
							</div>
							<div class="accordion-body collapse in" id="collapse7">
								<div class="panel-body">
									<form name="Calc" id="calc" style="font-weight: bold">
										<div class="formSep input-group input-group-sm">
											<input class="form-control" name="Input" type="text" /> <span
												class="input-group-btn">
												<button type="button" class="btn btn-default" name="clear"
													value="c" onclick="Calc.Input.value = ''">
													<i class="glyphicon glyphicon-remove"></i>
												</button>
											</span>
										</div>
										<div class="form-group" style="padding-left: 10px">
											<input class="btn form-control btn-default input-sm"
												name="seven" value="7" onclick="Calc.Input.value += '7'"
												type="button"> <input
												class="btn form-control btn-default input-sm" name="eight"
												value="8" onclick="Calc.Input.value += '8'" type="button">
											<input class="btn form-control btn-default input-sm"
												name="nine" value="9" onclick="Calc.Input.value += '9'"
												type="button"> <input
												class="btn form-control btn-default input-sm" name="div"
												value="/" onclick="Calc.Input.value += ' / '" type="button">
										</div>
										<div class="form-group" style="padding-left: 10px">
											<input class="btn form-control btn-default input-sm"
												name="four" value="4" onclick="Calc.Input.value += '4'"
												type="button"> <input
												class="btn form-control btn-default input-sm" name="five"
												value="5" onclick="Calc.Input.value += '5'" type="button">
											<input class="btn form-control btn-default input-sm"
												name="six" value="6" onclick="Calc.Input.value += '6'"
												type="button"> <input
												class="btn form-control btn-default input-sm" name="times"
												value="x" onclick="Calc.Input.value += ' * '" type="button">
										</div>
										<div class="form-group" style="padding-left: 10px">
											<input class="btn form-control btn-default input-sm"
												name="one" value="1" onclick="Calc.Input.value += '1'"
												type="button"> <input
												class="btn form-control btn-default input-sm" name="two"
												value="2" onclick="Calc.Input.value += '2'" type="button">
											<input class="btn form-control btn-default input-sm"
												name="three" value="3" onclick="Calc.Input.value += '3'"
												type="button"> <input
												class="btn form-control btn-default input-sm" name="minus"
												value="-" onclick="Calc.Input.value += ' - '" type="button">
										</div>
										<div class="formSep form-group" style="padding-left: 10px">
											<input class="btn form-control btn-default input-sm"
												name="dot" value="." onclick="Calc.Input.value += '.'"
												type="button"> <input
												class="btn form-control btn-default input-sm" name="zero"
												value="0" onclick="Calc.Input.value += '0'" type="button">
											<input class="btn form-control btn-default input-sm"
												name="DoIt" value="="
												onclick="Calc.Input.value = Math.round( eval(Calc.Input.value) * 1000)/1000"
												type="button"> <input
												class="btn form-control btn-default input-sm" name="plus"
												value="+" onclick="Calc.Input.value += ' + '" type="button">
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="push"></div>
				</div>
			</div>
		</div>
		<!-- </div> -->
		<div id="contentwrapper">
			<script src="js/jquery-migrate.min.js"></script>
			<script src="lib/jquery-ui/jquery-ui-1.10.0.custom.min.js"></script>
			<!-- touch events for jquery ui-->
			<script src="js/forms/jquery.ui.touch-punch.min.js"></script>
			<!-- easing plugin -->
			<script src="js/jquery.easing.1.3.min.js"></script>
			<!-- smart resize event -->
			<script src="js/jquery.debouncedresize.min.js"></script>
			<!-- js cookie plugin -->
			<script src="js/jquery_cookie_min.js"></script>
			<!-- main bootstrap js -->
			<script src="bootstrap/js/bootstrap.min.js"></script>
			<!-- bootstrap plugins -->
			<script src="js/bootstrap.plugins.min.js"></script>
			<!-- typeahead -->
			<script src="lib/typeahead/typeahead.min.js"></script>
			<!-- code prettifier -->
			<script src="lib/google-code-prettify/prettify.min.js"></script>
			<!-- sticky messages -->
			<script src="lib/sticky/sticky.min.js"></script>
			<!-- lightbox -->
			<script src="lib/colorbox/jquery.colorbox.min.js"></script>
			<!-- jBreadcrumbs -->
			<script src="lib/jBreadcrumbs/js/jquery.jBreadCrumb.1.1.min.js"></script>
			<!-- hidden elements width/height -->
			<script src="js/jquery.actual.min.js"></script>
			<!-- custom scrollbar -->
			<script src="lib/slimScroll/jquery.slimscroll.js"></script>
			<!-- fix for ios orientation change -->
			<script src="js/ios-orientationchange-fix.js"></script>
			<!-- to top -->
			<script src="lib/UItoTop/jquery.ui.totop.min.js"></script>
			<!-- mobile nav -->
			<script src="js/selectNav.js"></script>
			<!-- moment.js date library -->
			<script src="lib/moment/moment.min.js"></script>
			<!-- common functions -->
			<script src="js/pages/gebo_common.js"></script>
			<!-- dashboard functions -->
			<%--<script src="js/pages/gebo_dashboard.js"></script>--%>
			<script src="lib/datatables/jquery.dataTables.min.js"></script>
			<script
				src="lib/datatables/extras/Scroller/media/js/dataTables.scroller.min.js"></script>
			<!-- datatable table tools -->
			<script
				src="lib/datatables/extras/TableTools/media/js/TableTools.min.js"></script>
			<script
				src="lib/datatables/extras/TableTools/media/js/ZeroClipboard.js"></script>
			<!-- datatables bootstrap integration -->
			<script src="lib/datatables/jquery.dataTables.bootstrap.min.js"></script>
			<!-- datatable functions -->
			<script src="js/pages/gebo_datatables.js"></script>
			<script>
function getlogout(){
	document.location.href = "<%=request.getContextPath()%>/Sessionterminate";
}


</script>
</body>
</html>
