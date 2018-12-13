package com.sla.report;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import Database.Database;

/**
 * Servlet implementation class Fetching_Series_report_lazyload
 */
@WebServlet("/Fetching_Series_report_lazyload")
public class Fetching_Series_report_lazyload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fetching_Series_report_lazyload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html;charset=utf-8");
		System.out.println(">>>>>>>>>>Fetching_Series_report>>>>>>>>>");
		PrintWriter out = response.getWriter();
		Database db = new Database();
		Connection con = null;
		JSONObject obj = null;
		JSONArray arr = new JSONArray();
		ResourceBundle resource = ResourceBundle.getBundle("commonvariables");
		
		String series_name_2_1a = resource.getString("series_name_2_1a");
		String series_name_2_1b=resource.getString("series_name_2_1b");
		
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
		
		
		
		
		String sub_series_list=""+request.getParameter("sub_series_list");
		String series_list=""+request.getParameter("series_list");
		String dp_start=""+request.getParameter("dp_start");
		String dp_end=""+request.getParameter("dp_end");
	
		int pagecnt = 50;
		System.out.println("pagecnt>>>>>>>>>>>" + pagecnt);
		int vahan_pageIndex = Integer.parseInt(request.getParameter("vahan_pageIndex"));
		System.out.println("vahan_pageIndex>>>>>>>>>>>" + vahan_pageIndex);
		int outputinfo = 0;
		
		
		
		int firstrow   =  (vahan_pageIndex - 1) * pagecnt +1;
		int lastrow   = firstrow+pagecnt-1;
		
		String cond = "";
		String tablename = "";
		

			if(!dp_start.equalsIgnoreCase("null") && !dp_start.equalsIgnoreCase("")){		
				cond=cond+" and CAST(CONVERT(char(10),insertdate,126) AS DATE) >= CAST(CONVERT(char(10), '"+dp_start+"',126) AS DATE)";
			}
			if(!dp_end.equalsIgnoreCase("null") && !dp_end.equalsIgnoreCase("")){				
				cond=cond+" and CAST(CONVERT(char(10),insertdate,126) AS DATE)<= CAST(CONVERT(char(10), '"+dp_end+"',126) AS DATE)";
			}
			if(!sub_series_list.equalsIgnoreCase("null") && !sub_series_list.equalsIgnoreCase("")&& !sub_series_list.equalsIgnoreCase("select")){		
				
				if(sub_series_list.equalsIgnoreCase(series_name_2_2a) || sub_series_list.equalsIgnoreCase(series_name_2_2b)) {
					tablename="ApplicationOpening";
				}
				if(sub_series_list.equalsIgnoreCase(series_name_2_3a) || sub_series_list.equalsIgnoreCase(series_name_2_3b)) {
					tablename="userlogin";
				}
				
			} 
if(!series_list.equalsIgnoreCase("null") && !series_list.equalsIgnoreCase("")&& !series_list.equalsIgnoreCase("select")){		
				
			} 
	
System.out.println("tablename"+tablename);
		
		String ipaddress = "", location = "",date="",applicationname="",time="";String query ="";
		try {
			con = db.connection_get();
			if (con != null) {
				
				

				if(sub_series_list.equalsIgnoreCase(series_name_2_1a)) 
						{
					
					query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (Overall_Availability as Float) ) / COUNT(*), 2)) ) avg  from tbl_2_1_a where isnull(id,'')!='' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY id Desc) AS rownumber,  Hostname,IPaddress,Data_Center,Application_name,display_name,Process_name,Process_Availability,Overall_Availability,convert(varchar(10),insertdate,101)date  "
							+"	FROM   tbl_2_1_a where isnull(id,'')!='' "+cond+" " 
					       +"	) AS tbl "
					+"	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+" ";
					
							}

				if(sub_series_list.equalsIgnoreCase(series_name_2_1b)) 
						{
					
					query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (Overall_Availability as Float) ) / COUNT(*), 2)) ) avg  from tbl_2_1_b where isnull(id,'')!='' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY id Desc) AS rownumber,  Hostname,IPaddress,Data_Center,Application_name,Process_name,Process_Availability,Overall_Availability,convert(varchar(10),insertdate,101)date  "
							+"	FROM   tbl_2_1_b where isnull(id,'')!='' "+cond+" " 
					       +"	) AS tbl "
					+"	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+" ";
					
							}
				
				
				
				
				
				
				
				
				
				if(sub_series_list.equalsIgnoreCase(series_name_2_2a)) 
						{
					
					query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from ApplicationOpening where location='Command_Center' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
							+"	FROM   ApplicationOpening where location='Command_Center' "+cond+" " 
					       +"	) AS tbl "
					+"	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+" ";
					
					
				//	query="select ipaddress,location,convert(varchar(10),date,101)date,applicationname,time from dbo.ApplicationOpening where location='Command_Center' "+cond+" order by rid desc";
						}
				if(sub_series_list.equalsIgnoreCase(series_name_2_2b)) 
				{
		//	query="select ipaddress,location,convert(varchar(10),date,101)date,applicationname,time from dbo.ApplicationOpening where location='RVC_ZVC_PS'  "+cond+" order by rid desc";
					
					query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from ApplicationOpening where location='RVC_ZVC_PS' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
							+"	FROM   ApplicationOpening where location='RVC_ZVC_PS' "+cond+" " 
					       +"	) AS tbl "
					+"	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+" ";
					
				}
				if(sub_series_list.equalsIgnoreCase(series_name_2_3a)) 
				{
			//query="select ipaddress,location,convert(varchar(10),date,101)date,applicationname,time from userlogin where location='Command_Center'   "+cond+" order by rid desc ";
					query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from userlogin where location='Command_Center' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
							+"	FROM   userlogin where location='Command_Center' "+cond+" " 
					       +"	) AS tbl "
					+"	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+" ";
				}
				if(sub_series_list.equalsIgnoreCase(series_name_2_3b)) 
				{
			//query="select ipaddress,location,convert(varchar(10),date,101)date,applicationname,time from userlogin where location='RVC_ZVC_PS'  "+cond+" order by rid desc ";
					query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from userlogin where location='RVC_ZVC_PS' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
							+"	FROM   userlogin where location='RVC_ZVC_PS' "+cond+" " 
					       +"	) AS tbl "
					+"	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+" ";
					
				}
				if(sub_series_list.equalsIgnoreCase(series_name_2_4a)) 
				{
			//query="select ipaddress,location,convert(varchar(10),date,101)date,applicationname,time from userlogin where location='RVC_ZVC_PS'  "+cond+" order by rid desc ";
					query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from dbo.MenuNavigation where location='Command_Center' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
							+"	FROM   dbo.MenuNavigation where location='Command_Center' "+cond+" " 
					       +"	) AS tbl "
					+"	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+" ";
					
				}
				if(sub_series_list.equalsIgnoreCase(series_name_2_4b)) 
				{
			//query="select ipaddress,location,convert(varchar(10),date,101)date,applicationname,time from userlogin where location='RVC_ZVC_PS'  "+cond+" order by rid desc ";
					query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from MenuNavigation where location='RVC_ZVC_PS' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
							+"	FROM   MenuNavigation where location='RVC_ZVC_PS' "+cond+" " 
					       +"	) AS tbl "
					+"	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+" ";
					
				}
				
				if(sub_series_list.equalsIgnoreCase(series_name_2_5a)) 
				{
			//query="select ipaddress,location,convert(varchar(10),date,101)date,applicationname,time from userlogin where location='RVC_ZVC_PS'  "+cond+" order by rid desc ";
					query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from dbo.ChangeOfScreen where location='Command_Center' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
							+"	FROM   dbo.ChangeOfScreen where location='Command_Center' "+cond+" " 
					       +"	) AS tbl "
					+"	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+" ";
					
				}
				if(sub_series_list.equalsIgnoreCase(series_name_2_5b)) 
				{
			//query="select ipaddress,location,convert(varchar(10),date,101)date,applicationname,time from userlogin where location='RVC_ZVC_PS'  "+cond+" order by rid desc ";
					query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from ChangeOfScreen where location='RVC_ZVC_PS' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
							+"	FROM   ChangeOfScreen where location='RVC_ZVC_PS' "+cond+" " 
					       +"	) AS tbl "
					+"	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+" ";
					
				}
				
				if(sub_series_list.equalsIgnoreCase(series_name_2_6)) 
				{
			//
					query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from VideoFeedQuery where id='2.10' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
							+"	FROM   VideoFeedQuery where id='2.10'  "+cond+" " 
					       +"	) AS tbl "
					+"	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+" ";
					
				}

				if(sub_series_list.equalsIgnoreCase(series_name_2_6a)) 
				{
			//
					query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from VideoFeedQuery where id='2.14' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
							+"	FROM   VideoFeedQuery where id='2.14'  "+cond+" " 
					       +"	) AS tbl "
					+"	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+" ";
					
				}
				if(sub_series_list.equalsIgnoreCase(series_name_2_6b)) 
				{
			//
					query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from VideoFeedQuery where id='2.15' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
							+"	FROM   VideoFeedQuery where id='2.15'  "+cond+" " 
					       +"	) AS tbl "
					+"	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+" ";
					
				}
				if(sub_series_list.equalsIgnoreCase(series_name_2_6c)) 
				{
			//
					query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from VideoFeedQuery where id='2.16' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
							+"	FROM   VideoFeedQuery where id='2.16'  "+cond+" " 
					       +"	) AS tbl "
					+"	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+" ";
					
				}
				
				if(sub_series_list.equalsIgnoreCase(series_name_2_7)) 
				{
			//
					query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from ReportGenrationResponseTime where id='2.11' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
							+"	FROM   ReportGenrationResponseTime where id='2.11'  "+cond+" " 
					       +"	) AS tbl "
					+"	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+" ";
					
				}

				if(sub_series_list.equalsIgnoreCase(series_name_2_7a)) 
				{
			//
					query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from ReportGenrationResponseTime where id='2.17' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
							+"	FROM   ReportGenrationResponseTime where id='2.17'  "+cond+" " 
					       +"	) AS tbl "
					+"	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+" ";
					
				}
				if(sub_series_list.equalsIgnoreCase(series_name_2_7b)) 
				{
			//
					query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from ReportGenrationResponseTime where id='2.18' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
							+"	FROM   ReportGenrationResponseTime where id='2.18'  "+cond+" " 
					       +"	) AS tbl "
					+"	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+" ";
					
				}
				if(sub_series_list.equalsIgnoreCase(series_name_2_7c)) 
				{
			//
					query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from ReportGenrationResponseTime where id='2.19' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
							+"	FROM   ReportGenrationResponseTime where id='2.19'  "+cond+" " 
					       +"	) AS tbl "
					+"	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+" ";
					
				}

				if(sub_series_list.equalsIgnoreCase(series_name_2_8)) 
				{
			
					query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from PTZ_LagTime where isnull(rid,'')!='' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
							+"	FROM   PTZ_LagTime where isnull(rid,'')!='' "+cond+" " 
					       +"	) AS tbl "
					+"	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+" ";
					
				}
				if(sub_series_list.equalsIgnoreCase(series_name_2_9)) 
				{
					query="	SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (time as Float) ) / COUNT(*), 2)) ) avg  from CameraSettingModification where isnull(rid,'')!='' "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber, ipaddress,location,convert(varchar(10),date,101)date,applicationname,time "
							+"	FROM   CameraSettingModification where isnull(rid,'')!='' "+cond+" " 
					       +"	) AS tbl "
					+"	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+" ";
					
				}
				
				
				
				System.out.println("query"+query);
				ResultSet rs = db.SelectData(query, con);
				
				
				if (rs != null) {
					while (rs.next()) {
						obj = new JSONObject();
						
						if(sub_series_list.equalsIgnoreCase(series_name_2_1a)) 
						{
							
							
							String Total_Average=""+rs.getString("Total_Average");
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
										obj.put("Overall_Availability",Overall_Availability);
										obj.put("Process_Availability",Process_Availability);
										obj.put("Process_name",Process_name);
										obj.put("display_name",display_name);
										obj.put("Application_name",Application_name);										
										obj.put("Data_Center",Data_Center);						
								     	obj.put("IPaddress", IPaddress);							
							       	     obj.put("Hostname", Hostname);
						
							obj.put("date", date);
							obj.put("Total_Average", Total_Average);
						}
						else if(sub_series_list.equalsIgnoreCase(series_name_2_1b)) 
						{

							String Total_Average=""+rs.getString("Total_Average");
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
										obj.put("Overall_Availability",Overall_Availability);
										obj.put("Process_Availability",Process_Availability);
										obj.put("Process_name",Process_name);
									
										obj.put("Application_name",Application_name);										
										obj.put("Data_Center",Data_Center);						
								     	obj.put("IPaddress", IPaddress);							
							       	     obj.put("Hostname", Hostname);
						
							obj.put("date", date);
							obj.put("Total_Average", Total_Average);
						}else {
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
						
						String Total_Average=""+rs.getString("Total_Average");
					
						obj.put("Total_Average", Total_Average);
						
						obj.put("time", time);
						obj.put("applicationname", applicationname);
						obj.put("date", date);						
						obj.put("location", location);
						obj.put("ipaddress", ipaddress);
						
						}
						String rownumber = ""
								+ rs.getString("rownumber");
						//System.out.println(">>>>>rownumber"+rownumber);
						String Rcount = "" + rs.getString("Rcount");
						//System.out.println(">>>>>Rcount"+Rcount);
						obj.put("Rcount", Rcount);
						obj.put("rownumber", rownumber);
						
						arr.put(obj);
					}
				}else {
					System.out.println("No data");
					//obj = new JSONObject();
					//arr.put(obj);
				}
			}
		//	out.println(aesUtil.encrypt(salt, iv, "data",arr.toString()));
			
			out.println(arr);
			System.out.println(arr);
			//System.out.println(aesUtil.encrypt(salt, iv, "data",arr.toString()));
			out.close();
			con.close();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
