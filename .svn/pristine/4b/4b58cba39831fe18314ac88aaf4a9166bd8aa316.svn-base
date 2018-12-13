<%@ page language="java"
	import="org.cloudme.sample.aes.AesUtil,java.util.ResourceBundle,java.sql.Statement,java.sql.SQLException,Database.*,java.sql.ResultSet,java.text.DateFormat,java.sql.Connection,java.util.*,java.util.Date,java.text.DecimalFormat,java.text.SimpleDateFormat"%>


	<%
	String ses_cond="",uname="";
	String cond="";
	String uid=request.getParameter("uid");	
	String fdate=request.getParameter("fdate");
		if(!fdate.equalsIgnoreCase("")){
			cond=cond+" and CAST(CONVERT(char(10),insertdate,126) AS DATE) >= CAST(CONVERT(char(10), '"+fdate+"',126) AS DATE)";
		}
		String tdate=request.getParameter("tdate");
		if(!tdate.equalsIgnoreCase("")){
			cond=cond+" and CAST(CONVERT(char(10),insertdate,126) AS DATE) <= CAST(CONVERT(char(10), '"+tdate+"',126) AS DATE)";
		}
			String sname=""+request.getParameter("sname");
		
		String sub_series_list=request.getParameter("sub_series_list");
		
		
		String exportToExcel = request.getParameter("exportToExcel");
		if (exportToExcel != null
				&& exportToExcel.toString().equalsIgnoreCase("YES")) {
			%><div style="color: #3d72b4; font-size: 35px;text-align:center;font-weight:bold;">
		Mumbai City Surveillance
		</div><%
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "inline; filename=Series_"+sub_series_list+".xls");

		}
	%>
	<%
		if (exportToExcel == null) {
	%>
<%@include file="Main.jsp"%>
	
<div class="main_content">

	<div id="jCrumbs" class="breadCrumb module">
		<div style="overflow: hidden; position: relative; width: 1065px;">
			<div>
				<ul style="width: 5006px;">
					<li class="first"><a href="#"><i
							class="glyphicon glyphicon-home"></i></a></li>
					<li>Report</a></li>
					<!-- 	<li><a href="#">2.3</a></li> -->
					<li ><a href="<%=request.getContextPath()%>/Series.jsp"><b>Common Reporting</b></a></li>
					<li class="last" id="seriesname"><b><%=sub_series_list%> <%=sname%></b></li>


<li class="right" ><b><a
		href="ExporttoExcel_2.jsp?sname=<%=sname%>&fdate=<%=fdate%>&tdate=<%=tdate%>&sub_series_list=<%=sub_series_list%>&uid=<%=uid%>&exportToExcel=YES" >Export to Excel</a></b></li>
				</ul>
			</div>
		</div>
	</div>
	
<section class="content_b">
		<div class="row">
			<div class="col-md-12">
		
	<%
		}
	Database db = new Database();
	Connection con = null,con1=null;
	ResourceBundle resource = ResourceBundle.getBundle("commonvariables");

String series_name_2_1ad=resource.getString("series_name_2_1a");
String series_name_2_1bd=resource.getString("series_name_2_1b");


	String series_name_2_2a = resource.getString("series_name_2_2a");
	String series_name_2_2b=resource.getString("series_name_2_2b");
	String series_name_2_3a = resource.getString("series_name_2_3a");
	String series_name_2_3b=resource.getString("series_name_2_3b");
	
	
	String series_name_2_4a=resource.getString("series_name_2_4a");
	String series_name_2_4b=resource.getString("series_name_2_4b");
	String series_name_2_5a=resource.getString("series_name_2_5a");
	String series_name_2_5b=resource.getString("series_name_2_5b");
	String series_name_2_6=resource.getString("series_name_2_6");
	String series_name_2_6a=resource.getString("series_name_2_6a");
	String series_name_2_6b=resource.getString("series_name_2_6b");
	String series_name_2_6c=resource.getString("series_name_2_6c");
	String series_name_2_7=resource.getString("series_name_2_7");
	String series_name_2_7a=resource.getString("series_name_2_7a");
	String series_name_2_7b=resource.getString("series_name_2_7b");
	String series_name_2_7c=resource.getString("series_name_2_7c");
	String series_name_2_8=resource.getString("series_name_2_8");
	String series_name_2_9=resource.getString("series_name_2_9");
	
	con = db.connection_get();
	con1 = db.connection_get();
	String Total_Average="";
if(con1!=null){
	String uquery="select OfficerName,MobileNo,role from dbo.mastr_user where IsActive=1 and id="+uid+"";
	
	ResultSet userrs=db.SelectData(uquery, con1); 
	System.out.println(">>rs.isBeforeFirst"+userrs.getFetchSize());
	if(userrs!=null){
	if(userrs.next()){
		uname=""+userrs.getString("OfficerName");
	}
	}
}
	%>
	<div style="color:#033;font-size:25px;"></div>
	
	<%-- <div style="color:darkblue;font-weight:bold;font-size:22px;text-align:center;">Streaming - Status Report(<%=request_status1%>)</div> --%>
	
	<%if (exportToExcel != null
								&& exportToExcel.toString().equalsIgnoreCase("YES")) { %>
						<div
			style=" font-weight: bold; font-size: 22px; text-align: center;">
			
		</div>	<div style="Font-weight:bold;">Export Date - <%DateFormat dateFormat = new SimpleDateFormat("dd MMM yyyy hh:mm a ");
			Date date = new Date();
			out.print(dateFormat.format(date)); %><br>
			Exported By - <%=uname%>
			</div>
		
						<%} else{ %>
						<%-- <div
			style="color: white; font-weight: bold; font-size: 22px; text-align: center;">
			<%=sname%>
		</div> --%>
						<%} %>
	<br>
		<div style="overflow-x:scroll;">
	<table id="labour" class="table -dark -striped -bordered" border="1" style="white-space:nowrap;">

		
		
	<%	
	
	try {String ipaddress = "", location = "",date="",applicationname="",time="";String query ="";
				System.out.println("con"+con);
		if (con != null) {
			if(sub_series_list.equalsIgnoreCase(series_name_2_1ad)) 
			{
		
		query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (Overall_Availability as Float) ) / COUNT(*), 2)) ) avg  from tbl_2_1_a where isnull(id,'')!='' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY id Desc) AS rownumber,  Hostname,IPaddress,Data_Center,Application_name,display_name,Process_name,Process_Availability,Overall_Availability,convert(varchar(10),insertdate,101)date  "
				+"	FROM   tbl_2_1_a where isnull(id,'')!='' "+cond+" " 
		       +"	) AS tbl ";
		%><thead>
							<tr>
								<th class="text-center">S.No.</th>
								<th class="text-center">Host Name</th>
								<th class="text-center">IP address</th>
								<th class="text-center">Data Center</th>
								<th class="text-center">Application Name</th>
								<th class="text-center">Display Name</th>
								<th class="text-center">Process Name</th>
								<th class="text-center">Process Availability</th>
								<th class="text-center">Overall Availability</th>
							</tr>
						</thead>
						<tbody>
							<%
		
				}

	if(sub_series_list.equalsIgnoreCase(series_name_2_1bd)) 
			{
		
		query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (Overall_Availability as Float) ) / COUNT(*), 2)) ) avg  from tbl_2_1_b where isnull(id,'')!='' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY id Desc) AS rownumber,  Hostname,IPaddress,Data_Center,Application_name,Process_name,Process_Availability,Overall_Availability,convert(varchar(10),insertdate,101)date  "
				+"	FROM   tbl_2_1_b where isnull(id,'')!='' "+cond+" " 
		       +"	) AS tbl ";
		%>
				<thead>
							<tr>
								<th class="text-center">S.No.</th>
								<th class="text-center">Host Name</th>
								<th class="text-center">IP address</th>
								<th class="text-center">Data Center</th>
								<th class="text-center">Application Name</th>								
								<th class="text-center">Process Name</th>
								<th class="text-center">Process Availability</th>
								<th class="text-center">Overall Availability</th>
							</tr>
						</thead>
						<tbody><%
		
				}
	
			if(sub_series_list.equalsIgnoreCase(series_name_2_2a)) 
			{
		
		query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from ApplicationOpening where location='Command_Center' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
				+"	FROM   ApplicationOpening where location='Command_Center' "+cond+" " 
		       +"	) AS tbl ";
		
		%><thead>
		<tr>
				<th>S.No.</th>
				<th>IP Address</th>				
				<th>Location</th>				
				<th>Date</th>
				<th>Application Name</th>
				<th>Time(secs)</th>
							
			</tr>
			
		</thead>
		<tbody><%
		
	//	query="select ipaddress,location,convert(varchar(10),date,101)date,applicationname,time from dbo.ApplicationOpening where location='Command_Center' "+cond+" order by rid desc";
			}
	if(sub_series_list.equalsIgnoreCase(series_name_2_2b)) 
	{
//	query="select ipaddress,location,convert(varchar(10),date,101)date,applicationname,time from dbo.ApplicationOpening where location='RVC_ZVC_PS'  "+cond+" order by rid desc";
		
		query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from ApplicationOpening where location='RVC_ZVC_PS' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
				+"	FROM   ApplicationOpening where location='RVC_ZVC_PS' "+cond+" " 
		       +"	) AS tbl ";
	
		%><thead>
		<tr>
				<th>S.No.</th>
				<th>IP Address</th>				
				<th>Location</th>				
				<th>Date</th>
				<th>Application Name</th>
				<th>Time(secs)</th>
							
			</tr>
			
		</thead>
		<tbody><%
	}
	if(sub_series_list.equalsIgnoreCase(series_name_2_3a)) 
	{
//query="select ipaddress,location,convert(varchar(10),date,101)date,applicationname,time from userlogin where location='Command_Center'   "+cond+" order by rid desc ";
		query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from userlogin where location='Command_Center' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
				+"	FROM   userlogin where location='Command_Center' "+cond+" " 
		       +"	) AS tbl ";
		%><thead>
		<tr>
				<th>S.No.</th>
				<th>IP Address</th>				
				<th>Location</th>				
				<th>Date</th>
				<th>Application Name</th>
				<th>Time(secs)</th>
							
			</tr>
			
		</thead>
		<tbody><%
	}
	if(sub_series_list.equalsIgnoreCase(series_name_2_3b)) 
	{
//query="select ipaddress,location,convert(varchar(10),date,101)date,applicationname,time from userlogin where location='RVC_ZVC_PS'  "+cond+" order by rid desc ";
		query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from userlogin where location='RVC_ZVC_PS' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
				+"	FROM   userlogin where location='RVC_ZVC_PS' "+cond+" " 
		       +"	) AS tbl ";
		%><thead>
		<tr>
				<th>S.No.</th>
				<th>IP Address</th>				
				<th>Location</th>				
				<th>Date</th>
				<th>Application Name</th>
				<th>Time(secs)</th>
							
			</tr>
			
		</thead>
		<tbody><%
	
	}
	if(sub_series_list.equalsIgnoreCase(series_name_2_4a)) 
	{
//query="select ipaddress,location,convert(varchar(10),date,101)date,applicationname,time from userlogin where location='RVC_ZVC_PS'  "+cond+" order by rid desc ";
		query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from dbo.MenuNavigation where location='Command_Center' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
				+"	FROM   dbo.MenuNavigation where location='Command_Center' "+cond+" " 
		       +"	) AS tbl ";
	
		%><thead>
		<tr>
				<th>S.No.</th>
				<th>IP Address</th>				
				<th>Location</th>				
				<th>Date</th>
				<th>Application Name</th>
				<th>Time(secs)</th>
							
			</tr>
			
		</thead>
		<tbody><%
	}
	if(sub_series_list.equalsIgnoreCase(series_name_2_4b)) 
	{
//query="select ipaddress,location,convert(varchar(10),date,101)date,applicationname,time from userlogin where location='RVC_ZVC_PS'  "+cond+" order by rid desc ";
		query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from MenuNavigation where location='RVC_ZVC_PS' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
				+"	FROM   MenuNavigation where location='RVC_ZVC_PS' "+cond+" " 
		       +"	) AS tbl ";
		%><thead>
		<tr>
				<th>S.No.</th>
				<th>IP Address</th>				
				<th>Location</th>				
				<th>Date</th>
				<th>Application Name</th>
				<th>Time(secs)</th>
							
			</tr>
			
		</thead>
		<tbody><%
		
	}
	
	if(sub_series_list.equalsIgnoreCase(series_name_2_5a)) 
	{
//query="select ipaddress,location,convert(varchar(10),date,101)date,applicationname,time from userlogin where location='RVC_ZVC_PS'  "+cond+" order by rid desc ";
		query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from dbo.ChangeOfScreen where location='Command_Center' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
				+"	FROM   dbo.ChangeOfScreen where location='Command_Center' "+cond+" " 
		       +"	) AS tbl ";
		%><thead>
		<tr>
				<th>S.No.</th>
				<th>IP Address</th>				
				<th>Location</th>				
				<th>Date</th>
				<th>Application Name</th>
				<th>Time(secs)</th>
							
			</tr>
			
		</thead>
		<tbody><%
		
	}
	if(sub_series_list.equalsIgnoreCase(series_name_2_5b)) 
	{
//query="select ipaddress,location,convert(varchar(10),date,101)date,applicationname,time from userlogin where location='RVC_ZVC_PS'  "+cond+" order by rid desc ";
		query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from ChangeOfScreen where location='RVC_ZVC_PS' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
				+"	FROM   ChangeOfScreen where location='RVC_ZVC_PS' "+cond+" " 
		       +"	) AS tbl ";
		
		%><thead>
		<tr>
				<th>S.No.</th>
				<th>IP Address</th>				
				<th>Location</th>				
				<th>Date</th>
				<th>Application Name</th>
				<th>Time(secs)</th>
							
			</tr>
			
		</thead>
		<tbody><%
	}
	
	if(sub_series_list.equalsIgnoreCase(series_name_2_6)) 
	{
//
		query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from VideoFeedQuery where id='2.10' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
				+"	FROM   VideoFeedQuery where id='2.10'  "+cond+" " 
		       +"	) AS tbl ";
	
		%><thead>
		<tr>
				<th>S.No.</th>
				<th>IP Address</th>				
				<th>Location</th>				
				<th>Date</th>
				<th>Application Name</th>
				<th>Time(secs)</th>
							
			</tr>
			
		</thead>
		<tbody><%
	}

	if(sub_series_list.equalsIgnoreCase(series_name_2_6a)) 
	{
//
		query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from VideoFeedQuery where id='2.14' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
				+"	FROM   VideoFeedQuery where id='2.14'  "+cond+" " 
		       +"	) AS tbl ";
		%><thead>
		<tr>
				<th>S.No.</th>
				<th>IP Address</th>				
				<th>Location</th>				
				<th>Date</th>
				<th>Application Name</th>
				<th>Time(secs)</th>
							
			</tr>
			
		</thead>
		<tbody><%
		
	}
	if(sub_series_list.equalsIgnoreCase(series_name_2_6b)) 
	{
//
		query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from VideoFeedQuery where id='2.15' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
				+"	FROM   VideoFeedQuery where id='2.15'  "+cond+" " 
		       +"	) AS tbl ";
		
		%><thead>
		<tr>
				<th>S.No.</th>
				<th>IP Address</th>				
				<th>Location</th>				
				<th>Date</th>
				<th>Application Name</th>
				<th>Time(secs)</th>
							
			</tr>
			
		</thead>
		<tbody><%
	}
	if(sub_series_list.equalsIgnoreCase(series_name_2_6c)) 
	{
//
		query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from VideoFeedQuery where id='2.16' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
				+"	FROM   VideoFeedQuery where id='2.16'  "+cond+" " 
		       +"	) AS tbl ";
	
		%><thead>
		<tr>
				<th>S.No.</th>
				<th>IP Address</th>				
				<th>Location</th>				
				<th>Date</th>
				<th>Application Name</th>
				<th>Time(secs)</th>
							
			</tr>
			
		</thead>
		<tbody><%
	}
	
	if(sub_series_list.equalsIgnoreCase(series_name_2_7)) 
	{
//
		query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from ReportGenrationResponseTime where id='2.11' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
				+"	FROM   ReportGenrationResponseTime where id='2.11'  "+cond+" " 
		       +"	) AS tbl ";
		%><thead>
		<tr>
				<th>S.No.</th>
				<th>IP Address</th>				
				<th>Location</th>				
				<th>Date</th>
				<th>Application Name</th>
				<th>Time(secs)</th>
							
			</tr>
			
		</thead>
		<tbody><%
		
	}

	if(sub_series_list.equalsIgnoreCase(series_name_2_7a)) 
	{
//
		query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from ReportGenrationResponseTime where id='2.17' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
				+"	FROM   ReportGenrationResponseTime where id='2.17'  "+cond+" " 
		       +"	) AS tbl ";
		%><thead>
		<tr>
				<th>S.No.</th>
				<th>IP Address</th>				
				<th>Location</th>				
				<th>Date</th>
				<th>Application Name</th>
				<th>Time(secs)</th>
							
			</tr>
			
		</thead>
		<tbody><%
		
	}
	if(sub_series_list.equalsIgnoreCase(series_name_2_7b)) 
	{
//
		query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from ReportGenrationResponseTime where id='2.18' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
				+"	FROM   ReportGenrationResponseTime where id='2.18'  "+cond+" " 
		       +"	) AS tbl ";
		%><thead>
		<tr>
				<th>S.No.</th>
				<th>IP Address</th>				
				<th>Location</th>				
				<th>Date</th>
				<th>Application Name</th>
				<th>Time(secs)</th>
							
			</tr>
			
		</thead>
		<tbody><%
		
	}
	if(sub_series_list.equalsIgnoreCase(series_name_2_7c)) 
	{
//
		query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from ReportGenrationResponseTime where id='2.19' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
				+"	FROM   ReportGenrationResponseTime where id='2.19'  "+cond+" " 
		       +"	) AS tbl ";
		%><thead>
		<tr>
				<th>S.No.</th>
				<th>IP Address</th>				
				<th>Location</th>				
				<th>Date</th>
				<th>Application Name</th>
				<th>Time(secs)</th>
							
			</tr>
			
		</thead>
		<tbody><%
	}

	if(sub_series_list.equalsIgnoreCase(series_name_2_8)) 
	{

		query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from PTZ_LagTime where isnull(rid,'')!='' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
				+"	FROM   PTZ_LagTime where isnull(rid,'')!='' "+cond+" " 
		       +"	) AS tbl ";
		%><thead>
		<tr>
				<th>S.No.</th>
				<th>IP Address</th>				
				<th>Location</th>				
				<th>Date</th>
				<th>Application Name</th>
				<th>Time(secs)</th>
							
			</tr>
			
		</thead>
		<tbody><%
		
	}
	if(sub_series_list.equalsIgnoreCase(series_name_2_9)) 
	{
		query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from CameraSettingModification where isnull(rid,'')!='' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
				+"	FROM   CameraSettingModification where isnull(rid,'')!='' "+cond+" " 
		       +"	) AS tbl ";
		
		%><thead>
		<tr>
				<th>S.No.</th>
				<th>IP Address</th>				
				<th>Location</th>				
				<th>Date</th>
				<th>Application Name</th>
				<th>Time(secs)</th>
							
			</tr>
			
		</thead>
		<tbody><%
	}
			
			ResultSet rs=db.SelectData(query, con); 
			System.out.println(">>rs.isBeforeFirst"+rs.getFetchSize());
						if (!rs.isBeforeFirst()) {
							System.out.println(">>if");
			%><tr>
				<td colspan="6">No Data Found</td>
			</tr>
			<%
				} else {
							int i = 0;
							while (rs.next()) {
								
								if((!sub_series_list.equalsIgnoreCase(series_name_2_1ad))  && (!sub_series_list.equalsIgnoreCase(series_name_2_1bd)) ) 
								{
								
								
								ipaddress = "" + rs.getString("ipaddress");
								if(ipaddress.equalsIgnoreCase("") || ipaddress.equalsIgnoreCase("null") || ipaddress.equalsIgnoreCase(null)){
									ipaddress="";
								}
								ipaddress = ipaddress.trim();
								
								location = "" + rs.getString("location");
								if(location.equalsIgnoreCase("") || location.equalsIgnoreCase("null") || location.equalsIgnoreCase(null)){
									location="";
								}
								location = location.trim();
								
								date = "" + rs.getString("date");
								if(date.equalsIgnoreCase("") || date.equalsIgnoreCase("null") || date.equalsIgnoreCase(null)){
									date="";
								}
								date = date.trim();
								applicationname = "" + rs.getString("applicationname");
								if(applicationname.equalsIgnoreCase("") || applicationname.equalsIgnoreCase("null") || applicationname.equalsIgnoreCase(null)){
									applicationname="";
								}
								applicationname = applicationname.trim();
								time = "" + rs.getString("time");
								if(time.equalsIgnoreCase("") || time.equalsIgnoreCase("null") || time.equalsIgnoreCase(null)){
									time="";
								}
								time = time.trim();
								
								 Total_Average=""+rs.getString("Total_Average");
								String rownumber = ""
										+ rs.getString("rownumber");
								//System.out.println(">>>>>rownumber"+rownumber);
								String Rcount = "" + rs.getString("Rcount");
								

			%>


			<tr>

				<td style="text-align: center" ><%=(i + 1)%></td>	
				<td style="text-align: left;"><%=ipaddress%></td>
				<td align="left"><%=location%></td> 
				<td align="left"><%=date%></td>
				<td style="text-align: left;"><%=applicationname%></td>
				<td style="text-align: right;"><%=time%></td>
				

			</tr>

			<%
			
							}
								else{
									if(sub_series_list.equalsIgnoreCase(series_name_2_1ad)) 
									{
										 Total_Average=""+rs.getString("Total_Average");
										 date = "" + rs.getString("date");
										if(date.equalsIgnoreCase("") || date.equalsIgnoreCase("null") || date.equalsIgnoreCase(null)){
											date="";
										}
										date = date.trim();
																	
									String	 Hostname = "" + rs.getString("Hostname");
											if(Hostname.equalsIgnoreCase("") || Hostname.equalsIgnoreCase("null") || Hostname.equalsIgnoreCase(null)){
												Hostname="";
											}
											Hostname = Hostname.trim();
											
											String	IPaddress = "" + rs.getString("IPaddress");
												if(IPaddress.equalsIgnoreCase("") || IPaddress.equalsIgnoreCase("null") || IPaddress.equalsIgnoreCase(null)){
													IPaddress="";
												}
												IPaddress = IPaddress.trim();
												
												
												String	Data_Center = "" + rs.getString("Data_Center");
													if(Data_Center.equalsIgnoreCase("") || Data_Center.equalsIgnoreCase("null") || Data_Center.equalsIgnoreCase(null)){
														Data_Center="";
													}
													Data_Center = Data_Center.trim();
													String	Application_name = "" + rs.getString("Application_name");
													if(Application_name.equalsIgnoreCase("") || Application_name.equalsIgnoreCase("null") || Application_name.equalsIgnoreCase(null)){
														Application_name="";
													}
													Application_name = Application_name.trim();
													String	display_name = "" + rs.getString("display_name");
													if(display_name.equalsIgnoreCase("") || display_name.equalsIgnoreCase("null") || display_name.equalsIgnoreCase(null)){
														display_name="";
													}
													display_name = display_name.trim();
													
													
													String	Process_name = "" + rs.getString("Process_name");
													if(Process_name.equalsIgnoreCase("") || Process_name.equalsIgnoreCase("null") || Process_name.equalsIgnoreCase(null)){
														Process_name="";
													}
													Process_name = Process_name.trim();
													
													
													String	Process_Availability = "" + rs.getString("Process_Availability");
													if(Process_Availability.equalsIgnoreCase("") || Process_Availability.equalsIgnoreCase("null") || Process_Availability.equalsIgnoreCase(null)){
														Process_Availability="";
													}
													Process_Availability =Process_Availability.trim();
													
													
													String	Overall_Availability = "" + rs.getString("Overall_Availability");
													if(Overall_Availability.equalsIgnoreCase("") || Overall_Availability.equalsIgnoreCase("null") || Overall_Availability.equalsIgnoreCase(null)){
														Overall_Availability="";
													}
													Overall_Availability =Overall_Availability.trim();
													%>
							<tr>
								<td style="text-align: center" ><%=(i + 1)%></td>	
								<td style='width: 5px;'><%=date%></td>
								<td><%=Hostname%></td>
								<td><%=IPaddress%></td>
								<td style='text-align: right;'><%=Data_Center%></td>
								<td style='text-align: Center; width: 10px'><%=Application_name%></td>
								<td style='text-align: Center; width: 10px'><%=display_name%></td>
								<td style='text-align: Center; width: 10px'><%=Process_name%></td>
								<td style='text-align: Center; width: 10px'><%=Process_Availability%></td>
								<td style='text-align: Center; width: 10px'><%=Overall_Availability%></td>
							</tr>

							<% 
								
										}

							if(sub_series_list.equalsIgnoreCase(series_name_2_1bd)) 
									{
								

								 Total_Average=""+rs.getString("Total_Average");
								 date = "" + rs.getString("date");
								if(date.equalsIgnoreCase("") || date.equalsIgnoreCase("null") || date.equalsIgnoreCase(null)){
									date="";
								}
								date = date.trim();
															
							String	 Hostname = "" + rs.getString("Hostname");
									if(Hostname.equalsIgnoreCase("") || Hostname.equalsIgnoreCase("null") || Hostname.equalsIgnoreCase(null)){
										Hostname="";
									}
									Hostname = Hostname.trim();
									
									String	IPaddress = "" + rs.getString("IPaddress");
										if(IPaddress.equalsIgnoreCase("") || IPaddress.equalsIgnoreCase("null") || IPaddress.equalsIgnoreCase(null)){
											IPaddress="";
										}
										IPaddress = IPaddress.trim();
										
										
										String	Data_Center = "" + rs.getString("Data_Center");
											if(Data_Center.equalsIgnoreCase("") || Data_Center.equalsIgnoreCase("null") || Data_Center.equalsIgnoreCase(null)){
												Data_Center="";
											}
											Data_Center = Data_Center.trim();
											String	Application_name = "" + rs.getString("Application_name");
											if(Application_name.equalsIgnoreCase("") || Application_name.equalsIgnoreCase("null") || Application_name.equalsIgnoreCase(null)){
												Application_name="";
											}
											Application_name = Application_name.trim();
											
											
											
											String	Process_name = "" + rs.getString("Process_name");
											if(Process_name.equalsIgnoreCase("") || Process_name.equalsIgnoreCase("null") || Process_name.equalsIgnoreCase(null)){
												Process_name="";
											}
											Process_name = Process_name.trim();
											
											
											String	Process_Availability = "" + rs.getString("Process_Availability");
											if(Process_Availability.equalsIgnoreCase("") || Process_Availability.equalsIgnoreCase("null") || Process_Availability.equalsIgnoreCase(null)){
												Process_Availability="";
											}
											Process_Availability =Process_Availability.trim();
											
											
											String	Overall_Availability = "" + rs.getString("Overall_Availability");
											if(Overall_Availability.equalsIgnoreCase("") || Overall_Availability.equalsIgnoreCase("null") || Overall_Availability.equalsIgnoreCase(null)){
												Overall_Availability="";
											}
											Overall_Availability =Overall_Availability.trim();
											
											
											
											%>
											<tr>
								<td style="text-align: center" ><%=(i + 1)%></td>	
								<td style='width: 5px;'><%=date%></td>
								<td><%=Hostname%></td>
								<td><%=IPaddress%></td>
								<td style='text-align: right;'><%=Data_Center%></td>
								<td style='text-align: Center; width: 10px'><%=Application_name%></td>
								
								<td style='text-align: Center; width: 10px'><%=Process_name%></td>
								<td style='text-align: Center; width: 10px'><%=Process_Availability%></td>
								<td style='text-align: Center; width: 10px'><%=Overall_Availability%></td>
							</tr>
											
											<% 
							
									
								}
								}
			
			i++;
								}
							
							
							
								
							}

						}

	}
					
				 catch (Exception e) {

				}
			%>



		</tbody>
		<tfoot><tr><th colspan="5" style="text-align: left;">Overall-Average</th><th style="text-align: right;"><%=Total_Average%></th></tr></tfoot>
	</table>
</div>
<div style="margin-bottom:50%;"></div>
