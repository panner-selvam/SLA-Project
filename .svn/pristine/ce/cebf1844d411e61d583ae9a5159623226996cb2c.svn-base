<%@ page language="java"
	import="org.cloudme.sample.aes.AesUtil,java.util.ResourceBundle,java.sql.Statement,java.sql.SQLException,Database.*,java.sql.ResultSet,java.text.DateFormat,java.sql.Connection,java.util.*,java.util.Date,java.text.DecimalFormat,java.text.SimpleDateFormat"%>


	<%
	String Total_total_call="",Total_lost_call="";
	String ses_cond="",uname="";
	String Total_success="",Total_failure="";
	String cond="";
	String uid=request.getParameter("uid");	
	String fdate=request.getParameter("fdate");
		if(!fdate.equalsIgnoreCase("")){
			cond=cond+" and CAST(CONVERT(char(10),dt,126) AS DATE) >= CAST(CONVERT(char(10), '"+fdate+"',126) AS DATE)";
		}
		String tdate=request.getParameter("tdate");
		if(!tdate.equalsIgnoreCase("")){
			cond=cond+" and CAST(CONVERT(char(10),dt,126) AS DATE) <= CAST(CONVERT(char(10), '"+tdate+"',126) AS DATE)";
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
		href="ExporttoExcel_8.jsp?sname=<%=sname%>&fdate=<%=fdate%>&tdate=<%=tdate%>&sub_series_list=<%=sub_series_list%>&uid=<%=uid%>&exportToExcel=YES" >Export to Excel</a></b></li>
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
	String series_name_8_1d=resource.getString("series_name_8_1");
	String series_name_8_2d=resource.getString("series_name_8_2");
	
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
	
	try {String ipaddress = "", location = "",date="",applicationname="",success="",failure="";String query ="";
				System.out.println("con"+con);
		if (con != null) {
			
			if(sub_series_list.equalsIgnoreCase(series_name_8_1d)) 
			{									
		query =  "SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (call_ring_time as Float) ) / COUNT(*), 2)) ) avg  from [Avg_Speed_Ans] where isnull(id,'')!=''  "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY id Desc) AS rownumber,RIGHT(Convert(VARCHAR(20), calling_time, 0) ,9)calling_time,RIGHT(Convert(VARCHAR(20), Ans_time, 0) ,9) Ans_time,calling_parties_number,destination_party_number,convert(varchar(10),dt,101) dt,call_ring_time 	FROM   [Avg_Speed_Ans] where isnull(id,'')!='' "+cond+" 	) AS tbl 	";
		
		%>
		<table id="labour" class="table -dark -striped -bordered" border="1" style="white-space:nowrap;">

		<thead>
		<tr><th class="text-center">S.No.</th><th class="text-center">Calling Parties Number</th><th class="text-center">Destination Party Number</th><th class="text-center">Calling Time</th><th class="text-center">Ans Time</th><th class="text-center">Date</th><th class="text-center">Call Ring Time(Secs)</th> </tr></thead><tbody>
		<%
			}
	else if(sub_series_list.equalsIgnoreCase(series_name_8_2d)) 
	{									
query = "SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (total_call as Float) ) / COUNT(*), 2)) ) avg  from dbo.Avg_call_lost where ISNULL(id,'')!='' "+cond+" )Total_total_call , (select convert(numeric(10,2),( ROUND(SUM( cast (lost_call as Float) ) / COUNT(*), 2)) ) avg  from dbo.Avg_call_lost where ISNULL(id,'')!='' "+cond+" )Total_lost_call ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY id Desc) AS rownumber,convert(varchar(10),dt,101) dt,total_call,lost_call,lost_percentage 	FROM  Avg_call_lost where ISNULL(id,'')!='' "+cond+" 	) AS tbl 	";

%>
<table id="labour" class="table -dark -striped -bordered" border="1" style="white-space:nowrap;">
<tr><th class="text-center">S.No.</th><th class="text-center">Date</th><th class="text-center">Total Call</th><th class="text-center">Lost call</th><th class="text-center">Lost Percentage</th> </tr></thead><tbody>
<%
	}else{
		
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
								if(sub_series_list.equalsIgnoreCase(series_name_8_1d)) 
								{									
									String calling_parties_number = "" + rs.getString("calling_parties_number");
									if (calling_parties_number.equalsIgnoreCase("")
											|| calling_parties_number.equalsIgnoreCase("null")
											|| calling_parties_number.equalsIgnoreCase(null)) {
										calling_parties_number = "";
									}
									calling_parties_number = calling_parties_number.trim();

									String destination_party_number = "" + rs.getString("destination_party_number");
									if (destination_party_number.equalsIgnoreCase("")
											|| destination_party_number.equalsIgnoreCase("null")
											|| destination_party_number.equalsIgnoreCase(null)) {
										destination_party_number = "";
									}
									destination_party_number = destination_party_number.trim();

									String calling_time = "" + rs.getString("calling_time");
									if (calling_time.equalsIgnoreCase("") || calling_time.equalsIgnoreCase("null")
											|| calling_time.equalsIgnoreCase(null)) {
										calling_time = "";
									}
									calling_time = calling_time.trim();

									String Ans_time = "" + rs.getString("Ans_time");
									if (Ans_time.equalsIgnoreCase("") || Ans_time.equalsIgnoreCase("null")
											|| Ans_time.equalsIgnoreCase(null)) {
										Ans_time = "";
									}
									Ans_time = Ans_time.trim();

									String dt = "" + rs.getString("dt");
									if (dt.equalsIgnoreCase("") || dt.equalsIgnoreCase("null") || dt.equalsIgnoreCase(null)) {
										dt = "";
									}
									dt = dt.trim();

									String call_ring_time = "" + rs.getString("call_ring_time");
									if (call_ring_time.equalsIgnoreCase("") || call_ring_time.equalsIgnoreCase("null")
											|| call_ring_time.equalsIgnoreCase(null)) {
										call_ring_time = "";
									}
									call_ring_time = call_ring_time.trim();
									 Total_Average = "" + rs.getString("Total_Average");
									if (Total_Average.equalsIgnoreCase("") || Total_Average.equalsIgnoreCase("null")
											|| Total_Average.equalsIgnoreCase(null)) {
										Total_Average = "";
									}
									Total_Average = Total_Average.trim();

									%>


									<tr>

										<td style="text-align: center" ><%=(i + 1)%></td>	
									
										<td align="center"><%=calling_parties_number%></td> 
										<td align="center"><%=destination_party_number%></td>
										<td style="text-align: center;"><%=calling_time%></td>
										<td style="text-align: center;"><%=Ans_time%></td>
											<td style="text-align:center;"><%=dt%></td>
											<td style="text-align:center;"><%=call_ring_time%></td>

									</tr>

									<%
									
								
								
								}
								
								else if(sub_series_list.equalsIgnoreCase(series_name_8_2d)) 
								{									
									String dt = "" + rs.getString("dt");
									if (dt.equalsIgnoreCase("") || dt.equalsIgnoreCase("null")
											|| dt.equalsIgnoreCase(null)) {
										dt = "";
									}
									dt = dt.trim();
									
									String total_call = "" + rs.getString("total_call");
									if (total_call.equalsIgnoreCase("") || total_call.equalsIgnoreCase("null")
											|| total_call.equalsIgnoreCase(null)) {
										total_call = "";
									}
									total_call = total_call.trim();
									
									String lost_call = "" + rs.getString("lost_call");
									if (lost_call.equalsIgnoreCase("") || lost_call.equalsIgnoreCase("null")
											|| lost_call.equalsIgnoreCase(null)) {
										lost_call = "";
									}
									lost_call = lost_call.trim();
									
									String lost_percentage = "" + rs.getString("lost_percentage");
									if (lost_percentage.equalsIgnoreCase("") || lost_percentage.equalsIgnoreCase("null")
											|| lost_percentage.equalsIgnoreCase(null)) {
										lost_percentage = "";
									}
									lost_percentage = lost_percentage.trim();
									
									 Total_total_call = "" + rs.getString("Total_total_call");
									if (Total_total_call.equalsIgnoreCase("") || Total_total_call.equalsIgnoreCase("null")
											|| Total_total_call.equalsIgnoreCase(null)) {
										Total_total_call = "";
									}
									Total_total_call = Total_total_call.trim();
									
									 Total_lost_call = "" + rs.getString("Total_lost_call");
									if (Total_lost_call.equalsIgnoreCase("") || Total_lost_call.equalsIgnoreCase("null")
											|| Total_lost_call.equalsIgnoreCase(null)) {
										Total_lost_call = "";
									}
									Total_lost_call = Total_lost_call.trim();

									%>


									<tr>

										<td style="text-align: center" ><%=(i + 1)%></td>	
									
										<td style="text-align: center;"><%=dt%></td> 
										<td style="text-align: center;"><%=total_call%></td>
										<td style="text-align: center;"><%=lost_call%></td>
										<td style="text-align:center;"><%=lost_percentage%></td>
											

									</tr>

									<%
								
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
		
		<%	if(sub_series_list.equalsIgnoreCase(series_name_8_1d)) 
								{	 %>
		<tfoot><tr><th colspan="6" style="text-align: left;">Overall-Average</th><th style="text-align: center;"><%=Total_Average%></th></tr></tfoot>
	
		<% }else if(sub_series_list.equalsIgnoreCase(series_name_8_2d)) 
								{		
	 %>
	 <tfoot><tr><th colspan="2" style="text-align: left;">Overall-Total</th><th style="text-align: center;"><%=Total_total_call%></th><th style="text-align: center;"><%=Total_lost_call%></th><th></th></tr></tfoot>
	 <%
	}else{
		
	}
	%>
	</table>
</div>
<div style="margin-bottom:50%;"></div>
