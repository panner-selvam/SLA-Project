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
 * Servlet implementation class Fetching_sx_Series_report_lazyload
 */
@WebServlet("/Fetching_sx_Series_report_lazyload")
public class Fetching_sx_Series_report_lazyload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fetching_sx_Series_report_lazyload() {
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
		System.out.println(">>>>>>>>>>Fetching_fr_Series_report_lazyload>>>>>>>>>");
		PrintWriter out = response.getWriter();
		Database db = new Database();
		Connection con = null;
		JSONObject obj = null;
		JSONArray arr = new JSONArray();
		ResourceBundle resource = ResourceBundle.getBundle("commonvariables");
		
		
		String series_name_6_4=resource.getString("series_name_6_4");
		String series_name_6_1=resource.getString("series_name_6_1");
		String series_name_6_2=resource.getString("series_name_6_2");
		String series_name_6_3=resource.getString("series_name_6_3");
		String series_name_6_5=resource.getString("series_name_6_5");
		
		
		
		
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
				cond=cond+" and CAST(CONVERT(char(10),date,126) AS DATE) >= CAST(CONVERT(char(10), '"+dp_start+"',126) AS DATE)";
			}
			if(!dp_end.equalsIgnoreCase("null") && !dp_end.equalsIgnoreCase("")){				
				cond=cond+" and CAST(CONVERT(char(10),date,126) AS DATE)<= CAST(CONVERT(char(10), '"+dp_end+"',126) AS DATE)";
			}
			if(!sub_series_list.equalsIgnoreCase("null") && !sub_series_list.equalsIgnoreCase("")&& !sub_series_list.equalsIgnoreCase("select")){		
				
				
				
			} 
if(!series_list.equalsIgnoreCase("null") && !series_list.equalsIgnoreCase("")&& !series_list.equalsIgnoreCase("select")){		
				
			} 
	
System.out.println("tablename"+tablename);
		
String date="",Location="",Attendance="",SecurityName=""; 
		String query ="";
		try {
			con = db.connection_get();
			if (con != null) {
				
				if(sub_series_list.equalsIgnoreCase(series_name_6_4)) 
						{									
					query = "SELECT  * 	FROM   ( SELECT    COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber,convert(varchar(10),date,101)date,SecurityName,Attendance,Location	FROM  PhysicalSecurity where ISNULL(rid,'')!=''  	"+cond+") AS tbl 		WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+""; 
						}
				else	if(sub_series_list.equalsIgnoreCase(series_name_6_1)) 
				{									
			query =" SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (uptime as Float) ) / COUNT(*), 2)) )  avg  from tbl_6_1 where isnull(id,'')!=''  "+cond+")Totuptime ,  (select convert(numeric(10,2),( ROUND(SUM( cast (downtime as Float) ) / COUNT(*), 2)) )  avg  from tbl_6_1 where isnull(id,'')!=''   "+cond+" )Totdowntime ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER  (ORDER BY id Desc) AS rownumber,Ipaddress,name,datacenter,applicationname,uptime,Downtime,convert(varchar(10),datetime,101)date FROM   tbl_6_1 where isnull(id,'')!=''   "+cond+"   	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+""; 
				}
				else	if(sub_series_list.equalsIgnoreCase(series_name_6_2)) 
				{									
					query =" SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (uptime as Float) ) / COUNT(*), 2)) )  avg  from tbl_6_2 where isnull(id,'')!=''  "+cond+")Totuptime ,  (select convert(numeric(10,2),( ROUND(SUM( cast (downtime as Float) ) / COUNT(*), 2)) )  avg  from tbl_6_2 where isnull(id,'')!=''   "+cond+" )Totdowntime ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER  (ORDER BY id Desc) AS rownumber,ipaddress,hostname,datacenter,uptime,Downtime,convert(varchar(10),datetime,101)date FROM   tbl_6_2 where isnull(id,'')!=''   "+cond+"   	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+""; 
				}
				else	if(sub_series_list.equalsIgnoreCase(series_name_6_3)) 
				{									
					query =" SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (uptime as Float) ) / COUNT(*), 2)) )  avg  from tbl_6_3 where isnull(id,'')!=''  "+cond+")Totuptime , COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER  (ORDER BY id Desc) AS rownumber,Name,Place,Datetime,Online,Offline,convert(varchar(10),datetime,101)date FROM   tbl_6_3 where isnull(id,'')!=''   "+cond+"   	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+""; 
				}
				else	if(sub_series_list.equalsIgnoreCase(series_name_6_5)) 
				{									
					query =" SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (uptime as Float) ) / COUNT(*), 2)) )  avg  from tbl_6_5 where isnull(id,'')!=''  "+cond+")Totuptime ,  (select convert(numeric(10,2),( ROUND(SUM( cast (downtime as Float) ) / COUNT(*), 2)) )  avg  from tbl_6_5 where isnull(id,'')!=''   "+cond+" )Totdowntime ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER  (ORDER BY id Desc) AS rownumber,Ipaddress,Hostname,Location,uptime,Downtime,convert(varchar(10),datetime,101)date FROM   tbl_6_5 where isnull(id,'')!=''   "+cond+"   	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+""; 
				}
				else {
					
				}
				ResultSet rs = db.SelectData(query, con);
				
				
				if (rs != null) {
					while (rs.next()) {
						obj = new JSONObject();
						if(sub_series_list.equalsIgnoreCase(series_name_6_4)) 
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
						obj.put("date", date);
						
						obj.put("Location", Location);						
						obj.put("Attendance", Attendance);
						
						obj.put("Location", Location);
						obj.put("SecurityName", SecurityName);
						
						}
					
						else if(sub_series_list.equalsIgnoreCase(series_name_6_1)) 
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
							String Totuptime = "" + rs.getString("Totuptime");
							if(Totuptime.equalsIgnoreCase("") || Totuptime.equalsIgnoreCase("null") || Totuptime.equalsIgnoreCase(null)){
								Totuptime="";
							}
							Totuptime = Totuptime.trim();
							String Totdowntime = "" + rs.getString("Totdowntime");
							if(Totdowntime.equalsIgnoreCase("") || Totdowntime.equalsIgnoreCase("null") || Totdowntime.equalsIgnoreCase(null)){
								Totdowntime="";
							}
							Totdowntime = Totdowntime.trim();
							
							obj.put("Totdowntime", Totdowntime);
							obj.put("Totuptime", Totuptime);
							obj.put("date", date);
							obj.put("Downtime", Downtime);		
							obj.put("Uptime", Uptime);				
							obj.put("Ipaddress", Ipaddress);							
							obj.put("name", name);						
							obj.put("datacenter", datacenter);													
							obj.put("applicationname", applicationname);
							
						}
						else if(sub_series_list.equalsIgnoreCase(series_name_6_2)) 
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
							String Totuptime = "" + rs.getString("Totuptime");
							if(Totuptime.equalsIgnoreCase("") || Totuptime.equalsIgnoreCase("null") || Totuptime.equalsIgnoreCase(null)){
								Totuptime="";
							}
							Totuptime = Totuptime.trim();
							String Totdowntime = "" + rs.getString("Totdowntime");
							if(Totdowntime.equalsIgnoreCase("") || Totdowntime.equalsIgnoreCase("null") || Totdowntime.equalsIgnoreCase(null)){
								Totdowntime="";
							}
							Totdowntime = Totdowntime.trim();
							
							obj.put("Totdowntime", Totdowntime);
							obj.put("Totuptime", Totuptime);
							obj.put("date", date);
							obj.put("Downtime", Downtime);		
							obj.put("Uptime", Uptime);				
							obj.put("Ipaddress", Ipaddress);							
							obj.put("hostname", hostname);						
							obj.put("datacenter", datacenter);													
						
							
						}
						
						//6.3 start
						
						else if(sub_series_list.equalsIgnoreCase(series_name_6_3)) 
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
							 
							String Totuptime = "" + rs.getString("Totuptime");
							if(Totuptime.equalsIgnoreCase("") || Totuptime.equalsIgnoreCase("null") || Totuptime.equalsIgnoreCase(null)){
								Totuptime="";
							}
							Totuptime = Totuptime.trim();
							
							
							obj.put("name", name);
							obj.put("place", place);
							obj.put("date", date);
							obj.put("online", online);		
							obj.put("offline", offline);				
							obj.put("uptime", uptime);							
							obj.put("Totuptime", Totuptime);						
																				
						
						}
						//6.3 end
						
						
						else	if(sub_series_list.equalsIgnoreCase(series_name_6_5)) 
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
							String Totuptime = "" + rs.getString("Totuptime");
							if(Totuptime.equalsIgnoreCase("") || Totuptime.equalsIgnoreCase("null") || Totuptime.equalsIgnoreCase(null)){
								Totuptime="";
							}
							Totuptime = Totuptime.trim();
							String Totdowntime = "" + rs.getString("Totdowntime");
							if(Totdowntime.equalsIgnoreCase("") || Totdowntime.equalsIgnoreCase("null") || Totdowntime.equalsIgnoreCase(null)){
								Totdowntime="";
							}
							Totdowntime = Totdowntime.trim();
							
							obj.put("Totdowntime", Totdowntime);
							obj.put("Totuptime", Totuptime);
							obj.put("date", date);
							obj.put("Downtime", Downtime);		
							obj.put("Uptime", Uptime);				
							obj.put("Ipaddress", Ipaddress);							
							obj.put("hostname", hostname);						
																				
						
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
				}
				
				
				
				
				else {
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