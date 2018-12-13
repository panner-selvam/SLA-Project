<%@ page language="java"
	import="org.cloudme.sample.aes.AesUtil,java.util.ResourceBundle,java.sql.Statement,java.sql.SQLException,Database.*,java.sql.ResultSet,java.text.DateFormat,java.sql.Connection,java.util.*,java.util.Date,java.text.DecimalFormat,java.text.SimpleDateFormat"%>


	<%
	String ses_cond="",uname="";
	String Total_success="",Total_failure="";
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
		href="ExporttoExcel_3.jsp?sname=<%=sname%>&fdate=<%=fdate%>&tdate=<%=tdate%>&sub_series_list=<%=sub_series_list%>&uid=<%=uid%>&exportToExcel=YES" >Export to Excel</a></b></li>
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
	String series_name_3_1=resource.getString("series_name_3_1");
	String series_name_3_2=resource.getString("series_name_3_2");
	String series_name_3_3=resource.getString("series_name_3_3");
	String series_name_3_4=resource.getString("series_name_3_4");
	
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

		<thead>
		<tr>
				<th>S.No.</th>
				<th>Location</th>				
				<th>Date</th>
				<th>Application Name</th>
				<th>Success</th>
				<th>Failure</th>			
			</tr>
			
		</thead>
		<tbody>
		
	<%	
	
	try {String ipaddress = "", location = "",date="",applicationname="",success="",failure="";String query ="";
				System.out.println("con"+con);
		if (con != null) {
			
			if(sub_series_list.equalsIgnoreCase(series_name_3_1)) 
			{									
		query = "SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (success as Float) ) / COUNT(*), 2)) ) avg  from dbo.ANPRStanderd3Wheel where ISNULL(rid,'')!='' "+cond+" )Total_success , (select convert(numeric(10,2),( ROUND(SUM( cast (failure as Float) ) / COUNT(*), 2)) ) avg  from dbo.ANPRStanderd3Wheel where ISNULL(rid,'')!='' "+cond+" )Total_failure ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber,location,convert(varchar(10),date,101)date,applicationname,success,failure 	FROM  ANPRStanderd3Wheel where ISNULL(rid,'')!='' "+cond+" 	) AS tbl "; 
			}
	if(sub_series_list.equalsIgnoreCase(series_name_3_2)) 
	{									
query = "SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (success as Float) ) / COUNT(*), 2)) ) avg  from dbo.ANPRNonStanderd3Wheel where ISNULL(rid,'')!='' "+cond+" )Total_success , (select convert(numeric(10,2),( ROUND(SUM( cast (failure as Float) ) / COUNT(*), 2)) ) avg  from dbo.ANPRNonStanderd3Wheel where ISNULL(rid,'')!='' "+cond+" )Total_failure ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber,location,convert(varchar(10),date,101)date,applicationname,success,failure 	FROM  ANPRNonStanderd3Wheel where ISNULL(rid,'')!='' "+cond+" 	) AS tbl 	"; 
	}
	if(sub_series_list.equalsIgnoreCase(series_name_3_3)) 
	{									
query = "SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (success as Float) ) / COUNT(*), 2)) ) avg  from dbo.ANPRStanderd2Wheel where ISNULL(rid,'')!='' "+cond+" )Total_success , (select convert(numeric(10,2),( ROUND(SUM( cast (failure as Float) ) / COUNT(*), 2)) ) avg  from dbo.ANPRStanderd2Wheel where ISNULL(rid,'')!='' "+cond+" )Total_failure ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber,location,convert(varchar(10),date,101)date,applicationname,success,failure 	FROM  ANPRStanderd2Wheel where ISNULL(rid,'')!='' "+cond+" 	) AS tbl "; 
	}
	if(sub_series_list.equalsIgnoreCase(series_name_3_4)) 
	{									
query = "SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (success as Float) ) / COUNT(*), 2)) ) avg  from dbo.ANPRNonStanderd2Wheel where ISNULL(rid,'')!='' "+cond+" )Total_success , (select convert(numeric(10,2),( ROUND(SUM( cast (failure as Float) ) / COUNT(*), 2)) ) avg  from dbo.ANPRNonStanderd2Wheel where ISNULL(rid,'')!='' "+cond+" )Total_failure ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber,location,convert(varchar(10),date,101)date,applicationname,success,failure 	FROM  ANPRNonStanderd2Wheel where ISNULL(rid,'')!='' "+cond+" 	) AS tbl" 	; 
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
								
								
								 Total_success=""+rs.getString("Total_success");
								 Total_failure=""+rs.getString("Total_failure");
								String rownumber = ""
										+ rs.getString("rownumber");
								//System.out.println(">>>>>rownumber"+rownumber);
								String Rcount = "" + rs.getString("Rcount");
								

			%>


			<tr>

				<td style="text-align: center" ><%=(i + 1)%></td>	
			
				<td align="left"><%=location%></td> 
				<td align="left"><%=date%></td>
				<td style="text-align: right;"><%=applicationname%></td>
				<td style="text-align: right;"><%=success%></td>
					<td style="text-align:right;"><%=failure%></td>

			</tr>

			<%
			i++;
								}
								
							}

						}

	}
					
				 catch (Exception e) {

				}
			%>



		</tbody>
		<tfoot><tr><th colspan="4" style="text-align: left;">Overall-Average</th><th style="text-align: right;"><%=Total_success%></th><th style="text-align: right;"><%=Total_failure%></th></tr></tfoot>
	</table>
</div>
<div style="margin-bottom:50%;"></div>
