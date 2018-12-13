<%@ page language="java"
	import="org.cloudme.sample.aes.AesUtil,java.util.ResourceBundle,java.sql.Statement,java.sql.SQLException,Database.*,java.sql.ResultSet,java.text.DateFormat,java.sql.Connection,java.util.*,java.util.Date,java.text.DecimalFormat,java.text.SimpleDateFormat"%>


	<%
	 String Totuptime="",Totdowntime="";
	String ses_cond="",uname="";
	String date="",Location="",Attendance="",SecurityName=""; 
	String query ="";
	String cond="";
	String uid=request.getParameter("uid");	
	String fdate=request.getParameter("fdate");
		if(!fdate.equalsIgnoreCase("")){
			cond=cond+" and CAST(CONVERT(char(10),date,126) AS DATE) >= CAST(CONVERT(char(10), '"+fdate+"',126) AS DATE)";
		}
		String tdate=request.getParameter("tdate");
		if(!tdate.equalsIgnoreCase("")){
			cond=cond+" and CAST(CONVERT(char(10),date,126) AS DATE) <= CAST(CONVERT(char(10), '"+tdate+"',126) AS DATE)";
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
		href="ExporttoExcel_6.jsp?sname=<%=sname%>&fdate=<%=fdate%>&tdate=<%=tdate%>&sub_series_list=<%=sub_series_list%>&uid=<%=uid%>&exportToExcel=YES" >Export to Excel</a></b></li>
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

	
	String series_name_6_4d=resource.getString("series_name_6_4");
	String series_name_6_1d=resource.getString("series_name_6_1");
	String series_name_6_2d=resource.getString("series_name_6_2");
	String series_name_6_3d=resource.getString("series_name_6_3");
	String series_name_6_5d=resource.getString("series_name_6_5");
	
	
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
			Date date1 = new Date();
			out.print(dateFormat.format(date1)); %><br>
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
				System.out.println("con"+con);
		if (con != null) {
			if(sub_series_list.equalsIgnoreCase(series_name_6_4d)) 
			{									
		query = "SELECT  * 	FROM   ( SELECT    COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber,convert(varchar(10),date,101)date,SecurityName,Attendance,Location	FROM  PhysicalSecurity where ISNULL(rid,'')!=''  	"+cond+") AS tbl 		"; 
			
			%><%
			}
	
			else	if(sub_series_list.equalsIgnoreCase(series_name_6_1d)) 
			{									
		query =" SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (uptime as Float) ) / COUNT(*), 2)) )  avg  from tbl_6_1 where isnull(id,'')!=''  "+cond+")Totuptime ,  (select convert(numeric(10,2),( ROUND(SUM( cast (downtime as Float) ) / COUNT(*), 2)) )  avg  from tbl_6_1 where isnull(id,'')!=''   "+cond+" )Totdowntime ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER  (ORDER BY id Desc) AS rownumber,Ipaddress,name,datacenter,applicationname,uptime,Downtime,convert(varchar(10),datetime,101)date FROM   tbl_6_1 where isnull(id,'')!=''   "+cond+"   	) AS tbl 	"; 
			}
			else	if(sub_series_list.equalsIgnoreCase(series_name_6_2d)) 
			{									
				query =" SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (uptime as Float) ) / COUNT(*), 2)) )  avg  from tbl_6_2 where isnull(id,'')!=''  "+cond+")Totuptime ,  (select convert(numeric(10,2),( ROUND(SUM( cast (downtime as Float) ) / COUNT(*), 2)) )  avg  from tbl_6_2 where isnull(id,'')!=''   "+cond+" )Totdowntime ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER  (ORDER BY id Desc) AS rownumber,ipaddress,hostname,datacenter,uptime,Downtime,convert(varchar(10),datetime,101)date FROM   tbl_6_2 where isnull(id,'')!=''   "+cond+"   	) AS tbl 	"; 
			}
			else	if(sub_series_list.equalsIgnoreCase(series_name_6_3d)) 
			{									
				query =" SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (uptime as Float) ) / COUNT(*), 2)) )  avg  from tbl_6_3 where isnull(id,'')!=''  "+cond+")Totuptime , COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER  (ORDER BY id Desc) AS rownumber,Name,Place,Datetime,Online,Offline,convert(varchar(10),datetime,101)date FROM   tbl_6_3 where isnull(id,'')!=''   "+cond+"   	) AS tbl "; 
			}
			else	if(sub_series_list.equalsIgnoreCase(series_name_6_5d)) 
			{									
				query =" SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (uptime as Float) ) / COUNT(*), 2)) )  avg  from tbl_6_5 where isnull(id,'')!=''  "+cond+")Totuptime ,  (select convert(numeric(10,2),( ROUND(SUM( cast (downtime as Float) ) / COUNT(*), 2)) )  avg  from tbl_6_5 where isnull(id,'')!=''   "+cond+" )Totdowntime ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER  (ORDER BY id Desc) AS rownumber,Ipaddress,Hostname,Location,uptime,Downtime,convert(varchar(10),datetime,101)date FROM   tbl_6_5 where isnull(id,'')!=''   "+cond+"   	) AS tbl "; 
			}
			else {
				
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
								
								if(sub_series_list.equalsIgnoreCase(series_name_6_4d)) 
								{	
								date = "" + rs.getString("date");
								if(date.equalsIgnoreCase("") || date.equalsIgnoreCase("null") || date.equalsIgnoreCase(null)){
									date="";
								}
								date = date.trim();
							
								SecurityName = "" + rs.getString("SecurityName");
								if(SecurityName.equalsIgnoreCase("") || SecurityName.equalsIgnoreCase("null") || SecurityName.equalsIgnoreCase(null)){
									SecurityName="";
								}
								SecurityName = SecurityName.trim();
								Attendance = "" + rs.getString("Attendance");
								if(Attendance.equalsIgnoreCase("") || Attendance.equalsIgnoreCase("null") || Attendance.equalsIgnoreCase(null)){
									Attendance="";
								}
								Attendance = Attendance.trim();
								
								Location = "" + rs.getString("Location");
								if(Location.equalsIgnoreCase("") || Location.equalsIgnoreCase("null") || Location.equalsIgnoreCase(null)){
									Location="";
								}
								Location = Location.trim();
							
								String rownumber = ""
										+ rs.getString("rownumber");
								//System.out.println(">>>>>rownumber"+rownumber);
								String Rcount = "" + rs.getString("Rcount");

			%>


							<tr>

								<td style="text-align: center"><%=(i + 1)%></td>


								<td><%=date%></td>
								
								<td style='text-align: Center;'><%=SecurityName%></td>
								<td style='text-align: Center;'><%=Attendance%></td>
								<td style='text-align: Center;'><%=Location%></td>
							</tr>


							<%
							
								}
								
								else if(sub_series_list.equalsIgnoreCase(series_name_6_1d)) 
								{		
									String Ipaddress = "" + rs.getString("Ipaddress");
									if(Ipaddress.equalsIgnoreCase("") || Ipaddress.equalsIgnoreCase("null") || Ipaddress.equalsIgnoreCase(null)){
										Ipaddress="";
									}
									Ipaddress = Ipaddress.trim();
								
									String name = "" + rs.getString("name");
									if(name.equalsIgnoreCase("") || name.equalsIgnoreCase("null") || name.equalsIgnoreCase(null)){
										name="";
									}
									name = name.trim();
									String datacenter = "" + rs.getString("datacenter");
									if(datacenter.equalsIgnoreCase("") || datacenter.equalsIgnoreCase("null") || datacenter.equalsIgnoreCase(null)){
										datacenter="";
									}
									datacenter = datacenter.trim();
									
									String applicationname = "" + rs.getString("applicationname");
									if(applicationname.equalsIgnoreCase("") || applicationname.equalsIgnoreCase("null") || applicationname.equalsIgnoreCase(null)){
										applicationname="";
									}
									applicationname = applicationname.trim();
									String Uptime = "" + rs.getString("Uptime");
									if(Uptime.equalsIgnoreCase("") || Uptime.equalsIgnoreCase("null") || Uptime.equalsIgnoreCase(null)){
										Uptime="";
									}
									Uptime = Uptime.trim();
									String Downtime = "" + rs.getString("Downtime");
									if(Downtime.equalsIgnoreCase("") || Downtime.equalsIgnoreCase("null") || Downtime.equalsIgnoreCase(null)){
										Downtime="";
									}
									Downtime = Downtime.trim();
									 date = "" + rs.getString("date");
									if(date.equalsIgnoreCase("") || date.equalsIgnoreCase("null") || date.equalsIgnoreCase(null)){
										date="";
									}
									date = date.trim();
									
									 Totuptime = "" + rs.getString("Totuptime");
									if(Totuptime.equalsIgnoreCase("") || Totuptime.equalsIgnoreCase("null") || Totuptime.equalsIgnoreCase(null)){
										Totuptime="";
									}
									Totuptime = Totuptime.trim();
									 Totdowntime = "" + rs.getString("Totdowntime");
									if(Totdowntime.equalsIgnoreCase("") || Totdowntime.equalsIgnoreCase("null") || Totdowntime.equalsIgnoreCase(null)){
										Totdowntime="";
									}
									Totdowntime = Totdowntime.trim();
									
									
									%>
					<tr>
						
								<td style="text-align: center"><%=(i + 1)%></td>
						<td><%=date%></td>
						<td style='text-align: Center;'><%=Ipaddress%></td>
						<td style='text-align: Center;'><%=name%></td>
						<td style='text-align: Center;'><%=datacenter%></td>
						<td style='text-align: Center;'><%=applicationname%></td>
						<td style='text-align: Center;'><%=Uptime%></td>
						<td style='text-align: Center;'><%=Downtime%></td>
					</tr>

					<% 
									
									
								}//
								//third sec
								else if(sub_series_list.equalsIgnoreCase(series_name_6_2d)) 
						{		
							String Ipaddress = "" + rs.getString("Ipaddress");
							if(Ipaddress.equalsIgnoreCase("") || Ipaddress.equalsIgnoreCase("null") || Ipaddress.equalsIgnoreCase(null)){
								Ipaddress="";
							}
							Ipaddress = Ipaddress.trim();
						
							String hostname = "" + rs.getString("hostname");
							if(hostname.equalsIgnoreCase("") || hostname.equalsIgnoreCase("null") || hostname.equalsIgnoreCase(null)){
								hostname="";
							}
							hostname = hostname.trim();
							String datacenter = "" + rs.getString("datacenter");
							if(datacenter.equalsIgnoreCase("") || datacenter.equalsIgnoreCase("null") || datacenter.equalsIgnoreCase(null)){
								datacenter="";
							}
							datacenter = datacenter.trim();
							
							
							String Uptime = "" + rs.getString("Uptime");
							if(Uptime.equalsIgnoreCase("") || Uptime.equalsIgnoreCase("null") || Uptime.equalsIgnoreCase(null)){
								Uptime="";
							}
							Uptime = Uptime.trim();
							String Downtime = "" + rs.getString("Downtime");
							if(Downtime.equalsIgnoreCase("") || Downtime.equalsIgnoreCase("null") || Downtime.equalsIgnoreCase(null)){
								Downtime="";
							}
							Downtime = Downtime.trim();
							 date = "" + rs.getString("date");
							if(date.equalsIgnoreCase("") || date.equalsIgnoreCase("null") || date.equalsIgnoreCase(null)){
								date="";
							}
							date = date.trim();
							 Totuptime = "" + rs.getString("Totuptime");
							if(Totuptime.equalsIgnoreCase("") || Totuptime.equalsIgnoreCase("null") || Totuptime.equalsIgnoreCase(null)){
								Totuptime="";
							}
							Totuptime = Totuptime.trim();
							 Totdowntime = "" + rs.getString("Totdowntime");
							if(Totdowntime.equalsIgnoreCase("") || Totdowntime.equalsIgnoreCase("null") || Totdowntime.equalsIgnoreCase(null)){
								Totdowntime="";
							}
							Totdowntime = Totdowntime.trim();
							
							%>
					<tr>
						<td style="text-align: center"><%=(i + 1)%></td>
						<td><%=date%></td>
						<td style='text-align: Center;'><%=Ipaddress%></td>
						<td style='text-align: Center;'><%=hostname%></td>
						<td style='text-align: Center;'><%=datacenter%></td>
						<td style='text-align: Center;'><%=Uptime%></td>
						<td style='text-align: Center;'><%=Downtime%></td>
					</tr>
					<% 
							
						}
								
								///third end
								
								//four start
								else if(sub_series_list.equalsIgnoreCase(series_name_6_3d)) 
						{									
							String name = "" + rs.getString("name");
							if(name.equalsIgnoreCase("") || name.equalsIgnoreCase("null") || name.equalsIgnoreCase(null)){
								name="";
							}
							name = name.trim();
							date = "" + rs.getString("date");
							if(date.equalsIgnoreCase("") || date.equalsIgnoreCase("null") || date.equalsIgnoreCase(null)){
								date="";
							}
							date = date.trim();
							String place = "" + rs.getString("place");
							if(place.equalsIgnoreCase("") || place.equalsIgnoreCase("null") || place.equalsIgnoreCase(null)){
								place="";
							}
							place = place.trim();
							
							String online = "" + rs.getString("online");
							if(online.equalsIgnoreCase("") || online.equalsIgnoreCase("null") || online.equalsIgnoreCase(null)){
								online="";
							}
							online = online.trim();
							
							
							String offline = "" + rs.getString("offline");
							if(offline.equalsIgnoreCase("") || offline.equalsIgnoreCase("null") || offline.equalsIgnoreCase(null)){
								offline="";
							}
							offline = offline.trim();
							String uptime = "" + rs.getString("uptime");
							if(uptime.equalsIgnoreCase("") || uptime.equalsIgnoreCase("null") || uptime.equalsIgnoreCase(null)){
								uptime="";
							}
							uptime = uptime.trim();
							 
							 Totuptime = "" + rs.getString("Totuptime");
							if(Totuptime.equalsIgnoreCase("") || Totuptime.equalsIgnoreCase("null") || Totuptime.equalsIgnoreCase(null)){
								Totuptime="";
							}
							Totuptime = Totuptime.trim();
							
					%>

					<tr>
						<td style="text-align: center"><%=(i + 1)%></td>
						<td><%=date%></td>
						<td style='text-align: Center;'><%=name%></td>
						<td style='text-align: Center;'><%=place%></td>
						<td style='text-align: Center;'><%=online%></td>
						<td style='text-align: Center;'><%=offline%></td>
						<td style='text-align: Center;'><%=uptime%></td>
						
					</tr>
					<% 			
																				
						
						}
						//6.3 end
								//four end
								//Five Start
								
									else	if(sub_series_list.equalsIgnoreCase(series_name_6_5d)) 
						{									
						String	 Ipaddress = "" + rs.getString("Ipaddress");
							if(Ipaddress.equalsIgnoreCase("") || Ipaddress.equalsIgnoreCase("null") || Ipaddress.equalsIgnoreCase(null)){
								Ipaddress="";
							}
							Ipaddress = Ipaddress.trim();
						
							String hostname = "" + rs.getString("hostname");
							if(hostname.equalsIgnoreCase("") || hostname.equalsIgnoreCase("null") || hostname.equalsIgnoreCase(null)){
								hostname="";
							}
							hostname = hostname.trim();
							
							String location = "" + rs.getString("location");
							if(location.equalsIgnoreCase("") || location.equalsIgnoreCase("null") || location.equalsIgnoreCase(null)){
								location="";
							}
							location = location.trim();
							
							
							String Uptime = "" + rs.getString("Uptime");
							if(Uptime.equalsIgnoreCase("") || Uptime.equalsIgnoreCase("null") || Uptime.equalsIgnoreCase(null)){
								Uptime="";
							}
							Uptime = Uptime.trim();
							String Downtime = "" + rs.getString("Downtime");
							if(Downtime.equalsIgnoreCase("") || Downtime.equalsIgnoreCase("null") || Downtime.equalsIgnoreCase(null)){
								Downtime="";
							}
							Downtime = Downtime.trim();
							 date = "" + rs.getString("date");
							if(date.equalsIgnoreCase("") || date.equalsIgnoreCase("null") || date.equalsIgnoreCase(null)){
								date="";
							}
							date = date.trim();
							 Totuptime = "" + rs.getString("Totuptime");
							if(Totuptime.equalsIgnoreCase("") || Totuptime.equalsIgnoreCase("null") || Totuptime.equalsIgnoreCase(null)){
								Totuptime="";
							}
							Totuptime = Totuptime.trim();
							 Totdowntime = "" + rs.getString("Totdowntime");
							if(Totdowntime.equalsIgnoreCase("") || Totdowntime.equalsIgnoreCase("null") || Totdowntime.equalsIgnoreCase(null)){
								Totdowntime="";
							}
							Totdowntime = Totdowntime.trim();
							
							%>

					<tr>
						<td style="text-align: center"><%=(i + 1)%></td>
						<td><%=date%></td>
						<td style='text-align: Center;'><%=Ipaddress%></td>
						<td style='text-align: Center;'><%=hostname%></td>
						<td style='text-align: Center;'><%=location%></td>
						<td style='text-align: Center;'><%=Uptime%></td>
						<td style='text-align: Center;'><%=Downtime%></td>
					</tr>
					<% 
										
																				
						
						}
								//Five end
								
								
								
			i++;
								}
								
							}

						}

	}
					
				 catch (Exception e) {

				}
			%>



						</tbody>
						
							<%if(sub_series_list.equalsIgnoreCase(series_name_6_5d)){
				 %>
				<tfoot>            <tr>                <th colspan='5' style='text-align:right'>Average:</th>                 <th id='upavg' style='text-align:center;font-weight:bold;'><%=Totuptime%></th>  <th id='downavg' style='text-align:center;font-weight:bold;'><%=Totdowntime%></th>            </tr>        </tfoot>
				
				<% }%>
				<% if(sub_series_list.equalsIgnoreCase(series_name_6_4d)){
				 %>
					
						<% }%>
			<% if(sub_series_list.equalsIgnoreCase(series_name_6_3d)){
				 %>
					<tfoot>            <tr>                <th colspan='6' style='text-align:right'>Average:</th>                 <th id='upavg' style='text-align:center;font-weight:bold;'><%=Totuptime%></th>     </tr>        </tfoot>
					<% }%>
				<%if(sub_series_list.equalsIgnoreCase(series_name_6_2d)){
				 %>
					 <tfoot>            <tr>                <th colspan='5' style='text-align:right'>Average:</th>                 <th id='upavg' style='text-align:center;font-weight:bold;'><%=Totuptime%></th>  <th id='downavg' style='text-align:center;font-weight:bold;'><%=Totdowntime%></th>            </tr>        </tfoot>
						<% }%>
			<%if(sub_series_list.equalsIgnoreCase(series_name_6_1d)){
				 %>
					<tfoot>            <tr>                <th colspan='6' style='text-align:right'>Average:</th>                 <th id='upavg' style='text-align:center;font-weight:bold;'><%=Totuptime%></th>  <th id='downavg' style='text-align:center;font-weight:bold;'><%=Totdowntime%></th>            </tr>        </tfoot>
						<% }%>
						
	</table>
</div>
<div style="margin-bottom:50%;"></div>
