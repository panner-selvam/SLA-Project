<%@ page language="java"
	import="org.cloudme.sample.aes.AesUtil,java.util.ResourceBundle,java.sql.Statement,java.sql.SQLException,Database.*,java.sql.ResultSet,java.text.DateFormat,java.sql.Connection,java.util.*,java.util.Date,java.text.DecimalFormat,java.text.SimpleDateFormat"%>


	<%
	String Totuptime="0",Totdowntime="0";	
	String ses_cond="",uname="";

	String cond="";
	String uid=request.getParameter("uid");	
	String fdate=request.getParameter("fdate");
		if(!fdate.equalsIgnoreCase("")){
			cond=cond+" and CAST(CONVERT(char(10),datetime,126) AS DATE) >= CAST(CONVERT(char(10), '"+fdate+"',126) AS DATE)";
		}
		String tdate=request.getParameter("tdate");
		if(!tdate.equalsIgnoreCase("")){
			cond=cond+" and CAST(CONVERT(char(10),datetime,126) AS DATE) <= CAST(CONVERT(char(10), '"+tdate+"',126) AS DATE)";
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
		href="ExporttoExcel_7.jsp?sname=<%=sname%>&fdate=<%=fdate%>&tdate=<%=tdate%>&sub_series_list=<%=sub_series_list%>&uid=<%=uid%>&exportToExcel=YES" >Export to Excel</a></b></li>
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
	String series_name_7_1d=resource.getString("series_name_7_1");
	String series_name_7_2d=resource.getString("series_name_7_2");
	String series_name_7_3d=resource.getString("series_name_7_3");
	String series_name_7_4d=resource.getString("series_name_7_4");
	String series_name_7_5d=resource.getString("series_name_7_5");
	
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
	
		
	<%	
	
	try {
	String query ="";
				System.out.println("con"+con);
		if (con != null) {
			
			if(sub_series_list.equalsIgnoreCase(series_name_7_1d)) 
			{									
		//query =  "SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (call_ring_time as Float) ) / COUNT(*), 2)) ) avg  from [Avg_Speed_Ans] where isnull(id,'')!=''  "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY id Desc) AS rownumber,RIGHT(Convert(VARCHAR(20), calling_time, 0) ,9)calling_time,RIGHT(Convert(VARCHAR(20), Ans_time, 0) ,9) Ans_time,calling_parties_number,destination_party_number,convert(varchar(10),dt,101) dt,call_ring_time 	FROM   [Avg_Speed_Ans] where isnull(id,'')!='' "+cond+" 	) AS tbl 	";
		query =  "SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (uptime as Float) ) / COUNT(*), 2)) ) " + 
							" avg  from tbl_7_1 where isnull(id,'')!=''  "+cond+")Totuptime ,  (select convert(numeric(10,2),( ROUND(SUM( cast (downtime as Float) ) / COUNT(*), 2)) ) " + 
							" avg  from tbl_7_1 where isnull(id,'')!=''  "+cond+")Totdowntime ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER " + 
							" (ORDER BY id Desc) AS rownumber,hostname,ipaddress,location,uptime,downtime,convert(varchar(10),dt,101)dt FROM   tbl_7_1 where isnull(id,'')!='' "+cond+"   	) AS tbl "; 
					
		
		%>
	
			<table class="table table-striped table-bordered table-condensed display nowrap"	id="reportdata" width="100%"><thead><tr id="msgcnt"><th colspan="7" ><div id="rowpintdiv" style="font-weight:bold;"><div class="recordscnt">Total Records - <span id="passport_row_totcnt"></span>/<span id="passport_row_cnt"></span></div></th></tr>
				 <tr><th class="text-center">S.No.</th><th class="text-center">IP address</th><th class="text-center">Host Name</th><th class="text-center">Location</th><th class="text-center">Up Time (%)</th><th class="text-center">Down Time (%)</th> </tr></thead><tbody>
				 
		<%
			}
	else if(sub_series_list.equalsIgnoreCase(series_name_7_2d)) 
	{									
		query = "SELECT  * 	FROM   ( SELECT      COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER  (ORDER BY id Desc) AS rownumber,Name,Place,Time_hrs FROM   tbl_7_2 where isnull(id,'')!=''  	"+cond+") AS tbl ";

%>
<table class="table table-striped table-bordered table-condensed display nowrap"	id="reportdata" width="100%"><thead><tr id="msgcnt"><th colspan="5" ><div id="rowpintdiv" style="font-weight:bold;"><div class="recordscnt">Total Records - <span id="passport_row_totcnt"></span>/<span id="passport_row_cnt"></span></div></th></tr>
<tr><th class="text-center">S.No.</th><th class="text-center">Date</th><th class="text-center">Name</th><th class="text-center">Place</th><th class="text-center">Time (Hours)</th> </tr></thead><tbody>
<%
	}
	
	else if(sub_series_list.equalsIgnoreCase(series_name_7_3d)) 
	{									
		query = "SELECT  * 	FROM   ( SELECT      COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER  (ORDER BY id Desc) AS rownumber, Name,Place,Compliance FROM   tbl_7_3 where isnull(id,'')!=''  "+cond+"	) AS tbl 	 ";

%>
<table class="table table-striped table-bordered table-condensed display nowrap"	id="reportdata" width="100%"><thead><tr id="msgcnt"><th colspan="5" ><div id="rowpintdiv" style="font-weight:bold;"><div class="recordscnt">Total Records - <span id="passport_row_totcnt"></span>/<span id="passport_row_cnt"></span></div></th></tr>
<tr><th class="text-center">S.No.</th><th class="text-center">Date</th><th class="text-center">Name</th><th class="text-center">Place</th><th class="text-center">Compliance (%)</th> </tr></thead><tbody>
<%
	}
	
	else if(sub_series_list.equalsIgnoreCase(series_name_7_4d)) 
	{									
		query = "SELECT  * 	FROM   ( SELECT      COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER  (ORDER BY id Desc) AS rownumber, convert(varchar(10),Release_date,101) Release_date,Patch_Name,Patch_oem,convert(varchar(10),App_start_date,101) as App_start_date,convert(varchar(10),App_Close_Date,101) as App_Close_Date,Compliance,convert(varchar(10),datetime,101) as dt FROM   tbl_7_4 where isnull(id,'')!=''  "+cond+"	) AS tbl 	 ";

%>
<%
	}
	else if(sub_series_list.equalsIgnoreCase(series_name_7_5d)) 
	{									
		query = "SELECT  * 	FROM   ( SELECT      COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER  (ORDER BY id Desc) AS rownumber, convert(varchar(10),Release_date,101) Release_date,Patch_Name,Patch_oem,convert(varchar(10),App_start_date,101) as App_start_date,convert(varchar(10),App_Close_Date,101) as App_Close_Date,Compliance,convert(varchar(10),datetime,101) as dt FROM   tbl_7_5 where isnull(id,'')!=''  "+cond+"	) AS tbl 	 ";

%>
<table class="table table-striped table-bordered table-condensed display nowrap"	id="reportdata" width="100%"><thead><tr id="msgcnt"><th colspan="8" ><div id="rowpintdiv" style="font-weight:bold;"><div class="recordscnt">Total Records - <span id="passport_row_totcnt"></span>/<span id="passport_row_cnt"></span></div></th></tr>
<tr><th class="text-center">S.No.</th><th class="text-center">Date</th><th class="text-center">Released Date</th><th class="text-center">Patch Name</th><th class="text-center">Patch OEM</th> <th class="text-center">App Start Date</th> <th class="text-center">APP Close Date</th> <th class="text-center">Compliance</th> </tr></thead><tbody>
<%
	}
	
	
	
	else{
		
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
																
									if(sub_series_list.equalsIgnoreCase(series_name_7_1d)) 
									{			
										
										 Totuptime = "" + rs.getString("Totuptime");
										if (Totuptime.equalsIgnoreCase("")
												|| Totuptime.equalsIgnoreCase("null")
												|| Totuptime.equalsIgnoreCase(null)) {
											Totuptime = "";
										}
										Totuptime = Totuptime.trim();

										 Totdowntime = "" + rs.getString("Totdowntime");
										if (Totdowntime.equalsIgnoreCase("")
												|| Totdowntime.equalsIgnoreCase("null")
												|| Totdowntime.equalsIgnoreCase(null)) {
											Totdowntime = "";
										}
										Totdowntime = Totdowntime.trim();

										String ipaddress = "" + rs.getString("ipaddress");
										if (ipaddress.equalsIgnoreCase("") || ipaddress.equalsIgnoreCase("null")
												|| ipaddress.equalsIgnoreCase(null)) {
											ipaddress = "";
										}
										ipaddress = ipaddress.trim();

										String location = "" + rs.getString("location");
										if (location.equalsIgnoreCase("") || location.equalsIgnoreCase("null")
												|| location.equalsIgnoreCase(null)) {
											location = "";
										}
										location = location.trim();
										String hostname = "" + rs.getString("hostname");
										if (hostname.equalsIgnoreCase("") || hostname.equalsIgnoreCase("null")
												|| hostname.equalsIgnoreCase(null)) {
											hostname = "";
										}
										hostname = hostname.trim();
										
										String dt = "" + rs.getString("datetime");
										if (dt.equalsIgnoreCase("") || dt.equalsIgnoreCase("null") || dt.equalsIgnoreCase(null)) {
											dt = "";
										}
										dt = dt.trim();

										String uptime = "" + rs.getString("uptime");
										if (uptime.equalsIgnoreCase("") || uptime.equalsIgnoreCase("null")
												|| uptime.equalsIgnoreCase(null)) {
											uptime = "";
										}
										uptime = uptime.trim();
										String downtime = "" + rs.getString("downtime");
										if (downtime.equalsIgnoreCase("") || downtime.equalsIgnoreCase("null")
												|| downtime.equalsIgnoreCase(null)) {
											downtime = "";
										}
										downtime = downtime.trim();


									%>


									<tr>

										<td style="text-align: center" ><%=(i + 1)%></td>	
									
										<td align="center"><%=dt%></td> 
										<td align="center"><%=ipaddress%></td>
										<td style="text-align: center;"><%=hostname%></td>
										<td style="text-align: center;"><%=location%></td>
											<td style="text-align:center;"><%=uptime%></td>
											<td style="text-align:center;"><%=downtime%></td>

									</tr>

									<%
									
								
								
								}
									else if(sub_series_list.equalsIgnoreCase(series_name_7_2d)) {
									String dt = "" + rs.getString("dt");
									if (dt.equalsIgnoreCase("") || dt.equalsIgnoreCase("null")
											|| dt.equalsIgnoreCase(null)) {
										dt = "";
									}
									dt = dt.trim();
								
									String Name = "" + rs.getString("Name");
									if (Name.equalsIgnoreCase("") || Name.equalsIgnoreCase("null")
											|| Name.equalsIgnoreCase(null)) {
										Name = "";
									}
									Name = Name.trim();
								
									String Place = "" + rs.getString("Place");
									if (Place.equalsIgnoreCase("") || Place.equalsIgnoreCase("null")
											|| Place.equalsIgnoreCase(null)) {
										Place = "";
									}
									Place = Place.trim();
								
									String Time_hrs = "" + rs.getString("Time_hrs");
									if (Time_hrs.equalsIgnoreCase("") || Time_hrs.equalsIgnoreCase("null")
											|| Time_hrs.equalsIgnoreCase(null)) {
										Time_hrs = "";
									}
									Time_hrs = Time_hrs.trim();
								
									%>


									<tr>

										<td style="text-align: center" ><%=(i + 1)%></td>	
									
										<td style="text-align: center;"><%=dt%></td> 
										<td style="text-align: center;"><%=Name%></td>
										<td style="text-align: center;"><%=Place%></td>
										<td style="text-align:center;"><%=Time_hrs%></td>
											

									</tr>

									<%
								
								}
									//third
									
									else if(sub_series_list.equalsIgnoreCase(series_name_7_3d)) {
										String dt = "" + rs.getString("dt");
										if (dt.equalsIgnoreCase("") || dt.equalsIgnoreCase("null")
												|| dt.equalsIgnoreCase(null)) {
											dt = "";
										}
										dt = dt.trim();
									
										String Name = "" + rs.getString("Name");
										if (Name.equalsIgnoreCase("") || Name.equalsIgnoreCase("null")
												|| Name.equalsIgnoreCase(null)) {
											Name = "";
										}
										Name = Name.trim();
									
										String Place = "" + rs.getString("Place");
										if (Place.equalsIgnoreCase("") || Place.equalsIgnoreCase("null")
												|| Place.equalsIgnoreCase(null)) {
											Place = "";
										}
										Place = Place.trim();
									
										String Compliance = "" + rs.getString("Compliance");
										if (Compliance.equalsIgnoreCase("") || Compliance.equalsIgnoreCase("null")
												|| Compliance.equalsIgnoreCase(null)) {
											Compliance = "";
										}
										Compliance = Compliance.trim();
									

									%>


									<tr>

										<td style="text-align: center" ><%=(i + 1)%></td>	
									
										<td style="text-align: center;"><%=dt%></td> 
										<td style="text-align: center;"><%=Name%></td>
										<td style="text-align: center;"><%=Place%></td>
										<td style="text-align:center;"><%=Compliance%></td>
											

									</tr>

									<%
								
								}
								//Four
									else if(sub_series_list.equalsIgnoreCase(series_name_7_4d)) {
										String Release_date = "" + rs.getString("Release_date");
										if (Release_date.equalsIgnoreCase("") || Release_date.equalsIgnoreCase("null")
												|| Release_date.equalsIgnoreCase(null)) {
											Release_date = "";
										}
										Release_date = Release_date.trim();
									
										String Patch_Name = "" + rs.getString("Patch_Name");
										if (Patch_Name.equalsIgnoreCase("") || Patch_Name.equalsIgnoreCase("null")
												|| Patch_Name.equalsIgnoreCase(null)) {
											Patch_Name = "";
										}
										Patch_Name = Patch_Name.trim();
									

										String Patch_oem = "" + rs.getString("Patch_oem");
										if (Patch_oem.equalsIgnoreCase("") || Patch_oem.equalsIgnoreCase("null")
												|| Patch_oem.equalsIgnoreCase(null)) {
											Patch_oem = "";
										}
										Patch_oem = Patch_oem.trim();
									
										String App_start_date = "" + rs.getString("App_start_date");
										if (App_start_date.equalsIgnoreCase("") || App_start_date.equalsIgnoreCase("null")
												|| App_start_date.equalsIgnoreCase(null)) {
											App_start_date = "";
										}
										App_start_date = App_start_date.trim();
										String App_Close_Date = "" + rs.getString("App_Close_Date");
										if (App_Close_Date.equalsIgnoreCase("") || App_Close_Date.equalsIgnoreCase("null")
												|| App_Close_Date.equalsIgnoreCase(null)) {
											App_Close_Date = "";
										}
										App_Close_Date = App_Close_Date.trim();
										String Compliance = "" + rs.getString("Compliance");
										if (Compliance.equalsIgnoreCase("") || Compliance.equalsIgnoreCase("null")
												|| Compliance.equalsIgnoreCase(null)) {
											Compliance = "";
										}
										Compliance = Compliance.trim();
									
										String dt = "" + rs.getString("dt");
										if (dt.equalsIgnoreCase("") || dt.equalsIgnoreCase("null")
												|| dt.equalsIgnoreCase(null)) {
											dt = "";
										}
										dt = dt.trim();
									

									%>


									<tr>

										<td style="text-align: center" ><%=(i + 1)%></td>	
									
										<td style="text-align: center;"><%=dt%></td> 
										<td style="text-align: center;"><%=Release_date%></td>
										<td style="text-align: center;"><%=Patch_Name%></td>
										<td style="text-align:center;"><%=Patch_oem%></td>
										<td style="text-align:center;"><%=App_start_date%></td>
										<td style="text-align:center;"><%=App_Close_Date%></td>
										<td style="text-align:center;"><%=Compliance%></td>
										
										
											

									</tr>

									<%
													}
	//third
									
									else if(sub_series_list.equalsIgnoreCase(series_name_7_5d)) {
										String Release_date = "" + rs.getString("Release_date");
										if (Release_date.equalsIgnoreCase("") || Release_date.equalsIgnoreCase("null")
												|| Release_date.equalsIgnoreCase(null)) {
											Release_date = "";
										}
										Release_date = Release_date.trim();
									
										String Patch_Name = "" + rs.getString("Patch_Name");
										if (Patch_Name.equalsIgnoreCase("") || Patch_Name.equalsIgnoreCase("null")
												|| Patch_Name.equalsIgnoreCase(null)) {
											Patch_Name = "";
										}
										Patch_Name = Patch_Name.trim();
									

										String Patch_oem = "" + rs.getString("Patch_oem");
										if (Patch_oem.equalsIgnoreCase("") || Patch_oem.equalsIgnoreCase("null")
												|| Patch_oem.equalsIgnoreCase(null)) {
											Patch_oem = "";
										}
										Patch_oem = Patch_oem.trim();
									
										String App_start_date = "" + rs.getString("App_start_date");
										if (App_start_date.equalsIgnoreCase("") || App_start_date.equalsIgnoreCase("null")
												|| App_start_date.equalsIgnoreCase(null)) {
											App_start_date = "";
										}
										App_start_date = App_start_date.trim();
										String App_Close_Date = "" + rs.getString("App_Close_Date");
										if (App_Close_Date.equalsIgnoreCase("") || App_Close_Date.equalsIgnoreCase("null")
												|| App_Close_Date.equalsIgnoreCase(null)) {
											App_Close_Date = "";
										}
										App_Close_Date = App_Close_Date.trim();
										String Compliance = "" + rs.getString("Compliance");
										if (Compliance.equalsIgnoreCase("") || Compliance.equalsIgnoreCase("null")
												|| Compliance.equalsIgnoreCase(null)) {
											Compliance = "";
										}
										Compliance = Compliance.trim();
									
										String dt = "" + rs.getString("dt");
										if (dt.equalsIgnoreCase("") || dt.equalsIgnoreCase("null")
												|| dt.equalsIgnoreCase(null)) {
											dt = "";
										}
										dt = dt.trim();
									

									%>


									<tr>

										<td style="text-align: center" ><%=(i + 1)%></td>	
									
										<td style="text-align: center;"><%=dt%></td> 
										<td style="text-align: center;"><%=Release_date%></td>
										<td style="text-align: center;"><%=Patch_Name%></td>
										<td style="text-align:center;"><%=Patch_oem%></td>
										<td style="text-align:center;"><%=App_start_date%></td>
										<td style="text-align:center;"><%=App_Close_Date%></td>
										<td style="text-align:center;"><%=Compliance%></td>
										
										
											

									</tr>

									<%
													}else{}
									
									

									i++;
														}
														
													}

												}

							}
											
										 catch (Exception e) {

										}
			%>
		</tbody>		
		<%if(sub_series_list.equalsIgnoreCase(series_name_7_1d)){	
			%>
		<tfoot><tr><th colspan="4" style="text-align: left;">Overall-Average</th><th style="text-align: center;"><%=Totuptime%></th><th style="text-align: center;"><%=Totdowntime%></th></tr></tfoot>
			<%}else{	
		}
	%> 
	</table>
</div>
<div style="margin-bottom:50%;"></div>
