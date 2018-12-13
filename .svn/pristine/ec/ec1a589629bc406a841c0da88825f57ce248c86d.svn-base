<%@ page language="java"
	import="org.cloudme.sample.aes.AesUtil,java.util.ResourceBundle,java.sql.Statement,java.sql.SQLException,Database.*,java.sql.ResultSet,java.text.DateFormat,java.sql.Connection,java.util.*,java.util.Date,java.text.DecimalFormat,java.text.SimpleDateFormat"%>


	<%
	String ses_cond="",uname="";
	String Total_success="",Total_failure="";
	String success = "", roadworthiness = "",date="",vehicleno="",failure="";String query ="",Total_roadworth="";
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
		href="ExporttoExcel_4.jsp?sname=<%=sname%>&fdate=<%=fdate%>&tdate=<%=tdate%>&sub_series_list=<%=sub_series_list%>&uid=<%=uid%>&exportToExcel=YES" >Export to Excel</a></b></li>
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

	String series_name_4_3=resource.getString("series_name_4_3");
	String series_name_4_2=resource.getString("series_name_4_2");
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
	<table id="labour" class="table -dark -striped -bordered" border="1" style="white-space:nowrap;">


							<%	
	
	try {
				System.out.println("con"+con);
		if (con != null) {
			
			if(sub_series_list.equalsIgnoreCase(series_name_4_3)) 
			{									
		query = "SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (roadworthiness as Float) ) / COUNT(*), 2)) ) avg  from  AvailabilityMobVans where ISNULL(rid,'')!='' )Total_roadworth ,(select convert(numeric(10,2),( ROUND(SUM( cast (success as Float) ) / COUNT(*), 2)) ) avg  from  AvailabilityMobVans where ISNULL(rid,'')!=''  "+cond+" )Total_success , (select ( ROUND(SUM( cast (failure as int) ) / COUNT(*), 2)) avg  from AvailabilityMobVans where ISNULL(rid,'')!=''  "+cond+" )Total_failure ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber,convert(varchar(10),date,101)date,roadworthiness,success,failure,vehicleno 	FROM  AvailabilityMobVans where ISNULL(rid,'')!=''  "+cond+"	) AS tbl 	"; 
			
			%>
						<thead>
							<tr>
								<th class="text-center">S.No.</th>
								<th class="text-center">Vehicle No.</th>
								<th class="text-center">Date</th>
								<th class="text-center">Road Worthiness</th>
								<th class="text-center">Success</th>
								<th class="text-center">Failure</th>
							</tr>
						</thead>
						<tbody><%
			}
	
			if(sub_series_list.equalsIgnoreCase(series_name_4_2)) 
			{									
		query = "SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (roadworthiness as Float) ) / COUNT(*), 2)) ) avg  from  AvailabilityMobVans where ISNULL(rid,'')!='' )Total_roadworth ,(select convert(numeric(10,2),( ROUND(SUM( cast (success as Float) ) / COUNT(*), 2)) ) avg  from  AvailabilityMobVans where ISNULL(rid,'')!=''  "+cond+" )Total_success , (select ( ROUND(SUM( cast (failure as int) ) / COUNT(*), 2)) avg  from AvailabilityMobVans where ISNULL(rid,'')!=''  "+cond+" )Total_failure ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber,convert(varchar(10),date,101)date,roadworthiness,success,failure,vehicleno 	FROM  AvailabilityMobVans where ISNULL(rid,'')!=''  "+cond+"	) AS tbl 	"; 
			
		%>
		
						<thead>
							<tr>
								<th class="text-center">S.No.</th>
								<th class="text-center">Vehicle ID</th>
								<th class="text-center">Vehicle No</th>
								<th class="text-center">Vehicle Type</th>
								<th class="text-center">Date</th>
								<th class="text-center">Created Datetime</th>
								<th class="text-center">Average Online</th>
								<th class="text-center">Average Offline</th>
							</tr>
						</thead>
						<tbody>
							<%
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
								if(sub_series_list.equalsIgnoreCase(series_name_4_3)) 
								{				
								success = "" + rs.getString("success");
								if(success.equalsIgnoreCase("") || success.equalsIgnoreCase("null") || success.equalsIgnoreCase(null)){
									success="";
								}
								success = success.trim();
								failure = "" + rs.getString("failure");
								if(failure.equalsIgnoreCase("") || failure.equalsIgnoreCase("null") || failure.equalsIgnoreCase(null)){
									failure="";
								}
								failure = failure.trim();
								vehicleno = "" + rs.getString("vehicleno");
								if(vehicleno.equalsIgnoreCase("") || vehicleno.equalsIgnoreCase("null") || vehicleno.equalsIgnoreCase(null)){
									vehicleno="";
								}
								vehicleno = vehicleno.trim();
								
								date = "" + rs.getString("date");
								if(date.equalsIgnoreCase("") || date.equalsIgnoreCase("null") || date.equalsIgnoreCase(null)){
									date="";
								}
								date = date.trim();
								roadworthiness = "" + rs.getString("roadworthiness");
								if(roadworthiness.equalsIgnoreCase("") || roadworthiness.equalsIgnoreCase("null") || roadworthiness.equalsIgnoreCase(null)){
									roadworthiness="";
								}
								roadworthiness = roadworthiness.trim();
								
								 Total_roadworth=""+rs.getString("Total_roadworth");
								 Total_success=""+rs.getString("Total_success");
								 Total_failure=""+rs.getString("Total_failure");
								String rownumber = ""
										+ rs.getString("rownumber");
								//System.out.println(">>>>>rownumber"+rownumber);
								String Rcount = "" + rs.getString("Rcount");
								

			%>


							<tr>

								<td style="text-align: center"><%=(i + 1)%></td>
								<td><%=vehicleno%></td>
								<td><%=date%></td>
								<td style='text-align: Center;'><%=roadworthiness%></td>
								<td style='text-align: Center;'><%=success%></td>
								<td style='text-align: Center;'><%=failure%></td>

							</tr>

							<%
							
								}
								else{
									
									 Total_success=""+rs.getString("Total_success");
									 Total_failure=""+rs.getString("Total_failure");
									date = "" + rs.getString("date");
									if(date.equalsIgnoreCase("") || date.equalsIgnoreCase("null") || date.equalsIgnoreCase(null)){
										date="";
									}
									date = date.trim();
									String Createddate = "" + rs.getString("Createddate");
									if(Createddate.equalsIgnoreCase("") || Createddate.equalsIgnoreCase("null") || Createddate.equalsIgnoreCase(null)){
										Createddate="";
									}
									Createddate = Createddate.trim();
									
									
									String VehicleID = "" + rs.getString("VehicleID");
									if(VehicleID.equalsIgnoreCase("") || VehicleID.equalsIgnoreCase("null") || VehicleID.equalsIgnoreCase(null)){
										VehicleID="";
									}
									VehicleID = VehicleID.trim();
									String VehicleNo = "" + rs.getString("VehicleNo");
									if(VehicleNo.equalsIgnoreCase("") || VehicleNo.equalsIgnoreCase("null") || VehicleNo.equalsIgnoreCase(null)){
										VehicleNo="";
									}
									VehicleNo = VehicleNo.trim();
									String Vehicle_Type = "" + rs.getString("Vehicle_Type");
									if(Vehicle_Type.equalsIgnoreCase("") || Vehicle_Type.equalsIgnoreCase("null") || Vehicle_Type.equalsIgnoreCase(null)){
										Vehicle_Type="";
									}
									Vehicle_Type = Vehicle_Type.trim();
									String Avg_Online = "" + rs.getString("Avg_Online");
									if(Avg_Online.equalsIgnoreCase("") || Avg_Online.equalsIgnoreCase("null") || Avg_Online.equalsIgnoreCase(null)){
										Avg_Online="";
									}
									Avg_Online = Avg_Online.trim();
									String Avg_Offline = "" + rs.getString("Avg_Offline");
									if(Avg_Offline.equalsIgnoreCase("") || Avg_Offline.equalsIgnoreCase("null") || Avg_Offline.equalsIgnoreCase(null)){
										Avg_Offline="";
									}
									Avg_Offline = Avg_Offline.trim();
									
									
									%>
							<tr>
							<td style="text-align: center"><%=(i + 1)%></td>
								<td><%=VehicleID%></td>
								<td><%=VehicleNo%></td>
								<td style='text-align: Center;'><%=Vehicle_Type%></td>
								<td style='text-align: Center;'><%=date%></td>
								<td style='text-align: Center;'><%=Createddate%></td>
								<td style='text-align: Center;'><%=Avg_Online%></td>
								<td style='text-align: Center;'><%=Avg_Offline%></td>
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
						<tfoot>            <tr>                <th colspan='3' style='text-align:right'>Average:</th>                <th id='roadavg' style='text-align:center;font-weight:bold;'><%=Total_roadworth%></th>    <th id='successavg' style='text-align:center;font-weight:bold;'><%=Total_success%></th>  <th id='failureavg' style='text-align:center;font-weight:bold;'><%=Total_failure%></th>            </tr>        </tfoot>
	</table>
</div>
<div style="margin-bottom:50%;"></div>
