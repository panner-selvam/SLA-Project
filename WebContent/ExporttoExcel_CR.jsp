<%@ page language="java"
	import="org.cloudme.sample.aes.AesUtil,java.util.ResourceBundle,java.sql.Statement,java.sql.SQLException,Database.*,java.sql.ResultSet,java.text.DateFormat,java.sql.Connection,java.util.*,java.util.Date,java.text.DecimalFormat,java.text.SimpleDateFormat"%>


	<%
	String ses_cond="",uname="";
	String Percentage="",points="",status="", Series = "",Module="",date="";
	float tot= 0.0f;
	String query ="";
	String cond="";
	String uid=request.getParameter("uid");	
	String fdate=request.getParameter("fdate");
		if(!fdate.equalsIgnoreCase("")){
			cond=cond+" and CAST(CONVERT(char(10),dateofresponse,126) AS DATE) >= CAST(CONVERT(char(10), '"+fdate+"',126) AS DATE)";
		}
		String tdate=request.getParameter("tdate");
		if(!tdate.equalsIgnoreCase("")){
			cond=cond+" and CAST(CONVERT(char(10),dateofresponse,126) AS DATE) <= CAST(CONVERT(char(10), '"+tdate+"',126) AS DATE)";
		}
		
		
		String sub_series_list=request.getParameter("sub_series_list");
		
		if(!sub_series_list.equalsIgnoreCase("null") && !sub_series_list.equalsIgnoreCase("")&& !sub_series_list.equalsIgnoreCase("select")){		
			cond = cond + " and Module_No = '" + sub_series_list + "'";
		} 
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
					<li ><a href="<%=request.getContextPath()%>/Series_cr.jsp"><b>Consolidated Reporting</b></a></li>
					<li class="last" id="seriesname"><b><%=sub_series_list%></b></li>


<li class="right" ><b><a
		href="ExporttoExcel_CR.jsp?fdate=<%=fdate%>&tdate=<%=tdate%>&sub_series_list=<%=sub_series_list%>&uid=<%=uid%>&exportToExcel=YES" >Export to Excel</a></b></li>
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

						<thead>
							<tr>
								<th class="text-center">S.No.</th>
								
								<th class="text-center">Module</th>
								<th class="text-center">Performance Area</th>
								
								<th class="text-center">Points</th>
								
							</tr>
						</thead>
						<tbody>
							<%	
	
	try {
				System.out.println("con"+con);
		if (con != null) {
			
		//	 query = "select convert(varchar(10),dateofresponse,101)date,(Module_No+' '+Module_Name) Module,(Series_No+' '+Series_Name) Series,Percentage,points,status from Bind_SLA_Module_Points where isactive='1' "+cond+" order by series_order asc";
		 query = "	select series_order,(Module_No+' '+Module_Name) Module,(Series_No+' '+Series_Name) Series, "
			+"	convert(numeric(10,2),( ROUND(SUM( cast (points as Float) ) / COUNT(*), 2)) ) points "
						+"		 from Bind_SLA_Module_Points where isactive='1'  "+cond+"  "
						+"	group by series_order, Module_No,Module_Name,Series_No,Series_Name "
						+"	order by series_order asc ";
				
			
			ResultSet rs=db.SelectData(query, con); 
			System.out.println(">>rs.isBeforeFirst"+rs.getFetchSize());
						if (!rs.isBeforeFirst()) {
							System.out.println(">>if");
			%><tr>
								<td colspan="7">No Data Found</td>
							</tr>
							<%
				} else {
							int i = 0;
							while (rs.next()) {
								
								
								
								Module = "" + rs.getString("Module");
								if(Module.equalsIgnoreCase("") || Module.equalsIgnoreCase("null") || Module.equalsIgnoreCase(null)){
									Module="";
								}
								Module = Module.trim();
								
								Series = "" + rs.getString("Series");
								if(Series.equalsIgnoreCase("") || Series.equalsIgnoreCase("null") || Series.equalsIgnoreCase(null)){
									Series="";
								}
								Series = Series.trim();
								
								points = "" + rs.getString("points");
								if(points.equalsIgnoreCase("") || points.equalsIgnoreCase("null") || points.equalsIgnoreCase(null)){
									points="";
								}
								points = points.trim();
							
								tot=tot+Float.parseFloat(points);
			%>


							<tr>

								<td style="text-align: center"><%=(i + 1)%></td>
								
						
							
								<td><%=Module%></td>
								<td><%=Series%></td>
								
								<td style='text-align: Center;'><%=points%></td>
								
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
					<tfoot>            <tr>                <th colspan='3' style='text-align:right;font-weight:bold;'>Total Score:</th>              <th style='text-align:center;font-weight:bold;'><%=tot%></th>            </tr>        </tfoot>
	</table>
</div>
<div style="margin-bottom:50%;"></div>
