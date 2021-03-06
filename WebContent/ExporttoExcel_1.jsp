<%@ page language="java"
	import="org.cloudme.sample.aes.AesUtil,java.util.ResourceBundle,java.sql.Statement,java.sql.SQLException,Database.*,java.sql.ResultSet,java.text.DateFormat,java.sql.Connection,java.util.*,java.util.Date,java.text.DecimalFormat,java.text.SimpleDateFormat"%>


	<%
	
	
	String ses_cond="",uname="";
	String cond="";
	String uid=request.getParameter("uid");	
	String fdate=request.getParameter("fdate");
	String sub_series_list=request.getParameter("sub_series_list");
		
			String sname=""+request.getParameter("sname");
			String tdate=request.getParameter("tdate");
	
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
		href="ExporttoExcel_1.jsp?sname=<%=sname%>&fdate=<%=fdate%>&tdate=<%=tdate%>&sub_series_list=<%=sub_series_list%>&uid=<%=uid%>&exportToExcel=YES" >Export to Excel</a></b></li>
				</ul>
			</div>
		</div>
	</div>
	
<section class="content_b">
		<div class="row">
			<div class="col-md-12">
		
	<%
		}
	ResourceBundle resource = ResourceBundle.getBundle("commonvariables");
	String series_name_1_1ad=resource.getString("series_name_1_1a");
	String series_name_1_1bd=resource.getString("series_name_1_1b");
	String series_name_1_2d=resource.getString("series_name_1_2");
	String series_name_1_3d=resource.getString("series_name_1_3");
	String series_name_1_4d=resource.getString("series_name_1_4");
	String series_name_1_5d=resource.getString("series_name_1_5");
	String series_name_1_6d=resource.getString("series_name_1_6");
	String series_name_1_7d=resource.getString("series_name_1_7");
	String series_name_1_8d=resource.getString("series_name_1_8");
	String series_name_1_9d=resource.getString("series_name_1_9");
	String series_name_1_10d=resource.getString("series_name_1_10");
	String series_name_1_11d=resource.getString("series_name_1_11");		
	String series_name_1_12d=resource.getString("series_name_1_12");
	if(!fdate.equalsIgnoreCase("")){
		if(!sub_series_list.equalsIgnoreCase(series_name_1_1ad) &&!sub_series_list.equalsIgnoreCase(series_name_1_1bd) &&!sub_series_list.equalsIgnoreCase(series_name_1_2d) && !sub_series_list.equalsIgnoreCase(series_name_1_8d) && !sub_series_list.equalsIgnoreCase(series_name_1_9d) && !sub_series_list.equalsIgnoreCase(series_name_1_12d)) { 
			
			cond=cond+" and CAST(CONVERT(char(10),dt,126) AS DATE) >= CAST(CONVERT(char(10), '"+fdate+"',126) AS DATE)";
			}else {
				if(sub_series_list.equalsIgnoreCase(series_name_1_8d) || sub_series_list.equalsIgnoreCase(series_name_1_9d)) {
				cond=cond+" and CAST(CONVERT(char(10),insertdate,126) AS DATE) >= CAST(CONVERT(char(10), '"+fdate+"',126) AS DATE)";
				}
				else if(sub_series_list.equalsIgnoreCase(series_name_1_2d) ) {
					cond=cond+" and CAST(CONVERT(char(10),date,126) AS DATE) >= CAST(CONVERT(char(10), '"+fdate+"',126) AS DATE)";
					}
				else if(sub_series_list.equalsIgnoreCase(series_name_1_12d) ) {
					cond=cond+" and CAST(CONVERT(char(10),createdate,126) AS DATE) >= CAST(CONVERT(char(10), '"+fdate+"',126) AS DATE)";
					}
				else if( sub_series_list.equalsIgnoreCase(series_name_1_1bd) || sub_series_list.equalsIgnoreCase(series_name_1_1ad) ) {
					cond=cond+" and CAST(CONVERT(char(10),createdate,126) AS DATE) >= CAST(CONVERT(char(10), '"+fdate+"',126) AS DATE)";
					}
				else if(sub_series_list.equalsIgnoreCase(series_name_1_12d) ) {
					cond=cond+" and CAST(CONVERT(char(10),createdate,126) AS DATE) >= CAST(CONVERT(char(10), '"+fdate+"',126) AS DATE)";
					}
			}
	}
	
	if(!tdate.equalsIgnoreCase("")){
		if(!sub_series_list.equalsIgnoreCase(series_name_1_1ad) &&!sub_series_list.equalsIgnoreCase(series_name_1_1bd) &&!sub_series_list.equalsIgnoreCase(series_name_1_2d) &&  !sub_series_list.equalsIgnoreCase(series_name_1_8d) && !sub_series_list.equalsIgnoreCase(series_name_1_9d)) { 
			cond=cond+" and CAST(CONVERT(char(10),dt,126) AS DATE)<= CAST(CONVERT(char(10), '"+tdate+"',126) AS DATE)";
			}else {
				if(sub_series_list.equalsIgnoreCase(series_name_1_8d) || sub_series_list.equalsIgnoreCase(series_name_1_9d)) {
				cond=cond+" and CAST(CONVERT(char(10),insertdate,126) AS DATE)<= CAST(CONVERT(char(10), '"+tdate+"',126) AS DATE)";
				}
				else if(sub_series_list.equalsIgnoreCase(series_name_1_2d) ) {
					cond=cond+" and CAST(CONVERT(char(10),date,126) AS DATE) <=  CAST(CONVERT(char(10), '"+tdate+"',126) AS DATE)";
				}
				else if(sub_series_list.equalsIgnoreCase(series_name_1_12d) ) {
					cond=cond+" and CAST(CONVERT(char(10),createdate,126) AS DATE)  <= CAST(CONVERT(char(10), '"+tdate+"',126) AS DATE)";
					}
				else if( sub_series_list.equalsIgnoreCase(series_name_1_1bd) || sub_series_list.equalsIgnoreCase(series_name_1_1ad) ) {
					cond=cond+" and CAST(CONVERT(char(10),createdate,126) AS DATE)  <= CAST(CONVERT(char(10), '"+tdate+"',126) AS DATE)";
					}
				else if(sub_series_list.equalsIgnoreCase(series_name_1_12d) ) {
					cond=cond+" and CAST(CONVERT(char(10),createdate,126) AS DATE) <= CAST(CONVERT(char(10), '"+tdate+"',126) AS DATE)";
					}
			}
	}
	Database db = new Database();
	Database1 db1 = new Database1();
	
	String Total_Average="";
	String Totuniquecamcnt="",Total_online_camcnt="",Total_offline_ccnt="",Total_ratio_ccnt="",datedt="" ,query="",Avg_DisplayFPS="",unique_Camera_Count="",Online_Camera_Count="",Offline_Camera_Count="",Ratio_Live_Camera="",Location="";
	String percentag="",bad="",good="",SystemIP="",dt="",offline="";
	String	uptime="",online="",name="",datetime="";
	Connection con = null,con1=null,con2=null;
	
	
	con = db.connection_get();
	con1 = db1.connection_get();
	con2 = db.connection_get();
	
if(con2!=null){
	String uquery="select OfficerName,MobileNo,role from dbo.mastr_user where IsActive=1 and id="+uid+"";
	
	ResultSet userrs=db.SelectData(uquery, con2); 
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

		<thead>
		<% if((!sub_series_list.equalsIgnoreCase(series_name_1_1ad) &&!sub_series_list.equalsIgnoreCase(series_name_1_1bd) &&!sub_series_list.equalsIgnoreCase(series_name_1_2d) &&   !sub_series_list.equalsIgnoreCase(series_name_1_8d)) && (!sub_series_list.equalsIgnoreCase(series_name_1_9d)) && (!sub_series_list.equalsIgnoreCase(series_name_1_12d)) ){
					 
				 %><tr><th class="text-center">Sl.No</th><th class="text-center;">System  IPaddress</th><th class="text-center">AVG-Display FPS</th><th class="text-center">Unique</th><th class="text-center">Online </th><th class="text-center">Offline</th><th class="text-center">Ratio Live Camera </th><th class="text-center">Location</th> <th>Date</th></tr></thead><tbody><% 
				}else{
					if((sub_series_list.equalsIgnoreCase(series_name_1_8d))) {
					%><tr><th class="text-center" style="width:5%;">Sl.No</th><th class="text-center"  style="width:13%;">Date Time</th><th class="text-center">Name</th><th class="text-center">Online</th><th class="text-center">Offline</th><th class="text-center">Uptime(%)</th> </tr></thead><tbody>
					<%
					}else if((sub_series_list.equalsIgnoreCase(series_name_1_9d))) {
						%><tr><th class="text-center" style="width:5%;">Sl.No</th><th class="text-center">System IP</th><th class="text-center">Good</th><th class="text-center">Bad</th><th class="text-center">Date</th><th class="text-center">Percentage</th> </tr></thead><tbody><%	
					}
					else if((sub_series_list.equalsIgnoreCase(series_name_1_2d))) {
						%><tr><th class="text-center" style="width:5%;">Sl.No</th><th class="text-center">Date</th><th class="text-center">Start Time</th><th class="text-center">End Time</th><th class="text-center">Total No. of Camera</th><th class="text-center">Online Camera</th><th class="text-center">Offline Camera</th><th class="text-center">Live(%)</th> </tr></thead><tbody><%	
					}
					else if((sub_series_list.equalsIgnoreCase(series_name_1_1ad)) || (sub_series_list.equalsIgnoreCase(series_name_1_1bd))) {
					%><tr><th class="text-center" style="width:5%;">Sl.No</th><th class="text-center">Camera IP</th><th class="text-center">Region</th><th class="text-center">Zone</th><th class="text-center">Police Station</th><th class="text-center">Camera Name</th><th class="text-center">Camera Type</th><th class="text-center">Connection Type</th><th class="text-center">Camera Status</th><th class="text-center">Start Time</th><th class="text-center">End Time</th></tr></thead><tbody><% 
					}
				}
					%>
		
		
		
	<%	
	
	try {
				System.out.println("con"+con);
				if (con1 != null) {
				
				if(sub_series_list.equalsIgnoreCase(series_name_1_2d)) 
				{									
		
			query =  "SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (Avg as Float) ) / COUNT(*), 2)) ) avg  from [camera_Status_Avg] where isnull(id,'')!=''  "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY id Desc) AS rownumber,  date,RIGHT(Convert(VARCHAR(20), StartTime, 0) ,9)StartTime,RIGHT(Convert(VARCHAR(20), EndTime, 0) ,9) EndTime,TotalCount,onlineCount,OfflineCount,Avg 	FROM   [camera_Status_Avg] where isnull(id,'')!='' "+cond+" 	) AS tbl 	";
				
				}
				else	if(sub_series_list.equalsIgnoreCase(series_name_1_1ad) || sub_series_list.equalsIgnoreCase(series_name_1_1bd)) 
				{									
					query =  "SELECT  * 	FROM   ( SELECT      COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY id Desc) AS rownumber,  CameraIP, Region, Zone, PS, Cameraname, CameraType, Connectiontype, CameraStatus, StartTIme, EndTime 	FROM   [CAMSTS] where isnull(id,'')!='' "+cond+" 	) AS tbl 	";
			
				
				}
				ResultSet rs = db1.SelectData(query, con1);
				int i = 0;
				
				if (rs != null) {
					while (rs.next()) {
						String	Rcount = "" + rs.getString("Rcount");
						if(Rcount.equalsIgnoreCase("") || Rcount.equalsIgnoreCase("null") || Rcount.equalsIgnoreCase(null)){
							Rcount="";
						}
						String	rownumber = "" + rs.getString("rownumber");
						if(rownumber.equalsIgnoreCase("") || rownumber.equalsIgnoreCase("null") || rownumber.equalsIgnoreCase(null)){
							rownumber="";
						}
						
						if(sub_series_list.equalsIgnoreCase(series_name_1_2d)) 
						{									
						 Total_Average = "" + rs.getString("Total_Average");
						if(Total_Average.equalsIgnoreCase("") || Total_Average.equalsIgnoreCase("null") || Total_Average.equalsIgnoreCase(null)){
							Total_Average="";
						}
						
					
						String	date = "" + rs.getString("date");
						if(date.equalsIgnoreCase("") || date.equalsIgnoreCase("null") || date.equalsIgnoreCase(null)){
							date="";
						}
						String	StartTime = "" + rs.getString("StartTime");
						if(StartTime.equalsIgnoreCase("") || StartTime.equalsIgnoreCase("null") || StartTime.equalsIgnoreCase(null)){
							StartTime="";
						}
						String	EndTime = "" + rs.getString("EndTime");
						if(EndTime.equalsIgnoreCase("") || EndTime.equalsIgnoreCase("null") || EndTime.equalsIgnoreCase(null)){
							EndTime="";
						}
						String	TotalCount = "" + rs.getString("TotalCount");
						if(TotalCount.equalsIgnoreCase("") || TotalCount.equalsIgnoreCase("null") || TotalCount.equalsIgnoreCase(null)){
							TotalCount="";
						}
						String	onlineCount = "" + rs.getString("onlineCount");
						if(onlineCount.equalsIgnoreCase("") || onlineCount.equalsIgnoreCase("null") || onlineCount.equalsIgnoreCase(null)){
							onlineCount="";
						}
						
						String	OfflineCount = "" + rs.getString("OfflineCount");
						if(OfflineCount.equalsIgnoreCase("") || OfflineCount.equalsIgnoreCase("null") || OfflineCount.equalsIgnoreCase(null)){
							OfflineCount="";
						}
						String	Avg = "" + rs.getString("Avg");
						if(Avg.equalsIgnoreCase("") || Avg.equalsIgnoreCase("null") || Avg.equalsIgnoreCase(null)){
							Avg="";
						}
						
						%><tr><td style="text-align: center" ><%=(i + 1)%></td>
						
						<td style='width: 20px'><%=date%></td>
						<td><%=StartTime%></td>
						<td style='text-align: Center;'><%=EndTime%></td>
						<td style='text-align: Center;'><%=TotalCount%></td>
						<td style='text-align: Center;'><%=onlineCount%></td>
						<td style='text-align: Center;'><%=OfflineCount%></td>
						<td style='text-align: Center;'><%=Avg%></td>
						


	</tr>

						<%


						
						}
						else	if(sub_series_list.equalsIgnoreCase(series_name_1_1ad) || sub_series_list.equalsIgnoreCase(series_name_1_1bd)) 
						{									
					
							
							String	CameraIP = "" + rs.getString("CameraIP");
							if(CameraIP.equalsIgnoreCase("") || CameraIP.equalsIgnoreCase("null") || CameraIP.equalsIgnoreCase(null)){
								CameraIP="";
							}
							
							String	Region = "" + rs.getString("Region");
							if(Region.equalsIgnoreCase("") || Region.equalsIgnoreCase("null") || Region.equalsIgnoreCase(null)){
								Region="";
							}
							
							String	Zone = "" + rs.getString("Zone");
							if(Zone.equalsIgnoreCase("") || Zone.equalsIgnoreCase("null") || Zone.equalsIgnoreCase(null)){
								Zone="";
							}
							
							String	PS = "" + rs.getString("PS");
							if(PS.equalsIgnoreCase("") || PS.equalsIgnoreCase("null") || PS.equalsIgnoreCase(null)){
								PS="";
							}
							String	Cameraname = "" + rs.getString("Cameraname");
							if(Cameraname.equalsIgnoreCase("") || Cameraname.equalsIgnoreCase("null") || Cameraname.equalsIgnoreCase(null)){
								Cameraname="";
							}
						
							String	CameraType = "" + rs.getString("CameraType");
							if(CameraType.equalsIgnoreCase("") || CameraType.equalsIgnoreCase("null") || CameraType.equalsIgnoreCase(null)){
								CameraType="";
							}
							String	Connectiontype = "" + rs.getString("Connectiontype");
							if(Connectiontype.equalsIgnoreCase("") || Connectiontype.equalsIgnoreCase("null") || Connectiontype.equalsIgnoreCase(null)){
								Connectiontype="";
							}
							String	CameraStatus = "" + rs.getString("CameraStatus");
							if(CameraStatus.equalsIgnoreCase("") || CameraStatus.equalsIgnoreCase("null") || CameraStatus.equalsIgnoreCase(null)){
								CameraStatus="";
							}
							String	StartTIme = "" + rs.getString("StartTIme");
							if(StartTIme.equalsIgnoreCase("") || StartTIme.equalsIgnoreCase("null") || StartTIme.equalsIgnoreCase(null)){
								StartTIme="";
							}
							String	EndTime = "" + rs.getString("EndTime");
							if(EndTime.equalsIgnoreCase("") || EndTime.equalsIgnoreCase("null") || EndTime.equalsIgnoreCase(null)){
								EndTime="";
							}
							
							
							%>
							
							<tr><td style="text-align: center" ><%=(i + 1)%></td>
						<td style='width:20px'><%=CameraIP%></td><td ><%=Region%></td>
						<td style='text-align:Center;'><%=Zone%></td>
						<td style='text-align:Center;'><%=PS%></td>
						<td style='text-align:Center;width:10%;'><%=Cameraname%></td>
						<td style='text-align:Center;width:10%;'><%=CameraType%></td>
						<td style='text-align:Center;width:10%;'><%=Connectiontype%></td>
						<td style='text-align:Center;width:10%;'><%=CameraStatus%></td>
						<td style='text-align:Center;width:10%;'><%=StartTIme%></td>
						<td style='text-align:Center;width:10%;'><%=EndTime%></td></tr>
							<%
						}
						
						i++;	
						
					}
				}
				
				}
		if (con != null) {
			
			if(sub_series_list.equalsIgnoreCase(series_name_1_3d)) 
			{									
	
		query =  " SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (unique_Camera_Count as Float) ) / COUNT(*), 2)) )avg   from  dbo.CSV_AVG  where Location='CP_Office'  "+cond+" )Totuniquecamcnt ,  "
			+"	 (select convert(numeric(10,2),( ROUND(SUM( cast (Online_Camera_Count as Float) ) / COUNT(*), 2)) ) avg  from  CSV_AVG where Location='CP_Office'   "+cond+"  )Total_online_camcnt ,  " 
			+"		 (select ( ROUND(SUM( cast (Offline_Camera_Count as Float) ) / COUNT(*), 2)) avg  from CSV_AVG where Location='CP_Office'  "+cond+" )Total_offline_ccnt ,  "  
				+"	 (select ( ROUND(SUM( cast (Ratio_Live_Camera as Float) ) / COUNT(*), 2)) avg  from CSV_AVG where Location='CP_Office' "+cond+" )Total_ratio_ccnt ,   "
				 +"	COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY id Desc) AS rownumber,SystemIP,Avg_DisplayFPS,unique_Camera_Count,Online_Camera_Count,Offline_Camera_Count,Ratio_Live_Camera,Location ,convert(varchar(10),dt,101)dt	FROM  CSV_AVG where Location='CP_Office' "+cond+"	) AS tbl ";
			}
	
	if(sub_series_list.equalsIgnoreCase(series_name_1_4d)) 
	{									

query =  " SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (unique_Camera_Count as Float) ) / COUNT(*), 2)) )avg   from  dbo.CSV_AVG  where Location='CP_Office'  "+cond+" )Totuniquecamcnt ,  "
	+"	 (select convert(numeric(10,2),( ROUND(SUM( cast (Online_Camera_Count as Float) ) / COUNT(*), 2)) ) avg  from  CSV_AVG where Location='Second_CC'   "+cond+"  )Total_online_camcnt ,  " 
	+"		 (select ( ROUND(SUM( cast (Offline_Camera_Count as Float) ) / COUNT(*), 2)) avg  from CSV_AVG where Location='Second_CC'  "+cond+" )Total_offline_ccnt ,  "  
		+"	 (select ( ROUND(SUM( cast (Ratio_Live_Camera as Float) ) / COUNT(*), 2)) avg  from CSV_AVG where Location='Second_CC' "+cond+" )Total_ratio_ccnt ,   "
		 +"	COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY id Desc) AS rownumber,SystemIP,Avg_DisplayFPS,unique_Camera_Count,Online_Camera_Count,Offline_Camera_Count,Ratio_Live_Camera,Location ,convert(varchar(10),dt,101)dt	FROM  CSV_AVG where Location='Second_CC' "+cond+"	) AS tbl 	";
	}
	if(sub_series_list.equalsIgnoreCase(series_name_1_5d)) 
	{									

query =  " SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (unique_Camera_Count as Float) ) / COUNT(*), 2)) )avg   from  dbo.CSV_AVG  where Location='Traffic_CC'  "+cond+" )Totuniquecamcnt ,  "
	+"	 (select convert(numeric(10,2),( ROUND(SUM( cast (Online_Camera_Count as Float) ) / COUNT(*), 2)) ) avg  from  CSV_AVG where Location='Traffic_CC'   "+cond+"  )Total_online_camcnt ,  " 
	+"		 (select ( ROUND(SUM( cast (Offline_Camera_Count as Float) ) / COUNT(*), 2)) avg  from CSV_AVG where Location='Traffic_CC'  "+cond+" )Total_offline_ccnt ,  "  
		+"	 (select ( ROUND(SUM( cast (Ratio_Live_Camera as Float) ) / COUNT(*), 2)) avg  from CSV_AVG where Location='Traffic_CC' "+cond+" )Total_ratio_ccnt ,   "
		 +"	COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY id Desc) AS rownumber,SystemIP,Avg_DisplayFPS,unique_Camera_Count,Online_Camera_Count,Offline_Camera_Count,Ratio_Live_Camera,Location ,convert(varchar(10),dt,101)dt	FROM  CSV_AVG where Location='Traffic_CC' "+cond+"	) AS tbl 	";
	}
	if(sub_series_list.equalsIgnoreCase(series_name_1_6d)) 
	{									

query =  " SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (unique_Camera_Count as Float) ) / COUNT(*), 2)) )avg   from  dbo.CSV_AVG  where Location like '%RVC_ZVC%'  "+cond+" )Totuniquecamcnt ,  "
	+"	 (select convert(numeric(10,2),( ROUND(SUM( cast (Online_Camera_Count as Float) ) / COUNT(*), 2)) ) avg  from  CSV_AVG where Location like '%RVC_ZVC%'   "+cond+"  )Total_online_camcnt ,  " 
	+"		 (select ( ROUND(SUM( cast (Offline_Camera_Count as Float) ) / COUNT(*), 2)) avg  from CSV_AVG where Location like '%RVC_ZVC%'  "+cond+" )Total_offline_ccnt ,  "  
		+"	 (select ( ROUND(SUM( cast (Ratio_Live_Camera as Float) ) / COUNT(*), 2)) avg  from CSV_AVG where Location like '%RVC_ZVC%' "+cond+" )Total_ratio_ccnt ,   "
		 +"	COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY id Desc) AS rownumber,SystemIP,Avg_DisplayFPS,unique_Camera_Count,Online_Camera_Count,Offline_Camera_Count,Ratio_Live_Camera,Location ,convert(varchar(10),dt,101)dt	FROM  CSV_AVG where Location like '%RVC_ZVC%' "+cond+"	) AS tbl ";
	}
	if(sub_series_list.equalsIgnoreCase(series_name_1_7d)) 
	{									

query =  " SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (unique_Camera_Count as Float) ) / COUNT(*), 2)) )avg   from  dbo.CSV_AVG  where Location='PS_All'  "+cond+" )Totuniquecamcnt ,  "
	+"	 (select convert(numeric(10,2),( ROUND(SUM( cast (Online_Camera_Count as Float) ) / COUNT(*), 2)) ) avg  from  CSV_AVG where Location='PS_All'   "+cond+"  )Total_online_camcnt ,  " 
	+"		 (select ( ROUND(SUM( cast (Offline_Camera_Count as Float) ) / COUNT(*), 2)) avg  from CSV_AVG where Location='PS_All'  "+cond+" )Total_offline_ccnt ,  "  
		+"	 (select ( ROUND(SUM( cast (Ratio_Live_Camera as Float) ) / COUNT(*), 2)) avg  from CSV_AVG where Location='PS_All' "+cond+" )Total_ratio_ccnt ,   "
		 +"	COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY id Desc) AS rownumber,SystemIP,Avg_DisplayFPS,unique_Camera_Count,Online_Camera_Count,Offline_Camera_Count,Ratio_Live_Camera,Location ,convert(varchar(10),dt,101)dt	FROM  CSV_AVG where Location='PS_All' "+cond+"	) AS tbl 	";
	}
	if(sub_series_list.equalsIgnoreCase(series_name_1_10d)) 
	{									

query =  " SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (unique_Camera_Count as Float) ) / COUNT(*), 2)) )avg   from  dbo.CSV_AVG  where Location='CP_Office'  "+cond+" )Totuniquecamcnt ,  "
	+"	 (select convert(numeric(10,2),( ROUND(SUM( cast (Online_Camera_Count as Float) ) / COUNT(*), 2)) ) avg  from  CSV_AVG where Location='CP_Office'   "+cond+"  )Total_online_camcnt ,  " 
	+"		 (select ( ROUND(SUM( cast (Offline_Camera_Count as Float) ) / COUNT(*), 2)) avg  from CSV_AVG where Location='CP_Office'  "+cond+" )Total_offline_ccnt ,  "  
		+"	 (select ( ROUND(SUM( cast (Ratio_Live_Camera as Float) ) / COUNT(*), 2)) avg  from CSV_AVG where Location='CP_Office' "+cond+" )Total_ratio_ccnt ,   "
		 +"	COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY id Desc) AS rownumber,SystemIP,Avg_DisplayFPS,unique_Camera_Count,Online_Camera_Count,Offline_Camera_Count,Ratio_Live_Camera,Location ,convert(varchar(10),dt,101)dt	FROM  CSV_AVG where Location='CP_Office' "+cond+"	) AS tbl ";
	}
	if(sub_series_list.equalsIgnoreCase(series_name_1_11d)) 
	{									

query =  " SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (unique_Camera_Count as Float) ) / COUNT(*), 2)) )avg   from  dbo.CSV_AVG  where Location='DC1_DC2_A'  "+cond+" )Totuniquecamcnt ,  "
	+"	 (select convert(numeric(10,2),( ROUND(SUM( cast (Online_Camera_Count as Float) ) / COUNT(*), 2)) ) avg  from  CSV_AVG where Location='DC1_DC2_A'   "+cond+"  )Total_online_camcnt ,  " 
	+"		 (select ( ROUND(SUM( cast (Offline_Camera_Count as Float) ) / COUNT(*), 2)) avg  from CSV_AVG where Location='DC1_DC2_A'  "+cond+" )Total_offline_ccnt ,  "  
		+"	 (select ( ROUND(SUM( cast (Ratio_Live_Camera as Float) ) / COUNT(*), 2)) avg  from CSV_AVG where Location='DC1_DC2_A' "+cond+" )Total_ratio_ccnt ,   "
		 +"	COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY id Desc) AS rownumber,SystemIP,Avg_DisplayFPS,unique_Camera_Count,Online_Camera_Count,Offline_Camera_Count,Ratio_Live_Camera,Location ,convert(varchar(10),dt,101)dt	FROM  CSV_AVG where Location='DC1_DC2_A' "+cond+"	) AS tbl ";
	}
	if(sub_series_list.equalsIgnoreCase(series_name_1_12d)) 
	{									

query =  " SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (unique_Camera_Count as Float) ) / COUNT(*), 2)) )avg   from  dbo.CSV_AVG  where Location='DC1_DC2_B'  "+cond+" )Totuniquecamcnt ,  "
	+"	 (select convert(numeric(10,2),( ROUND(SUM( cast (Online_Camera_Count as Float) ) / COUNT(*), 2)) ) avg  from  CSV_AVG where Location='DC1_DC2_B'   "+cond+"  )Total_online_camcnt ,  " 
	+"		 (select ( ROUND(SUM( cast (Offline_Camera_Count as Float) ) / COUNT(*), 2)) avg  from CSV_AVG where Location='DC1_DC2_B'  "+cond+" )Total_offline_ccnt ,  "  
		+"	 (select ( ROUND(SUM( cast (Ratio_Live_Camera as Float) ) / COUNT(*), 2)) avg  from CSV_AVG where Location='DC1_DC2_B' "+cond+" )Total_ratio_ccnt ,   "
		 +"	COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY id Desc) AS rownumber,SystemIP,Avg_DisplayFPS,unique_Camera_Count,Online_Camera_Count,Offline_Camera_Count,Ratio_Live_Camera,Location ,convert(varchar(10),dt,101)dt	FROM  CSV_AVG where Location='DC1_DC2_B' "+cond+"	) AS tbl 	";
	}
	
	
	if(sub_series_list.equalsIgnoreCase(series_name_1_8d)) 
	{									

	query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (uptime as Float) ) / COUNT(*), 2)) ) avg  from MobileVan where isnull(id,'')!='' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY id Desc) AS rownumber, datetime,name,online,offline,uptime "
			+"	FROM   MobileVan where isnull(id,'')!='' "+cond+" " 
	       +"	) AS tbl ";
	
	}
	
	if(sub_series_list.equalsIgnoreCase(series_name_1_9d)) 
	{									

	query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (percentag as Float) ) / COUNT(*), 2)) ) avg  from qualityvideofields where isnull(id,'')!='' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY id Desc) AS rownumber, SystemIP,good,bad,dt,percentag "
			+"	FROM   qualityvideofields where isnull(id,'')!='' "+cond+" " 
	       +"	) AS tbl ";
	
	}
			
			ResultSet rs=db.SelectData(query, con); 
			System.out.println(">>rs.isBeforeFirst"+rs.getFetchSize());
						if (!rs.isBeforeFirst()) {
							System.out.println(">>if");
			%><tr>
				<td colspan="10">No Data Found</td>
			</tr>
			<%
				} else {
							int i = 0;
							while (rs.next()) {
								if(!sub_series_list.equalsIgnoreCase(series_name_1_8d) && !sub_series_list.equalsIgnoreCase(series_name_1_9d)) { 
									datedt = "" + rs.getString("dt");
									if(datedt.equalsIgnoreCase("") || datedt.equalsIgnoreCase("null") || datedt.equalsIgnoreCase(null)){
										datedt="";
									}
									Totuniquecamcnt = "" + rs.getString("Totuniquecamcnt");
									if(Totuniquecamcnt.equalsIgnoreCase("") || Totuniquecamcnt.equalsIgnoreCase("null") || Totuniquecamcnt.equalsIgnoreCase(null)){
										Totuniquecamcnt="";
									}
									Totuniquecamcnt = Totuniquecamcnt.trim();
									Total_online_camcnt = "" + rs.getString("Total_online_camcnt");
									if(Total_online_camcnt.equalsIgnoreCase("") || Total_online_camcnt.equalsIgnoreCase("null") || Total_online_camcnt.equalsIgnoreCase(null)){
										Total_online_camcnt="";
									}
									Total_online_camcnt = Total_online_camcnt.trim();
									Total_offline_ccnt = "" + rs.getString("Total_offline_ccnt");
									if(Total_offline_ccnt.equalsIgnoreCase("") || Total_offline_ccnt.equalsIgnoreCase("null") || Total_offline_ccnt.equalsIgnoreCase(null)){
										Total_offline_ccnt="";
									}
									Total_offline_ccnt = Total_offline_ccnt.trim();
									
									Total_ratio_ccnt = "" + rs.getString("Total_ratio_ccnt");
									if(Total_ratio_ccnt.equalsIgnoreCase("") || Total_ratio_ccnt.equalsIgnoreCase("null") || Total_ratio_ccnt.equalsIgnoreCase(null)){
										Total_ratio_ccnt="";
									}
									Total_ratio_ccnt = Total_ratio_ccnt.trim();
									SystemIP = "" + rs.getString("SystemIP");
									if(SystemIP.equalsIgnoreCase("") || SystemIP.equalsIgnoreCase("null") || SystemIP.equalsIgnoreCase(null)){
										SystemIP="";
									}
									SystemIP = SystemIP.trim();			
									Avg_DisplayFPS = "" + rs.getString("Avg_DisplayFPS");
									if(Avg_DisplayFPS.equalsIgnoreCase("") || Avg_DisplayFPS.equalsIgnoreCase("null") || Avg_DisplayFPS.equalsIgnoreCase(null)){
										Avg_DisplayFPS="";
									}
									Avg_DisplayFPS = Avg_DisplayFPS.trim();			
									unique_Camera_Count = "" + rs.getString("unique_Camera_Count");
									if(unique_Camera_Count.equalsIgnoreCase("") || unique_Camera_Count.equalsIgnoreCase("null") || unique_Camera_Count.equalsIgnoreCase(null)){
										unique_Camera_Count="";
									}
									unique_Camera_Count = unique_Camera_Count.trim();			
									Online_Camera_Count = "" + rs.getString("Online_Camera_Count");
									if(Online_Camera_Count.equalsIgnoreCase("") || Online_Camera_Count.equalsIgnoreCase("null") || Online_Camera_Count.equalsIgnoreCase(null)){
										Online_Camera_Count="";
									}
									Online_Camera_Count = Online_Camera_Count.trim();			
									Offline_Camera_Count = "" + rs.getString("Offline_Camera_Count");
									if(Offline_Camera_Count.equalsIgnoreCase("") || Offline_Camera_Count.equalsIgnoreCase("null") || Offline_Camera_Count.equalsIgnoreCase(null)){
										Offline_Camera_Count="";
									}
									Offline_Camera_Count = Offline_Camera_Count.trim();		
									Ratio_Live_Camera = "" + rs.getString("Ratio_Live_Camera");
									if(Ratio_Live_Camera.equalsIgnoreCase("") || Ratio_Live_Camera.equalsIgnoreCase("null") || Ratio_Live_Camera.equalsIgnoreCase(null)){
										Ratio_Live_Camera="";
									}
									Ratio_Live_Camera = Ratio_Live_Camera.trim();		
									Location = "" + rs.getString("Location");
									if(Location.equalsIgnoreCase("") || Location.equalsIgnoreCase("null") || Location.equalsIgnoreCase(null)){
										Location="";
									}
									Location = Location.trim();		
															
									
									
								}else {
									if(sub_series_list.equalsIgnoreCase(series_name_1_8d)) { 
									datetime = "" + rs.getString("datetime");
									if(datetime.equalsIgnoreCase("") || datetime.equalsIgnoreCase("null") || datetime.equalsIgnoreCase(null)){
										datetime="";
									}
									datetime = datetime.trim();	
										name = "" + rs.getString("name");
									if(name.equalsIgnoreCase("") || name.equalsIgnoreCase("null") || name.equalsIgnoreCase(null)){
										name="";
									}
									name = name.trim();	
										online = "" + rs.getString("online");
									if(online.equalsIgnoreCase("") || online.equalsIgnoreCase("null") || online.equalsIgnoreCase(null)){
										online="";
									}
									online = online.trim();	
										offline = "" + rs.getString("offline");
									if(offline.equalsIgnoreCase("") || offline.equalsIgnoreCase("null") || offline.equalsIgnoreCase(null)){
										offline="";
									}
									
									offline = offline.trim();	
										uptime = "" + rs.getString("uptime");
									if(uptime.equalsIgnoreCase("") || uptime.equalsIgnoreCase("null") || uptime.equalsIgnoreCase(null)){
										uptime="";
									}
									uptime = uptime.trim();	
										Total_Average = "" + rs.getString("Total_Average");
									if(Total_Average.equalsIgnoreCase("") || Total_Average.equalsIgnoreCase("null") || Total_Average.equalsIgnoreCase(null)){
										Total_Average="";
									}
									Total_Average = Total_Average.trim();	
											
									}else {
										
											SystemIP = "" + rs.getString("SystemIP");
										if(SystemIP.equalsIgnoreCase("") || SystemIP.equalsIgnoreCase("null") || SystemIP.equalsIgnoreCase(null)){
											SystemIP="";
										}
										SystemIP = SystemIP.trim();	
											good = "" + rs.getString("good");
										if(good.equalsIgnoreCase("") || good.equalsIgnoreCase("null") || good.equalsIgnoreCase(null)){
											good="";
										}
										good = good.trim();	
											bad = "" + rs.getString("bad");
										if(bad.equalsIgnoreCase("") || bad.equalsIgnoreCase("null") || bad.equalsIgnoreCase(null)){
											bad="";
										}
										bad = bad.trim();	
											dt = "" + rs.getString("dt");
										if(dt.equalsIgnoreCase("") || dt.equalsIgnoreCase("null") || dt.equalsIgnoreCase(null)){
											dt="";
										}
										dt = dt.trim();	
											
											percentag = "" + rs.getString("percentag");
										if(percentag.equalsIgnoreCase("") || percentag.equalsIgnoreCase("null") || percentag.equalsIgnoreCase(null)){
											percentag="";
										}
										percentag = percentag.trim();	
										
											Total_Average = "" + rs.getString("Total_Average");
										if(Total_Average.equalsIgnoreCase("") || Total_Average.equalsIgnoreCase("null") || Total_Average.equalsIgnoreCase(null)){
											Total_Average="";
										}
										Total_Average = Total_Average.trim();	
										
									}
									
								}
									
									String rownumber = ""
											+ rs.getString("rownumber");
									//System.out.println(">>>>>rownumber"+rownumber);
									String Rcount = "" + rs.getString("Rcount");

			%>


			<tr>
<%if(!sub_series_list.equalsIgnoreCase(series_name_1_1ad) &&!sub_series_list.equalsIgnoreCase(series_name_1_1bd) &&!sub_series_list.equalsIgnoreCase(series_name_1_2d) &&   !sub_series_list.equalsIgnoreCase(series_name_1_8d) && !sub_series_list.equalsIgnoreCase(series_name_1_9d)) { %>
				<td style="text-align: center" ><%=(i + 1)%></td>	
				<td style="text-align: left;"><%=SystemIP%></td>
				<td align="left"><%=Avg_DisplayFPS%></td> 
				<td align="center"><%=unique_Camera_Count%></td>
				<td style="text-align: center;"><%=Online_Camera_Count%></td>
				<td style="text-align: center;"><%=Offline_Camera_Count%></td>
				<td style="text-align: center;"><%=Ratio_Live_Camera%></td>
				<td style="text-align: center;"><%=Location%></td>
				<td style="text-align: center;"><%=datedt%></td>
				
<%} else{
if(sub_series_list.equalsIgnoreCase(series_name_1_8d)){%>
		<td style="text-align: center" ><%=(i + 1)%></td>
								
								<td style='width: 20px'><%=datetime%></td>
								<td><%=name%></td>
								<td style='text-align: Center;'><%=online%></td>
								<td style='text-align: Center;'><%=offline%></td>
								<td style='text-align: Center; width: 10%;'><%=uptime%></td>
								<%}else if(sub_series_list.equalsIgnoreCase(series_name_1_9d)){
	%>
							
								<td style='text-align: center;'><%=(i + 1)%></td>
								<td style='width: 20px'><%=SystemIP%></td>
								<td style='text-align: Center; width: 15%'><%=good%></td>
								<td style='text-align: Center; width: 15%'><%=bad%></td>
								<td style='text-align: Center; width: 15%'><%=dt%></td>
								<td style='text-align: Center; width: 10%;'><%=percentag%></td><% 
}
}%>
			</tr>

								<%
			i++;
								}
								 
							}

						
						
						
						
						
						
						
						}//con
		
		
		
		

	}
					
				 catch (Exception e) {

				}
			%>
							
						</tbody>
						<%if(sub_series_list.equalsIgnoreCase(series_name_1_1ad) &&!sub_series_list.equalsIgnoreCase(series_name_1_1bd) &&!sub_series_list.equalsIgnoreCase(series_name_1_2d) &&  !sub_series_list.equalsIgnoreCase(series_name_1_8d) && !sub_series_list.equalsIgnoreCase(series_name_1_9d)) { %>
						 <tfoot>            <tr>                <th colspan='3' style='text-align:right;font-weight:bold;'>Average:</th>                <th id='uniqueavg' style='text-align:center;font-weight:bold;'><%=Totuniquecamcnt%></th>    <th id='onlineavg' style='text-align:center;font-weight:bold;'><%=Total_online_camcnt%></th>  <th id='offlineavg' style='text-align:center;font-weight:bold;'><%=Total_offline_ccnt%></th>  <th id='ratioliveavg' style='text-align:center;font-weight:bold;'><%=Total_ratio_ccnt%></th> <th colspan='2'></th>           </tr>        </tfoot>
						
						<%} else{
if(sub_series_list.equalsIgnoreCase(series_name_1_8d)){%>

	 <tfoot>            <tr>       <td colspan='5'  style='text-align:right;font-weight:bold;'>Average</td><td id='peravg' style='text-align:center;font-weight:bold;'><%=Total_Average %></td></tr></tfoot>
<%}

else if(sub_series_list.equalsIgnoreCase(series_name_1_9d)){%>

	 <tfoot>            <tr>       <td colspan='5'  style='text-align:right;font-weight:bold;'> Average</td><td id='peravg' style='text-align:center;font-weight:bold;'><%=Total_Average %></td></tr></tfoot>
<%}
else if(sub_series_list.equalsIgnoreCase(series_name_1_2d)){%>

<tfoot>            <tr>       <td colspan='7'  style='text-align:right;font-weight:bold;'> Average</td><td id='peravg' style='text-align:center;font-weight:bold;'><%=Total_Average %></td></tr></tfoot>
<%}
%><%

						}%>

	</table>
</div>
<div style="margin-bottom:50%;"></div>
